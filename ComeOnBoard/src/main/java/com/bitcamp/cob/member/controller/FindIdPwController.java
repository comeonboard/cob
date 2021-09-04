package com.bitcamp.cob.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FindIdPwController {
	
	@RequestMapping("/member/findId")
	public String findId() {
		
		return "member/findId";
	}

	@RequestMapping("/member/findPw")
	public String findPw() {
		
		return "member/findPw";
	}
}
