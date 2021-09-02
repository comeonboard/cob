package com.bitcamp.cob.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.member.dao.MemberDao;

@Service
public class IdCheckService {	
	
	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate template;

	public String idCheck(String id) {
		
		String result = "Y";
		if(id.length()<8) {
			result = "R";
		}
		dao = template.getMapper(MemberDao.class);
		
		if(dao.selectById(id)>0) {
			result = "N";
		}
		return result;
	}
}
