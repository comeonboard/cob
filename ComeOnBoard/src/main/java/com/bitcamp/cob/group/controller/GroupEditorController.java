package com.bitcamp.cob.group.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroupEditorController {

	@RequestMapping("/group/groupEditor")
	public String getGroupEditor() {
		return "group/groupEditor";
	}
}
