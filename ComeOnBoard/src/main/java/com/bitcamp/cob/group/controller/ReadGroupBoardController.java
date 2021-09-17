package com.bitcamp.cob.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.bitcamp.cob.group.domain.Group;
import com.bitcamp.cob.group.service.ReadGroupBoardService;

@Controller
public class ReadGroupBoardController {
	
	@Autowired
	private ReadGroupBoardService service;
	
	
	@RequestMapping("/group/readGroup")
	public String returnPage(Model model, int grpIdx) {//매개변수에 grpIdx를 전달해줘야 처리가 가능하다!!
		

		
		Group readResult = service.groupBoard(grpIdx);
		
		model.addAttribute("readCreateGroupPage", readResult);
		

		
	return "group/readGroup";
}

}
