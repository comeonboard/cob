package com.bitcamp.cob.game.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.cob.game.domain.GameMain;
import com.bitcamp.cob.game.domain.SearchType;
import com.bitcamp.cob.game.service.GameListService;

@Controller
public class GameListController {

	@Autowired
	private GameListService listService;
	
	@RequestMapping("/game/gamelist")
	public String getGameList(
			Model model,
			HttpSession session,
			SearchType searchType
			) {
		
//		List<Game> list = null;
//		list = listService.getGameList();
		
		List<GameMain> list = null;
		
		if(searchType.getKeyword() != null && searchType.getKeyword().trim().length()>0) {
			list = listService.getGameMain(searchType);
		} else {
			list = listService.getGameMain();
		}	
		model.addAttribute("gamelist",list);
		session.setAttribute("gamelist", list);
	
		System.out.println(list);
		return "game/gameList2";
	}
	
	
}
