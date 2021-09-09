package com.bitcamp.cob.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cob.group.domain.Group;
import com.bitcamp.cob.group.service.UpdateGroupBoardService;

@Controller

public class UpdateGroupController {

	
	@Autowired
	private UpdateGroupBoardService updateService;
	
	
	@RequestMapping(value="/group/updateGroup", method=RequestMethod.GET)
	public String updateBoard(Group group, Model model) {
		
		group = updateService.reviewContent(group);
		
		model.addAttribute("updateBoard", group);
		System.out.println(group);
		return "group/updateGroup";
	}
	
	
	//모임 수정
	//오류 확인하기
	@RequestMapping(value="/group/updateGroup", method=RequestMethod.POST)
	public String editGroupBoard(Group group, Model model ) {
		//데이터 확인용
		System.out.println("POST로 실행된 "+group);

		int updateGrpIdx = updateService.groupBoardEdit(group);
		
		model.addAttribute("updateResult", updateGrpIdx);
		
		String viewReturn = "";
		
		
		viewReturn = "redirect:/group/createGroup?grpidx=";
		
		
		return viewReturn+updateGrpIdx;
	}
	
}
