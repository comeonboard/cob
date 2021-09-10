package com.bitcamp.cob.game.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.game.dao.Dao;
import com.bitcamp.cob.game.domain.Game;

@Service
public class GameEditService2 {


	@Autowired
	private SqlSessionTemplate template;

	public List<Game> getGameEditPage(int idx){
		
		return template.getMapper(Dao.class).selectAllGame(idx);
				
	}
	

}
