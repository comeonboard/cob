package com.bitcamp.cob.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.group.domain.Group;
import com.bitcamp.cob.group.service.ManageGroupService;
import com.bitcamp.cob.group.service.ReadGroupBoardService;


@Controller
public class GroupEditorController {

	@Autowired
	private ManageGroupService service;
	
	@Autowired
	private ReadGroupBoardService readContentService;

	// 1. readGroup.jsp에서 모임 참가 신청을 할 때 정보 받음 a href
	// 2. groupManagement.jsp에서 a href
	// 각각의 requestmapping 주소를 다르게 해주고 return은 동일하게 처리 하자
	
	
	@RequestMapping(value = "/group/groupEditor", method = RequestMethod.GET)
	public String getGroupEditor(int memIdx, int grpIdx, Model model) {

		service.insertEditGroup(memIdx, grpIdx);

		Group result = service.selectEditGroup(); // 내가 참가한 모임

		model.addAttribute("groupEditorReadResult", result);

//		return "redirect:/group/groupEditor";
		return "/group/groupEditor";
	}
	
	
	// groupManagement.jsp 에서 '게시물관리' 클릭시 저장된 게시글 정보를 select에서 화면에 보여주기
	@RequestMapping(value = "/group/groupEditorMyGroup", method=RequestMethod.GET)
	@ResponseBody
	public String getGroupEditorFromGroupManagementJsp(int grpIdx, Model model) {
		
		// 해당 게시글의 정보 가져오기
		Group result = readContentService.groupBoard(grpIdx);	
		// 모델에 저장하기
		model.addAttribute("groupEditorReadMyGroupResult", result);
		
		return "/group/groupEditor";
	}
	
	

	


}






