package com.bitcamp.cob.game.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.cob.game.domain.GameMain;
import com.bitcamp.cob.game.domain.GamePage;
import com.bitcamp.cob.game.domain.SearchType;
import com.bitcamp.cob.game.service.GameListService;
import com.bitcamp.cob.game.service.GamePageService;

@Controller
public class GamePageController {

	@Autowired
	private GamePageService listService;
	
	@Autowired
	private GameListService listService2;
	
	@RequestMapping("/game/gamepage/{idx}")
	public String getGamePage(
			Model model,
			HttpSession session,
			@PathVariable("idx") int idx,
			SearchType searchType
			) {
		
//		List<Game> list = null;
//		list = listService.getGameList();
		
		List<GamePage> list = null;
		List<GameMain> list2 = null;
		
		String view = "game/gamePage2";
		
		if(searchType.getKeyword() != null && searchType.getKeyword().trim().length()>0) {
			list2 = listService2.getGameMain(searchType);
			model.addAttribute("gamelist",list2);
			session.setAttribute("gamelist", list2);
			view = "game/gameList2";
		} else {
			list = listService.getGamePage(idx);
			model.addAttribute("gamepage",list);
			session.setAttribute("gamepage", list);
		}

		
		System.out.println("여기가문제?" + list);
		
		return view;
	}
	
	
}
