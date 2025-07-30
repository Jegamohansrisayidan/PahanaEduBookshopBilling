/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.servlet;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.model.User;
import com.pahana.pahanaedubookshopbilling.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/add-user")
public class AddUserServlet extends HttpServlet {

    private UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Check if user is admin (optional security check)
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        User currentUser = (User) session.getAttribute("user");
        if (!"admin".equalsIgnoreCase(currentUser.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Gather parameters from form
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password); // plain password - hashing happens in service
        user.setRole(role);
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setStatus("active");
        user.setCreatedAt(new java.sql.Timestamp(System.currentTimeMillis()));

        boolean success = userService.createUser(user);

        if (success) {
            response.sendRedirect("add-user.jsp?msg=User added successfully!");
        } else {
            response.sendRedirect("add-user.jsp?error=Failed to add user. Username/email may already exist.");
        }
    }
}
