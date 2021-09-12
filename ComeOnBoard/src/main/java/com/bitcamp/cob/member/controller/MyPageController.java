package com.bitcamp.cob.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	@RequestMapping("/member/mypage")
	public String myPage() {
		
		return "member/mypage";
	}
}
