/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.model;

/**
 *
 * @author Jegamohan Srisayidan
 */

import java.sql.Timestamp;

public class Customer {

    private int accountNo;
    private String name;
    private String address;
    private String phone;
    private String email;
    private int unitsConsumed;
    private String status;
    private java.sql.Timestamp createdAt;

    public Customer() {
    }

    public Customer(int accountNo, String name, String address, String phone, String email, int unitsConsumed, String status, java.sql.Timestamp createdAt) {
        this.accountNo = accountNo;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.unitsConsumed = unitsConsumed;
        this.status = status;
        this.createdAt = createdAt;
    }

    public int getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(int accountNo) {
        this.accountNo = accountNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getUnitsConsumed() {
        return unitsConsumed;
    }

    public void setUnitsConsumed(int unitsConsumed) {
        this.unitsConsumed = unitsConsumed;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Customer{" + "accountNo=" + accountNo + ", name=" + name + ", address=" + address + ", phone=" + phone + ", email=" + email + ", unitsConsumed=" + unitsConsumed + ", status=" + status + ", createdAt=" + createdAt + '}';
    }
}
