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
	
	
	@PostMapping("/friends/{fridx}")
	public int postFriend(
			@PathVariable("fridx")int frIdx,
			Integer memIdx// 회원 idx 
			){ 
		System.out.println(memIdx);
		int result = service.postFriend(memIdx, frIdx);

		return result;
	}
	
	@GetMapping("/friends/{frIdx}")
	public MemberInfo getFriend(
			@PathVariable("frIdx")int frIdx,
			Integer memIdx
			){
		MemberInfo friendInfo = service.getFriend(memIdx, frIdx);
		
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
	
	@GetMapping("/friendslist/{memIdx}")
	public List<MemberInfo> getAllMember(@PathVariable("memIdx")int memIdx){
		List<MemberInfo> list = null;
		
		list = service.getAllMember(memIdx);
		
		return list;
	}
	
	
	@DeleteMapping("/friends/{frIdx}")
	public int deleteFriend(@PathVariable("frIdx")int frIdx,
							@RequestParam("memIdx")int memIdx){
		int result = 0;
		System.out.println(memIdx);
		System.out.println(frIdx);
		
		result = service.deleteFriend(memIdx, frIdx);	
		
		return result;
	}

}
