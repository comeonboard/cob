package com.bitcamp.cob.member.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class LoginInfo {

	private int memIdx;
	private String memId;
	private String nickName;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Timestamp memBirth;
	private String memGender;
	private String preferAddr;
	private String memTel;
	private String memEmail;
	private String memPhoto;
	private String memAuth; // member, manager, ban, cafe
	
	public int getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Timestamp getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(Timestamp memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public String getPreferAddr() {
		return preferAddr;
	}
	public void setPreferAddr(String preferAddr) {
		this.preferAddr = preferAddr;
	}
	public String getMemPhoto() {
		return memPhoto;
	}
	public void setMemPhoto(String memPhoto) {
		this.memPhoto = memPhoto;
	}
	public String getMemAuth() {
		return memAuth;
	}
	public void setMemAuth(String memAuth) {
		this.memAuth = memAuth;
	}
	public String getMemTel() {
		return memTel;
	}
	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	@Override
	public String toString() {
		return "LoginInfo [memIdx=" + memIdx + ", memId=" + memId + ", nickName=" + nickName + ", memBirth=" + memBirth
				+ ", memGender=" + memGender + ", preferAddr=" + preferAddr + ", memTel=" + memTel + ", memEmail="
				+ memEmail + ", memPhoto=" + memPhoto + ", memAuth=" + memAuth + "]";
	}
	
	

	
}
