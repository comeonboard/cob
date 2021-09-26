package com.bitcamp.cob.game.domain;

public class OrderList {

	private String gameName;
	private int gamePrice;
	private int memIdx;
	private int gameIdx;
	private String memName;
	private String shipAddress;

	public OrderList() {}

	public OrderList(String gameName, int gamePrice, int memIdx, int gameIdx, String memName, String shipAddress) {
	
		this.gameName = gameName;
		this.gamePrice = gamePrice;
		this.memIdx = memIdx;
		this.gameIdx = gameIdx;
		this.memName = memName;
		this.shipAddress = shipAddress;
	}

	public String getGameName() {
		return gameName;
	}

	public void setGameName(String gameName) {
		this.gameName = gameName;
	}

	public int getGamePrice() {
		return gamePrice;
	}

	public void setGamePrice(int gamePrice) {
		this.gamePrice = gamePrice;
	}

	public int getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}

	public int getGameIdx() {
		return gameIdx;
	}

	public void setGameIdx(int gameIdx) {
		this.gameIdx = gameIdx;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getShipAddress() {
		return shipAddress;
	}

	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}

	@Override
	public String toString() {
		return "OrderList [gameName=" + gameName + ", gamePrice=" + gamePrice + ", memIdx=" + memIdx + ", gameIdx="
				+ gameIdx + ", memName=" + memName + ", shipAddress=" + shipAddress + "]";
	}
	
	
	
	
}
