package com.bitcamp.cob.game.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.cob.game.domain.GameListView;
import com.bitcamp.cob.game.domain.GameMain;
import com.bitcamp.cob.game.domain.SearchType;
import com.bitcamp.cob.game.domain.SortType;
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

		GameListView listView = null;
		//List<GameMain> list = null;
		String view = null;

		view = "game/gameList2";
		//System.out.println("여기까진 된거?");
		//System.out.println("url : " + searchType);
		listView = listService.getGameList(searchType);
		//System.out.println("뭐가 드어오긴함?" + listView);

		model.addAttribute("listView", listView);
		// session.setAttribute("gamelist", list);
		//System.out.println("gamelist data : " + list);

		return view;
	}

	
	
	
//	@RequestMapping("/game/gamelist/recently")
//	public String getSortGameList(
//			Model model,
//			HttpSession session,
//			SearchType searchType,
//			SortType sortType
//			) {
//		
//		
//		List<GameMain> list = null;
//		String view = null;
//		
//		if(searchType.getKeyword() != null && searchType.getKeyword().trim().length()>0) {
//			list = listService.getGameMain(searchType);
//			view = "game/gameList2";
//		} else {
//			list = listService.getGameMainAsc();
//			view = "game/gameList2";
//		}
//
//		model.addAttribute("gamelist",list);
//		session.setAttribute("gamelist", list);
//	
//		System.out.println(list);
//		return view;
//	}
	
	
//	@RequestMapping("/game/gamelist/avg")
//	public String getAvgGameList(
//			Model model,
//			HttpSession session,
//			SearchType searchType,
//			SortType sortType
//			) {
//		
//		
//		List<GameMain> list = null;
//		String view = null;
//		
//		if(searchType.getKeyword() != null && searchType.getKeyword().trim().length()>0) {
//			list = listService.getGameMain(searchType);
//			view = "game/gameList2";
//		} else {
//			list = listService.getGameMainAvg();
//			view = "game/gameList2";
//		}
//
//		model.addAttribute("gamelist",list);
//		session.setAttribute("gamelist", list);
//	
//		System.out.println(list);
//		return view;
//	}		
}
