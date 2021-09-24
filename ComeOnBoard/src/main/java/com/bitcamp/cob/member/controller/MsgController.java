package com.bitcamp.cob.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bitcamp.cob.member.domain.Msg;

@RestController
public class MsgController {

	@Autowired
	// 서비스
	
	@GetMapping("/msg/me")
	public List<Msg> getMsg() {
		List<Msg> list = null;
		return list;
	}
	
	@PostMapping("/msg")
	public int postMsg() {
		int result = 0;
		return result;
	}
	
	@DeleteMapping("/msg")
	public int deleteMsg() {
		int result = 0;
		return result;
	}
}
