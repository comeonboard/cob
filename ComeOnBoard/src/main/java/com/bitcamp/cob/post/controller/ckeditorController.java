package com.bitcamp.cob.post.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ckeditorController {

	@RequestMapping("/post/test")
	public String test() {
		return "post/test";
	}
}
