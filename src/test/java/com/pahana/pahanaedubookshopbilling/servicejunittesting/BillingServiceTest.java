/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.servicejunittesting;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.model.Bill;
import com.pahana.pahanaedubookshopbilling.model.BillItem;
import com.pahana.pahanaedubookshopbilling.service.BillingService;
import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;
import java.sql.Timestamp;
import java.util.Arrays;

@Disabled
class BillingServiceTest {

    private BillingService billingService;

    @BeforeEach
    void setUp() {
        billingService = new BillingService();
    }

    @Test
    void testCreateBillWithItems() {
        Bill bill = new Bill(0, 1, 1, new Timestamp(System.currentTimeMillis()), 150.0, 0.0, 0.0, 150.0, "cash", "paid", "Test Bill");
        BillItem item1 = new BillItem(0, 0, 1, 2, 50.0, 0.0, 100.0);
        BillItem item2 = new BillItem(0, 0, 2, 1, 50.0, 0.0, 50.0);

        int billId = billingService.createBillWithItems(bill, Arrays.asList(item1, item2));
        assertTrue(billId > 0);
    }
}
