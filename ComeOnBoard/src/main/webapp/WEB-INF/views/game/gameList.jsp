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
	<h1>겜리스트</h1>
	<hr>

	<table class="border">
		<tr>
			<th class="border">게임이미지</th>
			<th class="border">게임명</th>
			<th class="border">장르</th>
			<th class="border">게임인원</th>
			<th class="border">플레이타임</th>
			<th class="border">사용연령</th>
			<th class="border">게임평점</th>
		</tr>
	
		<c:forEach items="${gamelist}" var="gameMain" >
		<tr>
			<td class="border">${gameMain.gamePhoto}</td>		
			<td class="border">${gameMain.gameName}</td>
			<td class="border">${gameMain.gameSort}</td>
			<td class="border">${gameMain.gamePerson}</td>
			<td class="border">${gameMain.gameTime}</td>
			<td class="border">${gameMain.gameLmtAge}</td>
			<td class="border">${gameMain.revRating }</td>
		
		</tr>
		</c:forEach>


	</table>


</body>
</html>