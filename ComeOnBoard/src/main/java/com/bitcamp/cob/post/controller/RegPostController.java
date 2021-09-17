package com.bitcamp.cob.post.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cob.post.domain.PostRegRequest;
import com.bitcamp.cob.post.service.PostRegService;

@Controller
@RequestMapping("/post/postReg")
public class RegPostController {

	@Autowired
	private PostRegService service;
	
	@RequestMapping(method = RequestMethod.GET)
	public String regPostForm() {
		return "post/regPostReg";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String regPostView(
			@ModelAttribute("regRequest") PostRegRequest postRegRequest,
			HttpServletRequest request,
			Model model) {
		
		int resultCnt = service.regPost(postRegRequest, request);
		model.addAttribute("resultReg", resultCnt);
		
		String view = "post/regpostView";
		
		if(resultCnt == 1) {
			view = "redirect:/index";
		}
		
		return view;
	}

}
