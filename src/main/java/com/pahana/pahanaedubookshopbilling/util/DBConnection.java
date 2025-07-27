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
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/pahana_billing";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    // Singleton instance
    
    private static DBConnection instance;
    private Connection connection;

    // Private constructor to prevent instantiation
    
    private DBConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException ex) {
            throw new SQLException("MySQL JDBC Driver not found.", ex);
        }
    }

    // Get the singleton instance
    
    public static DBConnection getInstance() throws SQLException {
        if (instance == null || instance.getConnection().isClosed()) {
            instance = new DBConnection();
        }
        return instance;
    }

    // Get the JDBC Connection object
    
    public Connection getConnection() {
        return connection;
    }
}
