package com.bitcamp.cob.group.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroupManagementController {

	@RequestMapping("/group/groupManagement")
	public String getGroupManagement() {
		return "group/groupManagement";
	}
	
}
