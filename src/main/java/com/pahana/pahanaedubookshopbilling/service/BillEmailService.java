/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.service;

/**
 *
 * @author Jegamohan Srisayidan
 */

import com.pahana.pahanaedubookshopbilling.util.EmailWithAttachmentUtil;
import com.pahana.pahanaedubookshopbilling.model.Bill;
import com.pahana.pahanaedubookshopbilling.model.BillItem;
import com.pahana.pahanaedubookshopbilling.model.Customer;
import com.pahana.pahanaedubookshopbilling.observer.BillPdfGenerator;
import java.io.File;
import java.util.List;

public class BillEmailService {

    public void sendBillEmailWithAttachment(Bill bill, Customer customer, List<BillItem> items, String customerEmail) {
        try {
            
            // 1. Generate the PDF file (returns file path)
            
            String pdfPath = BillPdfGenerator.generateBillPdf(bill, customer, items);
            File pdfFile = new File(pdfPath);

            // 2. Compose the email subject and body
            
            String subject = "Your Bill from Pahana Edu Bookshop (Bill ID: " + bill.getBillId() + ")";
            String body = "Dear " + (customer != null ? customer.getName() : "customer")
                    + ",\n\nYour bill is attached as a PDF file.\n\nThank you!\nPahana Edu Team";

            // 3. Send the email with PDF attached
            
            EmailWithAttachmentUtil.sendMailWithAttachment(customerEmail, subject, body, pdfFile);

            // Optionally, delete the PDF after sending if it's just a temp file
            // pdfFile.delete();
            
            System.out.println("Bill email with attachment sent to " + customerEmail);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Failed to send bill email with attachment: " + e.getMessage());
        }
    }
}
