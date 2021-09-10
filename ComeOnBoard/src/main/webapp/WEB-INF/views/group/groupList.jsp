<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Come on, Board </title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<!-- taglib 코어태그 선언 후 href 경로 설정(경로의 유연성) -->
<link rel="stylesheet" href="<c:url value="/css/groupList.css"/>">

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>







<script>
	$(document).ready(function() {

		$("#aside1").click(function() {
			location.href = 'groupManagement';
		})

		$('#aside2').click(function() {
			location.href = 'createGroup';
		})

	});
</script>





</head>


<body>
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>


	<div id="wrap">
		<div class="main_div">
			<section>
				<br> <br> <br> <br>
				<div class="container">
					<!-- 탭 메뉴 내용 시작 -->
					<div id="tab-1" class="tab-content current">
						<!-- <h1>탭 메뉴 1 내용입니다.</h1> -->

						<p class="tab-p">
						<table class="table">


							<!-- 게시글 리스트 반복문 EL로 표현하기 (수정해야함)-->
							<!--  <c:forEach items="${memberList}" var="member">
								<tr>
									<td>${member.idx}</td>
									<td>${member.memberid}</td>
									<td>${member.password}</td>
									<td>${member.membername}</td>
									<td>${member.memberphoto}</td>
									<td><fmt:formatDate value="${member.date}" type="both" /></td>
									<td><a class="btn btn-primary"
										href="edit?idx=${member.idx}">수정</a> <a class="btn btn-danger"
										href="delete?idx=${member.idx}">삭제</a></td>
								</tr>
							</c:forEach>
						</table> -->



							<table>
								<colgroup>
									<col style="width: 100px">
									<col style="width: 400px">
									<col style="width: 140px">
									<col style="width: 120px">
									<col style="width: 120px">
									<col style="width: 120px">
								</colgroup>
								<thead>
									<tr>
										<th>지역</th>
										<th>제목</th>
										<th>작성자</th>
										<th>진행일</th>
										<th>마감일</th>
										<th>작성날짜</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td id="category">[서울]</td>
										<td><a href="groupContents.html">제목입니다</a></td>
										<td id="nickname">작성자</td>
										<td id="startDate">2021-08-21</td>
										<td id="endDate">2021-08-24</td>
										<td id="regdate">2021-08-15</td>
									</tr>
									<tr>
										<td id="category">[서울]</td>
										<td>제목입니다</td>
										<td id="nickname">작성자</td>
										<td id="startDate">2021-08-21</td>
										<td id="endDate">2021-08-24</td>
										<td id="regdate">2021-08-15</td>
									</tr>
									<tr>
										<td id="category">[서울]</td>
										<td>제목입니다</td>
										<td id="nickname">작성자</td>
										<td id="startDate">2021-08-21</td>
										<td id="endDate">2021-08-24</td>
										<td id="regdate">2021-08-15</td>
									</tr>
									<tr>
										<td id="category">[서울]</td>
										<td>제목입니다</td>
										<td id="nickname">작성자</td>
										<td id="startDate">2021-08-21</td>
										<td id="endDate">2021-08-24</td>
										<td id="regdate">2021-08-15</td>
									</tr>
									<tr>
										<td id="category">[서울]</td>
										<td>제목입니다</td>
										<td id="nickname">작성자</td>
										<td id="startDate">2021-08-21</td>
										<td id="endDate">2021-08-24</td>
										<td id="regdate">2021-08-15</td>
									</tr>
									<tr>
										<td id="category">[서울]</td>
										<td>제목입니다</td>
										<td id="nickname">작성자</td>
										<td id="startDate">2021-08-21</td>
										<td id="endDate">2021-08-24</td>
										<td id="regdate">2021-08-15</td>
									</tr>
									<tr>
										<td id="category">[서울]</td>
										<td>제목입니다</td>
										<td id="nickname">작성자</td>
										<td id="startDate">2021-08-21</td>
										<td id="endDate">2021-08-24</td>
										<td id="regdate">2021-08-15</td>
									</tr>
									<tr>
										<td id="category">[서울]</td>
										<td>제목입니다</td>
										<td id="nickname">작성자</td>
										<td id="startDate">2021-08-21</td>
										<td id="endDate">2021-08-24</td>
										<td id="regdate">2021-08-15</td>
									</tr>
									<tr>
										<td id="category">[서울]</td>
										<td>제목입니다</td>
										<td id="nickname">작성자</td>
										<td id="startDate">2021-08-21</td>
										<td id="endDate">2021-08-24</td>
										<td id="regdate">2021-08-15</td>
									</tr>
									<tr>
										<td id="category">[서울]</td>
										<td>제목입니다</td>
										<td id="nickname">작성자</td>
										<td id="startDate">2021-08-21</td>
										<td id="endDate">2021-08-24</td>
										<td id="regdate">2021-08-15</td>
									</tr>

								</tbody>
							</table>

							<div id="paging">1/2/3/4/5</div>

							<form id="search_var" method="POST">
								<select name="select_category" id="form_select_category">
									<option value="">종로구</option>
									<option value="">중구</option>
									<option value="">용산구</option>
									<option value="">성동구</option>
									<option value="">광진구</option>
									<option value="">동대문구</option>
									<option value="">중랑구</option>
									<option value="">성북구</option>
									<option value="">강북구</option>
									<option value="">도봉구</option>
									<option value="">노원구</option>
									<option value="">은평구</option>
									<option value="">서대문구</option>
									<option value="">마포구</option>
									<option value="">양천구</option>
									<option value="">강서구</option>
									<option value="">구로구</option>
									<option value="">금천구</option>
									<option value="">영등포구</option>
									<option value="">동작구</option>
									<option value="">관악구</option>
									<option value="">서초구</option>
									<option value="">강남구</option>
									<option value="">송파구</option>
									<option value="">강동구</option>
								</select> <input type="text" name="search" id="form_search">
								<button type="submit" name="click" id="form_button">검색</button>
							</form>

							</p>
							</div>
							<!-- 탭 메뉴 내용 끝 -->
							</div>
							</section>




							<aside id="aside1">
								<div class="no_overflow">
									<button class="button200px">
										<img src="<c:url value='/images/management_group.png'/>" width="200px"
											height="180px">
									</button>
									<br> <br> 모임 관리
								</div>
							</aside>

							<aside id="aside2">
								<div class="no_overflow">
									<button class="button200px">
										<img src="<c:url value='/images/people.png'/>" width="200px" height="180px">
									</button>
									<br> <br> 모임 등록
								</div>
							</aside>

							</div>
							</div>
		<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
</body>

</html>