package com.bitcamp.cob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class crawlingController {

	@Autowired
	private NaverBlogService service;
	
	@RequestMapping(value="craw/crawling_ajax", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String selectBlog(
			@RequestParam("keyword")String keyword){
		return service.searchBlog(keyword);
	}
}
