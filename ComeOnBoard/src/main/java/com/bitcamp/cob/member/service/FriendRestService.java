package com.bitcamp.cob.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.member.dao.MemberDao;
import com.bitcamp.cob.member.domain.MemberInfo;
import com.bitcamp.cob.member.domain.RecommendType;

@Service
public class FriendRestService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	// 친구 삭제
	public int deleteFriend(int memIdx, int frIdx) {
		return template.getMapper(MemberDao.class).deleteFriend(memIdx, frIdx);
	}

	// 친구 정보 보기
	public MemberInfo getMember(int memIdx, int idx) {
		MemberDao dao = template.getMapper(MemberDao.class);
		MemberInfo memberInfo = dao.getMember(memIdx, idx);
		List<String> preferGame = dao.getPreferGame(memIdx);
		memberInfo.setPreferGame(preferGame);
		return memberInfo;
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
	
	// 친구 추천 목록 JSON
	public List<MemberInfo> getRecommendFriend(RecommendType recommendType) {
		MemberDao dao = template.getMapper(MemberDao.class);
		List<MemberInfo> list = dao.recommendMemberByIdx(recommendType);
		
		// 멤버에 해당하는 선호게임 리스트 불러오기
		for(int i=0; i<list.size(); i++) {
			int memIdx = list.get(i).getMemIdx();
			List<String> preferGame = dao.getPreferGame(memIdx);
			list.get(i).setPreferGame(preferGame);
		}
		return list;
	}
	
	//선호 게임 목록 
	public List<String> getPreferGame(int memIdx){
		return template.getMapper(MemberDao.class).getPreferGame(memIdx);
	}
}
