<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Text Editor</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
	integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
	crossorigin="anonymous" />

<link rel="stylesheet" href="<c:url value="/css/readCreateGroup.css"/>">
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>

<!-- 스타일시트 여러개 선언 가능!!! 우선순위: 아래>위 -->
<!-- 공통 헤더 부분.jsp파일이기 땜에 include사용 -->
<%@ include file="/WEB-INF/views/frame/header.jsp"%>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

</head>


<body>
	<div class="Wrapper">
		<div id="content">
			<div class="WritingWrap">
				<div class="articletitle">
					<hr>
					<div style="width: 200px" class="title_inside_div">
						<h3>위치: ${readCreateGroupPage.loc}</h3>
						<h3>장르: ${readCreateGroupPage.genre}</h3>
						<h3>인원:
							${readCreateGroupPage.grpRegMem}/${readCreateGroupPage.grpMaxMem}</h3>
					</div>
					<div style="width: 500px" class="title_inside_div"
						id="date_information">
						<h3>모임 시작: ${readCreateGroupPage.grpDate}</h3>
						<h3>모집 마감: ${readCreateGroupPage.grpPostEndDate}</h3>
						<h3>작성자: ${readCreateGroupPage.nickName}</h3>
					</div>
				</div>
				<hr>
				<div id="attend_div">
					<!-- <a id="join_group" onclick="attend_gameGroup()"> -->
					<a id="join_group" href="/cob/group/groupEditor?grpIdx=${readCreateGroupPage.grpIdx}&memIdx=${loginInfo.memIdx}">
						모임 참가 신청
					</a>
				</div>
				<div>
					<hr>
					<div id="grpTitle">${readCreateGroupPage.grpTitle}</div>
					<hr>
					<div id="grpContent">${readCreateGroupPage.grpContent}</div>
					<div id="edit">
						<a href="updateGroup?grpIdx=${readCreateGroupPage.grpIdx}"
							style="color: rgb(66, 133, 244);">수정하기</a>&nbsp;&nbsp; <a
							onclick="confirm_delete_group_board()"
							style="color: rgb(66, 133, 244);">삭제하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	$(document).ready(function () {
		var memIdx = '${loginInfo.memIdx}';
		<%-- var memIdx = '<%=(String)session.getAttribute("memIdx")%>'; --%>
		var memIdxOnJsp = '${readCreateGroupPage.memIdx}';
		
		console.log(memIdx);
		console.log(memIdx.length);

		if ((memIdx != "null") && (memIdx == memIdxOnJsp)) {
			$("#join_group").hide();
		} else if ((memIdx != "null") && (memIdx != memIdxOnJsp)) {
			$("#edit").hide();
		} else if (memIdx.length == 0) {
			console.log(memIdx);
			/* sessionStorage.clear(); */
			$("#join_group").hide();
			$("#edit").hide();
		}
	})

	
	function confirm_delete_group_board() {
		if (confirm("모임 게시글을 삭제하시겠습니까?") == true) {
			location.href = "deleteGroupBoard?grpIdx=" + $
			{
				readCreateGroupPage.grpIdx
			}
		} else {
			return;
		}

	}

	
  	function attend_gameGroup() {
 			
/* 	  	 var url = ${readCreateGroupPage.grpIdx} ;
		 console.log(url);
		 
		  $.ajax({
			 url: "<c:url value='/group/groupEditorMyGroup?grpIdx="+url+"'/>",
			 type: "POST",
			 data: { 
			 "memIdx" : "${loginInfo.memIdx}",
			 "nickName" : "${readCreateGroupPage.nickName}"
			 },
			 processData: true,
			 contentType: "application/json",
			 dataType: "json",
			 success: function(data) {
			 alert('데이터 전송에 성공하였습니다');
			 }
		 })   */
	
	 } 
</script>



</html>




