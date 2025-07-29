/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.daojunittesting;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.dao.BillDAO;
import com.pahana.pahanaedubookshopbilling.model.Bill;
import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;
import java.sql.Timestamp;
import java.util.List;
@Disabled
class BillDAOTest {

    private BillDAO billDAO;

    @BeforeEach
    void setUp() {
        billDAO = new BillDAO();
    }

    @Test
    void testInsertAndRetrieveBill() {
        Bill bill = new Bill(0, 1, 1, new Timestamp(System.currentTimeMillis()), 200.0, 0.0, 0.0, 200.0, "cash", "paid", "JUnit Bill");
        int billId = billDAO.insertBill(bill);
        assertTrue(billId > 0);

        Bill retrieved = billDAO.getBillById(billId);
        assertNotNull(retrieved);
        assertEquals("JUnit Bill", retrieved.getRemarks());
    }

    @Test
    void testUpdateBill() {
        List<Bill> bills = billDAO.getAllBills();
        Bill bill = bills.get(bills.size() - 1); // Last added
        bill.setRemarks("Updated Bill");
        boolean updated = billDAO.updateBill(bill);
        assertTrue(updated);

        Bill updatedBill = billDAO.getBillById(bill.getBillId());
        assertEquals("Updated Bill", updatedBill.getRemarks());
    }

    @Test
    void testDeleteBill() {
        List<Bill> bills = billDAO.getAllBills();
        Bill bill = bills.get(bills.size() - 1); // Last added
        boolean deleted = billDAO.deleteBill(bill.getBillId());
        assertTrue(deleted);
    }
}
