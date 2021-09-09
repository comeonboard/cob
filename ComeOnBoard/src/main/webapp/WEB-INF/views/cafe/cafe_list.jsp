<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>  <!-- 문서의 첫행 표시, 웹 브라우저에 HTML5 임을 알림 -->
<html lang="ko"> <!-- 시작, lang 속성 입력(생략가능)-->
<head> <!-- 페이지의 필요한 추가 속성 작성 -->
    <meta charset="UTF-8"> <!-- 출력 포맷 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 모바일 페이지 속성 -->
    <title>Come on, Board : Cafe list</title> <!-- 문서 제목 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- 카드 선택시 하단 줄 CSS -->
	<link href="<c:url value="/css/hover.css"/>" rel="stylesheet" media="all">


	<link rel="stylesheet" href="<c:url value="/css/cafe_list.css"/>" type="text/css">
    <%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>

<script>

$(document).ready(function(){
	
	//getList(1, 'cafeIdx');
	
	let pageIdx = 1;
	let pageRating = 1;
	let pageAddress = 1;
	
    $('#btn_cafe_cafeidx_search').click(function(){
    	pageRating = 1;
    	pageAddress = 1;
    	scrollPage(pageIdx, $(this).val());
    });
    
    $('#btn_cafe_rating_search').click(function(){
    	pageIdx = 1;
    	pageAddress = 1;
    	scrollPage(pageRating, $(this).val());
    });
    
    $('#btn_cafe_address_search').click(function(){;
		pageIdx = 1;
		pageRating = 1;
    	scrollPage(pageAddress, $(this).val());
    });
	

	// 스크롤 페이징
    function scrollPage(page, search){
    	$('.card-deck').scroll(function(){
    		pageIdx++;
    		pageRating++;
    		pageAddress++;
    	    var scrollTop = $(this).scrollTop(); // 스크롤 현재 위치
    	    var innerHeight = $(this).innerHeight(); // 요소의 내부높이
    	    var scrollHeight = $(this).prop('scrollHeight'); // 스크롤의 전체 높이 
    	    //스크롤 현재 위치 + 요소의 내부 높이가 스크롤의 전체 높이보다 크거나 같으면 스크립트 실행
    	    if (scrollTop + innerHeight >= scrollHeight) {
    	    	//실행할 로직 (콘텐츠 추가)
    	        getList(page, search);
    	    }
    	});
    }
});



// 카페 리스트
function getList(page, search){
	$.ajax({
		url: '<c:url value="/cafe/cafe_listPaging"/>',
		type: 'post',
		data: {
			page : page,
			searchType : search
		},
		dataType: 'json',
		success : function(returnData) {
			console.log(returnData);
			console.log(returnData.cafe);
			var data = returnData.cafe;
			var html = ''
			if(page == 1){
				$('.card-deck').html(""); 
			}
			if(returnData.startNum <= returnData.totalCnt){
				$.each(data, function(idx, cafe) {
					html += '<div class="card hvr-underline-from-center fade-in" onclick="location.href=\'<c:url value="/cafe/cafe_page/'+cafe.cafeIdx+'"/>\'">'+'\n'+
					 	  '<img class="card-img-top" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FckSZmV%2FbtqLwLYTrGR%2FZkGjmqP0pHvzMkVK9b2pRk%2Fimg.png" alt="Card image cap">'+'\n'+
		                  '<div class="card-body">'+'\n'+
	    	              '<h5 class="card-title">'+cafe.cafeName+'</h5>'+'\n'+
	        	          '<p class="card-text" style="text-align: right;">'+'\n'+
	        	          cafe.stdFee+'\n'+
	                	  '<br>'+'\n'+
	                	  cafe.tenPerFee+'\n'+
	        	          '</p>'+'\n'+'</div>'+'\n'+'<div class="card-footer" style="text-align: center;">'+'\n'+
	            	      '<small class="text-primary">'+cafe.cafeAddress+'</small>'+'\n'+
	                	  '</div>'+'\n'+'</div>';
				});
				if(page == 1){
					$('.card-deck').html(html); 
				} else {
					$('.card-deck').append(html);
				}
			}
		},
		error : function(){
			alert('실패');
		},
		complete : function(){	
		}
	});
}


</script>





</head>

<body>

	<%@ include file="/WEB-INF/views/frame/header.jsp" %>

    <nav class="navbar navbar-light" style="background-color: #D6E9FF;">
    <ul class="nav-button">
        <li><button type="button" id="btn_cafe_cafeidx_search" class="btn btn-outline-danger" value="cafeIdx">등록순</button></li>
        <li><button type="button" id="btn_cafe_rating_search" class="btn btn-outline-success btn_cafe_star_search" value="cafeRating">평점순</button></li>
        <li><button type="button" id="btn_cafe_address_search" class="btn btn-outline-info btn_cafe_review_search" value="cafeAddress">지역순</button></li>
    </ul>
        <form class="form-inline">
            <select class="btn btn-outline-primary my-2 my-sm-0" name="searchType">
              <option value="cafeName">카페명</option>
              <option value="cafeAdderss">지역</option>
              <option value="both">난 둘다</option>
            </select>
            <input type="text" class="form-control mr-sm-2" name="keyword" placeholder="keyword">
            <input type="submit" class="btn btn-outline-primary my-2 my-sm-0" value="Search">
        </form>
    </nav>





    <div class="card-deck">
     	<c:if test="${fn:length(list) > 0}">
    	<c:forEach items="${list}" var="list" >	<c:url value="/cafe/cafe_page/${list.cafeIdx}"/>
			<div class="card hvr-underline-from-center fade-in" onclick="location.href="<c:url value="/cafe/cafe_page/${list.cafeIdx}"/>">
				<img class="card-img-top" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FckSZmV%2FbtqLwLYTrGR%2FZkGjmqP0pHvzMkVK9b2pRk%2Fimg.png" alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">${list.cafeName}</h5>
					<p class="card-text" style="text-align: right;">${list.stdFee}<br>${list.tenPerFee}</p>
				</div>
				<div class="card-footer" style="text-align: center;">
					<small class="text-primary">${list.cafeAddress}</small>
				</div>
			</div>
		</c:forEach>
		</c:if>
		
 		<c:if test="${fn:length(list) < 1}">
			<h1>검색결과 : ${fn:length(list)}</h1>
		</c:if>
    </div>



</body>




</html>