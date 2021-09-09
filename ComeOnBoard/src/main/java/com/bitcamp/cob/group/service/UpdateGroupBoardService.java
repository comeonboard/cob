package com.bitcamp.cob.group.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.group.dao.GroupDao;
import com.bitcamp.cob.group.domain.Group;

@Service
public class UpdateGroupBoardService {
	

	@Autowired
	private SqlSessionTemplate template;
	
	public int groupBoardEdit(Group group) {
		
		System.out.println(group);
		
		template.getMapper(GroupDao.class).updateGroupBoardContent(group);
		
		System.out.println("grpIdx는"+group.getGrpIdx());
		
		return group.getGrpIdx();
		
	}

	public Group reviewContent(Group group) {
		
		return template.getMapper(GroupDao.class).reSelectContent(group);
		
	}

}
