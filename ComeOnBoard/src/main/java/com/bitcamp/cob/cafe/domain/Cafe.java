package com.bitcamp.cob.cafe.domain;

public class Cafe {

	private int cafeIdx;
	private int memIdx;
	private String cafeName;
	private String cafeAddress;
	private String cafeTime;
	private int stdFee;
	private int tenPerFee;
	private int fourTable;
	private int grpTable;
	private String cafeTel;
	private int cafeRating;
	
	
	
	public Cafe(int cafeIdx, int memIdx, String cafeName, String cafeAddress, String cafeTime, int stdFee,
			int tenPerFee, int fourTable, int grpTable, String cafeTel, int cafeRating) {
		this.cafeIdx = cafeIdx;
		this.memIdx = memIdx;
		this.cafeName = cafeName;
		this.cafeAddress = cafeAddress;
		this.cafeTime = cafeTime;
		this.stdFee = stdFee;
		this.tenPerFee = tenPerFee;
		this.fourTable = fourTable;
		this.grpTable = grpTable;
		this.cafeTel = cafeTel;
		this.cafeRating = cafeRating;
	}

	public Cafe(){};

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

	public String getCafeName() {
		return cafeName;
	}

	public void setCafeName(String cafeName) {
		this.cafeName = cafeName;
	}

	public String getCafeAddress() {
		return cafeAddress;
	}

	public void setCafeAddress(String cafeAddress) {
		this.cafeAddress = cafeAddress;
	}

	public String getCafeTime() {
		return cafeTime;
	}

	public void setCafeTime(String cafeTime) {
		this.cafeTime = cafeTime;
	}

	public int getStdFee() {
		return stdFee;
	}

	public void setStdFee(int stdFee) {
		this.stdFee = stdFee;
	}

	public int getTenPerFee() {
		return tenPerFee;
	}

	public void setTenPerFee(int tenPerFee) {
		this.tenPerFee = tenPerFee;
	}

	public int getFourTable() {
		return fourTable;
	}

	public void setFourTable(int fourTable) {
		this.fourTable = fourTable;
	}

	public int getGrpTable() {
		return grpTable;
	}

	public void setGrpTable(int grpTable) {
		this.grpTable = grpTable;
	}

	public String getCafeTel() {
		return cafeTel;
	}

	public void setCafeTel(String cafeTel) {
		this.cafeTel = cafeTel;
	}

	public int getCafeRating() {
		return cafeRating;
	}

	public void setCafeRating(int cafeRating) {
		this.cafeRating = cafeRating;
	}

	@Override
	public String toString() {
		return "Cafe [cafeIdx=" + cafeIdx + ", memIdx=" + memIdx + ", cafeName=" + cafeName + ", cafeAddress="
				+ cafeAddress + ", cafeTime=" + cafeTime + ", stdFee=" + stdFee + ", tenPerFee=" + tenPerFee
				+ ", fourTable=" + fourTable + ", grpTable=" + grpTable + ", cafeTel=" + cafeTel + ", cafeRating="
				+ cafeRating + "]";
	}
	
}
