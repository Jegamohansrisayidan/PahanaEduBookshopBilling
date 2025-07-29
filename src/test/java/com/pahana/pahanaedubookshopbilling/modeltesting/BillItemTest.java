/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.modeltesting;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.model.BillItem;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class BillItemTest {

    private BillItem billItem;

    @BeforeEach
    void setUp() {
        billItem = new BillItem(
                101,
                1,
                201,
                3,
                500.00,
                50.00,
                1350.00
        );
    }

    @Test
    void testGetters() {
        assertEquals(101, billItem.getBillItemId());
        assertEquals(1, billItem.getBillId());
        assertEquals(201, billItem.getItemId());
        assertEquals(3, billItem.getQuantity());
        assertEquals(500.00, billItem.getItemPrice());
        assertEquals(50.00, billItem.getDiscount());
        assertEquals(1350.00, billItem.getSubtotal());
    }

    @Test
    void testSetters() {
        billItem.setBillItemId(102);
        billItem.setBillId(2);
        billItem.setItemId(202);
        billItem.setQuantity(5);
        billItem.setItemPrice(1000.00);
        billItem.setDiscount(100.00);
        billItem.setSubtotal(4900.00);

        assertEquals(102, billItem.getBillItemId());
        assertEquals(2, billItem.getBillId());
        assertEquals(202, billItem.getItemId());
        assertEquals(5, billItem.getQuantity());
        assertEquals(1000.00, billItem.getItemPrice());
        assertEquals(100.00, billItem.getDiscount());
        assertEquals(4900.00, billItem.getSubtotal());
    }

    @Test
    void testToString() {
        String result = billItem.toString();
        assertTrue(result.contains("billItemId=101"));
        assertTrue(result.contains("billId=1"));
        assertTrue(result.contains("itemId=201"));
        assertTrue(result.contains("quantity=3"));
        assertTrue(result.contains("itemPrice=500.0"));
        assertTrue(result.contains("discount=50.0"));
        assertTrue(result.contains("subtotal=1350.0"));
    }
}

