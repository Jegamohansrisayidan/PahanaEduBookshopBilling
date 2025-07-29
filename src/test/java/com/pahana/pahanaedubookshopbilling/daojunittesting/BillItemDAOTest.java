/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.daojunittesting;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.dao.BillItemDAO;
import com.pahana.pahanaedubookshopbilling.model.BillItem;
import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;
import java.util.List;
@Disabled
class BillItemDAOTest {

    private BillItemDAO billItemDAO;

    @BeforeEach
    void setUp() {
        billItemDAO = new BillItemDAO();
    }

    @Test
    void testInsertAndRetrieveBillItem() {
        // Insert assumes a valid billId and itemId exist in the DB
        BillItem billItem = new BillItem(0, 1, 1, 2, 100.0, 5.0, 195.0);
        boolean inserted = billItemDAO.insertBillItem(billItem);
        assertTrue(inserted);

        List<BillItem> items = billItemDAO.getBillItemsByBillId(1);
        assertTrue(items.size() > 0);
    }

    @Test
    void testUpdateBillItem() {
        List<BillItem> items = billItemDAO.getBillItemsByBillId(1);
        BillItem billItem = items.get(0);
        billItem.setQuantity(5);
        boolean updated = billItemDAO.updateBillItem(billItem);
        assertTrue(updated);
    }

    @Test
    void testDeleteBillItem() {
        List<BillItem> items = billItemDAO.getBillItemsByBillId(1);
        BillItem billItem = items.get(0);
        boolean deleted = billItemDAO.deleteBillItem(billItem.getBillItemId());
        assertTrue(deleted);
    }
}
