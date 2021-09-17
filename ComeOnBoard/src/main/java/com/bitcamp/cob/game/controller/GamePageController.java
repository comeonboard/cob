package com.bitcamp.cob.game.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.cob.game.domain.GamePage;
import com.bitcamp.cob.game.service.GamePageService;

@Controller
public class GamePageController {

	@Autowired
	private GamePageService listService;
	
	
	@RequestMapping("/game/gamepage/{idx}")
	public String getGamePage(
			Model model,
			HttpSession session,
			@PathVariable("idx") int idx
			) {
				
		GamePage list = null;		
		String view = "game/gamePage2";

		list = listService.getGamePage(idx);
		model.addAttribute("gamepage",list);
		session.setAttribute("gamepage", list);
		
		System.out.println("여기가문제?" + list);		
		return view;
	}
	
}
