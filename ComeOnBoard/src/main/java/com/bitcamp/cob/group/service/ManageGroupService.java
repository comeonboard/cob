package com.bitcamp.cob.group.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.group.dao.GroupDao;

import com.bitcamp.cob.group.domain.Group;

@Service
public class ManageGroupService {
	

	@Autowired
	private SqlSessionTemplate template;

	// 모임 참가 insert
	public int insertEditGroup(int memIdx, int grpIdx) {
		
		return template.getMapper(GroupDao.class).insertJoinGroup(memIdx, grpIdx);
		
	}
	
	// 참가한 그룹 가져오기
	public Group selectEditGroup() {

		return template.getMapper(GroupDao.class).selectJoinGroup();	
		
	}
	
	public ArrayList<Group> selectMyGameGroup(int memIdx) {
		
		return template.getMapper(GroupDao.class).selectMyGroup(memIdx);
		
	}
	
	
}
