package com.bitcamp.cob.game.domain;

import java.sql.Timestamp;

public class GameReview {

	private int revIdx;
	private int gameIdx;
	private int memIdx;
	private String revContent;
	private Timestamp revRegDate;
	private int revRating;
	
	public GameReview(int revIdx, int gameIdx, int memIdx, String revContent, Timestamp revRegDate, int revRating) {
		this.revIdx = revIdx;
		this.gameIdx = gameIdx;
		this.memIdx = memIdx;
		this.revContent = revContent;
		this.revRegDate = revRegDate;
		this.revRating = revRating;
	}
	
	public GameReview() {}

	public int getRevIdx() {
		return revIdx;
	}

	public void setRevIdx(int revIdx) {
		this.revIdx = revIdx;
	}

	public int getGameIdx() {
		return gameIdx;
	}

	public void setGameIdx(int gameIdx) {
		this.gameIdx = gameIdx;
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
		return "GameReview [revIdx=" + revIdx + ", gameIdx=" + gameIdx + ", memIdx=" + memIdx + ", revContent="
				+ revContent + ", revRegDate=" + revRegDate + ", revRating=" + revRating + "]";
	}
	
	
	
}
