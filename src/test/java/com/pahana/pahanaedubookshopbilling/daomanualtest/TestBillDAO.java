/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.daomanualtest;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.dao.BillDAO;
import com.pahana.pahanaedubookshopbilling.model.Bill;
import java.sql.Timestamp;

public class TestBillDAO {

    public static void main(String[] args) {
        BillDAO billDAO = new BillDAO();

        // 1. Insert a new bill
        Bill newBill = new Bill();
        newBill.setAccountNo(1); // Assume account_no 1 exists
        newBill.setUserId(1);    // Assume user_id 1 exists
        newBill.setBillDate(new Timestamp(System.currentTimeMillis()));
        newBill.setTotalAmount(1800.00);
        newBill.setDiscount(100.00);
        newBill.setTax(50.00);
        newBill.setPaidAmount(1750.00);
        newBill.setPaymentMethod("cash");
        newBill.setStatus("paid");
        newBill.setRemarks("Test Bill Insert");

        int newBillId = billDAO.insertBill(newBill);
        System.out.println("Inserted Bill ID: " + newBillId);

        // 2. Get the bill by id
        Bill foundBill = billDAO.getBillById(newBillId);
        System.out.println("Found Bill: " + foundBill);

        // 3. List all bills
        System.out.println("All bills:");
        for (Bill b : billDAO.getAllBills()) {
            System.out.println(b);
        }
    }
}
