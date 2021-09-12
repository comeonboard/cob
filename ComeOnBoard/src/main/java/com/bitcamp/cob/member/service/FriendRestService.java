package com.bitcamp.cob.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.member.dao.MemberDao;
import com.bitcamp.cob.member.domain.MemberInfo;

@Service
public class FriendRestService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	// 친구 삭제
	public int deleteFriend(int memIdx, int frIdx) {
		return template.getMapper(MemberDao.class).deleteFriend(memIdx, frIdx);
	}

	// 친구 정보 보기
	public MemberInfo getFriend(int memIdx, int frIdx) {
		
		return template.getMapper(MemberDao.class).getFriend(memIdx, frIdx);
	}
	// 친구 등록 
	public int postFriend(int memIdx, int frIdx) {
		
		return template.getMapper(MemberDao.class).postFriend(memIdx, frIdx);
	}
	
	// 팔로우 중인 친구 목록 JSON
	public List<MemberInfo> getFriendList(int memIdx) {
		
		return template.getMapper(MemberDao.class).selectFollowFriendByIdx(memIdx);
	}

	// 나를 팔로우 하는 친구 목록 JSON
	public List<MemberInfo> getFollowingFriendList(int memIdx) {
		return template.getMapper(MemberDao.class).selectFollowingFriendByIdx(memIdx);
	}
}
