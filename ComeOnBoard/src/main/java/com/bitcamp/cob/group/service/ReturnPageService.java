package com.bitcamp.cob.group.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.group.dao.GroupDao;
import com.bitcamp.cob.group.domain.Group;

@Service
public class ReturnPageService {

	@Autowired
	private SqlSessionTemplate template;
	
	public Group groupBoard(Group getGrpIdx) { //매개변수에 grpIdx를 전달해줘야 처리가 가능하다!!
		
		return template.getMapper(GroupDao.class).selectGroupBoardContent(getGrpIdx); //매개변수에 grpIdx를 전달해줘야 처리가 가능하다!!
		
	}

}
