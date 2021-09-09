package com.bitcamp.cob.cafe.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.cafe.dao.CafeDao;
import com.bitcamp.cob.cafe.domain.Cafe;
import com.bitcamp.cob.cafe.domain.CafePaging;
import com.bitcamp.cob.cafe.domain.CafeSearchType;

@Service
public class cafeListService {

	@Autowired
	private SqlSessionTemplate template;
	
	// 정렬방법 선택시
	public List<Cafe> cafeListBySort(CafePaging cafePaging) {
		return template.getMapper(CafeDao.class).cafeListBySort(cafePaging);
	}
	
	// 검색어 입력시
	public List<Cafe> cafeListByKeyword(CafeSearchType cafeSearchType) {
		return template.getMapper(CafeDao.class).cafeListByKeyword(cafeSearchType);
	}

	public int getCafeTotalCnt() {
		return template.getMapper(CafeDao.class).getCafeTotalCnt();
	}
}