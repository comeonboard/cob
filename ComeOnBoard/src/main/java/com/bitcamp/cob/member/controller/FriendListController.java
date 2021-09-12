package com.bitcamp.cob.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class FriendListController {
	
	@RequestMapping(value="/members/{memIdx}/friends", method=RequestMethod.POST)
	public String viewFriendsList(
			@PathVariable("memIdx") int memIdx) {
		
		return "member/friends";
	}
	
	// RestController로 이동
	/* @ResponseBody
	@RequestMapping("/member/friendList")
	public List<MemberInfo> getFriendList(int memIdx){
		List<MemberInfo> list = null;
		
		list = service.getFriendList(memIdx);
		
		return list;
	} */

}
