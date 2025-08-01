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
import com.pahana.pahanaedubookshopbilling.dao.ItemDAO;
import com.pahana.pahanaedubookshopbilling.model.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/item")
public class ItemServlet extends HttpServlet {

    private ItemDAO itemDAO = DAOFactory.getItemDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.equals("list")) {
            List<Item> items = itemDAO.getAllItems();
            request.setAttribute("items", items);
            request.getRequestDispatcher("item-management.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            String itemIdStr = request.getParameter("itemId");
            if (itemIdStr != null) {
                int itemId = Integer.parseInt(itemIdStr);
                Item item = itemDAO.getItemById(itemId);
                request.setAttribute("item", item);
                request.getRequestDispatcher("edit-item.jsp").forward(request, response);
            }
        } else if (action.equals("delete")) {
            String itemIdStr = request.getParameter("itemId");
            if (itemIdStr != null) {
                int itemId = Integer.parseInt(itemIdStr);
                itemDAO.deleteItem(itemId);
            }
            response.sendRedirect("item?action=list");
        } else if (action.equals("add")) {
            request.getRequestDispatcher("add-item.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String itemIdStr = request.getParameter("itemId");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String category = request.getParameter("category");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String status = request.getParameter("status");

        if (itemIdStr == null || itemIdStr.isEmpty()) {
            Item item = new Item();
            item.setName(name);
            item.setDescription(description);
            item.setPrice(price);
            item.setStock(stock);
            item.setCategory(category);
            item.setAuthor(author);
            item.setPublisher(publisher);
            item.setStatus(status);
            item.setCreatedAt(new java.sql.Timestamp(System.currentTimeMillis()));
            itemDAO.insertItem(item);
        } else {
            int itemId = Integer.parseInt(itemIdStr);
            Item item = itemDAO.getItemById(itemId);
            if (item != null) {
                item.setName(name);
                item.setDescription(description);
                item.setPrice(price);
                item.setStock(stock);
                item.setCategory(category);
                item.setAuthor(author);
                item.setPublisher(publisher);
                item.setStatus(status);
                itemDAO.updateItem(item);
            }
        }
        response.sendRedirect("item?action=list");
    }
}
