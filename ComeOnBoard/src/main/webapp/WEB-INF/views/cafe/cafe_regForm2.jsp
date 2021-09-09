<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>  <!-- 문서의 첫행 표시, 웹 브라우저에 HTML5 임을 알림 -->
<html lang="ko"> <!-- 시작, lang 속성 입력(생략가능)-->
<head> <!-- 페이지의 필요한 추가 속성 작성 -->
    <meta charset="UTF-8"> <!-- 출력 포맷 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 모바일 페이지 속성 -->
    <title>Cafe info</title> <!-- 문서 제목 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- 카드 선택시 하단 줄 CSS -->
	<link href="<c:url value="/css/hover.css"/>" rel="stylesheet" media="all">

<style>
         * {
        margin: 0;
        padding: 0;
        }
        .header {
            position: relative;
            z-index: 20;
            min-width: 980px;
            width: 100%;
            height: 140px;
            background-color: rgb(66, 133, 244);
            text-align: center;
        }
        ul {
        list-style: none;
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


        .cafe_wrap{
            max-width: 950px;
            margin: 0 auto;
            padding: 20px 0;
        }

        .first_hr{
            border: none;
            height: 1px;
            background-color: black;
        }
        .info_menu{
            margin-top: 50px;
        }




        /* 파일 미리보기 */
        ul.cvf_uploaded_files {
            list-style-type: none; margin: 20px 0 0 0; padding: 0;
        }
        ul.cvf_uploaded_files li {
            background-color: #fff; float: left; margin: 2px; width: 200px; height: 100px; line-height: 100px; position: relative;
        }
        ul.cvf_uploaded_files li img.img-thumb {
            width: 200px; height: 100px; border-radius: 5px;
        }
        ul.cvf_uploaded_files .ui-selected {
            background: red;
        }
        ul.cvf_uploaded_files .highlight {
            border: 1px dashed #000; width: 150px; background-color: #ccc; border-radius: 5px;
        }
        ul.cvf_uploaded_files .delete-btn {
            width: 24px; height: 24px; border: 0; position: absolute; top: 2.5px; right: 0px; padding: 0;
        }
        .bg-success {
            padding: 7px;
        }
        .thumnail {
            height: 150px;
            overflow: hidden;
            overflow-y: scroll;
        }


     </style>

    <!-- 파일 미리보기 -->

    <script>
        $(document).ready(function() {        
           
            var storedFiles = [];      
            //$('.cvf_order').hide();
           
            // Apply sort function 
            function cvf_reload_order() {
                var order = $('.cvf_uploaded_files').sortable('toArray', {attribute: 'item'});
                $('.cvf_hidden_field').val(order);
            }
           
            function cvf_add_order() {
                $('.cvf_uploaded_files li').each(function(n) {
                    $(this).attr('item', n);
                });
                console.log('test');
            }
           
           
            $(function() {
                $('.cvf_uploaded_files').sortable({
                    cursor: 'move',
                    placeholder: 'highlight',
                    start: function (event, ui) {
                        ui.item.toggleClass('highlight');
                    },
                    stop: function (event, ui) {
                        ui.item.toggleClass('highlight');
                    },
                    update: function () {
                        //cvf_reload_order();
                    },
                    create:function(){
                        var list = this;
                        resize = function(){
                            $(list).css('height','auto');
                            $(list).height($(list).height());
                        };
                        $(list).height($(list).height());
                        $(list).find('img').load(resize).error(resize);
                    }
                });
                $('.cvf_uploaded_files').disableSelection();
            });
                   
            $('body').on('change', '.user_picked_files', function() {
               
                var files = this.files;
                var i = 0;
                           
                for (i = 0; i < files.length; i++) {
                    var readImg = new FileReader();
                    var file = files[i];
                   
                    if (file.type.match('image.*')){
                        storedFiles.push(file);
                        readImg.onload = (function(file) {
                            return function(e) {
                                $('.cvf_uploaded_files').append(
                                "<li file = '" + file.name + "'>" +                                
                                    "<img class = 'img-thumb' src = '" + e.target.result + "' />" +
                                    "<a href = '#' class = 'cvf_delete_image btn-outline-danger' title = 'Cancel'><button class = 'delete-btn btn btn-danger'>X</button></a>" +
                                "</li>"
                                );     
                            };
                        })(file);
                        readImg.readAsDataURL(file);
                       
                    } else {
                        alert('the file '+ file.name + ' is not an image<br/>');
                    }
                   
                    if(files.length === (i+1)){
                        setTimeout(function(){
                            cvf_add_order();
                        }, 1000);
                    }
                }
            });
           
            // Delete Image from Queue
            $('body').on('click','a.cvf_delete_image',function(e){
                e.preventDefault();
                $(this).parent().remove('');       
               
                var file = $(this).parent().attr('file');
                for(var i = 0; i < storedFiles.length; i++) {
                    if(storedFiles[i].name == file) {
                        storedFiles.splice(i, 1);
                        break;
                    }
                }
               
                //cvf_reload_order();
               
            });
                   
            // AJAX Upload
/*             $('body').on('click', '.cvf_upload_btn', function(e){
               
                e.preventDefault();
                cvf_reload_order();
               
                //$(".cvf_uploaded_files").html('<p><img src = "loading.gif" class = "loader" /></p>');
                var data = new FormData();
               
                var items_array = $('.cvf_hidden_field').val();
                var items = items_array.split(',');
 
                for (var i in items){
                    var item_number = items[i];
                    data.append('files' + i, storedFiles[item_number]);
                }
                   
                $.ajax({
                    url: 'upload.php',
                    type: 'POST',
                    contentType: false,
                    data: data,
                    processData: false,
                    cache: false,
                    success: function(response, textStatus, jqXHR) {
                        //$(".cvf_uploaded_files").html('');                                               
                        //bootbox.alert('<br /><p class = "bg-success">File(s) uploaded successfully.</p>');
                        alert(jqXHR.responseText);
                    }
                });
               
            });  */       
 
        });
    </script>
    


</head>

<body>

    <header class="header">
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
    </header>

    <div class="cafe_wrap">   
        <div class="info"> 
        
        <h5 class="info_menu">카페 정보 등록</h5>
        <hr class="first_hr">

            <form method="post" enctype="multipart/form-data">
            
                <label for="exampleFormControlInput1">카페 이름</label>
                <input type="text" name="cafeName" class="form-control mb-2" id="exampleFormControlInput1" placeholder="카페 이름">

                <label for="exampleFormControlInput2">카페 주소</label>
                <input type="text" name="cafeAddress" class="form-control mb-2" id="exampleFormControlInput2" placeholder="카페 주소">

				<label for="exampleFormControlInput3">영업시간</label>
                <input type="text" name="cafeTime" class="form-control mb-2" id="exampleFormControlInput3" placeholder="영업시간">
				
				<label for="exampleFormControlInput4">시간당 기본 요금</label>
                <input type="text" name="stnFee" class="form-control mb-2" id="exampleFormControlInput4" placeholder="시간당 기본 요금">
				
				<label for="exampleFormControlInput5">10분당 추가 요금</label>
                <input type="text" name="tenPerFee" class="form-control mb-2" id="exampleFormControlInput5" placeholder="10분당 추가 요금">
				
				<label for="exampleFormControlInput6">4인석 수</label>
                <input type="text" name="fourTable" class="form-control mb-2" id="exampleFormControlInput6" placeholder="4인석 수">
				
				<label for="exampleFormControlInput7">8인석 수</label>
                <input type="text" name="grpTable" class="form-control mb-2" id="exampleFormControlInput7" placeholder="8인석 수">
				
				<label for="exampleFormControlInput8">카페 전화번호</label>
                <input type="text" name="cafeTel" class="form-control mb-2" id="exampleFormControlInput8" placeholder="카페 전화번호">
				
                
                <label for="exampleFormControlInput9">이미지 업로드</label>

                <div class ="form-group">
                    <input type="file" name="upload" multiple="multiple" class="user_picked_files mb-2" />
                    <br>
                    <label for="exampleFormControlInput10 text-muted">이미지 미리보기</label>
                    <div class="thumnail form-control mb-2">
                        <ul class="cvf_uploaded_files"></ul>
                    </div>
                </div>
                    <input type="submit" class="btn btn-primary col text-center mb-2" value="등록" />
                    <button class="btn btn-secondary col text-center" value="취소" /></button>
            
            </form>
            <hr>
        </div>  
    </div>


</body>

</html>