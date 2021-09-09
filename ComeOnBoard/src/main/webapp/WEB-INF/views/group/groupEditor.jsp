<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>edit_group</title>
<link rel="stylesheet" href="<c:url value="/css/groupEditor.css"/>">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>


<!-- 공통 헤더 부분.jsp파일이기 땜에 include사용 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
<%@ include file="/WEB-INF/views/frame/header.jsp"%>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>

<script>
	function alert_edit() {
		alert("수정되었습니다.");
	}
</script>

</head>


<body>

	<!-- <header>
        <div class="MultiBar">
            <ul class="area_gnb">
                <li>시작페이지로</li>
                <li>다크모드</li>
                <li>마이페이지</li>
                <li>로그인</li>
            </ul>
        </div>

        <div class="container">
            <img src="cob_white.png" class="logo">
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
    </header>  -->


	<div id="wrap">
		<div class="main_div">

			<form action="">
				<div id="div1" class="div">
					<!-- 히스토리백 -->

					<!-- 제목 -->
					<div class="form-group">
						<label for="formGroupExampleInput">제목</label> <input type="text"
							class="form-control" id="formGroupExampleInput">
					</div>
					<!-- 내용 -->
					<div class="form-group">
						<label for="exampleFormControlTextarea1">내용</label>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							rows="3"></textarea>
					</div>
					<!-- 파일선택 -->
					<div class="form-group">
						<input type="file" class="form-control-file"
							id="exampleFormControlFile1">
					</div>
					<!-- 확인 -->
					<button type="submit" class="btn btn-primary" id="confirm"
						onclick="alert_edit()">확인</button>
				</div>
			</form>

			<form action="">
				<div id="div2" class="div">
					<h4>모임 참가 희망자</h4>
					<hr>
					<!-- 참가 희망자 리스트 -->
					<ul>
						<li>
							<div id="participant_list">
								<!-- 닉네임 들어갈 자리 -->
								닉네임닉네임닉네임닉네임1
								<button class="btn btn-danger btn-sm" type="submit" id="decline">거절</button>
								<button class="btn btn-success btn-sm" type="submit" id="accept">수락</button>
							</div>
						</li>
						<li>
							<div id="participant_list">
								닉네임닉네임닉네임닉네임2
								<button class="btn btn-danger btn-sm" type="submit" id="decline">거절</button>
								<button class="btn btn-success btn-sm" type="submit" id="accept">수락</button>
							</div>
						</li>
						<li>
							<div id="participant_list">
								닉네임닉네임닉네임닉네임3
								<button class="btn btn-danger btn-sm" type="submit" id="decline">거절</button>
								<button class="btn btn-success btn-sm" type="submit" id="accept">수락</button>
							</div>
						</li>
						<li>
							<div id="participant_list">
								닉네임닉네임닉네임닉네임4
								<button class="btn btn-danger btn-sm" type="submit" id="decline">거절</button>
								<button class="btn btn-success btn-sm" type="submit" id="accept">수락</button>
							</div>
						</li>
						<li>
							<div id="participant_list">
								닉네임닉네임닉네임닉네임5
								<button class="btn btn-danger btn-sm" type="submit" id="decline">거절</button>
								<button class="btn btn-success btn-sm" type="submit" id="accept">수락</button>
							</div>
						</li>
					</ul>
					<!-- 참가 희망자 리스트 끝! -->

					<!-- 숫자 목차 -->
					<div id="number">1/2/3/4/5</div>

					<!-- 이전, 다음 버튼 -->
					<div id="previous_or_next">
						<button type="button" class="btn btn-outline-dark">이전</button>
						<button type="button" class="btn btn-outline-dark">다음</button>
					</div>
				</div>
			</form>
		</div>


		<div class="main_div">
			<div id="div3" class="div">
				<!-- 참가 인원 카운트 시작 -->
				<h4 id="count_participant">참여 인원 0/10</h4>

				<hr>

				<div id="participant_list_accepted">
					<!-- 닉네임 들어갈 자리 -->
					닉네임닉네임닉네임닉네임1
					<button class="btn btn-danger btn-sm" type="submit" id="decline">추방</button>
				</div>
				<div id="participant_list_accepted">
					<!-- 닉네임 들어갈 자리 -->
					닉네임닉네임닉네임닉네임2
					<button class="btn btn-danger btn-sm" type="submit" id="decline">추방</button>
				</div>
				<div id="participant_list_accepted">
					<!-- 닉네임 들어갈 자리 -->
					닉네임닉네임닉네임닉네임3
					<button class="btn btn-danger btn-sm" type="submit" id="decline">추방</button>
				</div>
				<div id="participant_list_accepted">
					<!-- 닉네임 들어갈 자리 -->
					닉네임닉네임닉네임닉네임4
					<button class="btn btn-danger btn-sm" type="submit" id="decline">추방</button>
				</div>
				<div id="participant_list_accepted">
					<!-- 닉네임 들어갈 자리 -->
					닉네임닉네임닉네임닉네임5
					<button class="btn btn-danger btn-sm" type="submit" id="decline">추방</button>
				</div>
				<div id="participant_list_accepted">
					<!-- 닉네임 들어갈 자리 -->
					닉네임닉네임닉네임닉네임6
					<button class="btn btn-danger btn-sm" type="submit" id="decline">추방</button>
				</div>
				<div id="participant_list_accepted">
					<!-- 닉네임 들어갈 자리 -->
					닉네임닉네임닉네임닉네임7
					<button class="btn btn-danger btn-sm" type="submit" id="decline">추방</button>
				</div>
				<div id="participant_list_accepted">
					<!-- 닉네임 들어갈 자리 -->
					닉네임닉네임닉네임닉네임8
					<button class="btn btn-danger btn-sm" type="submit" id="decline">추방</button>
				</div>
				<div id="participant_list_accepted">
					<!-- 닉네임 들어갈 자리 -->
					닉네임닉네임닉네임닉네임9
					<button class="btn btn-danger btn-sm" type="submit" id="decline">추방</button>
				</div>
				<div id="participant_list_accepted">
					<!-- 닉네임 들어갈 자리 -->
					닉네임닉네임닉네임닉네임10
					<button class="btn btn-danger btn-sm" type="submit" id="decline">추방</button>
				</div>
				<div id="participant_list_accepted">
					<!-- 닉네임 들어갈 자리 -->
					닉네임닉네임닉네임닉네임11
					<button class="btn btn-danger btn-sm" type="submit" id="decline">추방</button>
				</div>


			</div>
		</div>
	</div>

</body>

</html>