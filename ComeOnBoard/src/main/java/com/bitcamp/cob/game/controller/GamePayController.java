package com.bitcamp.cob.game.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("game/gamePay/{idx}")
public class GamePayController {

	
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String gamePayForm() {
		
		return "/game/gamePayForm";
	}
	
	
	@RequestMapping(method = RequestMethod.POST)
	public String gamePay() {
		
		
		
		
		return "";
	}
	
}
