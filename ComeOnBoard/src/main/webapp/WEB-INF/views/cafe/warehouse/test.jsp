<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Project : 회원 리스트</title>

</head>
<script src="https://code.jquery.com/jquery-1.12.4.js" 
integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" 
crossorigin="anonymous">
</script>
<body>

                        <div class="nav_right">
                            <li><a class="category" onclick="click_save_value(this)" href="#" style="color:#003f7f" >잡담</a></li>
                            <li><a href="<c:url value='/post/postList?postSort=질문'/>" style="color:#007fff" >질문</a></li>
                            <li><a href="<c:url value='/post/postList?postSort=후기'/>" style="color:#00bf5f" >후기</a></li>
                            <li><a href="<c:url value='/post/postList?postSort=게임TIP'/>" style="color:#4f007c" >게임TIP</a></li>
                            <li><a href="<c:url value='/post/postList?postSort=지역'/>" style="color:#ffaaaa" >지역</a></li>   
                            <li><a href="<c:url value='/post/postList?postSort=기타'/>" style="color:#000000" >기타</a></li>
                            <li><a href="<c:url value='/post/postList?postSort=공지'/>" style="color:#ff0000" >공지</a></li>
                        </div>
                        <div>
                            <select id="cntPerPage" name="sel" onchange="selChange()" class="dataPerPage">
		                        <option value="10">10줄 보기</option>
		                        <option value="15">15줄 보기</option>
		                        <option value="20">20줄 보기</option>
		                        <option value="25">25줄 보기</option>
		                        <option value="30">30줄 보기</option>   
                     		</select>
                        </div>
                        <script>
                           let value = '없당';
                           function click_save_value(category){
                              value = $(category).text();
                              alert(value);
                           }
                     	   function selChange() {
                        	alert(value);
                        	var select = $('#cntPerPage').val();
                        	location.href="#"+select;
                     	   }
                  </script>
                        
                       
</body>
</html> 