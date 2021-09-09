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
    <title>Come On, Board : Cafe info</title> <!-- 문서 제목 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
    <!-- 카드 선택시 하단 줄 CSS -->
	<link href="<c:url value="/css/hover.css"/>" rel="stylesheet" media="all">
	
	<link rel="stylesheet" href="<c:url value="/css/cafe_page.css"/>" type="text/css">

    <style>

    </style>

    <script type="text/javascript">
        $(document).ready(function(){
            
            reservation_list(4);
            
            let page = 1;
            review(page);
            

            // 4인석 버튼 클릭시 
            $('#btn_reservation_4').click(function(){
                reservation_list(4);
            })
            // 8인석 버튼 클릭시
            $('#btn_reservation_8').click(function(){
                reservation_list(8);
            })
            
        });

        // 예약 버튼 동적 생성
        // **DB에서 값을 가져올 때 예약이 불가한 시간은 비활성화 필요 - 분기처리 disabled?
        function reservation_list(table_num){

            // 날짜값
            var date = $('#date').val();

            // DB 조회 : date(날짜), table_num(4인석,8인석) 활용

            // 중복 생성 방지를 위한 자손 삭제
            $('#person *').remove();
            // 버튼 색상
            var color = table_num == 4 ? 'btn-outline-danger' : 'btn-outline-primary';
            // html 동적 생성
            var html = '<table>'+'\n'+'<tr>'+'\n';
            for(var i=10; i<20; i++) {
                if(i==15){
                    html += '</tr>'+'\n'+'<tr>'+'\n';
                }
                    html += '<td><button type="button" class="btn '+color+' rotate-hor-center" value='+i+'>'+i+'시</button></td>'+'\n';
            }
            html += '</tr>' + '\n' + '</table>';
            $('#person').append(html);
        }


        $(function () {
            // 달력 - 시간 제거, 오늘 이전 날짜 선택 불가
            $('#date').bootstrapMaterialDatePicker({
                time: false,
                minDate: moment()
            });
        });
     
        // 리뷰
/*         function review(){
            $('.post_wrap *').remove();
            // DB에서 받을 값
            var login_id = '직쏘';
            var member_img = 'image/img_avatar1.png';
            var member_id = '직쏘';
            var review_star = '★★★★★';
            var review_regdate = '2021-08-22';
            var review_post = '사장님이 친절해요';

            for(var i=0; i<5; i++){
                var html = '<div class="media">'+'\n'+
                            '<div class="media-left">'+'\n'+
                            '<img src="'+member_img+'\n'+
                            '" class="media-object mr-3" style="width:45px">'+'\n'+
                            '</div>'+'\n'+
                            '<div class="media-body">'+'\n'+
                            '<h4 class="media-heading">'+'\n'+
                            member_id+'\n'+
                            '<small><i class="ml-3">'+'\n'+
                            review_star+'\n'+
                            '</i></small><small><i style="float: right;">'+'\n'+
                            review_regdate+'\n'+
                            '</i></small></h4>'+'\n'+
                            '<p>'+'\n'+
                            review_post+'\n'+
                            '</p>'+'\n';
                            // 작성자와 로그인 아이디가 같으면 수정/삭제 추가
                            if(member_id == login_id){
                            html += '<ul><li style="float: right; margin-left: 10px;"><a href="#">수정</a></li><li style="float: right; margin-left: 10px;"><a href="#">삭제</a></li>'+'\n';
                            }
                            html += '</div>'+'\n'+
                            '</div>'+'\n'+
                            '<hr>';
                    $('.post_wrap').append(html);
            }
        } */
        
