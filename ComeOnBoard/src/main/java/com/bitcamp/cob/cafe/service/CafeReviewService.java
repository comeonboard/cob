package com.bitcamp.cob.cafe.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.cafe.dao.CafeDao;
import com.bitcamp.cob.cafe.domain.CafeReview;
import com.bitcamp.cob.cafe.domain.CafeReviewPaging;

@Service
public class CafeReviewService {

	@Autowired
	private SqlSessionTemplate template;

	// 카페리뷰 출력
	public List<CafeReview> getCafeReview(CafeReviewPaging cafeReviewPaging) {
		return template.getMapper(CafeDao.class).getCafeReview(cafeReviewPaging);
	}
	
	// 카페 리뷰 작성
	public int writeCafeReview(CafeReview cafeReview) {
		return template.getMapper(CafeDao.class).writeCafeReview(cafeReview);
	}
}