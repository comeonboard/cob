package com.bitcamp.cob.game.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.game.dao.Dao;
import com.bitcamp.cob.game.domain.GameMain;
import com.bitcamp.cob.game.domain.SearchType;

@Service
public class GameListService {

	
	@Autowired
	private SqlSessionTemplate template;
	
//	public List<Game> getGameList(){
//		
//		return template.getMapper(Dao.class).selectAllGame();
//		
//		
//	}
	
	public List<GameMain> getGameMain(){
		
		return template.getMapper(Dao.class).selectGameMain();
		
		
	}
	
	public List<GameMain> getGameMain(SearchType searchType){
		
		return template.getMapper(Dao.class).searchGame(searchType);
	
	}
	
}
