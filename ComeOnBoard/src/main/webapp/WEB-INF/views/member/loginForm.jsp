<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Come on, Board : 로그인</title>
    <%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
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

    input[type=button]{
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

    #btn_kakao {
        background-color: rgb(251, 188, 5);
        color: #000;
    }
    .area_chk {
        line-height: 25px;
        padding-bottom: 5px;
    }
    #reid_chk {
        width: 15px;

    }
    #reid_chk:hover, label:hover {
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
<script>
	$(document).ready(function(){
		var redirectUri = sessionStorage.getItem("redirectUri");
		console.log(redirectUri);
		$('#btn_login').click(function(){
			var memId = $('#memId').val();
			var memPassword =$('#memPassword').val();
			var reUri = redirectUri;
			console.log(reUri);
			var reid = $('#reid_chk').is(":checked") ? 'on' : '';
			console.log(reid);
			if(memId.trim().length<1){
				$('#area_msg').removeClass('display_none');
				$('#area_msg').html('아이디를 입력해주세요.');
			} else if(memPassword.trim().length<1){
				$('#area_msg').removeClass('display_none');
				$('#area_msg').html('비밀번호를 입력해주세요.');
			} else{
				$.ajax({
					url: '<c:url value="/member/login"/>',
					type : 'post',
					data : {
						memId : memId,
						memPassword : memPassword,
						reid : reid
					},
					success : function(data) {
						if (data == "false") {
							$('#area_msg').removeClass('display_none');
							$('#area_msg').html('아이디, 비밀번호가 일치하지 않습니다. <br> 다시 입력해주세요.');
						} else {
							if(reUri.length<1){
								location.replace('<c:url value="/"/>');
							} else {
								location.replace(reUri);
							}
						
						}
					},
					error : function(request, status, error) {
						alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
						console.log(request);
						console.log(status);
						console.log(error);
					},
					complete : function() {
					}
				})
			}
		});		
	});
</script>

<body>
    <div class="wrap">
    <div class="area_logo">
        <a href="<c:url value='/'/>">
        	<img src="/cob/images/logo_full.png">
        </a>
    </div>
    <div id="container">
        <form method="POST" id="login_form">
        	<fieldset class="login_form">
                <legend>로그인</legend>
                <div class="id_area">
                    <input type="text" id="memId"name="memId" class="input_row" placeholder="아이디" value="${cookie.reid.value}">
                </div>
                <div class="pw_area">
                    <input type="password" id="memPassword" name="memPassword" class="input_row" placeholder="비밀번호">
                </div>
                <div id="area_msg" class="color_red display_none">
                </div>
                <div class="area_chk">
                    <input type="checkbox" id="reid_chk" name="reid" ${cookie.reid ne null ? 'checked' : ''}>
                
                    <label for="reid_chk">아이디 저장하기</label> 
                </div>	
    	        <input type="button" id="btn_login" value="로그인">
                <input type="button" id="btn_kakao" value="카카오 아이디로 로그인하기">
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