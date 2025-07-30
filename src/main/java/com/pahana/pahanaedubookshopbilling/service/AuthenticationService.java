/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.service;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.factory.DAOFactory;
import com.pahana.pahanaedubookshopbilling.dao.UserDAO;
import com.pahana.pahanaedubookshopbilling.model.User;
import org.mindrot.jbcrypt.BCrypt;

public class AuthenticationService {

    private UserDAO userDAO = DAOFactory.getUserDAO();

    public User authenticate(String username, String password) {
        User user = userDAO.getUserByUsername(username);
        
        // Check hash using BCrypt
        
        if (user != null && BCrypt.checkpw(password, user.getPassword())) {
            return user;
        }
        return null;
    }
}
