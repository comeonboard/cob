package com.bitcamp.cob.group.controller;



import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.bitcamp.cob.group.domain.Group;
import com.bitcamp.cob.group.service.GroupBoardRegService;
import com.bitcamp.cob.group.service.UpdateGroupBoardService;

//컨트롤러의 역할: 1.front-controller, 2.초기화 설정
@Controller
@RequestMapping("/group/createGroup")
public class CreateGroupController {
	
	@Autowired
	private GroupBoardRegService service;
	
	private UpdateGroupBoardService updateService;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String returnGroupListPage() {
		return "group/createGroup";
	}
	
//	form에서 패러미터 받아오는 방법 3가지
//	requestparam -> 1개
//	HttpServletRequest request -> 여러개
//	ex)RegRequest regRequest -> 객체에 패러미터를 저장하여 생성자 형식으로(HttpServletRequest 만으로 부족할 때)

	
	@RequestMapping(method = RequestMethod.POST)
	public String getCreateGroup(HttpServletRequest request, Group group, Model model) {  
		
		
		//데이터 출력이 됨 -> 받아올 형태 정하기	
		System.out.println(group);
		

		//모임 게시글 등록시 DB에 저장(service의 영역)
		int grpIdx = service.groupBoardReg(group);
		
		//모임 게시글 등록시 model에 저장 -> view 역할을 하는 jsp(?)로 돌려줌
		model.addAttribute("result", grpIdx);
		
		String viewReturn = "";
		
		viewReturn = "redirect:/group/readGroup?grpIdx="; // 리다이렉트는 url을 보여주기 때문에
		
		return viewReturn+grpIdx;
		
	}
		
	
}
