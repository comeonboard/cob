package com.bitcamp.cob.group.domain;


import java.sql.Date;
import java.sql.Timestamp;


// postdate enddate 입력을 안하고 등록을 하면 에러가 뜸 -> 이걸 어떻게 처리해야 하나 고민중
public class Group {

	private int grpIdx;
	private int memIdx; // 외래키
	private Timestamp grpPostDate;
	private Date grpPostEndDate;
	private String grpDate;
	private String grpPhoto;
	private String grpContent;
	private int grpMaxMem;
	private int grpRegMem;
	private int gameIdx; // 외래키
	private String grpTitle;
	private String nickName;
	private String loc;
	private String genre;
	
	public Group() {}

	public Group(int grpIdx, int memIdx, Timestamp grpPostDate, Date grpPostEndDate, String grpDate, String grpPhoto,
			String grpContent, int grpMaxMem, int grpRegMem, int gameIdx, String grpTitle, String nickName, String loc,
			String genre) {
		super();
		this.grpIdx = grpIdx;
		this.memIdx = memIdx;
		this.grpPostDate = grpPostDate;
		this.grpPostEndDate = grpPostEndDate;
		this.grpDate = grpDate;
		this.grpPhoto = grpPhoto;
		this.grpContent = grpContent;
		this.grpMaxMem = grpMaxMem;
		this.grpRegMem = grpRegMem;
		this.gameIdx = gameIdx;
		this.grpTitle = grpTitle;
		this.nickName = nickName;
		this.loc = loc;
		this.genre = genre;
	}

	public int getGrpIdx() {
		return grpIdx;
	}

	public void setGrpIdx(int grpIdx) {
		this.grpIdx = grpIdx;
	}

	public int getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}

	public Timestamp getGrpPostDate() {
		return grpPostDate;
	}

	public void setGrpPostDate(Timestamp grpPostDate) {
		this.grpPostDate = grpPostDate;
	}

	public Date getGrpPostEndDate() {
		return grpPostEndDate;
	}

	public void setGrpPostEndDate(Date grpPostEndDate) {
		this.grpPostEndDate = grpPostEndDate;
	}

	public String getGrpDate() {
		return grpDate;
	}

	public void setGrpDate(String grpDate) {
		this.grpDate = grpDate;
	}

	public String getGrpPhoto() {
		return grpPhoto;
	}

	public void setGrpPhoto(String grpPhoto) {
		this.grpPhoto = grpPhoto;
	}

	public String getGrpContent() {
		return grpContent;
	}

	public void setGrpContent(String grpContent) {
		this.grpContent = grpContent;
	}

	public int getGrpMaxMem() {
		return grpMaxMem;
	}

	public void setGrpMaxMem(int grpMaxMem) {
		this.grpMaxMem = grpMaxMem;
	}

	public int getGrpRegMem() {
		return grpRegMem;
	}

	public void setGrpRegMem(int grpRegMem) {
		this.grpRegMem = grpRegMem;
	}

	public int getGameIdx() {
		return gameIdx;
	}

	public void setGameIdx(int gameIdx) {
		this.gameIdx = gameIdx;
	}

	public String getGrpTitle() {
		return grpTitle;
	}

	public void setGrpTitle(String grpTitle) {
		this.grpTitle = grpTitle;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	@Override
	public String toString() {
		return "Group [grpIdx=" + grpIdx + ", memIdx=" + memIdx + ", grpPostDate=" + grpPostDate + ", grpPostEndDate="
				+ grpPostEndDate + ", grpDate=" + grpDate + ", grpPhoto=" + grpPhoto + ", grpContent=" + grpContent
				+ ", grpMaxMem=" + grpMaxMem + ", grpRegMem=" + grpRegMem + ", gameIdx=" + gameIdx + ", grpTitle="
				+ grpTitle + ", nickName=" + nickName + ", loc=" + loc + ", genre=" + genre + "]";
	}
	
	
	
	
	
	
	
	

}
