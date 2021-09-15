package com.bitcamp.cob.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.member.service.FindIdPwService;

@Controller
public class FindIdPwController {
	
	@Autowired
	FindIdPwService service;
	
	@RequestMapping("/member/findId")
	public String findId() {
		
		return "member/findId";
	}

	@RequestMapping("/member/findPw")
	public String findPw(@RequestParam(required = false) String memId,
						@RequestParam(required = false) String memName,
						Model model) {
		if(memId != null) {
			model.addAttribute("memId", memId);
			model.addAttribute("memName", memName);
		} 
		
		return "member/findPw";
	}
	
	@PostMapping("/member/findId")
	@ResponseBody
	public List<String> findIdByEmail(
			String memEmail) {
		List<String> list = null;

		list = service.findIdByEmail(memEmail); // 있는지 확인

			
		
		return list;
	}
}
