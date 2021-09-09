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
    <title>Cafe info</title> <!-- 문서 제목 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- 카드 선택시 하단 줄 CSS -->
	<link href="<c:url value="/css/hover.css"/>" rel="stylesheet" media="all">

	<link rel="stylesheet" href="<c:url value="/css/cafe_regForm.css"/>" type="text/css">

<style>

     </style>

    <!-- 파일 미리보기 -->

   
    


</head>

<body>

    <header class="header">
        <div class="MultiBar">
            <ul class="area_gnb">
                <li>시작페이지로</li>
                <li>다크모드</li>
                <li>마이페이지</li>
                <li>로그인</li>
            </ul>
        </div>

        <div class="container">
            <img src="<c:url value="/images/cob_white.png"/>" class="logo">
        </div>
        <div class="main_naviwrap">
            <div class="main_nav">
                <ul class="left_ul">
                    <li>회사소개</li>
                    <li>회사소개</li>
                    <li>회사소개</li>    
                </ul>
            </div>
        </div>

        <div class="main_naviwrap">
            <div class="main_nav">
                <ul class="right_ul">
                    <li>모임</li>
                    <li>게시판</li>
                    <li>카페</li>
                    <li>게임</li>    
                </ul>
            </div>
        </div>
    </header>

    <div class="cafe_wrap">   
        <div class="info"> 
        
        <h5 class="info_menu">카페 정보 등록</h5>
        <hr class="first_hr">

            <form method="post" enctype="multipart/form-data">
            
                <label for="exampleFormControlInput1">카페 이름</label>
                <input type="text" name="cafeName" class="form-control mb-2" id="exampleFormControlInput1" placeholder="카페 이름">

                <label for="exampleFormControlInput2">카페 주소</label>
                <input type="text" name="cafeAddress" class="form-control mb-2" id="exampleFormControlInput2" placeholder="카페 주소">

				<label for="exampleFormControlInput3">영업시간</label>
                <input type="text" name="cafeTime" class="form-control mb-2" id="exampleFormControlInput3" placeholder="00:00~00:00">
				
				<label for="exampleFormControlInput4">시간당 기본 요금</label>
                <input type="number" name="stdFee" class="form-control mb-2" id="exampleFormControlInput4" placeholder="시간당 기본 요금">
				
				<label for="exampleFormControlInput5">10분당 추가 요금</label>
                <input type="number" name="tenPerFee" class="form-control mb-2" id="exampleFormControlInput5" placeholder="10분당 추가 요금">
				
				<label for="exampleFormControlInput6">4인석 수</label>
                <input type="number" name="fourTable" class="form-control mb-2" id="exampleFormControlInput6" placeholder="4인석 수">
				
				<label for="exampleFormControlInput7">8인석 수</label>
                <input type="number" name="grpTable" class="form-control mb-2" id="exampleFormControlInput7" placeholder="8인석 수">
				
				<label for="exampleFormControlInput8">카페 전화번호</label>
                <input type="text" name="cafeTel" class="form-control mb-2" id="exampleFormControlInput8" placeholder="000-0000-0000">
			<!-- 	        
				<label for="exampleFormControlInput8">카페 전화번호</label>
                <input type="text" name="cafeIdx" class="form-control mb-2" id="exampleFormControlInput8" placeholder="000-0000-0000">
				   -->    
				                
				<label for="cafeThumbnail">썸네일 미리보기</label>
				<input type="file" name="cafeThumbnail" id="cafeThumbnail">	
				<div id="thumbnail" class="form-control mb-2">
				</div>
				        				
 				<label for="cafeImg">이미지 미리보기</label>
				<input type="file" multiple="multiple" name="cafeImg" id="cafeImg">
				<div id="preview" class="form-control mb-2">
				</div>

			    <input type="submit" class="btn btn-primary col text-center mb-2" value="등록" />
            </form>
            <hr>
        </div>  
    </div>

</body>
	
<script>


var upload = document.querySelector('#cafeImg');
var uploadthumbnail = document.querySelector('#cafeThumbnail');

uploadthumbnail.addEventListener('change',function (e) {
	$('#thumbnail').empty();
    var get_file = e.target.files;

    var image = document.createElement('img');

    /* FileReader 객체 생성 */
    var reader = new FileReader();

    /* reader 시작시 함수 구현 */
    reader.onload = (function (aImg) {
        console.log(1);

        return function (e) {
            console.log(3);
            /* base64 인코딩 된 스트링 데이터 */
            aImg.src = e.target.result
        }
    })(image)

    if(get_file){
        /* 
            get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
            onload 에 설정했던 return 으로 넘어간다.
            이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
        */
        reader.readAsDataURL(get_file[0]);
        console.log(2);
    }
    
    $('#thumbnail').append(image);
})


upload.addEventListener('change',function (e) {
	$('#preview').empty();
    var get_file = e.target.files;

    for(var i=0; i<get_file.length; i++){
    	
	    var image = document.createElement('img');
	
	    /* FileReader 객체 생성 */
	    var reader = new FileReader();
	
	    /* reader 시작시 함수 구현 */
	    reader.onload = (function (aImg) {
	        console.log(1);
	
	        return function (e) {
	            console.log(3);
	            /* base64 인코딩 된 스트링 데이터 */
	            aImg.src = e.target.result
	        }
	    })(image)
	
	    if(get_file){
	        /* 
	            get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
	            onload 에 설정했던 return 으로 넘어간다.
	            이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
	        */
	        reader.readAsDataURL(get_file[i]);
	        console.log(2);
	    }
	    
	    $('#preview').append(image);
    }
})


</script>


	

</html>