function review(page){
       $.ajax({
    	   url: '<c:url value="/cafe/cafe_review"/>',
    	   type: 'get',
    	   data: { 
    		   page : page,
    		   cafeIdx : ${cafeInfo.cafeIdx}
    	   },
    	   dataType: 'json',
    	   success: function(returnData){
    		   console.log(returnData);
    		   var data = returnData;
    		   var html = ''
    		   
   			   $.each(data, function(idx, review) {
   				
   				console.log(idx);
   				var date = new Date(review.revRegDate);
   				var commRegDate = date.getFullYear() + ". " + date.getMonth() + ". " + date.getDate() + ". " + date.getHours() + ":" + date.getMinutes(); 
 				
   				html += '<div class="media">'+'\n'+
			                 '<div class="media-left">'+'\n'+
			                 '<img src="https://www.w3schools.com/bootstrap4/img_avatar1.png"\n'+
			                 '" class="media-object mr-3" style="width:45px">'+'\n'+
			                 '</div>'+'\n'+
			                 '<div class="media-body">'+'\n'+
			                 '<h4 class="media-heading">'+'\n'+
			                 review.memIdx+'\n'+
			                 '<small><i class="ml-3">★'+'\n'+
			                 review.revRating+'\n'+
			                 '</i></small><small><i style="float: right;">'+'\n'+
			                 commRegDate+'\n'+	
			                 '</i></small></h4>'+'\n'+
			                 '<p>'+'\n'+
			                 review.revContent+'\n'+
			                 '</p>'+'\n';
			                 // 작성자와 로그인 아이디가 같으면 수정/삭제 추가
			         html += '<ul><li style="float: right; margin-left: 10px;"><a href="#">수정</a></li><li style="float: right; margin-left: 10px;"><a href="#">삭제</a></li>'+'\n';
			         html += '</div>'+'\n'+
			                 '</div>'+'\n'+
			                 '<hr>';
			});	
    		   $('.post_wrap').append(html);

    	   },
    	   error : function(){
   				alert('실패');
   		   },
   		   complete : function(){	
   		   }
       })
}
        
        
        
        
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
            <img src="<c:url value="/images/cob_white.png"/>" class="logo">
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
        <div class="info" id="first">
            <h5 class="info_menu">카페 소개</h5>
            <hr class="first_hr">
            <!-- 사진영역 -->
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img class="d-block w-100" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FckSZmV%2FbtqLwLYTrGR%2FZkGjmqP0pHvzMkVK9b2pRk%2Fimg.png" alt="First slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FckSZmV%2FbtqLwLYTrGR%2FZkGjmqP0pHvzMkVK9b2pRk%2Fimg.png" alt="Second slide">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FckSZmV%2FbtqLwLYTrGR%2FZkGjmqP0pHvzMkVK9b2pRk%2Fimg.png" alt="Third slide">
                  </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
            </div>
            <!-- 기본정보 영역 -->
            <div class="basic_info">
                <h1>${cafeInfo.cafeName}</h1>
                <h5>★ ${cafeInfo.cafeRating}/5</h5>
                <h5>${cafeInfo.cafeAddress}</h5>
                <div class="li_warp">
                    <ul>
                        <li>요금 : 시간당 ${cafeInfo.stdFee}</li>
                        <li>테이블 정보 : 4인석 - ${cafeInfo.fourTable}, 8인석 - ${cafeInfo.grpTable}</li>
                        <li>영업시간 : ${cafeInfo.cafeTime}</li>
                        <li>연락처 : ${cafeInfo.cafeTel}</li>
                    </ul>
                    <button class="btn btn-outline-primary my-2 my-sm-0" data-toggle="modal" data-target="#gamelist">보유게임 리스트</button>
                </div>
            </div>  
        </div>
        <hr>   
        

        <div class="reservation" id="second">
            <h5 class="info_menu">예약</h5>
            <hr class="first_hr">
            <table>
                <tr>
                    <td><input class="btn btn-outline-success" type="text" id="date" value="2021-08-24"></td>
                </tr>
                <tr>
                    <td><button type="button" id="btn_reservation_4" class="btn btn-outline-danger">4인석</button></td>
                    <td><button type="button" id="btn_reservation_8" class="btn btn-outline-primary">8인석</button></td>                    
                </tr>
            </table>

            <!-- 예약 버튼 생성위치 -->
            <div id="person"></div>
            </div> 
        <hr>   
        
        
        <div class="review" id="third">
            <h5 class="info_menu">리뷰</h5>
            <hr class="first_hr">

            <div class="post_wrap">
            </div>

            <!-- 페이징 -->
               <nav aria-label="Page navigation example">
                   <ul class="pagination justify-content-center" style="float: none;">
                     <li class="page-item disabled">
                       <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                     </li>
                     <li class="page-item"><a class="page-link" href="#">1</a></li>
                     <li class="page-item"><a class="page-link" href="#">2</a></li>
                     <li class="page-item"><a class="page-link" href="#">3</a></li>
                     <li class="page-item">
                       <a class="page-link" href="#">Next</a>
                     </li>
                   </ul>
                 </nav>
            <br>

            <form method="post">              
                <div id="star" class="star-rating space-x-4 mx-auto">                   
                    <input type="radio" id="5-stars" name="revRating" value="5" v-model="ratings"/>
                    <label for="5-stars" class="star pr-4">★</label>
                    <input type="radio" id="4-stars" name="revRating" value="4" v-model="ratings"/>
                    <label for="4-stars" class="star">★</label>
                    <input type="radio" id="3-stars" name="revRating" value="3" v-model="ratings"/>
                    <label for="3-stars" class="star">★</label>
                    <input type="radio" id="2-stars" name="revRating" value="2" v-model="ratings"/>
                    <label for="2-stars" class="star">★</label>
                    <input type="radio" id="1-star" name="revRating" value="1" v-model="ratings" />
                    <label for="1-star" class="star">★</label>
                </div>

                <textarea class="form-control" id="exampleFormControlTextarea1" name= "revContent" rows="3"></textarea>
                <input class="btn btn-primary" type="submit" value="리뷰 작성" style="float: right; margin-top: 10px;">
            </form>
        </div>
        
    </div>


    <!-- Modal -->
    <div class="modal fade" id="gamelist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">보드게임 리스트</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-body">
            
                보드게임리스트가 출력됩니다

            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
        </div>
    </div>




    <div>
        <ul style="position: fixed; top: 40%; right: 5%;">
            <li><a href="#first"><button type="button" class="btn btn-outline-primary" style="width: 100px; height: 50px; margin: 5px;">카페 소개</button></a></li>
            <li><a href="#second"><button type="button" class="btn btn-outline-primary" style="width: 100px; height: 50px; margin: 5px;">예약</button></a></li>
            <li><a href="#third"><button type="button" class="btn btn-outline-primary" style="width: 100px; height: 50px; margin: 5px;">리뷰</button></a></li>
        </ul>
    </div>


</body>

</html>


