package com.bitcamp.cob.group.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.group.dao.GroupDao;
import com.bitcamp.cob.group.domain.Group;

@Service
public class GroupBoardRegService {


	@Autowired
	private SqlSessionTemplate template;
	
	public int groupBoardReg(Group group) {
		
		System.out.println(group);
		// dao(DB) 저장
		template.getMapper(GroupDao.class).insertGroupBoardContent(group);
		
		System.out.println("grpIdx확인"+group.getGrpIdx());
		
		return group.getGrpIdx();
		
	}

	
	
}
