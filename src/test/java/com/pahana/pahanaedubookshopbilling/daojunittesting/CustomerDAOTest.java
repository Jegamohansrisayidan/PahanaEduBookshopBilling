/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.daojunittesting;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.dao.CustomerDAO;
import com.pahana.pahanaedubookshopbilling.model.Customer;
import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;
import java.sql.Timestamp;
import java.util.List;
@Disabled
class CustomerDAOTest {

    private CustomerDAO customerDAO;

    @BeforeEach
    void setUp() {
        customerDAO = new CustomerDAO();
    }

    @Test
    void testInsertAndRetrieveCustomer() {
        Customer customer = new Customer(0, "Test Customer", "123 St", "0771234567", "cust@mail.com", 15, "active", new Timestamp(System.currentTimeMillis()));
        boolean inserted = customerDAO.insertCustomer(customer);
        assertTrue(inserted);

        List<Customer> customers = customerDAO.getAllCustomers();
        assertTrue(customers.stream().anyMatch(c -> c.getName().equals("Test Customer")));
    }

    @Test
    void testUpdateCustomer() {
        List<Customer> customers = customerDAO.getAllCustomers();
        Customer customer = customers.get(customers.size() - 1); // Get last added
        customer.setName("Updated Customer");
        boolean updated = customerDAO.updateCustomer(customer);
        assertTrue(updated);

        Customer updatedCustomer = customerDAO.getCustomerByAccountNo(customer.getAccountNo());
        assertEquals("Updated Customer", updatedCustomer.getName());
    }

    @Test
    void testDeleteCustomer() {
        List<Customer> customers = customerDAO.getAllCustomers();
        Customer customer = customers.get(customers.size() - 1); // Last added
        boolean deleted = customerDAO.deleteCustomer(customer.getAccountNo());
        assertTrue(deleted);
    }
}
