<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty loginChk}">
<script>
function makeRedirect(){
	var redirectUri = window.location.href;
	sessionStorage.setItem("redirectUri", redirectUri);
	location.href= '<c:url value="/member/login"/>' ;
}
</script>
<script>
	alert('로그인 후 사용이 가능합니다.');

	makeRedirect();
</script>

</c:if>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here: my page</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>

<script>
	$(document).ready(function() {

		// 아이디 탈퇴
		$('#btn_deletMember').on('click', function(){
			var memIdx = ${loginInfo.memIdx}
			var chk_delete = confirm('정말 삭제하시겠습니까?');
			if(chk_delete){
				$.ajax({
					url : '<c:url value="/member/delete"/>',
					type : 'post',
					data : {
						memIdx : memIdx
					},
					success : function(data) {
						if (data > 0) {
							alert('정상적으로 탈퇴 처리 되었습니다.');
							location.href ='<c:url value="/"/>';
						}
					},
					error : function(request, status, error) {
						alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
						console.log(request);
						console.log(status);
						console.log(error);
					}
				});				
			}
		});
		
		$('#btn_update_profile').click(function(){
			$('#update_my_info').removeClass('display_none');
		});
		
		$('.btn_close').click(function(){
			$(this).parent.addClass('display_none');
		});
	});
