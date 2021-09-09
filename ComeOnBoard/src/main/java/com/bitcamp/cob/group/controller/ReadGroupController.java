package com.bitcamp.cob.group.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cob.group.domain.Group;
import com.bitcamp.cob.group.service.ReturnPageService;

@Controller
public class ReadGroupController {
	
	@Autowired
	private ReturnPageService service;
	
	
	@RequestMapping("/group/readGroup")
	public String returnPage(Model model, Group getGrpIdx) {//매개변수에 grpIdx를 전달해줘야 처리가 가능하다!!
		
		Group group = service.groupBoard(getGrpIdx);
		
		model.addAttribute("readCreateGroupPage", group);
		
		
		
	return "group/readGroup";
}

}
