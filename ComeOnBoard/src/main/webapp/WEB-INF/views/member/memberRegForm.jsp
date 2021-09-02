<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Come on, Board</title>
    <%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
	 <style>
	    * {
	        padding: 0;
	        margin: 0;
	    }
	    fieldset {
	        border: none;
	    }
	    legend {
	        visibility: hidden;
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
	    .form_create_id {
	        width: 462px;
	        margin: 0 auto;
	    }
	
	    .form_create_id h2 {
	        text-align: center;
	        margin-bottom: 20px;
	        color: #777;
	    }
	
	    .input_area {
	        margin: 0 auto;
	        width: 460px;
	        height: 70px;
	        margin-bottom: 10px;
	    }
	
	    .input_row {
	        border: 1px solid #bbb;
	        padding: 7px 35px 10px 11px;
	        width: 412px;
	        height: 29px;
	        background-color: #fff;
	        font-size: 16px;
	    }
	
	    .input_row:focus,
	    .input_num:focus,
	    .input_phoneNum:focus {
	        outline: rgb(52, 168, 83) 1px solid;
	    }
	
	    .btn_reg {
	        display: block;
	        margin: 0 auto;
	        color: white;
	        background-color: rgb(52, 168, 83);
	        width: 460px;
	        height: 48px;
	        font-size: 16px;
	        border: none;
	        margin-bottom: 10px;
	        border-radius: 10px;
	    }
	
	    #last_li {
	        border: none;
	    }
	
	    .input_num {
	        border: 1px solid #bbb;
	        padding: 7px 1px 10px 11px;
	        margin-right: 5px;
	        margin-bottom: 10px;
	        width: 134px;
	        height: 29px;
	        background-color: #fff;
	        font-size: 16px;
	    }
	
	    select {
	        width: 460px;
	        height: 48px;
	        background-color: #fff;
	        font-size: 16px;
	        padding-left: 8px;
	        color: #777;
	        border: 1px solid #bbb;
	    }
	
	    .input_phoneNum,
	    .input_address {
	        border: 1px solid #bbb;
	        padding: 7px 35px 10px 11px;
	        margin-bottom: 5px;
	        width: 270px;
	        height: 29px;
	        background-color: #fff;
	        font-size: 16px;
	    }
	
	    .input_phoneNum+button,
	    .input_address+button {
	        float: right;
	        display: block;
	        height: 48px;
	        width: 135px;
	        color: white;
	        border: none;
	        border-radius: 5px;
	        background-color: rgb(66, 133, 244);
	        font-size: 14px;
	    }
	    #phoneNum_input {
	        height: 120px;
	    }
	
	    #input_memberphoto {
	        display: none;
	    }
	
	    #btn_photo {
	        display: block;
	        margin: 0 auto;
	        background-color: rgb(251,188,5);
	        width: 460px;
	        height: 48px;
	        font-size: 16px;
	        border: none;
	        margin-bottom: 10px;
	        border-radius: 10px;
	        text-align: center;
	        line-height: 48px;
	       }
	
	    #btn_photo:hover {
	        cursor: pointer;
	    }
	
	    #address_area {
	        height: 200px;
	    }
	    span.required {
	    	color : rgb(234,67,53);
	    }
	    
	    .display_none {
	    	display : none;	
	    }
	    .color_red {
	    	color: rgb(234,67,53)
	    }
	    .msg {
	    	font-size:13px;
	    }
	    .color_blue {
	    	color: rgb(66,133,244);
	    }
	    
	    .color_grey {
	    	color: #777;
	    }
	    
	    #loadingimg {
	    	width: 30px;
	    }
	
	</style>
	<script>
		$(document).ready(function() {
			$('#memId').focusin(function() {
				$('#msg_id').addClass('color_grey');
				$('#msg_id').removeClass('color_blue');
				$('#msg_id').removeClass('color_red');
				$('#msg_id').html('영어 소문자 + 숫자, 8-16자리');
				$(this).val('');
				
			});
			$('#memId').focusout(function() {
				console.log($(this).val());
				// ajax 비동기 통신 > id를 서버로 보내고 사용 가능 유무의 응답 코드를 받는다 -> 화면에 메시지 출력
				$.ajax({
					url : '<c:url value="/member/idCheck"/>',
					type : 'post',
					data : {
						mid : $(this).val()
					},
					beforeSend : function() {
						$('#msg_id').addClass('display_none');
						$('#loadingimg').removeClass('display_none');
					},
					success : function(data) {
						// data : Y / N
						if (data == 'Y') {
							$('#msg_id').removeClass('display_none');
							$('#msg_id').html('사용가능');
							$('#msg_id').addClass('color_blue');
							$('#msg_id').removeClass('color_grey');
						} else if(data == 'R'){
							$('#msg_id').removeClass('display_none');
							$('#msg_id').html('8글자 이상 입력해주세요.');
							$('#msg_id').addClass('color_red');
							$('#msg_id').removeClass('color_grey');
						} else {
							$('#msg_id').removeClass('display_none');
							$('#msg_id').html('중복된 아이디입니다.');
							$('#msg_id').addClass('color_red');
							$('#msg_id').removeClass('color_grey');
						}
					},
					error : function(request, status, error) {
						alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
						console.log(request);
						console.log(status);
						console.log(error);
					},
					complete : function() {
						$('#loadingimg').addClass('display_none');
					}
				});
			});
		});
	</script>   
