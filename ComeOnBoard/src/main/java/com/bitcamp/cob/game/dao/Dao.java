package com.bitcamp.cob.game.dao;

import java.util.List;

import com.bitcamp.cob.game.domain.Game;
import com.bitcamp.cob.game.domain.GameMain;
import com.bitcamp.cob.game.domain.GamePage;
import com.bitcamp.cob.game.domain.GameReview;
import com.bitcamp.cob.game.domain.SearchType;

public interface Dao {
	
	// 게임등록
	int insertGame(Game game);
	// 게임정보수정
	int editGame(Game game);
	List<Game> selectAllGame(int idx);
	
	List<GameReview> allGameReview();
	// 게임 메인
	List<GameMain> selectGameMain();
	// 게임 페이지
	List<GamePage> selectGamePage(int idx);
	// 게임 메인에서 게임 리스트 검색
	List<GameMain> searchGame(SearchType searchType);
	

}
