<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:if test="${loginInfo eq null}"> --%>
<c:if test="${!loginChk}">
<script>
	alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	history.go(-1);
</script>

</c:if>

<c:if test="${loginChk}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Project</title>
</head>
<body>

	<div id="content">	
		<h2>Login</h2>
		<hr>
		<h2>
			${loginInfo}
		</h2>	
	</div>
</body>
</html>
</c:if>