</head>

<body>

    <div class="area_logo">
        <a href="index.html">
        	<img src="/cob/images/logo_full.png">
        </a>
    </div>

    <div id="container">
        <form class="form_create_id" method="post" enctype="multipart/form-data">
            <fieldset>
                <legend>아이디, 비밀번호</legend>
                <h2> - 회원 가입 - </h2>
                <div class="input_area">
                    <input id="memId" name="memId" type="text" class="input_row" placeholder="아이디 "  pattern="^[a-z0-9]{8,16}$" required >
               		<span id="msg_id" class="msg color_grey">영어 소문자 + 숫자, 8-16자리</span>
                	<img id="loadingimg" class="display_none" alt="loading" src="<c:url value='/images/loading.gif'/>">
                </div>
                <div class="input_area">
                    <input type="password" class="input_row" placeholder="비밀번호" name="memPassword" pattern="^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$" required >
                	<span id="msg_pw" class="msg color_grey"> 영문 2개 이상, 숫자, 특수문자 각 1회 이상, 8자리 이상 입력 </span>
                </div>
                <div class="input_area">
                    <input type="password" class="input_row" placeholder="비밀번호 확인" name="rememPassword" required>
                    <span id="msg_repw" class="msg color_grey display_none"> 영어 소문자 + 숫자, 8-16자리 </span>
                </div>
            </fieldset>
            <fieldset>
                <legend>회원 정보</legend>
                <div class="input_area">
                    <p>이름<span class="required"> *</span></p>
                    <input type="text" class="input_row" placeholder="이름" name="memName">
                </div>
                
                <div class="input_area">
                    <p>닉네임<span class="required"> *</span></p>
                    <input type="text" class="input_row" placeholder="닉네임" name="nickName">
                </div>

                <div class="input_area">
                    <p>생년월일</p>
                    <input class="input_num" type="number" placeholder="년" name="year" size="4" min="1970"><input class="input_num" type="number" placeholder="월" name="month" min="1" max="12"><input class="input_num" type="number" placeholder="일" name="day" min="1" max="31">
                </div>

                <div class="input_area">
                    <p>성별</p>
                    <select name="memGender">
                        <option value="true">남자</option>
                        <option value="false">여자</option>
                    </select>
                </div>

                <div class="input_area">
                    <p>본인 확인 이메일<span class="required"> *</span></p>
                    <input type="text" class="input_row" placeholder="선택 입력" name="memEmail">
                </div>

                <div id="phoneNum_input" class="input_area">
                    <p>휴대전화<span class="required"> *</span></p>
                    <input type="text" class="input_phoneNum" placeholder="전화번호 입력" name="memTel">
                    <button>인증번호 받기</button>
                    <input type="text" class="input_row" placeholder="인증번호 입력">
                </div>

                <div class="input_area">
                    <p>프로필 사진</p>
                        <label id="btn_photo" for="input_memberphoto">파일 업로드</label>
                        <input type="file" id="input_memberphoto" name="memPhoto">

                </div>

                <div id="address_area" class="input_area">
                    <p>주소(선택 입력)</p>
                    <input type="text" class="input_address" placeholder="우편 번호">
                    <button>우편 번호</button>
                    <input type="text" class="input_row" placeholder="위 우편 번호를 입력해주세요.">
                    <input type="text" class="input_row" placeholder="나머지 주소" name="memAddress">
                </div>
                
                <input type="submit" class="btn_reg" value="가입하기">
            </fieldset>
        </form>   
    </div>
</body>
</html>