package com.bitcamp.cob.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cob.group.service.DeleteGroupBoardService;

@Controller
public class DeleteGroupBoardController {
	
	@Autowired
	private DeleteGroupBoardService service;

	@RequestMapping(value="/group/deleteGroupBoard", method = RequestMethod.GET)
	public String deleteGroupBoardPage(int grpIdx) { 
		
		service.deleteBoard(grpIdx);
		
		return "redirect:/group/groupList";
		
	}
	
}