</script>
</head>
<style>
	.btn_close {
		backgroun-color: red;
	}
    @keyframes gradient {
        0% {
        background-position: 0% 50%;
        }
        50% {
        background-position: 100% 50%;
        }
        100% {
        background-position: 0% 50%;
        }
    }

    * {
        margin: 0;
        padding: 0;
    }

    a {
        text-decoration: none;
        color: black;
    }

    .MultiBar a {
        color: white;
    }
    body {
        background-color :rgb(245, 246, 247);
    }
    ul {
        list-style: none;
    }
    header {
        position: relative;
        z-index: 20;
        min-width: 980px;
        width: 100%;
        height: 140px;
        background-color: rgb(66, 133, 244);
        text-align: center;
    }
    .MultiBar {
        display: inline-block;
        height: 30px;
        width: 100%;
        max-width: 1280px;
        padding: 12px 0px 5px;
    } 

    .area_gnb {
        font-size: 12px;
        width: 500px;
        height: 30px;
        float: right;
        color: white;
    }

    .area_gnb>li {
        float: right;
        width: 75px;
    }

    .container {
        display: inline-block;
        height: 93px;
        width: 100%;
        max-width: 1280px;
        position: relative;
    }

    .logo {
        position: absolute;
        left: 50%;
        width: 180px;
        margin-left: -90px;
    }


    .main_naviwrap {
        display: block;
        margin: 0 auto;
        width: 100%;
        max-width: 1280px;
        height: 80px;
        margin-top: -98px;
        padding-bottom: 10px;
    }
    .main_nav {
        padding-top: 45px;
    }
    .main_nav>.left_ul {
        float: left;
        overflow: hidden;
    }
    .main_nav>.right_ul {
        float: right;
        overflow: hidden;
    }

    .main_nav>ul>li {
        color: white;
        width: 85px;
        float: left;
    }

    .content {
        display: block;
        margin: 0 auto;
        width: 100%;
        max-width: 1280px;
    }

    footer {
        width: 100%;
        height: 100px;
        background-color: grey;
    }

    .content_wrap {
        width: 100%;
        height: 100%;
        overflow:hidden;
    }

    #menu_wrap {
        margin-top: 50px;
    }
    .content_menu {
        display: inline-block;
        width: 880px;
        height: 650px;
        overflow: hidden;
    }

    .content_menu>ul>li {
        display: block;
        float: left;
        width: 50%;
        height: 320px;
    }

    .content_menu a {
        position: relative;
        width: 420px;
        height: 300px;
        display: block;
        margin: 0 0 20px 20px;
        text-align: center;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0px 8px 20px -12px rgb(0 0 0 / 50%);
        
    }

    .content_menu img{
        margin-top: 80px;
        margin-bottom: 30px;
        width: 100px;
    }

    .content_menu a:hover{
        background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
        background-size: 400% 400%;
        color: white;
        animation: gradient 2s ease infinite;
    }

    .menu_wrap {
        margin: 0 auto;
        height: 100%;
        width: 1000px;
        padding: 50px;
    }

    .menu_wrap ul {
        height: 1360px;
    }

    .menu_wrap li {
        width: 500px;
        height: 350px;
        float: left;
    }
    .mypage_menu {
        position: relative;
        width: 420px;
        height: 270px;
        display: block;
        margin: 0 0 20px 20px;
        text-align: center;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0px 8px 20px -12px rgb(0 0 0 / 50%);
        padding: 20px;        
    }

    .mypage_menu h2 {
        font-size: 20px;
        margin-bottom: 30px;
    }

    #profile_frame {
        margin-left: 20px;
        width: 120px;
        height: 120px;
        border-radius: 50%;
        overflow:hidden;
        display: block;
        float: left;
    }

    #memberphoto {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .member_profile {
        float:right;
        display: block;
        width : 250px;
        height: 120px;
        text-align: left;
    }

    .member_profile td {
        width: 80px;
    }

    .area_update_profile {
        float: right;
        margin-top: 10px;
        margin-right: 15px;
      
    }

    button {
        width: 90px;
        height: 40px;
        border: none;
        background-color: rgb(66, 133, 244);
        border-radius: 10%;
        color: white;
    }

    .message_table {
        margin-left: 10px;
    }

    .message_table td {
        text-align: left;
        width: 100px;
    }

    .message_text {
        width: 300px !important;
    } 

    .area_select_menu {
        margin: 0 20px;
        float: left;
        width: 160px;
        height: 160px;
        border-radius: 10%;
        line-height: 160px;
        border: 1px solid #ddd;
        border-radius: 10px;
        box-shadow: 0px 8px 20px -12px rgb(0 0 0 / 50%);
    }

    .area_select_menu:hover{
        background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
        background-size: 400% 400%;
        color: white;
        animation: gradient 2s ease infinite;       
    }
    
    #reserve_cafe {
        text-align: left;
    }

    #cafeName {
        width: 170px;
    }

    #cafeLoc {
        width: 70px;
    }
    
    #cafeStartTime {
        width: 100px;
    }

    #reserve_cafe button {
        width: 80px;
        height: 30px;
    }

    #friends {
        text-align: left;
    }
    #friend_nickname {
        width: 250px;
    }

    #friend_photo {
        width: 60px;
    }

    #friend_profile_frame {
        width: 45px;
        height: 45px;
        border-radius: 70%;
        overflow:hidden;
        display: block;
        float: left;      
    }

    #friends button{
        width: 90px;
        height: 40px;
    }

    #extra_view {
        margin-top: 3px;
        float: right;
        background-color: rgb(251,188,5);
        color: black;
    }

    .area_friend {
        display: none;
        position: absolute;
        width: 300px;
        height: 400px;
        background-color: rgb(245, 246, 247);
        border-radius: 10px;
    }

    .area_friend button {
        margin-top: 10px;
    }

    .col1 {
        color: rgb(66, 133, 244);
        width: 100px;
        height: 30px;
        line-height: 30px;
        background-color: white;
        border-radius: 5px;
        border:rgb(66, 133, 244) 1px solid;
    }

    .col2 {
        width: 160px;
        height: 30px;
    }

    #friend_info_profile_frame {
        margin: 0 auto;
        width: 100px;
        height: 100px;
        border-radius: 70%;
        overflow:hidden;
        display: block;      
    }

    #update_my_info {
        width: 800px;
        height: auto;
        position: absolute;
        border-radius: 10px;
        background-color: #eee;
        z-index: 50;
        padding-top: 50px;
        padding-bottom: 50px;
    }

    .display_none {
        display: none;
    }
    
    #update_profile:hover {
        cursor: pointer;
    }

    .block {
        height: auto;
        display: block;
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

    #input_profile {
        display: none;
    }

    #profile_button {
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
        line-height: 48px
       };

    #profile_button:hover {
        cursor: pointer;
    }

    #address_area {
        height: 200px;
    }

    .form_update_profile {
        margin: 0 auto;
        text-align: left;
        position: relative;
        display: block;
        width: 400px;
        height: auto;
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
        margin-bottom: 10px;
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
</style>
<body>
	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
   <div class="content">
        <div class="menu_wrap">
                <ul>
                    <li>
                        <div class="mypage_menu">
                            <h2>내 정보</h2>
                            <div id="profile_frame">
                                <img id="memberphoto" src="<c:url value='/uploadfile/member/'/>${loginInfo.memPhoto}">
                            </div>
                            <div class="member_profile">
                                <table>
                                    <tr>
                                        <td>별 명</td>
                                        <td>${loginInfo.nickName}</td>
                                    </tr>
                                    <tr> 
                                        <td>성 별</td>
                                        <td>${loginInfo.memGender}</td>              
                                    </tr>
                                    <tr>
                                        <td>생년월일</td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${loginInfo.memBirth}"/></td>
                                    </tr>
                                    <tr> 
                                        <td>e-mail</td>
                                        <td>${loginInfo.memEmail}</td>                      
                                    </tr>
                                    <tr> 
                                        <td>선호 지역</td>
                                        <td>서울 도봉구</td>                   
                                    </tr>
                                </table>
                            </div>
                            <div class="area_update_profile">
                                <button id="btn_update_profile">정보 수정</button>
                                <button id="btn_deletMember">탈퇴</button>
                            </div>
                            <div id="update_my_info" class="display_none">
                                    <form class="form_update_profile">
                                        <h2>내 정보 수정</h2>
                                        <div class="input_area">
                                            <input type="password" class="input_row" placeholder="비밀번호">
                                        </div>
                                        <div class="input_area">
                                            <input type="password" class="input_row" placeholder="비밀번호 확인">
                                        </div>
                                        <div class="input_area">
                                            <p>이름</p>
                                            <input type="text" class="input_row" value="${loginInfo.memName}">
                                        </div>
                        
                                        <div class="input_area">
                                            <p>생년월일</p>
                                            <input class="input_num" type="number" placeholder="년"><input class="input_num" type="number" placeholder="월"><input class="input_num" type="number" placeholder="일">
                                        </div>
                        
                                        <div class="input_area">
                                            <p>성별</p>
                                            <select>
                                                <option>남자</option>
                                                <option>여자</option>
                                                <option>선택안함</option>
                                            </select>
                                        </div>
                        
                                        <div class="input_area">
                                            <p>본인 확인 이메일(선택 입력)</p>
                                            <input type="text" class="input_row" value="${loginInfo.memEmail}">
                                        </div>
                        
                                        <div id="phoneNum_input" class="input_area">
                                            <p>휴대전화</p>
                                            <input type="text" class="input_phoneNum" value="${loginInfo.memTel}">
                                            <button>인증번호 받기</button>
                                            <input type="text" class="input_row" placeholder="인증번호 입력">
                                        </div>
                        
                                        <div class="input_area">
                                            <p>프로필 사진</p>
                                                <label id="profile_button" for="input_profile">파일 업로드</label>
                                                <input type="file" id="input_profile">
                        
                                        </div>
                        
                                        <div id="address_area" class="input_area">
                                            <p>주소(선택 입력)</p>
                                            <input type="text" class="input_address" placeholder="우편 번호">
                                            <button>우편 번호</button>
                                            <input type="text" class="input_row" placeholder="위 우편 번호를 입력해주세요.">
                                            <input type="text" class="input_row" placeholder="나머지 주소">
                                        </div>
                                    </form>
                                    <button>수정하기</button>
                                    <button class="btn_close">창닫기</button>
                            </div>

                        </div>
                    </li>
                    <li>
                        <div class="mypage_menu">
                            <h2>쪽지함</h2>
                            <table class="message_table">
                                <tr>
                                    <td>친구1</td>
                                    <td class="message_text">쪽지내용1</td>
                                    <td>21.09.28</td>
                                </tr>
                                <tr>
                                    <td>친구2</td>
                                    <td class="message_text">쪽지내용2</td>
                                    <td>21.09.28</td>
                                </tr>
                                <tr>
                                    <td>친구3</td>
                                    <td class="message_text">쪽지내용3</td>
                                    <td>21.09.28</td>
                                </tr>
                                <tr>
                                    <td>친구4</td>
                                    <td class="message_text">쪽지내용4</td>
                                    <td>21.09.28</td>
                                </tr>
                                <tr>
                                    <td>친구5</td>
                                    <td class="message_text">쪽지내용5</td>
                                    <td>21.09.28</td>
                                </tr>
                                <tr>
                                    <td>친구6</td>
                                    <td class="message_text">쪽지내용6</td>
                                    <td>21.09.28</td>
                                </tr>

                            </table>
                            <button id="extra_view">더 보기</button>
                        </div>
                    </li>
                    <li>
                        <div class="mypage_menu">
                            <h2>모임 관리</h2>
                            <a id="make_group" href="#" class="area_select_menu"><div>내가 만든 모임</div></a>
                            <a id="enroll_group" href="#" class="area_select_menu"><div>내가 가입한 모임</div></a>
                        </div>
                    </li>
                    <li>
                        <div class="mypage_menu">
                            <h2>내 글 관리</h2>
                                <a id="my_post" href="#" class="area_select_menu"><div>내가 쓴 글</div></a>
                                <a id="my_comment" href="#" class="area_select_menu"><div>내 댓글</div></a>
                        </div>
                    </li>
                    <li>
                        <div class="mypage_menu">
                            <h2>예약 관리</h2>
                            <table id="reserve_cafe">
                                <tr>
                                    <th id="cafeName">카페명</th>
                                    <th id="cafeLoc">지역</th>
                                    <th id="cafeStartTime">예약일</th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <td id="cafeName">컴온보드카페</td>
                                    <td id="cafeLoc">마포구</td>
                                    <td id="cafeStartTime">21.09.01</td>
                                    <td><button class="confirm_res">예약 취소</button></td>
                                </tr>
                                <tr>
                                    <td id="cafeName">컴온보드카페</td>
                                    <td id="cafeLoc">마포구</td>
                                    <td id="cafeStartTime">21.09.01</td>
                                    <td><button class="confirm_res">예약 취소</button></td>
                                </tr>
                                <tr>
                                    <td id="cafeName">컴온보드카페</td>
                                    <td id="cafeLoc">마포구</td>
                                    <td id="cafeStartTime">21.09.01</td>
                                    <td><button class="confirm_res">예약 취소</button></td>
                                </tr>
                                <tr>
                                    <td id="cafeName">컴온보드카페</td>
                                    <td id="cafeLoc">마포구</td>
                                    <td id="cafeStartTime">21.09.01</td>
                                    <td><button class="confirm_res">예약 취소</button></td>
                                </tr>
                                <tr>
                                    <td id="cafeName">컴온보드카페</td>
                                    <td id="cafeLoc">마포구</td>
                                    <td id="cafeStartTime">21.09.01</td>
                                    <td><button class="confirm_res">예약 취소</button></td>
                                </tr>
                            </table>
                        </div>
                    </li>
                    <li>
                        <div class="mypage_menu">
                            <div id="friend1" class="area_friend">
                                <div id="friend_info_profile_frame">
                                </div>
                                <table>
                                    <tr>
                                        <td class="col1">닉네임</td>
                                        <td class="col2">미니언즈_밥</td>
                                    </tr>
                                    <tr>
                                        <td class="col1">생 일</td>
                                        <td class="col2">01.01.01</td>
                                    </tr>
                                    <tr>
                                        <td class="col1">성 별</td>
                                        <td class="col2">남</td>
                                    </tr>
                                    <tr>
                                        <td class="col1">포인트</td>
                                        <td class="col2">7200</td>
                                    </tr>
                                    <tr>
                                        <td class="col1">선호게임</td>
                                        <td class="col2">라스베가스</td>
                                    </tr>
                    
                                </table>
                                <button>쪽지보내기</button>
                                <button class="friend_close">창닫기</button>
                            </div>
                            <div id="friend2" class="area_friend">
                                <div id="friend_info_profile_frame">
                                </div>
                                <table>
                                    <tr>
                                        <td class="col1">닉네임</td>
                                        <td class="col2">미니언즈_케빈</td>
                                    </tr>
                                    <tr>
                                        <td class="col1">생 일</td>
                                        <td class="col2">01.01.01</td>
                                    </tr>
                                    <tr>
                                        <td class="col1">성 별</td>
                                        <td class="col2">남</td>
                                    </tr>
                                    <tr>
                                        <td class="col1">포인트</td>
                                        <td class="col2">7200</td>
                                    </tr>
                                    <tr>
                                        <td class="col1">선호게임</td>
                                        <td class="col2">라스베가스</td>
                                    </tr>
                    
                                </table>
                                <button>쪽지보내기</button>
                                <button class="friend_close">창닫기</button>
                            </div>
                            <div id="friend3" class="area_friend">
                                <div id="friend_info_profile_frame">
                                </div>
                                <table>
                                    <tr>
                                        <td class="col1">닉네임</td>
                                        <td class="col2">미니언즈_스튜어트</td>
                                    </tr>
                                    <tr>
                                        <td class="col1">생 일</td>
                                        <td class="col2">01.01.01</td>
                                    </tr>
                                    <tr>
                                        <td class="col1">성 별</td>
                                        <td class="col2">남</td>
                                    </tr>
                                    <tr>
                                        <td class="col1">포인트</td>
                                        <td class="col2">7200</td>
                                    </tr>
                                    <tr>
                                        <td class="col1">선호게임</td>
                                        <td class="col2">라스베가스</td>
                                    </tr>
                    
                                </table>
                                <button>쪽지보내기</button>
                                <button class="friend_close">창닫기</button>
                            </div>
                            
                            <h2>친구 관리</h2>
 
                            <table id="friends">
                                <tr>
                                    <td id="friend_photo">
                                        <div id="friend_profile_frame">
                                        </div>
                                    </td>
                                    <td id="friend_nickname">미니언즈_밥</td>
                                    <td><button class="btn_read_friend" data-friend="friend1">정보 보기</button></td>
                                </tr>
                                <tr>
                                    <td id="friend_photo">
                                        <div id="friend_profile_frame">
                                            <img id="memberphoto" src="kevin.jpg">
                                        </div>
                                    </td>
                                    <td id="friend_nickname">미니언즈_케빈</td>
                                    <td><button id="freind_button" class="btn_read_friend" data-friend="friend2">정보 보기</button></td>
                                </tr>
                                <tr>
                                    <td id="friend_photo">
                                        <div id="friend_profile_frame">
                                            <img id="memberphoto" src="stewart.jpg">
                                        </div>
                                    </td>
                                    <td id="friend_nickname" >미니언즈_스튜어트</td>
                                    <td><button data-friend="friend3" class="btn_read_friend">정보 보기</button></td>
                                </tr>
                            </table>
                            <button id="extra_view">더 보기</button>
                        </div>
                    </li>
                    <li>
                        <div class="mypage_menu">
                            <h2>카페 관리</h2>
                            <a id="make_cafe" href="#" class="area_select_menu"><div>카페 등록</div></a>
                            <a id="update_cafe" href="#" class="area_select_menu"><div>카페 관리</div></a>
                        </div>
                    </li>
                </ul>
            
        </div>

    </div>

    <footer>

    </footer>
</body>
</html>