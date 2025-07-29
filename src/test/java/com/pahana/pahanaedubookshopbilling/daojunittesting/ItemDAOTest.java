/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.daojunittesting;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.dao.ItemDAO;
import com.pahana.pahanaedubookshopbilling.model.Item;
import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;
import java.sql.Timestamp;
import java.util.List;
@Disabled
class ItemDAOTest {

    private ItemDAO itemDAO;

    @BeforeEach
    void setUp() {
        itemDAO = new ItemDAO();
    }

    @Test
    void testInsertAndRetrieveItem() {
        Item item = new Item(0, "JUnit Book", "JUnit Desc", 100.0, 10, "Book", "JUnit Auth", "JUnit Publ", "active", new Timestamp(System.currentTimeMillis()));
        boolean inserted = itemDAO.insertItem(item);
        assertTrue(inserted);

        List<Item> items = itemDAO.getAllItems();
        assertTrue(items.stream().anyMatch(i -> i.getName().equals("JUnit Book")));
    }

    @Test
    void testUpdateItem() {
        List<Item> items = itemDAO.getAllItems();
        Item item = items.get(items.size() - 1); // Last added
        item.setName("JUnit Updated");
        boolean updated = itemDAO.updateItem(item);
        assertTrue(updated);

        Item updatedItem = itemDAO.getItemById(item.getItemId());
        assertEquals("JUnit Updated", updatedItem.getName());
    }

    @Test
    void testDeleteItem() {
        List<Item> items = itemDAO.getAllItems();
        Item item = items.get(items.size() - 1); // Last added
        boolean deleted = itemDAO.deleteItem(item.getItemId());
        assertTrue(deleted);
    }
}
