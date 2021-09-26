<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>  <!-- 문서의 첫행 표시, 웹 브라우저에 HTML5 임을 알림 -->
<html lang="ko"> <!-- 시작, lang 속성 입력(생략가능)-->
<head> <!-- 페이지의 필요한 추가 속성 작성 -->
    <meta charset="UTF-8"> <!-- 출력 포맷 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 모바일 페이지 속성 -->
    <title>Come On, Board : Cafe info</title> <!-- 문서 제목 -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<script>

function pay_cancel(){

}

</script>
<body>
<div id="area_my_reservation" class="display_none" style="width:800px; text-align: center; line-height: 62px">
	<table class="table">
		<tr>
			<th>No</th>
			<th>결제시간</th>
			<th>카페이름</th>
			<th>예약날짜</th>
			<th>예약시간</th>
			<th>테이블</th>
			<th>가격</th>
			<th>취소</th>
		</tr>
		<c:if test="${!empty resultList}">
	    	<c:forEach items="${resultList}" var="list" varStatus="cnt">	
		    	<tr>
					<th>${cnt.index+1}</th>
					<th>${list.regDate}</th>
					<th>${list.cafeName}</th>
					<th>${list.reservDate}</th>
					<th>${list.reservTime}시</th>
					<c:if test="${list.reservFourTable == 1}">
	    				<th>4인석</th>
	    			</c:if>
	    			<c:if test="${list.reservgrpTable == 1}">
	    				<th>8인석</th>
	    			</c:if>
					<th>${list.stdFee}원</th>
					<th>
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<c:set var="nowDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
					<c:if test="${list.reservDate > nowDate}">
					<button type="button" class="btn btn-outline-danger">취소</button>
					</c:if>
					</th>
				</tr>
				<form>
					<input type="hidden" name="" value="${list.reservIdx}">
					<input type="hidden" name="" value="${list.stdFee}">
					<input type="hidden" name="" value="${list.tid}">
				</form>
	    	</c:forEach>
	    </c:if>
	    <c:if test="${empty resultList}">
	    	<h4>예약이 없습니다.</h4>
	    </c:if>
    </table>
</div>
</body>

</html>


