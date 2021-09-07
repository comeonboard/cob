package com.bitcamp.cob.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.cob.member.domain.MemberRegRequest;
import com.bitcamp.cob.member.service.MemberUpdateService;

@Controller
public class MemberInfoUpdateController {

	@Autowired
	private MemberUpdateService service;

	@RequestMapping(value="/member/updateMember", method = RequestMethod.POST)
	public String updateMember(
			@ModelAttribute("regRequest") MemberRegRequest regRequest,
			@RequestParam("memIdx") int memIdx,
			HttpSession session,
			Model model
			) {
		System.out.println(regRequest);
		int result = service.memberUpdate(memIdx, regRequest, session);
		
		model.addAttribute("result", result);
		
		return "member/updateMemeber";
	}
	
}
