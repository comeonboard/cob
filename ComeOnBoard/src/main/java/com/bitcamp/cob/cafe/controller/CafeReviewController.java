package com.bitcamp.cob.cafe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.cafe.domain.CafeReview;
import com.bitcamp.cob.cafe.domain.CafeReviewPaging;
import com.bitcamp.cob.cafe.service.CafeReviewService;

@Controller
public class CafeReviewController {

	@Autowired
	private CafeReviewService cafeReviewService;

	@RequestMapping(value= "/cafe/cafe_review", method = RequestMethod.GET)
	@ResponseBody
	public List<CafeReview> getCafeReview(CafeReviewPaging cafeReviewPaging) {
		
		List<CafeReview> reviewList = null;
		
		System.out.println("전달값" + cafeReviewPaging);
		
		//페이징 처리
		
		reviewList = cafeReviewService.getCafeReview(cafeReviewPaging);
		System.out.println("결과값" + reviewList);
		return reviewList;
	}
		
	@RequestMapping(value= "/cafe/cafe_page/{id}", method = RequestMethod.POST)
	public String writeCafeReview(CafeReview cafeReview, @PathVariable("id") int idx) {
	
		cafeReview.setCafeIdx(idx);
		System.out.println(cafeReview);
		
		int result = cafeReviewService.writeCafeReview(cafeReview);
		System.out.println(result);
		return "redirect:"+idx;
	}
}
	
	
	
	
	

	
