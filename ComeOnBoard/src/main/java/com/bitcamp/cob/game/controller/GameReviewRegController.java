//package com.bitcamp.cob.game.controller;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.bitcamp.cob.game.domain.GameRegRequest;
//import com.bitcamp.cob.game.service.GameRegService;
//import com.bitcamp.cob.member.dao.Dao;
//
//@Controller
//@RequestMapping("/game/gameReg")
//public class GameReviewRegController {
//	
//	
//	@Autowired
//	private GameRegService regService;
//	
//	@RequestMapping(method = RequestMethod.GET)
//	public String gameRegForm() {
//	
//		System.out.println("컨트롤러 get");
//		
//		return "game/gameRegForm3";
//	}
//	
//	@RequestMapping(method = RequestMethod.POST)
//	public String gameReg(
//			@ModelAttribute("regRequest") GameRegRequest regRequest,
//			HttpServletRequest request,
//			Model model
//			) {
//		
//		System.out.println("컨트롤러 post");
//		System.out.println(regRequest);
//		
//		int result = regService.gameReg(regRequest, request);
//		
//		
//		model.addAttribute("result",result);
//		
//		
//		String view = "game/gameRegEnd";
//		
//		if(result == 1) {
//			view = "redirect:/index";
//		}
//		
//		return view;
//	}
//}
//
//
