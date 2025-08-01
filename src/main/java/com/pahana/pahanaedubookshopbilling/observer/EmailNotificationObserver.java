/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.observer;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.dao.BillItemDAO;
import com.pahana.pahanaedubookshopbilling.dao.CustomerDAO;
import com.pahana.pahanaedubookshopbilling.model.Bill;
import com.pahana.pahanaedubookshopbilling.model.BillItem;
import com.pahana.pahanaedubookshopbilling.model.Customer;
import com.pahana.pahanaedubookshopbilling.service.BillEmailService;

import java.util.List;

public class EmailNotificationObserver implements BillObserver {

    @Override
    public void onBillCreated(Bill bill, String customerEmail) {
        if (customerEmail == null || customerEmail.trim().isEmpty()) {
            System.out.println("No customer email, skipping email notification.");
            return;
        }

        // Fetch BillItems
        
        BillItemDAO billItemDAO = new BillItemDAO();
        List<BillItem> billItems = billItemDAO.getBillItemsByBillId(bill.getBillId());

        // Fetch Customer by account number
        
        CustomerDAO customerDAO = new CustomerDAO();
        Customer customer = customerDAO.getCustomerByAccountNo(bill.getAccountNo());

        // Send the email with PDF attached (showing item names and customer name)
        
        BillEmailService emailService = new BillEmailService();
        emailService.sendBillEmailWithAttachment(bill, customer, billItems, customerEmail);
    }
}
