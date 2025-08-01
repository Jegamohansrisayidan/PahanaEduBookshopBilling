/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.servicejunittesting;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.model.User;
import com.pahana.pahanaedubookshopbilling.service.UserService;
import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;
import java.sql.Timestamp;

@Disabled
class UserServiceTest {

    private UserService userService;

    @BeforeEach
    void setUp() {
        userService = new UserService();
    }

    @Test
    void testCreateAndAuthenticateUser() {
        // Remove existing user if present
        User existing = userService.authenticate("JUnitAuth", "password");
        if (existing != null) {
            userService.getUserDAO().deleteUser(existing.getUserId());
        }
        User user = new User(0, "JUnitAuth", "password", "cashier", "Auth", "auth@mail.com", "99999", "active", new Timestamp(System.currentTimeMillis()));
        boolean created = userService.createUser(user);
        assertTrue(created);

        User authenticated = userService.authenticate("JUnitAuth", "password");
        assertNotNull(authenticated);
        assertEquals("JUnitAuth", authenticated.getUsername());
    }

}
