/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.observer;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.*;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.properties.HorizontalAlignment;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.UnitValue;
import com.pahana.pahanaedubookshopbilling.model.Bill;
import com.pahana.pahanaedubookshopbilling.model.BillItem;
import com.pahana.pahanaedubookshopbilling.model.Customer;
import com.pahana.pahanaedubookshopbilling.dao.ItemDAO;
import com.pahana.pahanaedubookshopbilling.model.Item;

import java.util.List;

public class BillPdfGenerator {

    public static String generateBillPdf(Bill bill, Customer customer, List<BillItem> items) throws Exception {
        String fileName = "Bill-" + bill.getBillId() + ".pdf";
        PdfWriter writer = new PdfWriter(fileName);
        PdfDocument pdfDoc = new PdfDocument(writer);
        Document document = new Document(pdfDoc);

        // === (1) Add Logo (if available) ===
        
        try {
            String logoPath = "webapp/logo.png";
            ImageData imageData = ImageDataFactory.create(logoPath);
            Image logo = new Image(imageData)
                    .scaleToFit(90, 90)
                    .setHorizontalAlignment(HorizontalAlignment.CENTER)
                    .setMarginBottom(8);
            document.add(logo);
        } catch (Exception e) {
            
            // If logo not found, skip
            
            System.out.println("Logo image not found: " + e.getMessage());
        }

        // === (2) Add Colored Header ===
        
        DeviceRgb headerBlue = new DeviceRgb(0, 102, 204); // Nice blue, or use your gold/brand color
        Paragraph header = new Paragraph("Pahana Edu Bookshop - Bill")
                .setTextAlignment(TextAlignment.CENTER)
                .setFontSize(22)
                .setBold()
                .setFontColor(ColorConstants.WHITE)
                .setBackgroundColor(headerBlue)
                .setPadding(10)
                .setMarginBottom(18);
        document.add(header);

        // === (3) Customer Info ===
        
        document.add(new Paragraph("Customer Name: " + (customer != null ? customer.getName() : "N/A")));
        if (customer != null) {
            document.add(new Paragraph("Address: " + customer.getAddress()));
            document.add(new Paragraph("Phone: " + customer.getPhone()));
        }
        document.add(new Paragraph("Account No: " + bill.getAccountNo()));
        document.add(new Paragraph("Bill Date: " + bill.getBillDate()));
        document.add(new Paragraph("Bill ID: " + bill.getBillId()));
        document.add(new Paragraph("Payment Method: " + bill.getPaymentMethod()).setMarginBottom(12));

        // === (4) Table Header ===
        
        Table table = new Table(UnitValue.createPercentArray(new float[]{1, 3, 1, 1, 1, 1}))
                .useAllAvailableWidth();
        DeviceRgb gold = new DeviceRgb(255, 204, 0); // Optional: change to headerBlue for blue table
        table.addHeaderCell(new Cell().add(new Paragraph("No")).setBackgroundColor(gold));
        table.addHeaderCell(new Cell().add(new Paragraph("Item Name")).setBackgroundColor(gold));
        table.addHeaderCell(new Cell().add(new Paragraph("Qty")).setBackgroundColor(gold));
        table.addHeaderCell(new Cell().add(new Paragraph("Price")).setBackgroundColor(gold));
        table.addHeaderCell(new Cell().add(new Paragraph("Discount")).setBackgroundColor(gold));
        table.addHeaderCell(new Cell().add(new Paragraph("Subtotal")).setBackgroundColor(gold));

        // === (5) Table Rows ===
        
        ItemDAO itemDAO = new ItemDAO();
        int count = 1;
        for (BillItem billItem : items) {
            Item item = itemDAO.getItemById(billItem.getItemId());
            String itemName = (item != null) ? item.getName() : "Unknown Item";
            
            // Alternate row colors
            
            Color rowColor = (count % 2 == 0)
                    ? new DeviceRgb(245, 245, 245)
                    : ColorConstants.WHITE;

            table.addCell(new Cell().add(new Paragraph(String.valueOf(count))).setBackgroundColor(rowColor));
            table.addCell(new Cell().add(new Paragraph(itemName)).setBackgroundColor(rowColor));
            table.addCell(new Cell().add(new Paragraph(String.valueOf(billItem.getQuantity()))).setBackgroundColor(rowColor));
            table.addCell(new Cell().add(new Paragraph(String.format("Rs. %.2f", billItem.getItemPrice()))).setBackgroundColor(rowColor));
            table.addCell(new Cell().add(new Paragraph(String.format("Rs. %.2f", billItem.getDiscount()))).setBackgroundColor(rowColor));
            table.addCell(new Cell().add(new Paragraph(String.format("Rs. %.2f", billItem.getSubtotal()))).setBackgroundColor(rowColor));
            count++;
        }
        document.add(table.setMarginBottom(14));

        // === (6) Summary Section (single line) ===
        
        Table summary = new Table(UnitValue.createPercentArray(new float[]{1}))
                .setWidth(UnitValue.createPercentValue(60))
                .setTextAlignment(TextAlignment.RIGHT)
                .setMarginLeft(250);

        summary.addCell(
                new Cell(1, 1)
                        .add(new Paragraph("Total Amount: Rs. " + String.format("%.2f", bill.getTotalAmount())))
                        .setBorder(Border.NO_BORDER)
                        .setBold()
        );
        document.add(summary);

        document.add(new Paragraph("\nThank you for your purchase!").setTextAlignment(TextAlignment.CENTER).setFontSize(13).setMarginTop(18));

        // === (7) Footer with contact email ===
        
        Paragraph footer = new Paragraph("Contact : Pahanaedu@gmail.com")
                .setTextAlignment(TextAlignment.CENTER)
                .setFontSize(9)
                .setFontColor(ColorConstants.GRAY)
                .setMarginTop(20);
        document.add(footer);

        document.close();
        return fileName;
    }
}
