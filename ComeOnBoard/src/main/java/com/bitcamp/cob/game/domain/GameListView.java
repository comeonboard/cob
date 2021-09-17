package com.bitcamp.cob.game.domain;

import java.util.List;

public class GameListView {

	private List<GameMain> gameList;
	private int gameTotalCount;  	// 전체 게임 갯수
	private int currentPageNumber; 	// 현재 페이지 번호
	private int pageTotalCount;		// 페이지 개수
	private int gameCountPerPage;	//페이지당 게시물 개수
	private int firstRow;			// DB 게시물의 시작 위치
	private int endRow;				// 마지막위치
	
	public GameListView(List<GameMain> gameList, int gameTotalCount, int currentPageNumber, int gameCountPerPage,
			int firstRow, int endRow) {
		
		this.gameList = gameList;
		this.gameTotalCount = gameTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.gameCountPerPage = gameCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calPageTotalCount();
	}

	private void calPageTotalCount() {
		
		if(this.gameTotalCount == 0) {
			this.pageTotalCount = 0;
		} else {
			this.pageTotalCount = this.gameTotalCount / this.gameCountPerPage;
			if(this.gameTotalCount % this.gameCountPerPage > 0) {
				this.pageTotalCount++;
			}			
		}		
	}

	public List<GameMain> getGameList() {
		return gameList;
	}

	public int getGameTotalCount() {
		return gameTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getGameCountPerPage() {
		return gameCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	@Override
	public String toString() {
		return "GameListView [gameList=" + gameList + ", gameTotalCount=" + gameTotalCount + ", currentPageNumber="
				+ currentPageNumber + ", pageTotalCount=" + pageTotalCount + ", gameCountPerPage=" + gameCountPerPage
				+ ", firstRow=" + firstRow + ", endRow=" + endRow + "]";
	}
	
	
	
	
}
