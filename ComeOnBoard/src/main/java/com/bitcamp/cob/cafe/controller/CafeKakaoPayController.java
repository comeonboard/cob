package com.bitcamp.cob.cafe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cob.cafe.domain.CafeReservation;
import com.bitcamp.cob.cafe.service.KakaopayService;

@Controller
public class CafeKakaoPayController {

	@Autowired
	private KakaopayService kakaopayService;

	// 결제 준비
	@RequestMapping(value = "/cafe/cafe_payReserv", method = RequestMethod.POST)
	@ResponseBody
	public String payReady(CafeReservation cafeReservation) {
		System.out.println("payReady 전달값 : "+ cafeReservation);
		return kakaopayService.payReady(cafeReservation);
	}
	
	// 결제 승인
	@RequestMapping(value = "/cafe/cafe_paySuccess", method = RequestMethod.GET)
	public String cafe_paySuccess(String pg_token, Model model) {
		System.out.println("cafe_paySuccess 전달값 : "+pg_token);
		model.addAttribute("payResult", "success");
		model.addAttribute("info", kakaopayService.payConfirm(pg_token));
		return "cafe/cafe_payResult";
	}

	// 실패
	@RequestMapping(value = "/cafe/cafe_payFail")
	public String payFail(Model model) {
		model.addAttribute("payResult", "fail");
		return "cafe/cafe_payResult";
	}
	
	// 취소
	@RequestMapping(value = "/cafe/cafe_payCancel")
	public String payCancel(Model model) {
		model.addAttribute("payResult", "cancel");
		return "cafe/cafe_payResult";
	}

}
