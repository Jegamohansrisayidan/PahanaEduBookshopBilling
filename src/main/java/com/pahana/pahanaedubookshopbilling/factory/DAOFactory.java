/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.factory;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.dao.*;

public class DAOFactory {

    public static CustomerDAO getCustomerDAO() {
        return new CustomerDAO();
    }

    public static ItemDAO getItemDAO() {
        return new ItemDAO();
    }

    public static BillDAO getBillDAO() {
        return new BillDAO();
    }

    public static BillItemDAO getBillItemDAO() {
        return new BillItemDAO();
    }

    public static UserDAO getUserDAO() {
        return new UserDAO();
    }
}
