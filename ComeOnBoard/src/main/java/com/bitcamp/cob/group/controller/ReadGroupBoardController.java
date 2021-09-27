package com.bitcamp.cob.group.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.bitcamp.cob.group.domain.Group;
import com.bitcamp.cob.group.service.ManageGroupService;
import com.bitcamp.cob.group.service.ReadGroupBoardService;

@Controller
public class ReadGroupBoardController {
	
	@Autowired
	private ReadGroupBoardService service;
	
	@Autowired
	private ManageGroupService manageService;
	
	
	@RequestMapping("/group/readGroup")
	public String returnPage(Model model, int grpIdx) {//매개변수에 grpIdx를 전달해줘야 처리가 가능하다!!
		
		// 게시글 내용 보기
		Group readResult = service.groupBoard(grpIdx);
		model.addAttribute("readCreateGroupPage", readResult);
		
		// 현재 인원 count
		int countResult = manageService.countRegMem(grpIdx);
		model.addAttribute("readCreateGroupPageCountRegMem", countResult+1);
		
		// 모임 참가 신청 버튼 비활성화, 이미 신청했을 때 처리		// grpIdx만 써서 arrayList로 받아서 javascript에서 비교하는 방법이 있으면 쉬운데..
//		int readResult2 = manageService.showApplying(grpIdx, memIdx);
//		model.addAttribute("showApplying", readResult2);
		
		return "group/readGroup";
	}

}
