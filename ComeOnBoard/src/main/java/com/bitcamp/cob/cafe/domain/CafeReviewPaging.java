package com.bitcamp.cob.cafe.domain;

public class CafeReviewPaging {

	private int page;
	private int totalCnt;
	private int startNum;
	private int endNum;
	private int cafeIdx;
	
	public CafeReviewPaging() {}

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
	
	public int getCafeIdx() {
		return cafeIdx;
	}

	public void setCafeIdx(int cafeIdx) {
		this.cafeIdx = cafeIdx;
	}

	@Override
	public String toString() {
		return "CafeReviewPaging [page=" + page + ", totalCnt=" + totalCnt + ", startNum=" + startNum + ", endNum="
				+ endNum + ", cafeIdx=" + cafeIdx + "]";
	}



}
