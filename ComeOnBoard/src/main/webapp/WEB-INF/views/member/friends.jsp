<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Come on, Board: 친구 목록</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>

<script>
	$(document).ready(function(){
		var fr = getFriendList();
		let tab_id = 'tab1';
		let memIdx = ${loginInfo.memIdx};
		console.log(memIdx);
        $('.btn_menu').click(function(){
        	 $('#nickName_popup').hide();
			 $('.btn_menu').removeClass('bgColor_blue');
             tab_id = $(this).attr('data-tab');
             
             $('#'+tab_id).addClass('bgColor_blue');
             if(tab_id == 'tab1'){
 				getFriendList();	
 			} else if(tab_id == 'tab2'){
 				getFollowingFriendList();
 			} else if(tab_id == 'tab3'){
 				console.log(memIdx);
 				getRecommendFriendByAddr(memIdx, '${loginInfo.preferAddr}');
 			}
        });
        
     	// 친구 팔로우 끊기
     	$(document).on('click', '.btn_delete_friend', function(){
			frIdx = $(this).attr('data-friend');
			deleteFriend(frIdx);
			if(tab_id == 'tab1'){
				getFriendList();	
			} else if(tab_id == 'tab2'){
				getFollowingFriendList();
			}
			
		});
     	
     	// 친구 정보에서 팔로우 끊기
     	$(document).on('click', '#btn_delete_friend', function(){
			frIdx = $(this).attr('data-friend');
			deleteFriend(frIdx);
			if(tab_id == 'tab1'){
				getFriendList();	
			} else if(tab_id == 'tab2'){
				getFollowingFriendList();
			}
		});
		
     	// 추가 정보 팝업
     	$(document).off('click', '.namespace').on('click', '.namespace', function(e){
        //$('.namespace').unbind('click').bind('click',function(e){
        	let frIdx = $(this).attr('data-friend');
        	target = $(e.target);
        	var p = $(target).offset();
        	var divTop 	= p.top + 10; //상단 좌표 
        	var divLeft = p.left + 20; //좌측 좌표 
        	//레이어 팝업 view
        	$('#nickName_popup').css({ "z-index":'30',"top": divTop ,"left": divLeft , "position": "absolute" }).show();

        	// 상세 정보 보기
        	$('.btn_friend_info').off('click').on('click',function(){
        		getFriend(frIdx);
        		$('#nickName_popup').hide();
        		$('#area_friend_info').show();
        		memIdx = null;
        	});
        	
        	// 창 닫기 
    		$('.btn_close').click(function(){
    			$(this).closest('div').hide();
    		});
        });
        
        // 목록에서 친구 추가 
        $(document).on('click', '.btn_reg_friend', function(){
			var frIdx = $(this).attr('data-friend');
			regFriend(frIdx);
			console.log(tab_id);
			if(tab_id == 'tab2'){
           	 	getFollowingFriendList();
			}
        });
        
        // 정보 보기에서 친구 추가
        $(document).on('click', '#btn_reg_friend', function(){
			var frIdx = $(this).attr('data-friend');
			regFriend(frIdx);
			$('#area_friend_info').hide();
			if(tab_id == 'tab2'){
           	 	getFollowingFriendList();
			}
        });
        
   

     	
	});

