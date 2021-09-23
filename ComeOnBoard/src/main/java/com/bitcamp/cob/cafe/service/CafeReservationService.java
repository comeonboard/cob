package com.bitcamp.cob.cafe.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.cafe.dao.CafeDao;
import com.bitcamp.cob.cafe.domain.CafeReservation;

@Service
public class CafeReservationService {

	@Autowired
	private SqlSessionTemplate template;
	
	// 예약 테이블 반환
	public List<CafeReservation> getReservButton(CafeReservation cafeReservation) {
		return template.getMapper(CafeDao.class).getReservButton(cafeReservation);
	}

	// 예약
	public int regReserv(CafeReservation cafeReservation) {
		return template.getMapper(CafeDao.class).regReserv(cafeReservation);
	}

	// 예약 확인 리스트
	public List<CafeReservation> getReservList(CafeReservation cafeReservation) {
		return template.getMapper(CafeDao.class).getReservList(cafeReservation);
	}
	
	// 예약 취소
	public int delReserv(int reservIdx) {
		return template.getMapper(CafeDao.class).delReserv(reservIdx);
	}

}
