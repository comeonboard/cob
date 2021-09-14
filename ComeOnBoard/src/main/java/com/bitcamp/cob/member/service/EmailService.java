package com.bitcamp.cob.member.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
	
	@Autowired
	private JavaMailSender sender;
	
	public int sendEmail(String memEmail, HttpSession session) {
		int result = 1;
		
		Random random = new Random();
		int chkNum = random.nextInt(1000000);
		MimeMessage message = sender.createMimeMessage();
		
		//메일 제목
		try {
			message.setSubject("Come On, Board E-mail 인증 번호", "UTF-8");
		
			String html = "<h1>Come On, Board 인증번호는 ";
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("chkNum", chkNum);
		return result;
	}
	
	
	
	
}
