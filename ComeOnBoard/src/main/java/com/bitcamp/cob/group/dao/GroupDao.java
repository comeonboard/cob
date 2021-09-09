package com.bitcamp.cob.group.dao;


import java.util.List;


import com.bitcamp.cob.group.domain.Group;


public interface GroupDao {
	

	//모임 생성
	public int insertGroupBoardContent(Group group);
	
	//모임 게시글 출력
	public Group selectGroupBoardContent(Group getGrpIdx); //매개변수에 grpIdx를 전달해줘야 처리가 가능하다!!
	
//	//update할 제목, 내용
//	public Group selectCreatedTitleAndContent();
	
	//모임 업데이트
	public int updateGroupBoardContent(Group group);

	public Group reSelectContent(Group getGrpIdx);
}
