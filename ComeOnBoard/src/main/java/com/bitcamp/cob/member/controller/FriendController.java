package com.bitcamp.cob.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bitcamp.cob.member.domain.MemberInfo;
import com.bitcamp.cob.member.service.FriendRestService;

@RestController
public class FriendController {

	@Autowired
	private FriendRestService service;
	
	@PostMapping("/members/{memIdx}/friends/{fridx}")
	public int postFriend(
			@PathVariable("memIdx")int memIdx, // 회원 idx
			@PathVariable("fridx")int frIdx // 친구 idx 
			){ 
		int result = service.postFriend(memIdx, frIdx);
		
		return result;
	}
	
	@GetMapping("/members/{memIdx}/friends/{frIdx}")
	public MemberInfo getFriend(
			@PathVariable("memIdx")int memIdx,
			@PathVariable("frIdx")int frIdx) {
		MemberInfo friendInfo = service.getFriend(memIdx, frIdx);
			
		System.out.println(friendInfo);
		
		return friendInfo;
	}
	
	@GetMapping("/members/{memIdx}/friends/follow")
	public List<MemberInfo> getFriendList(@PathVariable("memIdx")int memIdx){
		List<MemberInfo> list = null;
		
		list = service.getFriendList(memIdx);
		
		return list;
	}
	
	@GetMapping("/friends/following/{memIdx}")
	public List<MemberInfo> getFollowingFriendList(@PathVariable("memIdx")int memIdx){
		List<MemberInfo> list = null;
		
		list = service.getFollowingFriendList(memIdx);
		
		return list;
	}
	
	@RequestMapping(value="/members/friends", method=RequestMethod.POST)
	public int deleteFriend(@RequestParam("memIdx")int memIdx,
							@RequestParam("frIdx")int frIdx){
		int result = 0;
		System.out.println(memIdx);
		System.out.println(frIdx);
		
		result = service.deleteFriend(memIdx, frIdx);	
		
		return result;
	}

}
