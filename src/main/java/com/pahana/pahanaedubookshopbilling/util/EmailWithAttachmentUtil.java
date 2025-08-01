/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahana.pahanaedubookshopbilling.util;

/**
 *
 * @author Jegamohan Srisayidan
 */

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.io.File;
import java.util.Properties;

public class EmailWithAttachmentUtil {

    public static void sendMailWithAttachment(String to, String subject, String textBody, File attachment) throws Exception {
        String from = "jegamohansrisayidan@gmail.com";   // <-- YOUR email address
        String password = "ypadovsnzbrhagaf";  // <-- YOUR APP PASSWORD (NOT your real password!)
        String host = "smtp.gmail.com";

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props,
                new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        }
        );

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject(subject);

        // Text part
        MimeBodyPart textPart = new MimeBodyPart();
        textPart.setText(textBody);

        // Attachment part
        MimeBodyPart attachPart = new MimeBodyPart();
        attachPart.attachFile(attachment);

        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(textPart);
        multipart.addBodyPart(attachPart);

        message.setContent(multipart);
        Transport.send(message);

        System.out.println("Mail sent with attachment to " + to);
    }
}
