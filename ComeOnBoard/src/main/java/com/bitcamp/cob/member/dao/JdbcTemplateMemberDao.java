package com.bitcamp.cob.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.bitcamp.cob.domain.Member;

@Repository
public class JdbcTemplateMemberDao {
	
	@Autowired
	private JdbcTemplate template;
	
	public int insertMember(Member member) throws SQLException {	
		
		int resultCnt = 0;
		String sql1 = "insert into member (memberid, password, membername) values (?, ?, ?)";
		String sql2 = "insert into member (memberid, password, membername, memberphoto) values (?, ?, ?, ?)";
		
		if(member.getMemberphoto() != null) {
			resultCnt = template.update(sql2,
										member.getMemberid(),
										member.getPassword(),
										member.getMembername(),
										member.getMemberphoto()
										);
		} else {
			resultCnt = template.update(sql1,
										member.getMemberid(),
										member.getPassword(),
										member.getMembername());
		}
		return resultCnt;
	}
	
	public int insertMember1(Member member) throws SQLException {		
		
		int resultCnt = 0;
		
		// 자동 증가한 컬럼의 값을 저장할 객체
		KeyHolder holder = new GeneratedKeyHolder();
		
		template.update(
				new PreparedStatementCreator() {
					
					@Override
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						String sql2 = "insert into member (memberid, password, membername, memberphoto) values (?, ?, ?, ?)";
						PreparedStatement pstmt = con.prepareStatement(sql2, new String[] {"idx"});
						pstmt.setString(1, member.getMemberid());
						pstmt.setString(2, member.getPassword());
						pstmt.setString(3, member.getMembername());
						pstmt.setString(4, member.getMemberphoto());
						return pstmt;
					}
				}
				, holder);
		
		Number idx = holder.getKey();
		member.setIdx(idx.intValue());
		
		return resultCnt;
	}
	

	public Member selectByIdPw(String id, String pw) throws SQLException {
		
		// String sql = "select * from member where memberid=? and password=?";
		List<Member> list = template.query("select * from member where memberid=? and password=?", new MemberRowMapper(), id, pw);
			//Member member = list.isEmpty() ? null :list.get(0);
		
		return list.isEmpty() ? null : list.get(0);
	}

	// ID 중복여부 확인을 위한 id 값으로 검색 -> 개수 반환
	public int selectById(String memberId) throws SQLException {
		return template.queryForObject("select count(*) from member where memberid=?", Integer.class, memberId);
	}
	
	
	
	
	
	
	

}