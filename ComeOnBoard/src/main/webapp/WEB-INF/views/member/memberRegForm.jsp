<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Come on, Board: 회원가입</title>
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
	        min-height: 70px;
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
	    

	    .msg {
	    	font-size:13px;
	    }
	   
	    
	    .loadingimg {
	    	width: 30px;
	    }
	    
	    #msg_nickName {
	    	display: block;
	    	height: 25px;
	    }
	
	</style>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		$(document).ready(function() {
			// 아이디 체크 초기화
			$('#memId').focusin(function() {
				$('#msg_id').addClass('color_grey');
				$('#msg_id').removeClass('color_blue');
				$('#msg_id').removeClass('color_red');
				$('#msg_id').html('영어 소문자 + 숫자, 8-16자리');
				$(this).val('');
			});
			
			// 아이디 체크 
			$('#memId').focusout(function() {
				// ajax 비동기 통신 > id를 서버로 보내고 사용 가능 유무의 응답 코드를 받는다 -> 화면에 메시지 출력
				$.ajax({
					url : '<c:url value="/member/idCheck"/>',
					type : 'post',
					data : {
						mid : $(this).val()
					},
					beforeSend : function() {
						$('#msg_id').addClass('display_none');
						$('#id_loading').removeClass('display_none');
					},
					success : function(data) {
						// data : Y(사용 가능) / R(정규식 맞지 않을때) / N(중복 아이디)
						if (data == 'Y') {
							$('#msg_id').removeClass('display_none');
							$('#msg_id').html('사용가능');
							$('#msg_id').addClass('color_blue');
							$('#msg_id').removeClass('color_grey');
						} else if(data == 'R'){
							$('#msg_id').removeClass('display_none');
							$('#msg_id').html('ID 형식과 일치하지 않습니다. 다시 입력해주세요.');
							$('#msg_id').addClass('color_red');
							$('#msg_id').removeClass('color_grey');
						} else {
							$('#msg_id').removeClass('display_none');
							$('#msg_id').html('중복된 아이디입니다. 다시 입력해주세요.');
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
						$('#id_loading').addClass('display_none');
					}
				});
			});
			
			// 비밀번호 체크 초기화
			$('#memPassword').focusin(function() {
				$('#msg_pw').addClass('color_grey');
				$('#msg_pw').removeClass('color_blue');
				$('#msg_pw').removeClass('color_red');
				$('#msg_pw').html(' 영문, 숫자, 특수문자 각 1회 이상, 8-16자리');
				$(this).val('');	
			});
			
			// 비밀번호 체크
			$('#memPassword').focusout(function(){
				var exptext = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/;
				var password = $('#memPassword').val();
				if(password.trim().length>0 && exptext.test(password)){
					$('#msg_pw').removeClass('display_none');
					$('#msg_pw').html('사용가능');
					$('#msg_pw').addClass('color_blue');
					$('#msg_pw').removeClass('color_grey');
				} else {
					$('#msg_pw').removeClass('display_none');
					$('#msg_pw').html('형식이 올바르지 않습니다. 다시 입력해주세요.');
					$('#msg_pw').addClass('color_red');
					$('#msg_pw').removeClass('color_grey');
				}
			});
			
			// 비밀번호 일치 초기화
			$('#memRePw').focusin(function() {
				$('#msg_repw').addClass('display_none');
				$('#msg_repw').removeClass('color_blue');
				$('#msg_repw').removeClass('color_red');
				$(this).val('');	
			});
			
			// 비밀번호 일치 체크
			$('#memRePw').focusout(function(){
				
				if ($('#memRePw').val() == $('#memPassword').val()) {
					$('#msg_repw').removeClass('display_none');
					$('#msg_repw').html('비밀번호가 일치합니다.');
					$('#msg_repw').addClass('color_blue');
					$('#msg_repw').removeClass('color_grey');
				} else {
					$('#msg_repw').removeClass('display_none');
					$('#msg_repw').html('비밀번호가 일치하지 않습니다.');
					$('#msg_repw').addClass('color_red');
					$('#msg_repw').removeClass('color_grey');
				}
				
			});
			
			// 닉네임 중복체크 초기화
			$('#nickName').focusin(function() {
				$('#msg_nickName').addClass('color_grey');
				$('#msg_nickName').removeClass('color_blue');
				$('#msg_nickName').removeClass('color_red');
				$('#msg_nickName').html('한글, 영어, 숫자 조합 2-8자리');
				$(this).val('');
			});
			
			// 닉네임 중복 체크 
			$('#nickName').focusout(function() {
				$.ajax({
					url : '<c:url value="/member/nickNameCheck"/>',
					type : 'post',
					data : {
						nickName : $(this).val()
					},
					beforeSend : function() {
						$('#msg_nickName').addClass('display_none');
						$('#nickName_loading').removeClass('display_none');
					},
					success : function(data) {
						// data : Y(사용 가능) / R(정규식 맞지 않을때) / N(중복 아이디)
						if (data == 'Y') {
							$('#msg_nickName').removeClass('display_none');
							$('#msg_nickName').html('사용가능');
							$('#msg_nickName').addClass('color_blue');
							$('#msg_nickName').removeClass('color_grey');
						} else if(data == 'R'){
							$('#msg_nickName').removeClass('display_none');
							$('#msg_nickName').html('닉네임 형식과 일치하지 않습니다. 다시 입력해주세요.');
							$('#msg_nickName').addClass('color_red');
							$('#msg_nickName').removeClass('color_grey');
						} else {
							$('#msg_nickName').removeClass('display_none');
							$('#msg_nickName').html('중복된 닉네임입니다. 다시 입력해주세요.');
							$('#msg_nickName').addClass('color_red');
							$('#msg_nickName').removeClass('color_grey');
						}
					},
					error : function(request, status, error) {
						alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
						console.log(request);
						console.log(status);
						console.log(error);
					},
					complete : function() {
						$('#nickName_loading').addClass('display_none');
					}
				});
			});
			// 우편번호 찾기 
			$('#btn_address').click(function(){
			  new daum.Postcode({
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			        	  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			        	
			    	    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			    	    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			    	    var addr = ''; // 주소 변수
			    	    var extraAddr = ''; // 참고항목 변수
			    	
			    	    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			    	    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			    	        addr = data.roadAddress;
			    	    } else { // 사용자가 지번 주소를 선택했을 경우(J)
			    	        addr = data.jibunAddress;
			    	    }
			    	
			    	    // 우편번호와 주소 정보를 해당 필드에 넣는다.
			    	    $('#postCode').val(data.zonecode);
			    	    $('#addr').val(addr);
			    	    // 커서를 상세주소 필드로 이동한다.
			    	    $('#extraAddr').focus();
			    	    
			        }
			    }).open();

				return false;
			});
			
			
		});
