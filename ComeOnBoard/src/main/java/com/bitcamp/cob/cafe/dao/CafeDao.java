package com.bitcamp.cob.cafe.dao;

import java.util.List;

import com.bitcamp.cob.cafe.domain.Cafe;
import com.bitcamp.cob.cafe.domain.CafePaging;
import com.bitcamp.cob.cafe.domain.CafeReview;
import com.bitcamp.cob.cafe.domain.CafeReviewPaging;
import com.bitcamp.cob.cafe.domain.CafeSearchType;

public interface CafeDao {

	// 카페 리스트 출력 - 정렬 방식 선택시
	List<Cafe> cafeListBySort(CafePaging cafePaging);
	// 카페 리스트 출력 - 검색어 입력시
	List<Cafe> cafeListByKeyword(CafeSearchType cafeSearchType);
	// 전체 카페의 수
	int getCafeTotalCnt();
	// 카페 페이지
	Cafe getCafeInfo(int idx);
	// 리뷰 리스트 출력
	List<CafeReview> getCafeReview(CafeReviewPaging cafeReviewPaging);
	// 카페 리뷰 작성
	int writeCafeReview(CafeReview cafeReview);
	// 카페 정보 등
	int cafeReg(Cafe cafe);


}
