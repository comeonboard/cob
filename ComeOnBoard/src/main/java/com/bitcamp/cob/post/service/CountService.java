package com.bitcamp.cob.post.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.cob.post.dao.PostDao;

@Service
public class CountService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int countPost(String postSort) {
		return template.getMapper(PostDao.class).countPost(postSort);
	}

	public int countcomment(int postIdx) {
		return template.getMapper(PostDao.class).countComment(postIdx);
	}
	
}
