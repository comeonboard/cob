<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.80.0">
<title>ComeOnBoard</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
</head>
<style>
	.reg_photo{
		width:204px;
		clear:both;
		height:250px;
	}
	.reg_default {
		float: left;
		background-color: #f7f7f7;
		width: 200px;
		height: 200px;
		box-shadow: 1px 1px 3px 1px #dadce0;
		border: 2px solid white;
	}
	.reg_default>img{
        width: 100%;
        height: 100%;
    }
    
    .none{
    	display:none;
    }
    
    label{
    	font-size: 18px;
        width: 150px;
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
        background-color: rgb(251, 188, 006);
        border-radius: 15px 15px;
    }
    
   /*  #cob_gameRegBtn{
    	display:none;
    } */
</style>

<!-- Custom styles for this template -->
<link href="<c:url value="/css/offcanvas.css"/>" rel="stylesheet">


<script>

	function setImg(event) {

		var reader = new FileReader();

		reader.onload = function(event) {
			/* document.querySelector("div#image_container").removeChild(); */
			var oldImg = document.querySelector("#image_container img");
			if (oldImg != null) {
				document.querySelector("#image_container").removeChild(oldImg);
			}

			var newImg = document.createElement("img");
			newImg.setAttribute("src", event.target.result);
			document.querySelector("#image_container").appendChild(newImg);
		};

		reader.readAsDataURL(event.target.files[0]);
	}
</script>
<body >
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	
	<div id="content">
		
		<h2>게임등록</h2>
		<hr>

		<form method="post" enctype="multipart/form-data" accept-charset="UTF-8" class="form-inline" >

			<table 
			class = "d-flex align-items-center p-3 my-3 text-black-50 bg_red rounded shadow-sm">
				<tr>
					<th>게임이름</th>
					<td><input type="text" name="gameName" id="gameName"  class="form-control mr-2" ></td>
				</tr>
				<tr>
					<th>장르</th>
					<td><select name="gameSort" id="gameSort"  class="form-control mr-2" >
							<option value="전략">전략</option>
							<option value="추상">추상</option>
							<option value="컬렉터블">컬렉터블</option>
							<option value="가족">가족</option>
							<option value="어린이">어린이</option>
							<option value="파티">파티</option>
							<option value="테마">테마</option>
							<option value="워게임">워게임</option>
						</select></td>
				</tr>
				<tr>
					<th>게임인원</th>
					<td><input type="text" name="gamePerson" id="gamePerson"  class="form-control mr-2" ></td>
				</tr>
				<tr>
					<th>플레이타임</th>
					<td><input type="text" name="gameTime" id="gameTime"  class="form-control mr-2" ></td>
				</tr>
				<tr>
					<th>사용연령</th>
					<td>
						<select name="gameLmtAge" id="gameLmtAge"  class="form-control mr-2" >
							<option value="1">전체연령가</option>
							<option value="7">7세</option>
							<option value="12">12세</option>
							<option value="15">15세</option>
							<option value="19">19세</option>
						</select>
					</td>
					
				</tr>
				<tr>
					<th>출판사</th>
					<td><input type="text" name="gamePublisher" id="gamePublisher"  class="form-control mr-2" ></td>
				</tr>
				<tr>
					<th>출판일</th>
					<td><input type="text" name="gamePubDate" id="gamePubDate"  class="form-control mr-2" ></td>
				</tr>
				<tr>
					<th>게임사진</th>
					<td class="reg_photo">
					 <div class="reg_default" id="image_container" ></div>
					<input type="file" name="gamePhoto" id="image" accept="image/*" onchange="setImg(event);"  class=" none" >
					<label for="image">이미지등록</label>
					</td>
				</tr>
				<tr>
					<th>INTRO</th>
					<td><input type="text" name="gameIntro" id="gameIntro"  class="form-control mr-2" ></td>
				</tr>								
				<tr>
					<th>RULE</th>
					<td><input type="text" name="gameRule" id="gameRule"  class="form-control mr-2" ></td>
				</tr>
				<tr>
					<th>VIDEO</th>
					<td><input type="text" name="gameVideo" id="gameVideo"  class="form-control mr-2" ></td>
				</tr>				
				<tr>
					<th></th>
					
				</tr>
				<tr>
					<th></th>
					<td>
						<input type="submit" name="cob_gameRegBtn" id="cob_gameRegBtn" value="등록" class="none" >
						<label for="cob_gameRegBtn">게임등록</label>
					</td>
				</tr>
			</table>

		</form>
		
		
	</div>


</body>

	<script src="<c:url value="/js/bootstrap.bundle.min.js"/>"></script>
	

	<script src="<c:url value="/js/offcanvas.js"/>"></script>


</html>