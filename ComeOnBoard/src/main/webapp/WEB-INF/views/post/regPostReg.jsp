<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" 
integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" 
crossorigin="anonymous">
</script>  
<script type="text/javascript" src="<c:url value='/smarteditor2/js/HuskyEZCreator.js'/>" charset="utf-8"></script>
</head>
<body>
	<h1>게시판 등록 화면</h1>

	<form id="form" method="post">
		<table style="width: 900px">
			<tr>
				<!-- session에서 구해온다. -->
				<td>멤버 idx</td>
				<td><input type="number" name="memIdx" id="memIdx"></td>
			</tr>
			<tr>
				<!-- session에서 구해온다 -->
				<td>닉네임</td>
				<td><input type="text" name="postWriter"></td>
			</tr>
			<tr>
				<!-- select로 값을 저장 -->
				<td>카테고리</td>
				<td>
					<!-- <input type="text" name="postSort"> --> 
					<select name="postSort">
						<option value="잡담">잡담</option>
						<option value="질문">질문</option>
						<option value="후기">후기</option>
						<option value="게임TIP">게임TIP</option>
						<option value="지역">지역</option>
						<option value="기타">기타</option>
						<option value="공지">공지</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="postTitle"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="postContent" id="postContent" rows="10"
						cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="button" value="등록" id="save">
				<input type="reset"></td>
			</tr>
		</table>
	</form>
</body>
<script>
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "postContent",
		sSkinURI : "<c:url value='/smarteditor2/SmartEditor2Skin.html'/>",
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,
			fOnBeforeUnload : function() {

			}
		},
		fOnAppLoad : function() {
			//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
			oEditors.getById["postContent"].exec("PASTE_HTML",
					[ "기존 DB에 저장된 내용을 에디터에 적용할 문구" ]);
		},
		fCreator : "createSEditor2"
	});

	$("#save").click(function() {
		oEditors.getById["postContent"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#form").submit();
		/* var value = document.getElementById("postContent").value;
		console.log(value); */
	});
</script>
</html>