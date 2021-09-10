<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ComeOnBoard</title>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    ul {
        list-style: none;
    }
  
    .ex_wrap{
        width: 100%;
        background-color: #f7f7f7;
        border: 1px solid rgb(251, 188, 006); 
        width: 980px;
        margin: 0px auto;
        height: 250px;
        padding: 0px 5px;
    }

    .ex_title{
        margin: 10px 30px 0px 30px;
    }

    .ex_wrap>div>h2{
        margin-top: 8px;
        display: inline-block;
    }

    .ex_wrap>div>input{
        display: inline-block;
        margin : 8px 10px;
        width: 50px;
    }

    .ex_score{
        background-color: rgb(052,168,083);
        width:130px;
        height:130px;
        border-radius: 75px;
        margin-top: 13px;
        margin-left: 25px;
        float: left;
        box-shadow: 1px 1px 3px 1px #dadce0;
    }

    .ex_score>h1{
        text-align: center;
        padding-top: 20px;
        font-size: 64px;
      
    }
    .ex_left{
        margin-left: 40px;
        margin-top: 18px;
        float: left;
        font-size: 18px;
    } 
    .ex_left>li{
        margin-top: 20px;
        
    }   
    .ex_center{
        margin-left:60px;
        margin-top: 18px;
        float: left;
        font-size: 18px;
    }
    .ex_center>li{
        margin-top: 20px;
    }    
    .ex_right{
        margin-left:60px;
        margin-top: 18px;
        float: left;
        font-size: 18px;
    }
    .ex_right>li{
        margin-top: 20px;
    }    
    
    .ex_img{
        float: right;
        margin-right: 20px;
        display: inline-block;
        box-shadow: 1px 1px 3px 1px #dadce0;
        border-radius: 15px 15px;
        
    }
    
    .ex_img>img{
        border-radius: 20px;
    }

    .rule_wrap{
        width: 100%;
        background-color: #f7f7f7;
        width: 980px;
        margin: 0px auto;
        height: 70%;
        
        padding: 0px 5px;
        border-left: 1px solid rgb(251, 188, 006);
        border-right: 1px solid rgb(251, 188, 006);
        border-bottom: 1px solid rgb(251, 188, 006);
    }


  
    .rule_list input[type=radio]{
        display: none;
    }

    #tab-1:checked ~ .rule_list_tab label:nth-child(1), /* id:tab-1 과 rule_list_tab 자손을 연결 */
    #tab-2:checked ~ .rule_list_tab label:nth-child(2),
    #tab-3:checked ~ .rule_list_tab label:nth-child(3),
    #tab-4:checked ~ .rule_list_tab label:nth-child(4){
        background-color: rgb(251, 188, 006); 
        box-shadow: none;   
    }

    .rule_content > div{
        display: none;
    }

    .rule_content > pre{
        display: none;
        width:860px;
        white-space: pre-wrap;
    }

    #tab-1:checked ~ .rule_content pre:nth-child(1), 
    #tab-2:checked ~ .rule_content pre:nth-child(2),
    #tab-3:checked ~ .rule_content pre:nth-child(3),
    #tab-4:checked ~ .rule_content pre:nth-child(4){
        display: block;
    }

    .rule_list{
        margin: 0 auto;
        width: 900px;
        max-width: 100%;
        padding-top: 20px;
        padding-left: 40px;
        padding-right: 40px;
    }

    .rule_list_tab{
        overflow: hidden;
    }

    
    .rule_list_tab label{
        
        font-size: 18px;
        width: 25%;
        float: left;
        text-align: center;
        padding: 15px 0px;
        text-transform: uppercase; /* 글자를 대문자로 바꿔준다 */
        font-weight: bold;
        letter-spacing: 2px; /* 글자사이 간격 */
        user-select: none; /* 드래그를 막아주는 속성 */
        background-color: #f7f7f7;
        /* box-shadow: 1px 1px 3px 1px #dadce0; */
        /* border-right: 1 px solid rgb(251, 188, 006); */
        -webkit-user-select: none;
    }
 
    .rule_list_tab>label:hover{
        background-color: rgb(66, 133, 244);
        cursor: pointer;
    }

    .rule_content {
        background-color: rgb(250, 250, 250);
        min-height: 370px;
        box-shadow: 1px 1px 3px 1px #dadce0;
        border: 1px solid #dadce0;
    }


    .rule_content > div{
        padding: 30px;
        line-height: 1.5;
        font-size: 17px;
    }
    
    .rule_content > pre{
        padding: 30px;
        line-height: 1.5;
        font-size: 17px;
    }    
 
    .rule_content_name3 > iframe{
        width: 400px;
        height: 300px;
    }

    .review_item{
        padding-top: 20px;
        padding-left: 40px;
        width: 921px;
       
    }
    
    .review_text{
        font-size: 16px;
    }
   
    .review_wrap{
        margin: 0px auto;
        width: 670px;
        height: 160px;
        display: inline;
    }

    .review_area{
        width: 630px;
        height: 50px;
        margin: 20px auto;
    }
    .review_text{
        width: 578px;
        height: 40px;
        font-size: 18px;
        float: left;
        resize: none;
        background-color: white;
        border-radius: 15px 0px 0px 15px;
        outline: none;
        text-indent: 10px;
        padding-top: 10px;
        box-shadow: 1px 1px 3px 1px #dadce0;
        border: 1px solid #dadce0;
        
    }
    .review_btn{
        background-color: rgb(251, 188, 006);
        width:50px;
        height:52px;
        border-radius: 0px 10px 10px 0px;
        float: left;
        font-size: 18px;
        box-shadow: 1px 1px 3px 1px #dadce0;
        border: 1px solid #dadce0;
    }

    .review_list{
        clear: left;
        margin-top: 20px;
    }
    .list_item{
        clear: left;
        width: 872px;
        height: 30px;
        box-shadow: 1px 1px 3px 1px #dadce0;
        border: 1px solid #dadce0;
        margin-top: 5px;
    }
    .list_id{
        float: left;
        border-right: 2px solid rgb(251, 188, 006);
        padding: 2px 10px;
    }
    .list_text{
        float: left;
        border-right: 2px solid rgb(251, 188, 006);
        width: 600px;
        padding: 2px 10px;
    }
    .list_date{
        float: left;
        padding: 2px 10px;
    }
    .paging{
        margin-top: 25px;
        margin-left: auto;
        margin-right: auto;
        width: 300px;
    }
    .paging>ul>li{
        float: left;
        width: 36px;
        height: 20px;
        border-right: 2px solid rgb(251, 188, 006);
        border-left: 2px solid rgb(251, 188, 006);
        text-align: center;
        box-shadow: 1px 1px 3px 1px #dadce0;
        padding: 0px 1px;
        padding-bottom: 3px;
    }

    .moving{
        clear: left;
        margin: 0px auto;
        padding-top: 20px;
        width: 189px;
        height: 30px;
        
    }
    .moving>ul>li{
        float: left;
    }
    .moving>ul>li>a{
    	display : block;
        width: 50px;
        border-radius: 5px;
        margin-right: 3px;
        box-shadow: 1px 1px 3px 1px #dadce0;
        border: 1px solid #dadce0;
        text-align : center;
        
    }

    .moving>ul>li>a:hover{
    	background-color: rgb(66, 133, 244); 
        cursor: pointer;
    }

    a{
        text-decoration: none;
        color: black;
    }

    hr{
            margin-bottom: 10px;
            width: 250px;
            background-color: rgb(251, 188, 006);
            height: 2px;
        }

    input[type=button]:hover{
        background-color: rgb(66, 133, 244); 
        cursor: pointer;
    }

    .star-rating {
        display: flex;
        flex-direction: row-reverse;
        font-size: 2.25rem;
        line-height: 2.5rem;
        justify-content: space-around;
        padding: 0 0.2em;
        text-align: center;
        width: 5em;
        margin: 0px auto;
    }
 

    .star-rating input {
     display: none;
    }
 
    .star-rating label {
        -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
        -webkit-text-stroke-width: 2.3px;
        -webkit-text-stroke-color: #2b2a29;
        cursor: pointer;
    }
    
    .star-rating :checked ~ label {
        -webkit-text-fill-color: rgb(251, 188, 006);
    }
    
    .star-rating label:hover,
    .star-rating label:hover ~ label {
     -webkit-text-fill-color: rgb(251, 188, 006);
    }


