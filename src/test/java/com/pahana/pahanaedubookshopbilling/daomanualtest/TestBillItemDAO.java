/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.daomanualtest;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.dao.BillItemDAO;
import com.pahana.pahanaedubookshopbilling.model.BillItem;

public class TestBillItemDAO {

    public static void main(String[] args) {
        BillItemDAO billItemDAO = new BillItemDAO();

        // 1. Insert new bill items (assume bill_id 1 and item_id 1/2 exist)
        
        BillItem item1 = new BillItem();
        item1.setBillId(1);      // use a real bill_id from your DB
        item1.setItemId(1);      // use a real item_id from your DB
        item1.setQuantity(2);
        item1.setItemPrice(900.00);
        item1.setDiscount(0.00);
        item1.setSubtotal(1800.00);

        boolean inserted1 = billItemDAO.insertBillItem(item1);
        System.out.println("Inserted Bill Item 1: " + inserted1);

        BillItem item2 = new BillItem();
        item2.setBillId(1);      // use the same bill_id
        item2.setItemId(2);      // use a real item_id from your DB
        item2.setQuantity(1);
        item2.setItemPrice(550.00);
        item2.setDiscount(50.00);
        item2.setSubtotal(500.00);

        boolean inserted2 = billItemDAO.insertBillItem(item2);
        System.out.println("Inserted Bill Item 2: " + inserted2);

        // 2. Get all items for bill_id 1
        
        System.out.println("All Bill Items for Bill ID 1:");
        for (BillItem bi : billItemDAO.getBillItemsByBillId(1)) {
            System.out.println(bi);
        }
    }
}
