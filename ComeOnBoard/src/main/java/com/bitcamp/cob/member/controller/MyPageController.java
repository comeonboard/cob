package com.bitcamp.cob.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.member.service.FriendRestService;

@Controller
public class MyPageController {
	
	@Autowired
	FriendRestService service;
	
	@RequestMapping("/member/mypage")
	public String myPage() {
		
		return "member/mypage";
	}
	
	@GetMapping("/members/{idx}/game")
	@ResponseBody
	public List<String> getPreferGame(
			@PathVariable("idx") int memIdx){
		List list = service.getPreferGame(memIdx);
		return list;
	}
}
