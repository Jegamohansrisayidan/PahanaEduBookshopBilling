/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.modeltesting;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.model.Bill;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.sql.Timestamp;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Disabled;
@Disabled
class BillTest {

    private Bill bill;
    private Timestamp billDate;

    @BeforeEach
    void setUp() {
        billDate = new Timestamp(System.currentTimeMillis());
        bill = new Bill(
                1,
                1001,
                501,
                billDate,
                2000.00,
                100.00,
                180.00,
                2080.00,
                "Cash",
                "Paid",
                "No remarks"
        );
    }

    @Test
    void testGetters() {
        assertEquals(1, bill.getBillId());
        assertEquals(1001, bill.getAccountNo());
        assertEquals(501, bill.getUserId());
        assertEquals(billDate, bill.getBillDate());
        assertEquals(2000.00, bill.getTotalAmount());
        assertEquals(100.00, bill.getDiscount());
        assertEquals(180.00, bill.getTax());
        assertEquals(2080.00, bill.getPaidAmount());
        assertEquals("Cash", bill.getPaymentMethod());
        assertEquals("Paid", bill.getStatus());
        assertEquals("No remarks", bill.getRemarks());
    }

    @Test
    void testSetters() {
        Timestamp newDate = new Timestamp(System.currentTimeMillis());

        bill.setBillId(2);
        bill.setAccountNo(2002);
        bill.setUserId(601);
        bill.setBillDate(newDate);
        bill.setTotalAmount(5000.00);
        bill.setDiscount(200.00);
        bill.setTax(300.00);
        bill.setPaidAmount(5100.00);
        bill.setPaymentMethod("Card");
        bill.setStatus("Unpaid");
        bill.setRemarks("Pending");

        assertEquals(2, bill.getBillId());
        assertEquals(2002, bill.getAccountNo());
        assertEquals(601, bill.getUserId());
        assertEquals(newDate, bill.getBillDate());
        assertEquals(5000.00, bill.getTotalAmount());
        assertEquals(200.00, bill.getDiscount());
        assertEquals(300.00, bill.getTax());
        assertEquals(5100.00, bill.getPaidAmount());
        assertEquals("Card", bill.getPaymentMethod());
        assertEquals("Unpaid", bill.getStatus());
        assertEquals("Pending", bill.getRemarks());
    }

    @Test
    void testToString() {
        String result = bill.toString();
        assertTrue(result.contains("billId=1"));
        assertTrue(result.contains("accountNo=1001"));
        assertTrue(result.contains("userId=501"));
        assertTrue(result.contains("totalAmount=2000.0"));
        assertTrue(result.contains("discount=100.0"));
        assertTrue(result.contains("tax=180.0"));
        assertTrue(result.contains("paidAmount=2080.0"));
        assertTrue(result.contains("paymentMethod=Cash"));
        assertTrue(result.contains("status=Paid"));
        assertTrue(result.contains("remarks=No remarks"));
    }
}

