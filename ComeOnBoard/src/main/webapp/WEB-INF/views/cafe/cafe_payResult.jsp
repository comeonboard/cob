<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<c:if test="${payResult eq 'success'}">
	<script>
	alert('결제되었습니다.');
	alert('결제일시: '+${info.approved_at}+'\n주문번호: ${info.partner_order_id}\n상품명: ${info.item_name}\n상품수량: ${info.quantity}\n결제금액: ${info.amount.total}\n결제방법: ${info.payment_method_type});
	</script>
 ${info.partner_order_id} ${info.item_name} ${info.quantity} ${info.amount.total} ${info.payment_method_type}
</c:if>

<c:if test="${payResult eq 'fail' || empty payResult}">
	<script>
	alert('오류가 발생하여 결제에 실패했습니다.\n잠시 후 다시 시도해주세요.');
	//window.close();
	</script>
</c:if>   

<c:if test="${payResult eq 'cancel'}">
	<script>
	alert('결제가 취소되었습니다.');
	//window.close();
	</script>
</c:if>

 --%>
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

<style>

#top{
	width: 100%;
	height: 10%;
	background-color: #0091ea;
	
}
#result{
	text-align: center;
	width: 350px;
	height: 380px;
	

/*	margin-top: -175px;
	margin-left: -190px; */
}
#check{
	background-color: #0091ea;
	border-radius: 50%;
	width: 80px;
	height: 80px;
}

.left, .right{
	display: inline-block;
}
.left{
	float: left;
}
.right{
	float: right;
}
.clear{
	clear: both;
}
</style>

<body>

	<div id="top">
		<div id="result">
			<div id="check"></div>
			<h3>결제요청 처리 완료</h3>
			<h4 class="left">가맹점</h4> <h4 class="right">가맹점</h4>
			<h4 class="left">결제방법</h4> <h4 class="right">123</h4>
			<h4 class="left">결제금액</h4> <h4 class="right">123</h4>
			<h4 class="left">결제일시</h4> <h4 class="right">123</h4>
			<h4 class="left">결제내역</h4> <h4 class="right">123</h4>
			<br>
			<p class="clear">예약정보는 마이페이지에서 확인할 수 있습니다.</p>
			
			<button class="btn btn-outline-primary"></button>
		</div>
	</div>
	
</body>
</html>