</script>
<style>
	h2 {
		margin: 20px 40px;
		padding: 5px;
		border-radius: 10px;
		background-color : rgb(52,168,83);
		color: white;
		font-size:18px;
	}
	.area_friend_list {
		margin: 40px auto;
		width: 900px;
		height: 1000px;
		background-color: white;
	}
	
	.ul_menu {
		height: 50px;
		margin-bottom: 25px;
	}
	
	.ul_menu li {
		width: 300px;
		float: left;
	}
	.btn_menu {
		border: none;
		width: 300px;
		height: 50px;
		font-size: 18px;
		border-radius: 10px;
		background-color: #aaa;
		font-weight: 600;
	}
	
	.bgColor_blue {
		background-color: rgb(66,133,244);
		color: white;
	}

	
	#friend_list {
		width: 100%;
		min-height: 500px;
		background-color: white;
		
	}
	
	.frInfo {
		position: relative;
		display: block;
		margin: 0 auto;
		width: 90%;
		height: 50px;
		border-bottom: 1px solid #555;
		overflow: hidden;	
	}
	

	
	.frInfo li {
		height: 50px;
		float: left;
		line-height: 50px;
	}
	
	.col1, .col5 {
		width: 50px;
	}
	
	.col2 {
		text-align: center;
		width: 170px
		} 
	.col3, .col4 {
		width: 250px;
	}
	
	.friend_photo {
        width : 100%;
        height: 100%;
    }

    .friend_profile_frame {
        width: 45px;
        height: 45px;
        border-radius: 70%;
        overflow:hidden;
        display: block;
        float: left;      
    }

    button {
    	width: 90px;
        height: 40px;
        border: none;
        background-color: rgb(66, 133, 244);
        border-radius: 10%;
        color: white;
    }
	
	button:hover {
		cursor: pointer;
	}
	#nickName_popup {
		background-color: white;
		width: 100px;
		height: 93px;
		border: 1px solid #ccc;
		text-align: center;
		display:none;
	}
	
	#nickName_popup li {
		height: 30px;
		line-height: 30px;
		border-bottom: 1px solid #ccc;
	}
	
	#nickName_popup a {
		height: 30px;
	}
	
	#nickName_popup li:hover {
		background-color: rgb(251, 188, 5);
	}
	
	#area_friend_info {
		display: none;
		margin-left: 250px;
        position: absolute;
        width: 400px;
        height: 400px;
        background-color: rgb(245, 246, 247);
        border-radius: 10px;
        z-index: 50;
    }
    
    #area_friend_info .col1 {
        color: rgb(66, 133, 244);
        width: 100px;
        height: 30px;
        line-height: 30px;
        background-color: white;
        border-radius: 5px;
        border:rgb(66, 133, 244) 1px solid;
    }

    #area_friend_info .col2 {
        width: 160px;
        height: 30px;
        background-color: white;
    }
    
    #friend_info_profile_frame {
        margin: 15px auto;
        width: 100px;
        height: 100px;
        border-radius: 70%;
        overflow:hidden;
        display: block;      
    }
    
    #area_friend_info table{
		display: block;
        width: 300px;
		margin: 15px auto;
    }
    .btn_delete_friend {
    	background-color: rgb(234,67,53);
    }
    
    #btn_send_msg {
    	margin-left: 40px;
    }
	
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<div class="content">
		<div class="area_friend_list">
			<ul class="ul_menu">
				<li><button type="button" id="tab1" class="btn_menu bgColor_blue" data-tab="tab1">내가 등록한 친구 보기</button></li>
				<li><button type="button" id="tab2" class="btn_menu" data-tab="tab2">나를 등록한 친구 보기</button></li>
				<li><button type="button" id="tab3" class="btn_menu" data-tab="tab3">친구 추천</button></li>
			</ul>
			<!-- 친구 정보 보기 팝업 -->
			<div id="area_friend_info">
               <div id="friend_info_profile_frame">
               </div>
               <table>
                   <tr>
                       <td class="col1">닉네임</td>
                       <td id="friend_nickName" class="col2"></td>
                   </tr>
                   <tr>
                       <td class="col1">생 일</td>
                       <td id="friend_memBirth" class="col2"></td>
                   </tr>
                   <tr>
                       <td class="col1">성 별</td>
                       <td id="friend_memGender" class="col2"></td>
                   </tr>
                   <tr>
                       <td class="col1">선호게임</td>
                       <td id="friend_preferGame" class="col2">7200</td>
                   </tr>
                   <tr>
                       <td class="col1">선호지역</td>
                       <td id="friend_preferAddr" class="col2"></td>
                   </tr>
   
               </table>
                  <button id="btn_send_msg">쪽지보내기</button>
                  <button id="btn_reg_friend" class="display_none">친구 등록</button>
                  <button id="btn_delete_friend" class="display_none">친구 삭제</button>
                  <button class="btn_close">창닫기</button>
           	</div>
			<div id="friend_list">
				<h2>나와 선호지역이 같은 회원</h2>
					<div id="area_friend_preferAddr"></div>
				<h2>나와 선호게임이 같은 회원</h2>
					<div id="area_friend_preferGame"></div>
			</div>	
			<!-- 친구 이름 클릭시 팝업 -->
			<div id="nickName_popup">
					<ul>
						<li><a href="#" class="btn_friend_info">정보 보기</a></li>
						<li><a>작성 글보기</a></li>
						<li><a href="#" class="btn_close">닫기</a></li>
					</ul>		
			</div>
		</div>
	</div>
