/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.service;

/**
 *
 * @author Jegamohan Srisayidan
 */
import com.pahana.pahanaedubookshopbilling.dao.UserDAO;
import com.pahana.pahanaedubookshopbilling.factory.DAOFactory;
import com.pahana.pahanaedubookshopbilling.model.User;
import org.mindrot.jbcrypt.BCrypt;

public class UserService {

    private UserDAO userDAO = DAOFactory.getUserDAO();

    public boolean createUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userDAO.insertUser(user);
    }

    // For one-time admin/user creation in Java
    public boolean createUserWithHashedPassword(User user) {

        // Always hash the password before save!
        String plainPassword = user.getPassword();
        String hashed = BCrypt.hashpw(plainPassword, BCrypt.gensalt());
        user.setPassword(hashed);
        return userDAO.insertUser(user);
    }

    // For updating password (e.g., admin changes)
    public boolean updateUserPassword(User user, String newPassword) {
        String hashed = BCrypt.hashpw(newPassword, BCrypt.gensalt());
        user.setPassword(hashed);
        return userDAO.updateUser(user);
    }

    // Authenticate
    public User authenticate(String username, String password) {
        User user = userDAO.getUserByUsername(username);
        if (user != null && BCrypt.checkpw(password, user.getPassword())) {
            return user;
        }
        return null;
    }

    public UserDAO getUserDAO() {
        return userDAO;
    }

}
