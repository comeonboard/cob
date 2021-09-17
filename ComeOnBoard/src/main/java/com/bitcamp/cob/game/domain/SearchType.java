package com.bitcamp.cob.game.domain;

public class SearchType {
	
	private int page; // 페이징처리
	private String searchType;
	private String keyword;
	private int firstRow;
	private int gameCountPerPage;
	
	public SearchType(int page, String searchType, String keyword) {

		this.page = page;
		this.searchType = searchType;
		this.keyword = keyword;
	}
	
	public SearchType() {
		
		this.page = 1;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}

	public int getGameCountPerPage() {
		return gameCountPerPage;
	}

	public void setGameCountPerPage(int gameCountPerPage) {
		this.gameCountPerPage = gameCountPerPage;
	}

	@Override
	public String toString() {
		return "SearchType [page=" + page + ", searchType=" + searchType + ", keyword=" + keyword + ", firstRow="
				+ firstRow + ", gameCountPerPage=" + gameCountPerPage + "]";
	}

	
	
	

	


	
	
	
}

