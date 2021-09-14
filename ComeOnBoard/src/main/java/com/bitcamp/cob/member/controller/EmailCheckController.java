package com.bitcamp.cob.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bitcamp.cob.member.service.EmailService;

@RestController
public class EmailCheckController {
	
	@Autowired
	EmailService service;
	
	@PostMapping("/members/email")
	public int sendEmail(
			@RequestParam("memEmail") String memEmail,
			HttpSession session
			) {
		service.sen
		
		return 1;
	}
	
}
