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

<!-- 스타일시트 여러개 선언 가능!!! 우선순위: 아래>위 -->


<!-- 공통 헤더 부분.jsp파일이기 땜에 include사용 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
<%@ include file="/WEB-INF/views/frame/header.jsp"%>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>

</head>


<body>
	
		<div class="Wrapper">
			<div id="content">
				<div class="WritingWrap">
					<div class="articletitle">
						<br>
						<hr>
						<br>
						<div style="width: 300px" class="title_inside_div">
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
					<br>
					<hr>
					<br>
					<div>
						<input type="button" id="join_group" value="모임 참가하기">
					</div>
					<br>
					<div>
						<hr>
						<br>
						<div id="grpTitle">${readCreateGroupPage.grpTitle}</div>
						<br>
						<hr>
						<br>
						<div id="grpContent">${readCreateGroupPage.grpContent}</div>
						<br>
						<div id="edit">
							<a href="<c:url value="/group/updateGroup"/>" style="color: rgb(66, 133, 244);">수정하기</a>&nbsp;&nbsp; 
							<a href="#" style="color: rgb(66, 133, 244);">삭제하기</a>
						</div>
						<br> <br>
						<hr>
					</div>
				</div>
				<br>
			</div>
		</div>
	
</body>

</html>