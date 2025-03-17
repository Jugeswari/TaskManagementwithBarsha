package com.taskmanagement.servlet;
import java.util.ArrayList;
import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class EmailReminder {
   
	public static void sendEmail(String recipientEmail, ArrayList<String> tasks) {
        final String senderEmail = "barshameher976@gmail.com"; // Apna email likho
        final String senderPassword = "sixr amlw fqds ngvl"; // App password

        // SMTP Server Properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        // Create Session
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            // Email Message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Task Deadline Reminder");

            StringBuilder emailbodyBuilder = new StringBuilder("Dear, \n\n This is a remainder that your below Mention tasks are Overdue : \n ");
            for(int i = 0 ; i<tasks.size(); i++)
            {
            	String task = tasks.get(i);
            	emailbodyBuilder.append(task).append("\n");
            }
            
            emailbodyBuilder.append("Please try to finish your tasks ASAP \n \n Best regards \n Task Management with Barsha");
            
            message.setText(emailbodyBuilder.toString());
            
            Transport.send(message);
            System.out.println("Reminder Email Sent Successfully!");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
		
	}

}