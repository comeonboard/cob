package com.bitcamp.cob.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bitcamp.cob.member.domain.FindIdPwInfo;
import com.bitcamp.cob.member.domain.LoginInfo;
import com.bitcamp.cob.member.domain.Member;
import com.bitcamp.cob.member.domain.MemberInfo;
import com.bitcamp.cob.member.domain.RecommendType;

public interface MemberDao {
	
	// 회원 가입
	int insertMember(Member member);
	
	// ID 중복값 체크
	int selectById(String memId);
	
	// 비밀번호 확인
	int selectByPw(String memPassword);
	
	// 닉네임 중복값 체크
	int selectByNickName(String nickName);
	
	// 로그인 
	LoginInfo selectByIdPw(String memId, String memPw);
	
	// 정보 변경 위한 기존 입력 정보 받아오기
	LoginInfo selectByIdx(int memIdx);
	
	// 회원 정보 수정
	int updateMember(Member member);
	
	// 비밀번호 변경
	int updatePwById(@Param("memId")String memId, @Param("memPassword")String memPassword);
	
	// 사진 변경
	int updateMemPhoto(@Param("memIdx")int memIdx, @Param("memPhoto")String memPhoto);
	
	// 탈퇴, 아이디 삭제
	int deleteMember(int memIdx);
	
	// 나를 팔로우 하고 있는 친구 리스트 불러오기
	List<MemberInfo> selectFollowingFriendByIdx(int memIdx);
	
	// 나를 팔로우 하고 있는 친구 리스트 불러오기
	List<MemberInfo> selectFollowFriendByIdx(int memIdx);
	
	// 친구 정보 삭제하기
	int deleteFriend(@Param("memIdx")int memIdx, @Param("frIdx")int frIdx);
	
	// 친구 정보 불러오기
	MemberInfo getFriend(@Param("memIdx")int memIdx, @Param("frIdx")int frIdx);
	// 친구 등록 
	int postFriend(int memIdx, int frIdx);
	
	// 추천 친구 리스트 불러오기
	List<MemberInfo> recommendMemberByIdx(RecommendType recommendType);
	
	// 이메일로 ID 찾기
	List<String> getMemId(FindIdPwInfo findIdPwInfo);
	// 이메일로 PW 찾기
	int getMemPw(FindIdPwInfo findIdPwInfo);

}
