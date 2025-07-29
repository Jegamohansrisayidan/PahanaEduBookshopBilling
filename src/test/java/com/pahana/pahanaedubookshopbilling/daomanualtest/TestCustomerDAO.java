/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.daomanualtest;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.dao.CustomerDAO;
import com.pahana.pahanaedubookshopbilling.model.Customer;

public class TestCustomerDAO {

    public static void main(String[] args) {
        CustomerDAO customerDAO = new CustomerDAO();

        // Insert new customer
        
        Customer c = new Customer();
        c.setName("Test Customer");
        c.setAddress("123 New Road, Colombo");
        c.setPhone("0778888888");
        c.setEmail("testcustomer@pahanaedu.lk");
        c.setUnitsConsumed(10);
        c.setStatus("active");
        c.setCreatedAt(new java.sql.Timestamp(System.currentTimeMillis()));

        boolean inserted = customerDAO.insertCustomer(c);
        System.out.println("Inserted: " + inserted);

        // List all customers
        
        for (Customer customer : customerDAO.getAllCustomers()) {
            System.out.println(customer);
        }
    }
}
