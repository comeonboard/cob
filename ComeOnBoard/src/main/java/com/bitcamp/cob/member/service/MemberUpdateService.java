package com.bitcamp.cob.member.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bitcamp.cob.member.dao.MemberDao;
import com.bitcamp.cob.member.domain.Member;
import com.bitcamp.cob.member.domain.MemberRegRequest;

@Service
public class MemberUpdateService {

	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int memberUpdate(int memIdx, MemberRegRequest regRequest, HttpSession session){
		int resultCnt = 0;
		
		regRequest.makeMemBirth();
		Member member = regRequest.toMember(memIdx);
			
		dao = template.getMapper(MemberDao.class);
			
		resultCnt = dao.updateMember(member);
		
		if(resultCnt>0) {
			member = dao.selectByIdx(memIdx);
			session.setAttribute("loginInfo", member);
		}
		return resultCnt;
	}
}
