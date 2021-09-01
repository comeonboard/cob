package com.bitcamp.cob.member.dao;

import com.bitcamp.cob.member.domain.Member;

public interface MemberDao {
	
	//회원 가입
	int insertMember(Member member);
	
}
