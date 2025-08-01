/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.service;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.dao.BillDAO;
import com.pahana.pahanaedubookshopbilling.dao.BillItemDAO;
import com.pahana.pahanaedubookshopbilling.dao.CustomerDAO;
import com.pahana.pahanaedubookshopbilling.factory.DAOFactory;
import com.pahana.pahanaedubookshopbilling.model.Bill;
import com.pahana.pahanaedubookshopbilling.model.BillItem;
import com.pahana.pahanaedubookshopbilling.model.Customer;
import com.pahana.pahanaedubookshopbilling.observer.BillObserver;
import java.util.ArrayList;
import java.util.List;

public class BillingService {

    private BillDAO billDAO = DAOFactory.getBillDAO();
    private BillItemDAO billItemDAO = DAOFactory.getBillItemDAO();
    private CustomerDAO customerDAO = DAOFactory.getCustomerDAO();
    private List<BillObserver> observers = new ArrayList<>();

    public void addObserver(BillObserver observer) {
        observers.add(observer);
    }

    public int createBillWithItems(Bill bill, List<BillItem> items) {
        int billId = billDAO.insertBill(bill);
        if (billId > 0) {
            for (BillItem item : items) {
                item.setBillId(billId);
                billItemDAO.insertBillItem(item);
            }
            bill.setBillId(billId);

            // Fetch customer email from DB
            
            Customer customer = customerDAO.getCustomerByAccountNo(bill.getAccountNo());
            String customerEmail = (customer != null) ? customer.getEmail() : null;

            // Notify all observers
            
            for (BillObserver observer : observers) {
                observer.onBillCreated(bill, customerEmail);
            }
        }
        return billId;
    }
}
