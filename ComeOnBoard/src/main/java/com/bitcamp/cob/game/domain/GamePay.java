package com.bitcamp.cob.game.domain;

public class GamePay {

	int cusIdx;
	int memIdx;
	int gameIdx;
	String memName;
	String gamePrice;
	String shipAddress;
	String phoneNum;
	
	public GamePay(int cusIdx, int memIdx, int gameIdx, String memName, String gamePrice, String shipAddress,
			String phoneNum) {
		this.cusIdx = cusIdx;
		this.memIdx = memIdx;
		this.gameIdx = gameIdx;
		this.memName = memName;
		this.gamePrice = gamePrice;
		this.shipAddress = shipAddress;
		this.phoneNum = phoneNum;
	}
	
	public GamePay() {}

	public int getCusIdx() {
		return cusIdx;
	}

	public void setCusIdx(int cusIdx) {
		this.cusIdx = cusIdx;
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

	public String getGamePrice() {
		return gamePrice;
	}

	public void setGamePrice(String gamePrice) {
		this.gamePrice = gamePrice;
	}

	public String getShipAddress() {
		return shipAddress;
	}

	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	@Override
	public String toString() {
		return "GamePay [cusIdx=" + cusIdx + ", memIdx=" + memIdx + ", gameIdx=" + gameIdx + ", memName=" + memName
				+ ", gamePrice=" + gamePrice + ", shipAddress=" + shipAddress + ", phoneNum=" + phoneNum + "]";
	}
	
	
	
}
