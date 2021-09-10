<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ComeOnBoard</title>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
</head>
<style>
	.border{
		border : 1px solid #aaa;
	}
</style>
<body>
	<h1>Info</h1>
	<hr>

	<table class="border">
		<tr>
			<th class="border">게임이미지</th>
			<th class="border">게임명</th>
			<th class="border">장르</th>
			<th class="border">게임인원</th>
			<th class="border">플레이타임</th>
			<th class="border">사용연령</th>
			<th class="border">출판사</th>
			<th class="border">출판일</th>
			<th class="border">INTRO</th>
			<th class="border">RULE</th>
			<th class="border">PLAY</th>
			<th class="border">게임평점</th>
		</tr>
	
		<c:forEach items="${gamepage}" var="gamePage" >
		<tr>
			<td class="border">${gamePage.gamePhoto}</td>		
			<td class="border">${gamePage.gameName}</td>
			<td class="border">${gamePage.gameSort}</td>
			<td class="border">${gamePage.gamePerson}</td>
			<td class="border">${gamePage.gameTime}</td>
			<td class="border">${gamePage.gameLmtAge}</td>
			<td class="border">${gamePage.gamePublisher}</td>
			<td class="border">${gamePage.gamePubDate}</td>
			<td class="border">${gamePage.gameIntro}</td>
			<td class="border">${gamePage.gameRule}</td>
			<td class="border">${gamePage.gameVideo}</td>
			<td class="border">${gamePage.revRating }</td>
		
		</tr>
		</c:forEach>


	</table>


</body>
</html>