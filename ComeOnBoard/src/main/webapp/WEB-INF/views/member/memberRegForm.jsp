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
</head>
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
        line-height: 48px
       };

    #btn_photo:hover {
        cursor: pointer;
    }

    #address_area {
        height: 200px;
    }

</style>
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
                    <input type="text" class="input_row" placeholder="아이디" name="memId">
                </div>
                <div class="input_area">
                    <input type="password" class="input_row" placeholder="비밀번호" name="memPassword">
                </div>
                <div class="input_area">
                    <input type="password" class="input_row" placeholder="비밀번호 확인" name="rememPassword">
                </div>
            </fieldset>
            <fieldset>
                <legend>회원 정보</legend>
                <div class="input_area">
                    <p>이름</p>
                    <input type="text" class="input_row" placeholder="이름" name="memName">
                </div>
                
                <div class="input_area">
                    <p>닉네임</p>
                    <input type="text" class="input_row" placeholder="닉네임" name="nickName">
                </div>

                <div class="input_area">
                    <p>생년월일</p>
                    <input class="input_num" type="number" placeholder="년" name="year"><input class="input_num" type="number" placeholder="월" name="month"><input class="input_num" type="number" placeholder="일" name="day">
                </div>

                <div class="input_area">
                    <p>성별</p>
                    <select name="memGender">
                        <option>성별</option>
                        <option value="true">남자</option>
                        <option value="false">여자</option>
                    </select>
                </div>

                <div class="input_area">
                    <p>본인 확인 이메일(선택 입력)</p>
                    <input type="text" class="input_row" placeholder="선택 입력" name="memEmail">
                </div>

                <div id="phoneNum_input" class="input_area">
                    <p>휴대전화</p>
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