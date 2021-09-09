package com.bitcamp.cob.group.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroupListController {
	
	@RequestMapping("/group/groupList")
	public String getGroupList() {
		
		
		
		return "group/groupList";
	}
	
}
