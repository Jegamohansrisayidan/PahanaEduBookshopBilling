/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.factoryjunittesting;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.dao.CustomerDAO;
import com.pahana.pahanaedubookshopbilling.factory.DAOFactory;
import com.pahana.pahanaedubookshopbilling.model.Customer;
import org.junit.jupiter.api.Test;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Disabled;

@Disabled
class DAOFactoryTest {

    @Test
    void testGetAllCustomers() {
        
        // Use the DAOFactory to get the DAO
        
        CustomerDAO customerDAO = DAOFactory.getCustomerDAO();
        
        // Retrieve all customers
        
        List<Customer> customers = customerDAO.getAllCustomers();

        // Assert the list is not null
        
        assertNotNull(customers, "The customer list should not be null");

        // Optionally, print for manual inspection (not required for automation)
        
        customers.forEach(c -> System.out.println("Customer: " + c.getName()));

        // You can also assert at least one customer exists if you expect data:
        // assertTrue(customers.size() > 0, "There should be at least one customer");
    }
}
