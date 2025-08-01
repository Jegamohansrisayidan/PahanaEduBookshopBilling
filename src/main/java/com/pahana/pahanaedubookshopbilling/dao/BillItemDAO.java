/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.dao;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.model.BillItem;
import com.pahana.pahanaedubookshopbilling.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillItemDAO {

    // Get bill item by id
    
    public BillItem getBillItemById(int billItemId) {
        BillItem billItem = null;
        String sql = "SELECT * FROM bill_items WHERE bill_item_id = ?";
        try (Connection conn = DBConnection.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, billItemId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                billItem = extractBillItem(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return billItem;
    }

    // Insert a new bill item (useful for a list in a bill)
    
    public boolean insertBillItem(BillItem billItem) {
        String sql = "INSERT INTO bill_items (bill_id, item_id, quantity, item_price, discount, subtotal) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, billItem.getBillId());
            ps.setInt(2, billItem.getItemId());
            ps.setInt(3, billItem.getQuantity());
            ps.setDouble(4, billItem.getItemPrice());
            ps.setDouble(5, billItem.getDiscount());
            ps.setDouble(6, billItem.getSubtotal());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Update bill item
    
    public boolean updateBillItem(BillItem billItem) {
        String sql = "UPDATE bill_items SET bill_id=?, item_id=?, quantity=?, item_price=?, discount=?, subtotal=? WHERE bill_item_id=?";
        try (Connection conn = DBConnection.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, billItem.getBillId());
            ps.setInt(2, billItem.getItemId());
            ps.setInt(3, billItem.getQuantity());
            ps.setDouble(4, billItem.getItemPrice());
            ps.setDouble(5, billItem.getDiscount());
            ps.setDouble(6, billItem.getSubtotal());
            ps.setInt(7, billItem.getBillItemId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete bill item
    
    public boolean deleteBillItem(int billItemId) {
        String sql = "DELETE FROM bill_items WHERE bill_item_id=?";
        try (Connection conn = DBConnection.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, billItemId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get all bill items for a bill
    
    public List<BillItem> getBillItemsByBillId(int billId) {
        List<BillItem> list = new ArrayList<>();
        String sql = "SELECT * FROM bill_items WHERE bill_id=?";
        try (Connection conn = DBConnection.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, billId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractBillItem(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Helper: extract BillItem from ResultSet
    
    private BillItem extractBillItem(ResultSet rs) throws SQLException {
        BillItem billItem = new BillItem();
        billItem.setBillItemId(rs.getInt("bill_item_id"));
        billItem.setBillId(rs.getInt("bill_id"));
        billItem.setItemId(rs.getInt("item_id"));
        billItem.setQuantity(rs.getInt("quantity"));
        billItem.setItemPrice(rs.getDouble("item_price"));
        billItem.setDiscount(rs.getDouble("discount"));
        billItem.setSubtotal(rs.getDouble("subtotal"));
        return billItem;
    }
}
