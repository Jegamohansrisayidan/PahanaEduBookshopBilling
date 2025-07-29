/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.dao;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.model.Customer;
import com.pahana.pahanaedubookshopbilling.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    // Get a customer by account number
    
    public Customer getCustomerByAccountNo(int accountNo) {
        Customer customer = null;
        String sql = "SELECT * FROM customers WHERE account_no = ?";
        try (Connection conn = DBConnection.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, accountNo);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                customer = extractCustomer(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    // Add a new customer
    
    public boolean insertCustomer(Customer customer) {
        String sql = "INSERT INTO customers (name, address, phone, email, units_consumed, status, created_at) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getAddress());
            ps.setString(3, customer.getPhone());
            ps.setString(4, customer.getEmail());
            ps.setInt(5, customer.getUnitsConsumed());
            ps.setString(6, customer.getStatus());
            ps.setTimestamp(7, customer.getCreatedAt());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Update customer details
    
    public boolean updateCustomer(Customer customer) {
        String sql = "UPDATE customers SET name=?, address=?, phone=?, email=?, units_consumed=?, status=? WHERE account_no=?";
        try (Connection conn = DBConnection.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getAddress());
            ps.setString(3, customer.getPhone());
            ps.setString(4, customer.getEmail());
            ps.setInt(5, customer.getUnitsConsumed());
            ps.setString(6, customer.getStatus());
            ps.setInt(7, customer.getAccountNo());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete customer
    
    public boolean deleteCustomer(int accountNo) {
        String sql = "DELETE FROM customers WHERE account_no=?";
        try (Connection conn = DBConnection.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, accountNo);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // List all customers
    
    public List<Customer> getAllCustomers() {
        List<Customer> list = new ArrayList<>();
        String sql = "SELECT * FROM customers";
        try (Connection conn = DBConnection.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(extractCustomer(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Helper: extract Customer from ResultSet
    
    private Customer extractCustomer(ResultSet rs) throws SQLException {
        Customer customer = new Customer();
        customer.setAccountNo(rs.getInt("account_no"));
        customer.setName(rs.getString("name"));
        customer.setAddress(rs.getString("address"));
        customer.setPhone(rs.getString("phone"));
        customer.setEmail(rs.getString("email"));
        customer.setUnitsConsumed(rs.getInt("units_consumed"));
        customer.setStatus(rs.getString("status"));
        customer.setCreatedAt(rs.getTimestamp("created_at"));
        return customer;
    }
}
