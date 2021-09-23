package com.bitcamp.cob.cafe.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CafeReservation {

	private int reservIdx;
	private int cafeIdx;
	private int memIdx;
	private String memName;
	private String reservDate;
	private int reservTime;
	private int reservTable;
	private int fixedTable;
	private String requestTable;
	private int  etc;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp regDate;

	public CafeReservation() {
	}

	public int getReservIdx() {
		return reservIdx;
	}

	public void setReservIdx(int reservIdx) {
		this.reservIdx = reservIdx;
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

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getReservDate() {
		return reservDate;
	}

	public void setReservDate(String reservDate) {
		this.reservDate = reservDate;
	}

	public int getReservTime() {
		return reservTime;
	}

	public void setReservTime(int reservTime) {
		this.reservTime = reservTime;
	}

	public int getReservTable() {
		return reservTable;
	}

	public void setReservTable(int reservTable) {
		this.reservTable = reservTable;
	}

	public int getFixedTable() {
		return fixedTable;
	}

	public void setFixedTable(int fixedTable) {
		this.fixedTable = fixedTable;
	}

	public String getRequestTable() {
		return requestTable;
	}

	public void setRequestTable(String requestTable) {
		this.requestTable = requestTable;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	
	
	public int getEtc() {
		return etc;
	}

	public void setEtc(int etc) {
		this.etc = etc;
	}

	@Override
	public String toString() {
		return "CafeReservation [reservIdx=" + reservIdx + ", cafeIdx=" + cafeIdx + ", memIdx=" + memIdx + ", memName="
				+ memName + ", reservDate=" + reservDate + ", reservTime=" + reservTime + ", reservTable=" + reservTable
				+ ", fixedTable=" + fixedTable + ", requestTable=" + requestTable + ", regDate=" + regDate + "]";
	}


	
}