</body>

<script>
	// 팔로우 중인 친구 리스트 불러오기
	function getFriendList(){
		var friendList = null;
		var url = '<c:url value="/members/"/>'+'${loginInfo.memIdx}'+"/friends/follow";
		$.ajax({
			url: url,
			type : 'get',
			dataType: 'json',
			success : function(data) {
				friendList = data;
				$('#friend_list').empty();
				$.each(data, function(index, item){
					var memIdx = item.memIdx;
					var html = '<ul class=frInfo>';
                    html += '<li class="col1"><div class="friend_profile_frame">'
                    html += '<img class="friend_photo" src="<c:url value="/uploadfile/member/"/>'+item.memPhoto+'">'
                    html += '</div></li>'
                   	html += '<li class="col2"><a href="#" class="namespace" data-friend="'+memIdx+'">'+item.nickName+'</a></li>'
                   	html += '<li class="col3">'+item.preferAddr+'</li>'
                   	html += '<li class="col4">'+'선호게임'+'</li>'
                   	html += '<li><button class="btn_delete_friend" data-friend="'+memIdx+'">삭제</button></li>'
                   	html += '</ul>'
         			
        			$('#friend_list').append(html);
					});	
			},
			error : function(request, status, error) {
				alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
	
		return friendList;
	}
	// 나를 팔로우 하는 친구 정보 불러오기
	function getFollowingFriendList(){
		var friendsList = null;
		var url = '<c:url value="/friends/following/"/>'+'${loginInfo.memIdx}';	
		$.ajax({
			url: url,
			type : 'get',
			dataType: 'json',
			success : function(data) {
				friendList = data;
				$('#friend_list').empty();
				$.each(data, function(index, item){
					var memIdx = item.memIdx;
					var html = '<ul class=frInfo>';
                    html += '<li class="col1"><div class="friend_profile_frame">'
                    html += '<img class="friend_photo" src="<c:url value="/uploadfile/member/"/>'+item.memPhoto+'">'
                    html += '</div></li>'
                   	html += '<li class="col2"><a href="#" class="namespace" data-friend="'+memIdx+'">'+item.nickName+'</a></li>'
                   	html += '<li class="col3">'+item.preferAddr+'</li>'
                   	html += '<li class="col4">'+'선호게임'+'</li>'
                   	if(item.followChk>0){
                       	html += '<li><button class="btn_delete_friend" data-friend="'+memIdx+'">삭제</button></li>'
                    } else {
                    	html += '<li><button class="btn_reg_friend" data-friend="'+memIdx+'">등록</button></li>'
                    }
                   	html += '</ul>'
         			
        			$('#friend_list').append(html);
					});	
			},
			error : function(request, status, error) {
				alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
	
		return friendsList;
	}
	// 추천 친구 리스트 불러오기
	function getRecommendFriendByAddr(memIdx, preferAddr){
		var friendsList = null;
		var url = '<c:url value="/friends/recommendFriends/"/>'+ memIdx;
		var recommendType =  {
				memIdx : memIdx,
				preferAddr : preferAddr,
				preferGame : "라스베가스"
			};
		console.log(preferAddr);
		$.ajax({
			url: url,
			type : 'get',
			data : recommendType,
			dataType: 'json',
			cotentType : 'application/json',
			success : function(data) {
				friendList = data;
				$('#friend_list').empty();
				var areaHtml = '<h2>나와 선호지역이 같은 회원</h2>';
				areaHtml += '<div id="area_friend_preferAddr"></div>';
				areaHtml += '<h2>나와 선호게임이 같은 회원</h2>';
				areaHtml += '<div id="area_friend_preferGame"></div>';
				console.log(areaHtml);
				$('#friend_list').append(areaHtml);
				
				$.each(data, function(index, item){
					var memIdx = item.memIdx;
					var html = '<ul class=frInfo>';
					if(item.followChk>0){
						return;
					}
                    html += '<li class="col1"><div class="friend_profile_frame">'
                    html += '<img class="friend_photo" src="<c:url value="/uploadfile/member/"/>'+item.memPhoto+'">'
                    html += '</div></li>'
                   	html += '<li class="col2"><a href="#" class="namespace" data-friend="'+memIdx+'">'+item.nickName+'</a></li>'
                   	html += '<li class="col3">'+item.preferAddr+'</li>'
                   	html += '<li class="col4">'+'선호게임'+'</li>'
                   	if(item.followChk>0){
                       	html += '<li><button class="btn_delete_friend" data-friend="'+memIdx+'">삭제</button></li>'
                    } else {
                    	html += '<li><button class="btn_reg_friend" data-friend="'+memIdx+'">등록</button></li>'
                    }
                   	html += '</ul>'
         			
        			$('#area_friend_preferAddr').append(html);
					});	
			},
			error : function(request, status, error) {
				alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
	
		return friendsList;
	}
	
	//다른 회원 정보 불러오기
	function getFriend(frIdx){
		var url = "<c:url value='/friends/'/>"+frIdx;
		$.ajax({
			url: url,
			type : 'get',
			data : { memIdx : '${loginInfo.memIdx}'},
			dataType: 'json',
			success : function(data) {
				if(data!=null){
					$('#friend_info_profile_frame').html('<img class="friend_photo" src="<c:url value="/uploadfile/member/"/>'+data.memPhoto+'">');
					$('#friend_nickName').html(data.nickName);
					$('#friend_memBirth').html(data.memBirth);
					$('#friend_memGender').html(data.memGender);
					$('#friend_preferGame').html(data.preferGame);
					$('#friend_preferAddr').html(data.preferAddr);
					
					if(data.followChk>0){
						$('#btn_reg_friend').addClass('display_none');
						$('#btn_delete_friend').removeClass('display_none');
						$('#btn_delete_friend').attr("data-friend", data.memIdx);
					} else {
						$('#btn_delete_friend').addClass('display_none');
						$('#btn_reg_friend').removeClass('display_none');
						$('#btn_reg_friend').attr("data-friend", data.memIdx);
					}
				}
			},
			error : function(request, status, error) {
				alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
	}
	// 친구 추가 메소드
    function regFriend(frIdx){
    	url = '<c:url value="/friends/"/>'+frIdx;
    	memIdx = ${loginInfo.memIdx};
    	$.ajax({
			url : url,
			type : 'post',
			data : { memIdx : '${loginInfo.memIdx}'},
			success : function(data) {
				if (data>0) {	
				 alert('친구 등록이 완료되었습니다.');
				} 
			},
			error : function(request, status, error) {
				alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});
    };
    
    // 친구 팔로우 취소 메소드
    function deleteFriend(frIdx){
		if(confirm('정말 삭제하시겠습니까?')){
			var deleteUrl = '<c:url value="/friends/"/>'+frIdx;
			$.ajax({
				url : deleteUrl,
				type : 'delete',
				data : {
					memIdx : '${loginInfo.memIdx}'
					},
				success : function(data) {
					if (data>0) {
						alert('친구 삭제가 완료되었습니다.');
					} 
				},
				error : function(request, status, error) {
					alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});
		}	
	}
	
</script>
</html>
