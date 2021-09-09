package com.bitcamp.cob.cafe.domain;

import java.sql.Timestamp;

public class CafeReview {

	private int revIdx;
	private int cafeIdx;
	private int memIdx;
	private String revContent;
	private Timestamp revRegDate;
	private int revRating;
	
	public CafeReview() {}

	public int getRevIdx() {
		return revIdx;
	}

	public void setRevIdx(int revIdx) {
		this.revIdx = revIdx;
	}

	public int getCafeIdx() {
		return cafeIdx;
	}

	public void setCafeIdx(int cafeIdx) {
		this.cafeIdx = cafeIdx;
	}

	public int getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public Timestamp getRevRegDate() {
		return revRegDate;
	}

	public void setRevRegDate(Timestamp revRegDate) {
		this.revRegDate = revRegDate;
	}

	public int getRevRating() {
		return revRating;
	}

	public void setRevRating(int revRating) {
		this.revRating = revRating;
	}

	@Override
	public String toString() {
		return "CafeReview [revIdx=" + revIdx + ", cafeIdx=" + cafeIdx + ", memIdx=" + memIdx + ", revContent="
				+ revContent + ", revRegDate=" + revRegDate + ", revRating=" + revRating + "]";
	}
	
	
	

	
}
