package com.bitcamp.cob.game.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.game.dao.GameDao;
import com.bitcamp.cob.game.domain.GamePay;

@Service
public class GamePayService {

	private GameDao dao;
	@Autowired
	private SqlSessionTemplate template;
	
	public int gamePay(GamePay pay) {
	
		return  template.getMapper(GameDao.class).insertPay(pay);
	}
}
