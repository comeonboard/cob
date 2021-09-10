package com.bitcamp.cob.game.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cob.game.domain.GameMain;
import com.bitcamp.cob.game.domain.GameRegRequest;
import com.bitcamp.cob.game.domain.SearchType;
import com.bitcamp.cob.game.service.GameListService;
import com.bitcamp.cob.game.service.GameRegService;

@Controller
@RequestMapping("/game/gameReg")
public class GameRegController {
	
	
	@Autowired
	private GameRegService regService;

	@Autowired
	private GameListService listService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String gameRegForm() {
	
		System.out.println("컨트롤러 get");
		
		return "game/gameRegForm3";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String gameReg(
			@ModelAttribute("regRequest") GameRegRequest regRequest,
			HttpServletRequest request,
			Model model,
			SearchType searchType
			) {

		List<GameMain> list = null;		
		
		System.out.println("컨트롤러 post");
		System.out.println(regRequest);
		
		int result = regService.gameReg(regRequest, request);
		String view = "game/gameRegEnd";
		
		if(searchType.getKeyword() != null && searchType.getKeyword().trim().length()>0) {
			list = listService.getGameMain(searchType);
			model.addAttribute("gamelist",list);
			view = "game/gameList2";
		} else {
			
			model.addAttribute("result",result);

			if(result == 1) {
				view = "redirect:/index";
			}
			
		}
			
		return view;
	}
}