</style>

<script>

function btnclick(){
        alert('등록되었습니다');
    }

  
</script>
<script>
  function ratingToPercent(){
      const score = +this.restaurant.averageScore * 20;
      return score + 1.5;
    }  

</script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
    $(function(){
    	var video = '${gamepage[0].gameVideo}';
    	console.log(video);
 
        var embed = $('#content_iframe'); // 영상코드

        $('#tab-3').on('click',function(){
           /*  $('.rule_content_name3 ').empty(); */
            var path = $(this).attr('href');  
            $('.rule_content_name3').append(video);
            $(path).show();
            
        })

        $('#tab-1').on('click',function(){
            $('.rule_content_name3 ').empty();
        })

        $('#tab-2').on('click',function(){
            $('.rule_content_name3 ').empty();
        })

        $('#tab-4').on('click',function(){
            $('.rule_content_name3 ').empty();
        }) 
    });
   

</script>
<body class="main_body">

	<%@ include file="/WEB-INF/views/gameFrame/multibar.jsp"%>
	<%@ include file="/WEB-INF/views/gameFrame/searchbar.jsp"%>
	
		<div class="ex_wrap">

			<div class="ex_title">
				<h2>${gamepage[0].gameName}</h2>
				<input type="button" class="btn_edit" value="edit"
					onclick="location.href='<c:url value ='/game/gameEdit/'/>${gamepage[0].gameIdx}'">
					
			</div>
			<hr>

			<div class="ex_score">
				<h1>${gamepage[0].avg }</h1>
			</div>

			<div class="ex_list">
				<ul class="ex_left">
					<li>장르 : ${gamepage[0].gameSort}</li>
					<li>플레이타임 : ${gamepage[0].gameTime}</li>

				</ul>
				<ul class="ex_center">
					<li>게임인원 :${gamepage[0].gamePerson}</li>
					<li>사용연령 : ${gamepage[0].gameLmtAge}</li>
				</ul>
				<ul class="ex_right">
					<li>출시일 :${gamepage[0].gamePubDate}</li>
					<li>출판사 :${gamepage[0].gamePublisher}</li>
				</ul>
			</div>

			<div class="ex_img">
				<img src="<c:url value="/uploadfile/uploadgamefile"/>/${gamepage[0].gamePhoto}" height = "160px" width="160px"/>	
			</div>

		</div>

		<div class="rule_wrap">



			<div class="rule_list">

				<input type="radio" id="tab-1" name="show" checked> 
				<input type="radio" id="tab-2" name="show"> 
				<input type="radio" id="tab-3" name="show"> 
				<input type="radio" id="tab-4" name="show">

				<div class="rule_list_tab">
					<label for="tab-1">Intro</label> 
					<label for="tab-2">Rule</label> 
					<label for="tab-3">play</label> 
					<label for="tab-4">etc</label>
				</div>

				<div class="rule_content">
					<pre class="rule_content_name1">${gamepage[0].gameIntro}</pre>
					<pre class="rule_content_name2">${gamepage[0].gameRule}</pre>
					<pre class="rule_content_name3" id="game_play"></pre>
					<pre class="rule_content_name4">etc입니다</pre>
				</div>
			</div>
	
	<div class="review_item">
		<h1>review</h1>
		<hr>


		
			<div class="review_wrap">
	
				<div class="star-rating space-x-4 mx-auto">
					<input type="radio" id="5-stars" name="rating" value="5" /> 
					<label for="5-stars" class="star pr-4">★</label>
					<input type="radio" id="4-stars" name="rating" value="4" /> 
					<label for="4-stars" class="star">★</label> 
					<input type="radio" id="3-stars" name="rating" value="3" />
					<label for="3-stars" class="star">★</label> 
					<input type="radio" id="2-stars" name="rating" value="2" /> 
					<label for="2-stars" class="star">★</label> 
					<input type="radio" id="1-star" name="rating" value="1" /> 
					<label for="1-star" class="star">★</label>
				</div>
		
	
				<div class="review_area">
	
					<textarea class="review_text" cols="50" rows="1"></textarea>
					<input type="button" value="등록" class="review_btn"
						onclick="btnclick()">
				</div>
	
			</div>
		



		<div class="review_list">
			<ul class="list_item">
				<li class="list_id"><a href="#"> 어드민(admin)</a></li>
				<li class="list_text"><a href="#">리뷰 페이지 입니다</a></li>
				<li class="list_date">2021.08.20</li>
			</ul>
			<ul class="list_item">
				<li class="list_id"><a href="#"> 어드민(admin)</a></li>
				<li class="list_text"><a href="#">리뷰 페이지 입니다</a></li>
				<li class="list_date">2021.08.20</li>
			</ul>
			<ul class="list_item">
				<li class="list_id"><a href="#"> 어드민(admin)</a></li>
				<li class="list_text"><a href="#">리뷰 페이지 입니다</a></li>
				<li class="list_date">2021.08.20</li>
			</ul>
			<ul class="list_item">
				<li class="list_id"><a href="#"> 어드민(admin)</a></li>
				<li class="list_text"><a href="#">리뷰 페이지 입니다</a></li>
				<li class="list_date">2021.08.20</li>
			</ul>
			<ul class="list_item">
				<li class="list_id"><a href="#"> 어드민(admin)</a></li>
				<li class="list_text"><a href="#">리뷰 페이지 입니다</a></li>
				<li class="list_date">2021.08.20</li>
			</ul>
		</div>

	</div>

	<div class="paging">
		<ul>
			<li><a href="#">이전</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">다음</a></li>
		</ul>
	</div>
	<div class="moving">
		<ul>
			<li>
				<a href="<c:url value ='/game/gamepage/'/>${gamepage[0].gameIdx+1}" id="prev" >이전</a>
				
			</li>
			<li>
				<a href="<c:url value ='/game/gamelist'/>"  id="list" >목록</a>
				
			</li>
			<li>
				<a href="<c:url value ='/game/gamepage/'/>${gamepage[0].gameIdx-1}" id="next" >다음</a>
				
			</li>
		</ul>
	</div>
	</div>
	<footer>
		<h2>footer입니다</h2>
	</footer>





</body>
</html>