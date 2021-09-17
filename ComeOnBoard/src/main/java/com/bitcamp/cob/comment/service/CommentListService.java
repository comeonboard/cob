package com.bitcamp.cob.comment.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.comment.domain.Comment;
import com.bitcamp.cob.post.dao.PostDao;

@Service
public class CommentListService {

	@Autowired
	private SqlSessionTemplate template;

	public List<Comment> getCommentList(int postIdx){
		return template.getMapper(PostDao.class).selectCommList(postIdx);
	}
	
	public Comment getBestComment(int postIdx){
		return template.getMapper(PostDao.class).selectBestComment(postIdx);
	}
}