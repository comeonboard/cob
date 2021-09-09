package com.bitcamp.cob.cafe.domain;

import java.util.List;

public class CafePaging {

	private String searchType; 
	private int page;
	private int totalCnt;
	private int startNum;
	private int endNum;
	private List<Cafe> cafe;
	
	public CafePaging() {}

	public CafePaging(String searchType, int page, int totalCnt, int startNum, int endNum, List<Cafe> cafe) {
		this.searchType = searchType;
		this.page = page;
		this.totalCnt = totalCnt;
		this.startNum = startNum;
		this.endNum = endNum;
		this.cafe = cafe;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	
	public List<Cafe> getCafe() {
		return cafe;
	}

	public void setCafe(List<Cafe> cafe) {
		this.cafe = cafe;
	}

	@Override
	public String toString() {
		return "CafePaging [searchType=" + searchType + ", page=" + page + ", totalCnt=" + totalCnt + ", startNum="
				+ startNum + ", endNum=" + endNum + ", cafe=" + cafe + "]";
	}

}
