package com.bitcamp.cob.game.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.game.dao.GameDao;
import com.bitcamp.cob.game.domain.GameListView;
import com.bitcamp.cob.game.domain.GameMain;
import com.bitcamp.cob.game.domain.SearchType;
import com.bitcamp.cob.game.domain.SortType;

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
	
//	private GameListService() {}
//	private static GameListService service = new GameListService();
//	public static GameListService getInstance() {
//		return service;
//	}
	
	//페이지에 표현할 메시지 개수
	private final int gameCountPerPage = 5;
	
	public GameListView getGameList( SearchType searchType) {
		System.out.println("여기로오니(GameListService)?");		
		
		GameListView listView = null;
				

		System.out.println("키워드 : " + searchType.getKeyword());
		///////////////////////////////////
		// 전체 게시물의 갯수
		int gameTotalCount = template.getMapper(GameDao.class).countGameList(searchType);
		
		System.out.println("totalCount : " + gameTotalCount );
		// 페이지에 표현할  객체들 List<GameMain>
		List<GameMain> gameList = null;
		//SearchType search = null;
		// 시작행의 위치값  limit index
		int firstRow = (searchType.getPage()-1)*gameCountPerPage;
		System.out.println("totalCount : " + firstRow +  gameCountPerPage + searchType.getKeyword());
		searchType.setFirstRow(firstRow);
		searchType.setGameCountPerPage(gameCountPerPage);
		System.out.println("searchType : " + searchType);
		gameList = template.getMapper(GameDao.class).selectGamePaging(searchType);
		System.out.println("gameList : " + gameList);
		
		listView = new GameListView(
				gameList, 
				gameTotalCount, 
				searchType.getPage(), 
				gameCountPerPage, 
				firstRow, 
				0);
		System.out.println("listView : " + listView);
		return listView;
	}

//	public int countGameList(SearchType searchType) {
//		return template.getMapper(Dao.class).countGameList(searchType.getKeyword());
//	}
	


//	public List<GameMain> getGameMain(int pageNumber){
//		System.out.println("게임메인 불려옴");
//		int firstRow = (pageNumber-1)*gameCountPerPage;
//		return template.getMapper(Dao.class).selectGameMain(firstRow,gameCountPerPage);
//		
//		
//	}	
//	
//	public List<GameMain> getGameMain(SearchType searchType){
//		System.out.println("검색 게임 불러옴");
//		return template.getMapper(Dao.class).searchGame(searchType);
//	
//	}
	
	public List<GameMain> getGameMain(SortType sortType){
		
		return template.getMapper(GameDao.class).sortGame(sortType);
	
	}
	
	public List<GameMain> getGameMainAsc(){
		
		return template.getMapper(GameDao.class).selectGameMainAsc();
		
	}
	public List<GameMain> getGameMainAvg(){
		
		return template.getMapper(GameDao.class).selectGameMainAvg();
		
	}	
}
