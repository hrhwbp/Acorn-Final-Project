package com.remind.model;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailSender {						
	@Autowired
	private JavaMailSender mailSender;
	
	public boolean sendEmail(Email email) throws Exception{
		try {
			MimeMessage msg = mailSender.createMimeMessage(); 	
			msg.setSubject(email.getSubject());					
			msg.setText(email.getContent());					
			msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));	
			mailSender.send(msg);
			return true;
		} catch (Exception e) {
			System.out.println("sendEmail Error " + e);
			return false;
		}
										
	}
	
}


















