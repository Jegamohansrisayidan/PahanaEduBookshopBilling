/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.daojunittesting;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.dao.UserDAO;
import com.pahana.pahanaedubookshopbilling.model.User;
import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;
import java.sql.Timestamp;
import java.util.List;
@Disabled
class UserDAOTest {

    private UserDAO userDAO;

    @BeforeEach
    void setUp() {
        userDAO = new UserDAO();
    }

    @Test
    void testInsertAndRetrieveUser() {
        // Clean up if user exists
        User existing = userDAO.getUserByUsername("JUnitUser");
        if (existing != null) {
            userDAO.deleteUser(existing.getUserId());
        }
        User user = new User(0, "JUnitUser", "password", "cashier", "JUnit", "junit@mail.com", "12345", "active", new Timestamp(System.currentTimeMillis()));
        boolean inserted = userDAO.insertUser(user);
        assertTrue(inserted);

        User retrieved = userDAO.getUserByUsername("JUnitUser");
        assertNotNull(retrieved);
        assertEquals("JUnitUser", retrieved.getUsername());
    }

    @Test
    void testUpdateUser() {
        // Always ensure the user exists
        User user = userDAO.getUserByUsername("JUnitUser");
        if (user == null) {
            user = new User(0, "JUnitUser", "password", "cashier", "JUnit", "junit@mail.com", "12345", "active", new Timestamp(System.currentTimeMillis()));
            userDAO.insertUser(user);
            user = userDAO.getUserByUsername("JUnitUser");
        }
        assertNotNull(user);
        user.setName("JUnit Updated");
        boolean updated = userDAO.updateUser(user);
        assertTrue(updated);
        User updatedUser = userDAO.getUserByUsername("JUnitUser");
        assertEquals("JUnit Updated", updatedUser.getName());
    }

    @Test
    void testGetAllUsers() {
        List<User> users = userDAO.getAllUsers();
        assertNotNull(users);
        assertTrue(users.size() > 0);
    }

    @Test
    void testDeleteUser() {
        User user = userDAO.getUserByUsername("JUnitUser");
        assertNotNull(user);
        boolean deleted = userDAO.deleteUser(user.getUserId());
        assertTrue(deleted);
    }
}
