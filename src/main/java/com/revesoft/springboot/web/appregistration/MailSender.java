package com.revesoft.springboot.web.appregistration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailParseException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.*;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletContext;
import java.util.*;

/**
 * Created by Bony on 10/22/2017.
 */
@Component
public class MailSender {

    @Autowired

    ServletContext context;




   private JavaMailSender sender=new JavaMailSenderImpl();


    @Bean
    public JavaMailSender getJavaMailSender() {
       JavaMailSender mailSender = new JavaMailSenderImpl();
//        mailSender.setHost("smtp.gmail.com");
//        mailSender.setPort(587);
//
//        mailSender.setUsername("my.gmail@gmail.com");
//        mailSender.setPassword("password");
//
//        Properties props = mailSender.getJavaMailProperties();
//        props.put("mail.transport.protocol", "smtp");
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.starttls.enable", "true");
//        props.put("mail.debug", "true");

        return mailSender;
    }

    public boolean sendMail(String From, String To, String Subject, String mailbody, HashMap<String,String> Files) {
        final String username = "oisf.reve@gmail.com";
        final String password = "oisf@reve";
        boolean isSend=false;

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");

        //added by Bishwajit Saha for ignoring antivirus action
        props.put("mail.smtp.ssl.trust", "*");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(From));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(To));
            message.setSubject(Subject);
            message.setText(mailbody);

            MimeBodyPart messagePart = new MimeBodyPart();
            messagePart.setContent(mailbody, "text/html");



            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messagePart);

//            String file = "static/assets/docs/SSO_Integration_Manual(Technical).docx";
            //String absoulatePart=context.getRealPath("resources").toString();

//            Iterator it = Files.entrySet().iterator();
//            while (it.hasNext()) {
//
//                MimeBodyPart  messageBodyPart = new MimeBodyPart();
//                Map.Entry pair = (Map.Entry)it.next();
//                System.out.println(pair.getKey() + " = " + pair.getValue());
//                it.remove(); // avoids a ConcurrentModificationException
//
//                String file = pair.getValue().toString();
//                String fileName = pair.getKey().toString();
//                DataSource source = new FileDataSource(file);
//                messageBodyPart.setDataHandler(new DataHandler(source));
//                messageBodyPart.setFileName(fileName);
//                multipart.addBodyPart(messageBodyPart);
//
//
//
//
//            }
            message.setContent(multipart);

            System.out.println("Sending");

            Transport.send(message);
            isSend=true;

            System.out.println("Done");


        } catch (MessagingException e) {
            isSend=false;
            throw new RuntimeException(e);
        }
        return isSend;
    }


    public void sendEmail( String From,String To,String Subject,String mailbody) throws Exception{


        final String username = "oisf.reve@gmail.com";
        final String password = "oisf@reve";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");

        //added by Bishwajit Saha for ignoring antivirus action
        props.put("mail.smtp.ssl.trust", "*");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(From));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(To));
            message.setSubject(Subject);
            message.setText(mailbody);

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

}
