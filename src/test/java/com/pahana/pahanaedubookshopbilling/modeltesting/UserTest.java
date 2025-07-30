/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.modeltesting;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.model.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.sql.Timestamp;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Disabled;
@Disabled
class UserTest {

    private User user;
    private Timestamp now;

    @BeforeEach
    void setUp() {
        now = new Timestamp(System.currentTimeMillis());
        user = new User(1, "admin", "pass123", "admin", "Jegamohan",
                "jega@example.com", "1234567890", "active", now);
    }

    @Test
    void testGetters() {
        assertEquals(1, user.getUserId());
        assertEquals("admin", user.getUsername());
        assertEquals("pass123", user.getPassword());
        assertEquals("admin", user.getRole());
        assertEquals("Jegamohan", user.getName());
        assertEquals("jega@example.com", user.getEmail());
        assertEquals("1234567890", user.getPhone());
        assertEquals("active", user.getStatus());
        assertEquals(now, user.getCreatedAt());
    }

    @Test
    void testSetters() {
        user.setUserId(2);
        user.setUsername("cashier1");
        user.setPassword("newpass");
        user.setRole("cashier");
        user.setName("Sai");
        user.setEmail("sai@example.com");
        user.setPhone("0987654321");
        user.setStatus("inactive");
        Timestamp later = new Timestamp(System.currentTimeMillis());
        user.setCreatedAt(later);

        assertEquals(2, user.getUserId());
        assertEquals("cashier1", user.getUsername());
        assertEquals("newpass", user.getPassword());
        assertEquals("cashier", user.getRole());
        assertEquals("Sai", user.getName());
        assertEquals("sai@example.com", user.getEmail());
        assertEquals("0987654321", user.getPhone());
        assertEquals("inactive", user.getStatus());
        assertEquals(later, user.getCreatedAt());
    }

    @Test
    void testToString() {
        String result = user.toString();
        assertTrue(result.contains("userId=1"));
        assertTrue(result.contains("username=admin"));
        assertTrue(result.contains("password=pass123"));
        assertTrue(result.contains("role=admin"));
        assertTrue(result.contains("name=Jegamohan"));
        assertTrue(result.contains("email=jega@example.com"));
        assertTrue(result.contains("phone=1234567890"));
        assertTrue(result.contains("status=active"));
        assertTrue(result.contains(now.toString()));
    }
}
