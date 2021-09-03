package com.bitcamp.cob.member.dao;

import com.bitcamp.cob.member.domain.Member;

public interface MemberDao {
	
	// 회원 가입
	int insertMember(Member member);
	
	// ID 중복값 체크
	int selectById(String memId);
	
	// 닉네임 중복값 체크
	int selectByNickName(String nickName);
	
	// 로그인 
	Member selectByIdPw(String memId, String memPw);
}
