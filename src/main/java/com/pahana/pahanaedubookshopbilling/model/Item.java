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

public class Item {

    private int itemId;
    private String name;
    private String description;
    private double price;
    private int stock;
    private String category;
    private String author;
    private String publisher;
    private String status;
    private java.sql.Timestamp createdAt;

    public Item() {
    }

    public Item(int itemId, String name, String description, double price, int stock, String category, String author, String publisher, String status, java.sql.Timestamp createdAt) {
        this.itemId = itemId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.category = category;
        this.author = author;
        this.publisher = publisher;
        this.status = status;
        this.createdAt = createdAt;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
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
        return "Item{" + "itemId=" + itemId + ", name=" + name + ", description=" + description + ", price=" + price + ", stock=" + stock + ", category=" + category + ", author=" + author + ", publisher=" + publisher + ", status=" + status + ", createdAt=" + createdAt + '}';
    }
}
