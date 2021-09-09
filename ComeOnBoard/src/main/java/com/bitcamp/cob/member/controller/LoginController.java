package com.bitcamp.cob.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bitcamp.cob.member.service.LoginService;

@Controller
@RequestMapping("member/login")
@SessionAttributes("loginChk")
public class LoginController {
	
	@Autowired
	private LoginService loginService;

	@RequestMapping(method = RequestMethod.GET)
	public String loginForm() {
		
		return "member/loginForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String login(
			@RequestParam("memId") String memberid,
			@RequestParam("memPassword") String password,
			@RequestParam(value = "reid", required = false) String reid,
			HttpServletResponse response,
			HttpServletRequest request,
			HttpSession session	
			) {
			
		// 사용자가 입력한 id, pw 서비스에 전달해서 로그인 처리
		boolean loginChk = loginService.login(memberid, password, reid, session, response);
		session.setAttribute("loginChk", loginChk);
		
		return "member/loginChk";
	}

}
