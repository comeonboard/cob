package com.bitcamp.cob.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.member.dao.MemberDao;

@Service
public class FindIdPwService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<String> findIdByEmail(String memEmail) {
		return template.getMapper(MemberDao.class).getMemId(memEmail);
	}

}
