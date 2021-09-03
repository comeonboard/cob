<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Come on, Board : Login</title>
    <link rel="icon" href="simple_logo.png">
    <c:if test="${param.result == 1}">
		<script>
			alert('회원가입을 축하합니다.');
		</script>
	</c:if>
</head>

<style>
    * {
        padding: 0;
        margin: 0;
    }

    a {
        color: #777;
        text-decoration: none;
    }
    fieldset {
        border: none;
        border-bottom: 1px solid #bbb;
    }
    legend {
        visibility: hidden;
    }
    .wrap {
        background-color :rgb(245, 246, 247);
    }
    .area_logo {
        display: block;
        width: 768px;
        margin: 0 auto;
        height: 44px;
        padding: 180px 0 60px;
    }

    .area_logo img {
        display: block;
        height: 60px;
        margin: 0 auto;
    }

    #container {
        display: block;
        width: 768px;
        margin: 0 auto;
        min-height: 700px;
        padding-bottom: 50px;
    }
    .login_form {
        width: 462px;
        margin: 0 auto;
    }
    .id_area, .pw_area {
        margin: 0 auto;
        width: 460px;
        height: 48px;
        margin-bottom: 10px;
    }

    .input_row {
        border: 1px solid #bbb;
        padding: 7px 35px 10px 11px;
        margin-bottom: 10px;
        width: 412px;
        height: 29px;
        background-color: #fff;
        font-size: 16px;
    }

    .input_row:focus {
        outline: rgb(52, 168, 83) 1px solid;
    }

    .login_btn, .kakao_btn{
        display: block;
        text-align: center;
        color: white;
        background-color: rgb(52, 168, 83);
        width: 460px;
        height: 48px;
        font-size: 16px;
        border: none;
        margin-bottom: 10px;
    }

    .kakao_btn {
        background-color: rgb(251, 188, 5);
        color: #000;
    }
    .area_chk {
        line-height: 25px;
        padding-bottom: 5px;
    }
    #login_chk {
        width: 15px;

    }
    #login_chk:hover, label:hover {
        cursor: pointer;
    }

    .nav_login {
        margin:0 auto;
        width: 460px;
    }

    .nav_login>ul{
        width: 393px;
        margin: 10px auto;
        list-style: none;
        overflow: hidden;
    }

    .nav_login>ul>li {
        text-align: center;
        width: 130px;
        float: left;
        border-right: 1px solid black;
        color: #777;
    }

    #last_li {
        border: none;
    }



</style>
<body>
    <div class="wrap">
        <header>
            <a href="<c:url value='/'/>">
                <div class="area_logo">
                    <img src="<c:url value='/images/logo_full.png'/>">
                </div>
            </a>
        </header>
        <div id="container">
        <form method="POST">
        	<fieldset class="login_form">
                <legend>로그인</legend>
                <div class="id_area">
                    <input type="text" name="memId" class="input_row" placeholder="아이디" value="${cookie.reid.value}">
                </div>
                <div class="pw_area">
                    <input type="password" name="memPassword" class="input_row" placeholder="비밀번호">
                </div>
                <div class="area_chk">
                    <input type="checkbox" id="login_chk" name="reid" value="on" ${cookie.reid ne null ? 'checked' : ''}>
                
                    <label for="login_chk">아이디 저장하기</label> 
                </div>
                <input type="submit" class="login_btn" value="로그인">
                <input type="button" class="kakao_btn" value="카카오 아이디로 로그인하기">
                <input type="hidden" name="redirectUri" value="${param.referer}">
            </fieldset>
        </form>
            <div class="nav_login">
                <ul>
                    <li><a href="findId.html">아이디 찾기</a></li>
                    <li><a href="findPw.html">비밀번호 찾기</a></li>
                    <li id="last_li" ><a href="<c:url value='/member/memberReg'/>">회원 가입</a></li>       
                </ul>
            </div>
        </div>
    </div>
</body>
</html>