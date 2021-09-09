<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/css/groupManagement.css"/>">

    <!-- 공통 헤더 부분.jsp파일이기 땜에 include사용 -->
<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
<%@ include file="/WEB-INF/views/frame/header.jsp"%>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
    
    
    <script>
        // 탈퇴 팝업창
        function popUp1() {
            document.getElementById('btn_exit_popUp1').style.display = "block";
        }
        function popUp2() {
            document.getElementById('btn_exit_popUp2').style.display = "block";
        }

        // 탈퇴 - 미완성
        function btn_exit1() {

        }
        function btn_exit2() {

        }

        // 팝업창 닫기
        function btn_close1() {
            document.getElementById('btn_exit_popUp1').style.display = "none";
        }
        function btn_close2() {
            document.getElementById('btn_exit_popUp2').style.display = "none";
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

            <div id="div1" class="div">
                <div id="div1_1" class="secondary_div1">
                    <br><br>
                    내 모임(게임명)1
                    <br>
                    <input type="button" value="게시물관리" class="button" onclick="location.href = 'groupEditor'">
                    <input type="button" value="탈퇴" class="button" onclick="popUp1()">
                </div>
                <div id="div1_2" class="secondary_div1">
                    <br><br>
                    내 모임(게임명)2
                    <br>
                    <input type="button" value="게시물관리" class="button">
                    <input type="button" value="탈퇴" class="button" onclick="popUp1()">
                </div>
                <div id="div1_3" class="secondary_div1">
                    <br><br>
                    내 모임(게임명)3
                    <br>
                    <input type="button" value="게시물관리" class="button">
                    <input type="button" value="탈퇴" class="button" onclick="popUp1()">
                </div>
            </div>

            <div id="div2" class="div">
                <div id="div2_1" class="secondary_div2">
                    <br>
                    참여한 모임(게임명)1
                    <br>
                    <br>
                    일시:
                    <br>
                    현재 인원:
                    <br>
                    <input type="button" value="탈퇴" class="button2" onclick="popUp2()">
                </div>
                <div id="div2_2" class="secondary_div2">
                    <br>
                    참여한 모임(게임명)2
                    <br>
                    <br>
                    일시:
                    <br>
                    현재 인원:
                    <br>
                    <input type="button" value="탈퇴" class="button2" onclick="popUp2()">
                </div>
                <div id="div2_3" class="secondary_div2">
                    <br>
                    참여한 모임(게임명)3
                    <br>
                    <br>
                    일시:
                    <br>
                    현재 인원:
                    <br>
                    <input type="button" value="탈퇴" class="button2" onclick="popUp2()">
                </div>
            </div>

        </div>
    </div>


    <!-- 탈퇴버튼 -->
    <div id="btn_exit_popUp1">
        <h1>정말 탈퇴하시겠습니까?</h1>
        <input type="button" value="예" id="btn_exit" class="btn_shape" onclick="btn_exit1()">
        <input type="button" value="아니오" id="btn_close" class="btn_shape" onclick="btn_close1()">
    </div>
    <div id="btn_exit_popUp2">
        <h1>정말 탈퇴하시겠습니까?</h1>
        <input type="button" value="예" id="btn_exit" class="btn_shape" onclick="btn_exit2()">
        <input type="button" value="아니오" id="btn_close" class="btn_shape" onclick="btn_close2()">
    </div>




</body>

</html>