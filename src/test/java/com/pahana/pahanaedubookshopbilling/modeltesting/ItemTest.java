/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.modeltesting;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.model.Item;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.sql.Timestamp;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Disabled;
@Disabled
class ItemTest {

    private Item item;
    private Timestamp now;

    @BeforeEach
    void setUp() {
        now = new Timestamp(System.currentTimeMillis());
        item = new Item(
                101,
                "Java Book",
                "Complete Java Programming Guide",
                1500.0,
                25,
                "Education",
                "James Gosling",
                "Oracle Press",
                "Available",
                now
        );
    }

    @Test
    void testGetters() {
        assertEquals(101, item.getItemId());
        assertEquals("Java Book", item.getName());
        assertEquals("Complete Java Programming Guide", item.getDescription());
        assertEquals(1500.0, item.getPrice());
        assertEquals(25, item.getStock());
        assertEquals("Education", item.getCategory());
        assertEquals("James Gosling", item.getAuthor());
        assertEquals("Oracle Press", item.getPublisher());
        assertEquals("Available", item.getStatus());
        assertEquals(now, item.getCreatedAt());
    }

    @Test
    void testSetters() {
        Timestamp later = new Timestamp(System.currentTimeMillis());

        item.setItemId(202);
        item.setName("Python Book");
        item.setDescription("Python Programming for Beginners");
        item.setPrice(1200.0);
        item.setStock(30);
        item.setCategory("Technology");
        item.setAuthor("Guido van Rossum");
        item.setPublisher("Tech Press");
        item.setStatus("Out of Stock");
        item.setCreatedAt(later);

        assertEquals(202, item.getItemId());
        assertEquals("Python Book", item.getName());
        assertEquals("Python Programming for Beginners", item.getDescription());
        assertEquals(1200.0, item.getPrice());
        assertEquals(30, item.getStock());
        assertEquals("Technology", item.getCategory());
        assertEquals("Guido van Rossum", item.getAuthor());
        assertEquals("Tech Press", item.getPublisher());
        assertEquals("Out of Stock", item.getStatus());
        assertEquals(later, item.getCreatedAt());
    }

    @Test
    void testToString() {
        String result = item.toString();
        assertTrue(result.contains("itemId=101"));
        assertTrue(result.contains("name=Java Book"));
        assertTrue(result.contains("description=Complete Java Programming Guide"));
        assertTrue(result.contains("price=1500.0"));
        assertTrue(result.contains("stock=25"));
        assertTrue(result.contains("category=Education"));
        assertTrue(result.contains("author=James Gosling"));
        assertTrue(result.contains("publisher=Oracle Press"));
        assertTrue(result.contains("status=Available"));
        assertTrue(result.contains(now.toString()));
    }
}
