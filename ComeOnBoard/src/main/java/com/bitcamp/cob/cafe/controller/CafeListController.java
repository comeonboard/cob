package com.bitcamp.cob.cafe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.cafe.domain.Cafe;
import com.bitcamp.cob.cafe.domain.CafePaging;
import com.bitcamp.cob.cafe.domain.CafeSearchType;
import com.bitcamp.cob.cafe.service.cafeListService;

@Controller
public class CafeListController {

	@Autowired
	private cafeListService cafeListService;
	
	// 검색어
	@RequestMapping(value = "/cafe/cafe_list", method = RequestMethod.GET)
	public String cafeList(Model model, CafeSearchType cafeSearchType) {
		System.out.println("cafeList 메소드 실행");
		List<Cafe> list = null;
		System.out.println("cafeSearchType : "+cafeSearchType);
		// 검색어 입력시 검색어의 유효성 처리
		if (cafeSearchType.getKeyword() != null && cafeSearchType.getKeyword().trim().length() > 0) {
			list = cafeListService.cafeListByKeyword(cafeSearchType);
		}
		model.addAttribute("list", list);
		System.out.println("list : "+list);
		return "cafe/cafe_list";
	}
	
	// 정렬 버튼
//	@RequestMapping(value = "/cafe/cafe_list", method = RequestMethod.POST)
//	@ResponseBody
//	public List<Cafe> cafeListBySort(CafeSearchType cafeSearchType) {
//		System.out.println("0");
//		List<Cafe> list = null;
//
//		// 정렬 방식 선택시
//		if(!cafeSearchType.getSearchType().isEmpty()) {
//			if(cafeSearchType.getSearchType().equals("cafeRating")) {
//				// 카페 평점은 내림차순으로 정렬
//				cafeSearchType.setSearchType("cafeRating desc");
//			}
//		}
//			list = cafeListService.cafeListBySort(cafeSearchType.getSearchType());
//		return list;
//	}
	
	// 스크롤 페이징
	@RequestMapping(value = "/cafe/cafe_listPaging", method = RequestMethod.POST)
	@ResponseBody
	public CafePaging listPaging(CafePaging cafePaging){
		
		// 페이지
		int page = cafePaging.getPage();
		System.out.println(cafePaging);
		if(page==1) {
			cafePaging.setStartNum(0);
			cafePaging.setEndNum(9);
		} else {
			cafePaging.setStartNum(page+(8*(page-1)));
			cafePaging.setEndNum(page*9);
		}
		
		cafePaging.setCafe(cafeListService.cafeListBySort(cafePaging));
		// 전체 카페의 수
		cafePaging.setTotalCnt(cafeListService.getCafeTotalCnt());
		
		return cafePaging;
	}
	
	

	
}
