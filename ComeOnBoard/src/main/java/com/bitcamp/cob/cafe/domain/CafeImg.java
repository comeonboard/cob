package com.bitcamp.cob.cafe.domain;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class CafeImg {

	private int cafeIdx;
	private MultipartFile cafeThumbnail;
	private MultipartFile cafeImg[] = new MultipartFile[9];
	
	public CafeImg() {}
	
	public CafeImg(int cafeIdx, MultipartFile cafeThumbnail, MultipartFile[] cafeImg) {
		this.cafeIdx = cafeIdx;
		this.cafeThumbnail = cafeThumbnail;
		this.cafeImg = cafeImg;
	}

	public int getCafeIdx() {
		return cafeIdx;
	}

	public void setCafeIdx(int cafeIdx) {
		this.cafeIdx = cafeIdx;
	}

	public MultipartFile getCafeThumbnail() {
		return cafeThumbnail;
	}

	public void setCafeThumbnail(MultipartFile cafeThumbnail) {
		this.cafeThumbnail = cafeThumbnail;
	}

	public MultipartFile[] getCafeImg() {
		return cafeImg;
	}

	public void setCafeImg(MultipartFile[] cafeImg) {
		this.cafeImg = cafeImg;
	}

	@Override
	public String toString() {
		return "CafeImg [cafeIdx=" + cafeIdx + ", cafeThumbnail=" + cafeThumbnail + ", cafeImg="
				+ Arrays.toString(cafeImg) + "]";
	}

}
