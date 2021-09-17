<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js" 
integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" 
crossorigin="anonymous">
</script>  
<script src ="<c:url value='/ckeditor/ckeditor.js'/>"></script>
<body>
	<textarea id="ckeditor" name="editor" ></textarea>
</body>
<script>
	CKEDITOR.replace("ckeditor", {
			filebrowserUploadUrl : "<c:url value='/adm/fileupload'/>"
	});
</script>
</html>