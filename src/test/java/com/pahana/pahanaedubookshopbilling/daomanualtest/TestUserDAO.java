/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.daomanualtest;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.dao.UserDAO;
import com.pahana.pahanaedubookshopbilling.model.User;

public class TestUserDAO {

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();

        // Find user by username
        
        User user = userDAO.getUserByUsername("admin");
        System.out.println(user);

        // Add a new user
        
        User newUser = new User();
        newUser.setUsername("testuser");
        newUser.setPassword("testpass"); // hash before storing in real use!
        newUser.setRole("cashier");
        newUser.setName("Test User");
        newUser.setEmail("test@edu.lk");
        newUser.setPhone("0777777777");
        newUser.setStatus("active");
        newUser.setCreatedAt(new java.sql.Timestamp(System.currentTimeMillis()));

        boolean inserted = userDAO.insertUser(newUser);
        System.out.println("Inserted: " + inserted);
    }
}
