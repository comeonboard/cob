package com.bitcamp.cob.cafe.domain;

import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Cafe2 {

	private int cafeIdx;
	private int memIdx;
	private String cafeName;
	private String cafeAddress;
	private String cafeTime;
	private String cafeTel;
	private MultipartFile cafeThumbnailFile;
	private List<MultipartFile> cafeImgFile;
	
	private String cafeThumbnail;
	private List<String> cafeImg;
	
	// 천단위 , 변환
	private String stdFeeComma;
	private String tenPerFeeComma;

	public Cafe2(){}

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

	public String getCafeTel() {
		return cafeTel;
	}

	public void setCafeTel(String cafeTel) {
		this.cafeTel = cafeTel;
	}

	public MultipartFile getCafeThumbnailFile() {
		return cafeThumbnailFile;
	}

	public void setCafeThumbnailFile(MultipartFile cafeThumbnailFile) {
		this.cafeThumbnailFile = cafeThumbnailFile;
	}

	public List<MultipartFile> getCafeImgFile() {
		return cafeImgFile;
	}

	public void setCafeImgFile(List<MultipartFile> cafeImgFile) {
		this.cafeImgFile = cafeImgFile;
	}

	public String getCafeThumbnail() {
		return cafeThumbnail;
	}

	public void setCafeThumbnail(String cafeThumbnail) {
		this.cafeThumbnail = cafeThumbnail;
	}

	public List<String> getCafeImg() {
		return cafeImg;
	}

	public void setCafeImg(List<String> cafeImg) {
		this.cafeImg = cafeImg;
	}

	public String getStdFeeComma() {
		return stdFeeComma;
	}

	public void setStdFeeComma(String stdFeeComma) {
		this.stdFeeComma = stdFeeComma;
	}

	public String getTenPerFeeComma() {
		return tenPerFeeComma;
	}

	public void setTenPerFeeComma(String tenPerFeeComma) {
		this.tenPerFeeComma = tenPerFeeComma;
	}

	@Override
	public String toString() {
		return "Cafe2 [cafeIdx=" + cafeIdx + ", memIdx=" + memIdx + ", cafeName=" + cafeName + ", cafeAddress="
				+ cafeAddress + ", cafeTime=" + cafeTime + ", cafeTel=" + cafeTel + ", cafeThumbnailFile="
				+ cafeThumbnailFile + ", cafeImgFile=" + cafeImgFile + ", cafeThumbnail=" + cafeThumbnail + ", cafeImg="
				+ cafeImg + ", stdFeeComma=" + stdFeeComma + ", tenPerFeeComma=" + tenPerFeeComma + "]";
	}



	
}