</script>  

</head>

<body>

    <div class="area_logo">
        <a href="<c:url value='/'/>">
        	<img src="/cob/images/logo_full.png">
        </a>
    </div>

    <div id="container">
 
        <form class="form_create_id" method="post" enctype="multipart/form-data">
            <fieldset>
                <legend>아이디, 비밀번호</legend>
                <h2> - 회원 가입 - </h2>
                <div class="input_area">
                    <input id="memId" name="memId" type="text" class="input_row" placeholder="아이디 " required>
               		<span id="msg_id" class="msg color_grey"> 영어 소문자 + 숫자, 8-16자리</span>
                	<img id="id_loading" class="loadingimg display_none" alt="loading" src="<c:url value='/images/loading.gif'/>">
                </div>
                <div class="input_area">
                    <input type="password" id="memPassword" name="memPassword" class="input_row" placeholder="비밀번호" required>
                	<span id="msg_pw" class="msg color_grey"> 영문, 숫자, 특수문자 조합, 8-12자리</span>
                </div>
                <div class="input_area">
                    <input type="password" id="memRePw" name="memRePw" class="input_row" placeholder="비밀번호 확인" required>
                    <span id="msg_repw" class="msg color_grey display_none"></span>
                </div>
            </fieldset>
            <fieldset>
                <legend>회원 정보</legend>
                <div class="input_area">
                    <p>이름<span class="required"> *</span></p>
                    <input type="text" class="input_row" placeholder="이름" name="memName" required>
                </div>
                
                <div class="input_area">
                    <p>닉네임<span class="required"> *</span></p>
                    <input type="text" id="nickName" name="nickName" class="input_row" placeholder="닉네임" required>
                    <span id="msg_nickName" class="msg color_grey"> 한글, 영어, 숫자 조합 2-8자리</span>
                	<img id="nickName_loading" class="loadingimg display_none" alt="loading" src="<c:url value='/images/loading.gif'/>">
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
                    <input type="text" class="input_row" placeholder="ex) cob@cob.com" name="memEmail" pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$" required>
                </div>

                <div id="phoneNum_input" class="input_area">
                    <p>휴대전화<span class="required"> *</span></p>
                    <input type="text" class="input_phoneNum" placeholder="전화번호 입력" name="memTel" pattern="^\d{3}-\d{3,4}-\d{4}$" required>
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
                    <input type="text" id="postCode" name="postCode" class="input_address" placeholder="우편 번호">
                    <button id="btn_address">우편 번호</button>
                    <input type="text" id="addr" name="addr" class="input_row" placeholder="주소" readonly>
                    <input type="text" id="extraAddr" name="extraAddr"class="input_row" placeholder="상세 주소">
                </div>
                
                <input type="submit" class="btn_reg" value="가입하기">
            </fieldset>
        </form>   
    </div>
</body>
</html>