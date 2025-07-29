/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.modeltesting;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.model.Customer;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.sql.Timestamp;
import static org.junit.jupiter.api.Assertions.*;

class CustomerTest {

    private Customer customer;
    private Timestamp now;

    @BeforeEach
    void setUp() {
        now = new Timestamp(System.currentTimeMillis());
        customer = new Customer(
                1001,
                "John Doe",
                "123 Main St",
                "0771234567",
                "john@example.com",
                120,
                "Active",
                now
        );
    }

    @Test
    void testGetters() {
        assertEquals(1001, customer.getAccountNo());
        assertEquals("John Doe", customer.getName());
        assertEquals("123 Main St", customer.getAddress());
        assertEquals("0771234567", customer.getPhone());
        assertEquals("john@example.com", customer.getEmail());
        assertEquals(120, customer.getUnitsConsumed());
        assertEquals("Active", customer.getStatus());
        assertEquals(now, customer.getCreatedAt());
    }

    @Test
    void testSetters() {
        Timestamp later = new Timestamp(System.currentTimeMillis());

        customer.setAccountNo(2002);
        customer.setName("Jane Smith");
        customer.setAddress("456 Elm St");
        customer.setPhone("0789876543");
        customer.setEmail("jane@example.com");
        customer.setUnitsConsumed(250);
        customer.setStatus("Inactive");
        customer.setCreatedAt(later);

        assertEquals(2002, customer.getAccountNo());
        assertEquals("Jane Smith", customer.getName());
        assertEquals("456 Elm St", customer.getAddress());
        assertEquals("0789876543", customer.getPhone());
        assertEquals("jane@example.com", customer.getEmail());
        assertEquals(250, customer.getUnitsConsumed());
        assertEquals("Inactive", customer.getStatus());
        assertEquals(later, customer.getCreatedAt());
    }

    @Test
    void testToString() {
        String output = customer.toString();
        assertTrue(output.contains("accountNo=1001"));
        assertTrue(output.contains("name=John Doe"));
        assertTrue(output.contains("address=123 Main St"));
        assertTrue(output.contains("phone=0771234567"));
        assertTrue(output.contains("email=john@example.com"));
        assertTrue(output.contains("unitsConsumed=120"));
        assertTrue(output.contains("status=Active"));
        assertTrue(output.contains(now.toString()));
    }
}
