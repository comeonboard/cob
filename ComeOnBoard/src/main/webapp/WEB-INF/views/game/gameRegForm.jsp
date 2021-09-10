<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>ComeOnBoard</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

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
</style>
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

		<form method="post" accept-charset="UTF-8"  >

			<table >
				<tr>
					<th>게임이름</th>
					<td><input type="text" name="gameName" id="gameName" ></td>
				</tr>
				<tr>
					<th>장르</th>
					<td><select name="gameSort" id="gameSort">
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
					<td><input type="text" name="gamePerson" id="gamePerson"></td>
				</tr>
				<tr>
					<th>플레이타임</th>
					<td><input type="text" name="gameTime" id="gameTime"></td>
				</tr>
				<tr>
					<th>사용연령</th>
					<td>
						<select name="gameLmtAge" id="gameLmtAge">
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
					<td><input type="text" name="gamePublisher" id="gamePublisher"></td>
				</tr>
				<tr>
					<th>출판일</th>
					<td><input type="text" name="gamePubDate" id="gamePubDate"></td>
				</tr>
				<tr>
					<th>게임사진</th>
					<td class="reg_photo">
					 <div class="reg_default" id="image_container" ></div>
					<input type="file" name="gamePhoto" id="image" accept="image/*" onchange="setImg(event);">
					</td>
				</tr>
				<tr>
					<th>INTRO</th>
					<td><input type="text" name="gameIntro" id="gameIntro"></td>
				</tr>								
				<tr>
					<th>RULE</th>
					<td><input type="text" name="gameRule" id="gameRule"></td>
				</tr>
				<tr>
					<th>VIDEO</th>
					<td><input type="text" name="gameVideo" id="gameVideo"></td>
				</tr>				
				<tr>
					<th></th>
					
				</tr>
				<tr>
					<th></th>
					<td><input type="submit" value="등록"></td>
				</tr>
			</table>

		</form>
		
		
	</div>


</body>
</html>