/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.observer;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.model.Bill;
import com.pahana.pahanaedubookshopbilling.model.BillItem;
import com.pahana.pahanaedubookshopbilling.service.BillingService;
import java.util.ArrayList;
import java.util.List;

public class BillingServiceObserverTest {

    public static void main(String[] args) {
        BillingService billingService = new BillingService();
        billingService.addObserver(new EmailNotificationObserver());

        Bill bill = new Bill();
        bill.setAccountNo(123);
        bill.setUserId(1);
        bill.setBillDate(new java.sql.Timestamp(System.currentTimeMillis()));
        bill.setTotalAmount(1000);
        bill.setDiscount(50);
        bill.setTax(100);
        bill.setPaidAmount(1050);
        bill.setPaymentMethod("cash");
        bill.setStatus("paid");
        bill.setRemarks("Test Bill");

        List<BillItem> billItems = new ArrayList<>();
        BillItem item = new BillItem();
        item.setItemId(1);
        item.setQuantity(2);
        item.setItemPrice(500);
        item.setDiscount(0);
        item.setSubtotal(1000);
        billItems.add(item);

        int billId = billingService.createBillWithItems(bill, billItems);
        if (billId > 0) {
            System.out.println("Bill created with ID: " + billId);
        } else {
            System.out.println("Bill creation failed.");
        }
    }
}
