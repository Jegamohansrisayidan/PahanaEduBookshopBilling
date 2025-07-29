/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.daomanualtest;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.dao.ItemDAO;
import com.pahana.pahanaedubookshopbilling.model.Item;

public class TestItemDAO {

    public static void main(String[] args) {
        ItemDAO itemDAO = new ItemDAO();

        // Insert a new item
        
        Item newItem = new Item();
        newItem.setName("Test Book");
        newItem.setDescription("A sample test book");
        newItem.setPrice(499.50);
        newItem.setStock(50);
        newItem.setCategory("Book");
        newItem.setAuthor("Author A");
        newItem.setPublisher("Publisher P");
        newItem.setStatus("active");
        newItem.setCreatedAt(new java.sql.Timestamp(System.currentTimeMillis()));

        boolean inserted = itemDAO.insertItem(newItem);
        System.out.println("Inserted: " + inserted);

        // List all items
        
        for (Item item : itemDAO.getAllItems()) {
            System.out.println(item);
        }
    }
}
