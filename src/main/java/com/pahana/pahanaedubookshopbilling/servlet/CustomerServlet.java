/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.servlet;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.factory.DAOFactory;
import com.pahana.pahanaedubookshopbilling.dao.CustomerDAO;
import com.pahana.pahanaedubookshopbilling.model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/customer")
public class CustomerServlet extends HttpServlet {

    private CustomerDAO customerDAO = DAOFactory.getCustomerDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.equals("list")) {
            List<Customer> customers = customerDAO.getAllCustomers();
            request.setAttribute("customers", customers);
            request.getRequestDispatcher("customer-management.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            String accountNoStr = request.getParameter("accountNo");
            if (accountNoStr != null && !accountNoStr.isEmpty()) {
                int accountNo = Integer.parseInt(accountNoStr);
                Customer c = customerDAO.getCustomerByAccountNo(accountNo);
                request.setAttribute("customer", c);
                request.getRequestDispatcher("edit-customer.jsp").forward(request, response);
            } else {
                response.sendRedirect("customer?action=list");
            }
        } else if (action.equals("delete")) {
            String accountNoStr = request.getParameter("accountNo");
            if (accountNoStr != null && !accountNoStr.isEmpty()) {
                int accountNo = Integer.parseInt(accountNoStr);
                customerDAO.deleteCustomer(accountNo);
            }
            response.sendRedirect("customer?action=list");
        } else if (action.equals("add")) {
            request.getRequestDispatcher("add-customer.jsp").forward(request, response);
        } else {
            response.sendRedirect("customer?action=list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountNoStr = request.getParameter("accountNo");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String unitsConsumedStr = request.getParameter("unitsConsumed");
        String status = request.getParameter("status");

        int unitsConsumed = 0;
        try {
            if (unitsConsumedStr != null && !unitsConsumedStr.trim().isEmpty()) {
                unitsConsumed = Integer.parseInt(unitsConsumedStr.trim());
            }
        } catch (NumberFormatException ex) {
            unitsConsumed = 0;
        }

        if (accountNoStr == null || accountNoStr.isEmpty()) {
            Customer c = new Customer();
            c.setName(name);
            c.setAddress(address);
            c.setPhone(phone);
            c.setEmail(email);
            c.setUnitsConsumed(unitsConsumed);
            c.setStatus(status);
            c.setCreatedAt(new java.sql.Timestamp(System.currentTimeMillis()));
            customerDAO.insertCustomer(c);
        } else {
            int accountNo = Integer.parseInt(accountNoStr);
            Customer c = customerDAO.getCustomerByAccountNo(accountNo);
            if (c != null) {
                c.setName(name);
                c.setAddress(address);
                c.setPhone(phone);
                c.setEmail(email);
                c.setUnitsConsumed(unitsConsumed);
                c.setStatus(status);
                customerDAO.updateCustomer(c);
            }
        }
        response.sendRedirect("customer?action=list");
    }
}
