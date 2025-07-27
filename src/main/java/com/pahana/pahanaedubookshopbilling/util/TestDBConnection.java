/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.util;

/**
 *
 * @author Jegamohan Srisayidan
 */

import java.sql.Connection;
import java.sql.SQLException;

public class TestDBConnection {

    public static void main(String[] args) {
        try {

            // Get connection from Singleton class
            
            Connection conn = DBConnection.getInstance().getConnection();
            if (conn != null && !conn.isClosed()) {
                System.out.println("Database connection successful!");
            } else {
                System.out.println("Database connection failed!");
            }
        } catch (SQLException e) {
            System.out.println("Error connecting to database: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
