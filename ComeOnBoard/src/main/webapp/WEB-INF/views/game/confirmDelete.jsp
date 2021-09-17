<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 정말 삭제 하시겠습니까?</h1>
	<form method="post">
		<input type="hidden" name="memAuth" value ="${loginInfo.memAuth}">
		<input type="hidden" name="memAuth" value ="${gamepage.gameIdx}">
		<textarea class="hidden" name="gameIdx" id="gameIdx" >${gamepage.gameIdx}</textarea>
		<input type="submit" value="삭제">
	</form>	
</body>
</html>