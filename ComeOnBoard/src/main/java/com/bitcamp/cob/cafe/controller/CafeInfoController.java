package com.bitcamp.cob.cafe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cob.cafe.domain.Cafe;
import com.bitcamp.cob.cafe.service.CafeInfoService;

@Controller
public class CafeInfoController {

	@Autowired
	private CafeInfoService cafeInfoService;
	
	// 카페 페이지
	@RequestMapping(value = "/cafe/cafe_page/{id}", method = RequestMethod.GET)
	public String cafeInfo(Model model, @PathVariable("id") int idx, HttpSession session) {
		
		Cafe cafe = null;		
		cafe = cafeInfoService.getCafeInfo(idx);
		model.addAttribute("cafeInfo", cafe);
		model.addAttribute("cafeImg", cafe.getCafeImg());
		System.out.println(cafe.getCafeImg());
		return "cafe/cafe_page";
	}
	
	// 카페 정보 입력폼
	@RequestMapping(value = "/cafe/cafe_regForm", method = RequestMethod.GET)
	public void cafeRegForm() {}
	
	// 카페 정보 입력
	@RequestMapping(value = "/cafe/cafe_regForm", method = RequestMethod.POST)
	public String regCafe(Cafe cafe, Model model) {
		System.out.println("인포 컨트롤러의 카페 정보 입력 메소드 실행 : "+cafe);
		model.addAttribute("cafeRegResult", cafeInfoService.regCafe(cafe));
		//System.out.println("생성된 IDX : " + cafe.getCafeIdx());
		model.addAttribute("cafeIdx", cafe.getCafeIdx());
		return "cafe/cafe_regImg";
	}
	
	// 카페 정보 수정
	@RequestMapping(value = "/cafe/cafe_info", method = RequestMethod.POST)
	public String updateCafeInfo(Cafe cafe, Model model) {

		model.addAttribute("cafeModifyResult", cafeInfoService.updateCafeInfo(cafe));
		model.addAttribute("cafeIdx", cafe.getCafeIdx());
		return "cafe/cafe_regResult";
	}
	
	
	// 이미지 저장폼
	//@RequestMapping(value = "/cafe/cafe_regImg", method = RequestMethod.GET)
	//public void cafeReg() {}
	

	


}



















