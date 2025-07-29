/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.model;

/**
 *
 * @author Jegamohan Srisayidan
 */

public class BillItem {

    private int billItemId;
    private int billId;
    private int itemId;
    private int quantity;
    private double itemPrice;
    private double discount;
    private double subtotal;

    public BillItem() {
    }

    public BillItem(int billItemId, int billId, int itemId, int quantity, double itemPrice, double discount, double subtotal) {
        this.billItemId = billItemId;
        this.billId = billId;
        this.itemId = itemId;
        this.quantity = quantity;
        this.itemPrice = itemPrice;
        this.discount = discount;
        this.subtotal = subtotal;
    }

    public int getBillItemId() {
        return billItemId;
    }

    public void setBillItemId(int billItemId) {
        this.billItemId = billItemId;
    }

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(double itemPrice) {
        this.itemPrice = itemPrice;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    @Override
    public String toString() {
        return "BillItem{" + "billItemId=" + billItemId + ", billId=" + billId + ", itemId=" + itemId + ", quantity=" + quantity + ", itemPrice=" + itemPrice + ", discount=" + discount + ", subtotal=" + subtotal + '}';
    }
}
