<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
<script>
function makeRedirect(){
	var redirectUri = window.location.href;
	sessionStorage.setItem("redirectUri", redirectUri);
	location.href= '<c:url value="/member/login"/>' ;
}
</script>
        <div class="nav_top">
            <ul class="area_gnb">
                <li>시작페이지로</li>
                <li>다크모드</li>
                <li><a href="<c:url value='/member/mypage'/>">마이페이지</a></li>
                <c:if test="${!loginChk}">
       	            <li><a href="#" onclick="makeRedirect()">로그인</a></li>
                </c:if>
				<c:if test="${loginChk}">
					<li><a href="<c:url value='/member/logout'/>">로그아웃</a></li>
				</c:if>
            </ul>
        </div>

        <div class="container">
            <a href="<c:url value='/'/>"><img src="<c:url value='/images/logo_white.png'/>" class="logo"></a>
        </div>


        <div class="nav_main_wrap">
            <div class="nav_main">
                <ul class="right_ul font_white">
                    <li>모임</li>
                    <li>게시판</li>
                    <li>카페</li>
                    <li>게임</li>    
                </ul>
            </div>
        </div>
    </header>