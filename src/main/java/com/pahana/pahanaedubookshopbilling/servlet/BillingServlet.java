/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.servlet;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.model.Bill;
import com.pahana.pahanaedubookshopbilling.model.BillItem;
import com.pahana.pahanaedubookshopbilling.model.User;
import com.pahana.pahanaedubookshopbilling.observer.EmailNotificationObserver;
import com.pahana.pahanaedubookshopbilling.service.BillingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/billing")
public class BillingServlet extends HttpServlet {

    private static double parseDoubleSafe(String s) {
        if (s == null || s.trim().isEmpty()) {
            return 0.0;
        }
        try {
            return Double.parseDouble(s.trim());
        } catch (NumberFormatException e) {
            return 0.0;
        }
    }

    private static int parseIntSafe(String s) {
        if (s == null || s.trim().isEmpty()) {
            return 0;
        }
        try {
            return Integer.parseInt(s.trim());
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int accountNo = parseIntSafe(request.getParameter("accountNo"));
        double totalAmount = parseDoubleSafe(request.getParameter("totalAmount"));
        double discount = parseDoubleSafe(request.getParameter("totalDiscount"));
        double tax = parseDoubleSafe(request.getParameter("tax"));
        double paidAmount = parseDoubleSafe(request.getParameter("paidAmount"));
        String paymentMethod = request.getParameter("paymentMethod");

        Bill bill = new Bill();
        bill.setAccountNo(accountNo);
        bill.setUserId(user.getUserId());
        bill.setBillDate(new Timestamp(System.currentTimeMillis()));
        bill.setTotalAmount(totalAmount);
        bill.setDiscount(discount);
        bill.setTax(tax);
        bill.setPaidAmount(paidAmount);
        bill.setPaymentMethod(paymentMethod != null ? paymentMethod : "cash");
        bill.setStatus("paid");
        bill.setRemarks("");

        String[] itemIds = request.getParameterValues("itemId");
        String[] itemPrices = request.getParameterValues("itemPrice");
        String[] quantities = request.getParameterValues("quantity");
        String[] discounts = request.getParameterValues("discount");
        String[] subtotals = request.getParameterValues("subtotal");

        List<BillItem> billItems = new ArrayList<>();
        if (itemIds != null && itemPrices != null && quantities != null && discounts != null && subtotals != null) {
            int itemCount = itemIds.length;
            for (int i = 0; i < itemCount; i++) {
                if (itemIds[i] == null || itemIds[i].isEmpty()) {
                    continue;
                }
                BillItem bi = new BillItem();
                bi.setItemId(parseIntSafe(itemIds[i]));
                bi.setQuantity(parseIntSafe(quantities[i]));
                bi.setItemPrice(parseDoubleSafe(itemPrices[i]));
                bi.setDiscount(parseDoubleSafe(discounts[i]));
                bi.setSubtotal(parseDoubleSafe(subtotals[i]));
                billItems.add(bi);
            }
        }

        BillingService billingService = new BillingService();
        billingService.addObserver(new EmailNotificationObserver());

        int billId = billingService.createBillWithItems(bill, billItems);

        if (billId > 0) {
            response.sendRedirect("bill-history.jsp?msg=created");
        } else {
            response.sendRedirect("bill-history.jsp?msg=error");
        }
    }
}
