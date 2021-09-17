<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	// 테스트용 세션 저장
	session.setAttribute("nickName", "닉네임");
	session.setAttribute("memIdx", 1);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Project : 게시글 보기</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js" 
integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" 
crossorigin="anonymous">
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script >
    $(document).ready(function(){
		commentCount();
		showBestComm();
    	showCommList();
    	
    	$('#naverSearch').click(function(){
    		var keyword = $('#keyword').val();
    		naverSearch(keyword);
    	})
    	
    	shareKakao();	// 카카오 초기 호출
    	
        // 댓글 하나만 입력하도록 설정
        $('.add-recomments').click(function(){
            var add_recomments = $(this).attr('data-recomments');
            console.log(add_recomments);
            $('.recomments').addClass('display-none');
            $('.'+add_recomments).removeClass('display-none');
        })
        $('.write').click(function(){
            $('.recomments').addClass('display-none');
        })
        $('.remove-comments').click(function(){
            $('.recomments').addClass('display-none');
        })

        // 회원 정보
        $('.imgSelect').click(function(){
            var data_id = $(this).attr('data-id');
            console.log(data_id);
            $('.nick-box').addClass('display-none');
            $('.'+data_id).removeClass('display-none');
        })
        // url 복사 기능
        $('.copy-url').click(function(){
            copyLink();
        })

        // 외부영역 클릭 시 팝업 닫기
        $(document).mouseup(function (e){
        var LayerPopup = $(".nick-box");
            if(LayerPopup.has(e.target).length === 0){
                LayerPopup.addClass("display-none");
            }
        });

        // 댓글 좋아요 싫어요 중 하나만 눌리도록 설정
        $('.btn-like').click(function(){
            $(this).toggleClass("done");
            $(this).next().removeClass("done");
        });
        $('.btn-dislike').click(function(){
            $(this).toggleClass("done");
            $(this).prev().removeClass("done");
        });
    });
    function naverSearch(keyword){
    	$.ajax({
			url : '<c:url value="/craw/crawling_ajax"/>',    			
			type : "post",
			async : false,
			data : { keyword : keyword },
			success : function(data){
				const obj = JSON.parse(data);
				console.log(obj.items[0].link);
				console.log(obj.items[0].title);
			},
			error : function(){
				alert("오류발생");
			}
		});
    }
    
 	// Kakao 공유 동작 function
    function shareKakao() {
        Kakao.init('e743b6daa20e101e0afb710dae9965b3');        

        // Kakao 버튼 생성
        Kakao.Link.createDefaultButton({
        	
            container : '#btnKakao',	// kakao button
            objectType : 'feed',
            content : {
                title : "${postDetail[1].postTitle}",        
                description : "COB 게시글 공유하기!",
                imageUrl : "https://img.icons8.com/wired/64/000000/kakaotalk.png",
                link : {
                    mobileWebUrl : "포스트 링크 (모바일)",
                    webUrl : "http://localhost:8080/cobsp/post/postDetail?postIdx=${postDetail[1].postIdx}"
                }
            },
            social : {
            	likeCount : ${postDetail[1].postLike},
            	viewCount : ${postDetail[1].views},
            	commentCount : ${countComment}
            }
        });
    }
 	// 댓글 갯수 구하기
	function commentCount(){
		$.ajax({
			url : '<c:url value="/comment/countComment"/>',    			
			type : "post",
			data : { postIdx : ${postDetail[1].postIdx} },
			async : false,
			success : function(data){
				$('#commCnt').html("댓글 : "+ data);
			},
			error : function(){
				alert("오류발생");
			}
		});
	}
 	// 추천 비추천 신고하기 버튼
	function btn_down(type, tableType, idx, memIdx){
 		if( memIdx == ${sessionScope.memIdx}){
 			alert('작성자는 누를 수 없습니다!');
 		}else{
 			$.ajax({
 	 			url : '<c:url value="/check/addLike"/>',
 				type : "post",
 				data : { type : type,
 					tableType : tableType,
 					idx : idx,
 					memIdx : ${sessionScope.memIdx}
 	 			},
 				async : false,
 				success : function(msg){
 					if(msg == 1){
 						if(type=='like'){
 							alert('이미 추천 버튼을 누르셨습니다.');
 						}if(type=='dislike'){
 							alert('이미 비추천 버튼을 누르셨습니다.');
 						}if(type=='rep'){
 							alert('이미 신고하기를 누르셨습니다.');
 						}
 					}else{
 						alert('성공!');
 					}
 				},
 				error : function(){
 					alert("버튼 누르는 중에 오류 발생");
 				} 
 	 		});
 		}
 	}
    //  url 복사 기능
    function copyLink(){

        let currentUrl = window.document.location.href;

        let t = document.createElement("textarea");
        document.body.appendChild(t);
        t.value = currentUrl;
        t.select();
        document.execCommand('copy');
        document.body.removeChild(t);

        alert('주소를 복사하였습니다.');
    }
    function shareFacebook(){
    	window.open('http://www.facebook.com/sharer.php?u=https://dc2348.tistory.com/')
    }
    function shareTwitter() {
        var sendText = "트위터 공유 테스트"; // 전달할 텍스트
        var sendUrl = "https://devpad.tistory.com/53"; // 전달할 URL
        window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
    }
    function shareNaver() {
        var url = encodeURI(encodeURIComponent(myform.url.value));
        var title = encodeURI(myform.title.value);
        var shareURL = "https://share.naver.com/web/shareView.nhn?url=" + url + "&title=" + title;
        document.location = shareURL;
      }
</script>
<body>
	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
	
	<div >
		<input id="keyword" type="text">
		<button id="naverSearch">검색</button>
	</div>
	
	<div id="shareSNS">
		<!-- 카카오 공유 -->
		<a id="btnKakao" class="btn px-1"><img src="/cobsp/images/kakao_logo.png" alt="카카오톡 공유"></a>
		<!-- facebook 공유 -->
		<a id="shareFacebook" onclick="shareFacebook()"><img src="/cobsp/images/facebook_logo.png" alt="페이스북 공유"></a>
		<!-- 트위터 공유 -->
		<a id="shareTwitter" onclick="shareTwitter()"><img src="/cobsp/images/twitter_logo.png" alt="트위터 공유"></a>
		<!-- 네이버 공유 -->
		<a id="shareNaver" onclick="shareNaver()"><img src="/cobsp/images/naverblog_logo.png" alt="네이버 공유하기"></a>
		<form id="myform" style="display:none">
			<input type="hidden" id="url" value="https://marsland.tistory.com/471"><br/>
		    <input type="hidden" id="title" value="${ postDetail[1].postTitle }"><br/>
		</form>
	</div>
	
	<div class="Wrapper">
        <div class="WritingWrap">
            <div class="contents">
                <div class="board_header">
                    <h3><a href="<c:url value='/post/postList'/>">COB 게시판</a></h3>
                    <a href="<c:url value='post/postList'/>" class="categori">잡담</a>
                    <a href="<c:url value='/post/write'/>" class="categori-write">글쓰기</a>
                    <a href="<c:url value='/post/postDetail?postIdx=${postDetail[0].postIdx}'/>" class="categori-right">다음글</a>
                    <a href="<c:url value='/post/postDetail?postIdx=${postDetail[2].postIdx}'/>" class="categori-right">이전글</a>
                    <a href="<c:url value='/post/postList'/>" class="categori-right">목록</a>
                </div>
                <div class="contents-wrap">
                    <div class="contents-header">
                        <div class="header1">
                            <span class="title">${postDetail[1].postTitle}</span>
                            <span class="time"><fmt:formatDate value="${postDetail[1].postRegDate}" type="date"
							pattern="yyyy.MM.dd" /></span>
                            <a herf="#" >
                                <img class="copy-url" src="/cobsp/images/copy--v1.png" alt="링크 주소복사 아이콘" title="주소복사">
                            </a>
                        </div>
                        <div class="header2">
                            <a href="#" class="imgSelect" data-id="id${postDetail[1].postIdx}">
                            	<img src="/cobsp/images/user.png"/>${postDetail[1].postWriter}
                            </a>
                            <div class="nick-box id1 display-none">
                                <ul>
                                    <li>작성글보기</li>
                                    <li>회원정보보기</li>
                                </ul>
                            </div>
                            <div class="contents-header-info">
                                <span class="commentsCnt">조회수 : ${postDetail[1].views}</span>
                                <span>좋아요 : ${postDetail[1].postLike}</span>
                                <span id="commCnt"></span>	<!-- 댓글 숫자 가져와야함 -->
                            </div>
                        </div>
                    </div>
                    <div class="contents-text">
                        ${postDetail[1].postContent}
                    </div>
                    <div class="contents-etc">
                        <div class="updown">
                            <div class="up" onclick='btn_down("like","post",${postDetail[1].postIdx},${ postDetail[1].memIdx })'>
                                <a><img src="https://img.icons8.com/material-rounded/24/4a90e2/facebook-like--v1.png"/></a>
                                <strong id="upresult" >${postDetail[1].postLike}</strong>
                            </div>
                            <div class="down" onclick='btn_down("dislike","post",${postDetail[1].postIdx},${ postDetail[1].memIdx })'>
                                <a><img src="https://img.icons8.com/material-rounded/24/fa314a/thumbs-down.png"/></a>
                                <strong id="downresult">${postDetail[1].postDislike}</strong>
                            </div>
                        </div>
                        <div class="icons-wrap">
                            <a><img onclick="btn_down('rep', 'post', ${ postDetail[1].postIdx },${ postDetail[1].memIdx })" src="https://img.icons8.com/ios/50/000000/siren.png"/></a>
                            <a><img src="https://img.icons8.com/wired/64/000000/paste.png"/></a>
                            <a><img src="https://img.icons8.com/material-outlined/24/000000/share.png"/></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="contents-crud">
                <a href="<c:url value='/post/write'/>" class="contents-c">글쓰기</a>
	            <c:if test="${ sessionScope.memIdx == postDetail[1].memIdx}">
	            	<a href="<c:url value='/post/postEdit?postIdx=${postDetail[1].postIdx}'/>" class="contents-u" >수정</a>
	                <a href="<c:url value='/post/postDelete?postIdx=${postDetail[1].postIdx}'/>" class="contents-d" onclick="return confirm('해당게시글을 삭제하시겠습니까?');">삭제</a>
	            </c:if>
                <a href="<c:url value='/post/postList'/>" class="contents-r">목록</a>
            </div>
            <!-- 댓글 영역 -->
            <div class="comments-wrap" id="comments">
                <div class="comments-best">
				<!-- 베스트 댓글 -->
                </div>
                <div class="comments">
                <!-- 댓글이 들어가는 장소 -->
                </div>
                <!-- 댓글 쓰기 -->
                <div class="comments-write">
                    <label>댓글 쓰기</label>
                    <div>
                    	<form id="commForm">
	                    	<textarea id="commText" class="write-comments" name="commContent" cols="100" rows="4" style="resize: none;" placeholder="댓글을 입력해주세요."></textarea>
	                        <input id="postIdx" type="hidden" name="postIdx" value="${postDetail[1].postIdx}">
	                        <input id="memIdx" type="hidden" name="memIdx" value="<c:out value="${sessionScope.memIdx}"/>">
	                        <input id="insert_comment" type="button" form="commForm" value="등록">
                    	</form>
                    </div>
                </div>
                <div class="comments-paging">
                    <a href="#"><span>첫 페이지</span></a>			
                    <a href="#">1</a>			
                    <a href="#">2</a>
                    <a href="#">3</a>	
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">6</a>
                    <a href="#">7</a>					
                    <a href="#"><span>끝 페이지</span></a>
                </div>
            </div>
        </div>
        <div class="control-bar">
            <a href="#top">⬆</a><br>
            <a href="#bottom">⬇</a><br>
            <a href="#comments">💬</a>
        </div>
    </div>
    <div id="#bottom">
    </div>
    <div id="test"></div>
    <script>
    	// 댓글 등록
		$('#insert_comment').on("click", function(){
			var params = $('#commForm').serialize();
			console.log(params);

			if($('#commText').val() == ''){
				alert('댓글 내용을 입력해주세요');
				return false;
			}
			$.ajax({
				url : '<c:url value="/comment/regComment"/>',
				type :"post",
				data : params,
				async: false,
				success : function(){
					alert('댓글이 등록되었습니다.');
					commentCount();
					showCommList();
					$('#commText').val('');
				},
				error : function(){
					alert("오류 발생!");
				}
			});
			
		});
		// 댓글 리스트 조회
		function showCommList(){
			var postIdx = $('#postIdx').val();
			console.log(postIdx);
			
			$.ajax({
				url : '<c:url value="/comment/commentList"/>',
				type : "post",
				data : {postIdx : postIdx},
				async: false,
				success : function(list){
					var htmls = "";
					
					if(list.length<1){
						htmls = "등록된 댓글이 없습니다.";
					}else{
						for(var i=0;i<list.length; i++){
							var date = new Date(list[i].commRegDate);
							var month = date.getMonth() + 1;
							var commRegDate = date.getFullYear() + ". " + month + ". " + date.getDate() + ". " + date.getHours() + ":" + date.getMinutes();
							
							htmls += '<ul><li><div id="id' + list[i].commIdx + '" class="id">';
							htmls += '<div class="comments-profile"><img src="https://img.icons8.com/ios/50/000000/cat-profile.png" ></div>';
							htmls += '<div class="comments-info">';
							htmls += '<a><img class="rank imgSelect" data-id="id' + list[i].commIdx + '" src="https://img.icons8.com/ios/50/fa314a/diamond.png" >' + list[i].commWriter;
					        htmls += '<div class="nick-box id' + list[i].commIdx + ' display-none"><ul><li>작성글보기</li><li>회원정보보기</li></ul></div></a>';
					        htmls += '<span class="date"> ' + commRegDate + ' </span>';
					        htmls += '<a class="add-recomments" data-recomments="comments2" onclick="btn_Recomment('+list[i].commIdx+')">답글쓰기</a>';
					        htmls += '<a href="javascript:void(0)" onclick="fn_editComment(' + list[i].commIdx + ', \'' + list[i].commWriter + '\', \'' + list[i].commContent + '\')"> 수정</a>';
					        htmls += '<a href="javascript:void(0)" onClick="fn_deleteComment(' + list[i].commIdx + ')"> 삭제<a>'
					        htmls += '<a><img onclick="btn_down(\'rep\', \'comment\', ' + list[i].commIdx + ', '+ list[i].memIdx +')" src="https://img.icons8.com/ios/50/000000/siren.png"/></a>';
					        htmls += '<button onclick="btn_down(\'dislike\', \'comment\', ' + list[i].commIdx + ',' + list[i].memIdx + ')" class="btn-dislike">비추천 : ' + list[i].commDislike +'</span></button>';
					        htmls += '<button onclick="btn_down(\'like\', \'comment\', '+ list[i].commIdx +',' + list[i].memIdx + ')" class="btn-like comm'+list[i].commIdx+'">추천 : ' + list[i].commLike +'</span></button>';
					        htmls += '<div class="comments-text">' + list[i].commContent.replaceAll("\r\n", "<br>") + '<div class="recommentdiv"></div></div></div></div></li></ul>';
						}
					}
					$('.comments').html(htmls);
					showRecomment();
				},
				error : function(){
					alert("오류 발생!");
				}
			});
		}
		// 베스트 댓글 조회
		function showBestComm(){
			var postIdx = $('#postIdx').val();
			
			$.ajax({
				url : '<c:url value="/comment/bestComment"/>',
				type : "post",
				data : {postIdx : postIdx},
				async: false,
				success : function(list){
					var htmls = '';
					if(list){
						var date = new Date(list.commRegDate);
						var month = date.getMonth()+1;
						var commRegDate = date.getFullYear() + ". " + month + ". " + date.getDate() + ". " + date.getHours() + ":" + date.getMinutes();
						
						htmls += '<div class="commemts-best-title"><span>베스트 댓글</span></div>';
						htmls += '<div><div class="comments-profile"><img src="https://img.icons8.com/ios/50/000000/nerd--v1.png" ></div>';
						htmls += '<div class="comments-info">';	
						htmls += '<a><img class="rank imgSelect" data-id="id' + list.commIdx + '" src="https://img.icons8.com/ios/50/fa314a/diamond.png">'+list.commWriter;
						htmls += '<div class="nick-box id display-none"><ul><li>작성글보기</li><li>회원정보보기</li></ul></div></a>';
						htmls += '<span class="date"> '+ commRegDate + '</span>';  
						htmls += '<a><img src="https://img.icons8.com/ios/50/000000/siren.png"/></a>';
						htmls += '<button class="btn-dislike">비추천 : ' + list.commDislike +'</button>';
						htmls += '<button class="btn-like">추천 : ' + list.commLike + '</button>'
	                    htmls += '<div class="comments-text">'+ list.commContent + '</div></div></div>';
					}
					else{
						htmls += '등록된 댓글이 없습니다.';
						
					}
					$('.comments-best').append(htmls);
				},
				error : function(){
					alert("베스트 댓글 조회 오류 발생!");
				}
			});
		}
		// 댓글 삭제
		function fn_deleteComment(commIdx){

			var msg = confirm("정말로 삭제하시겠습니까??");

			if(msg){
				$.ajax({
					url : '<c:url value="/comment/deleteComment"/>',
					type : "post",
					data : {commIdx : commIdx},
					async: false,
					success : function(){
						alert('해당 게시물을 삭제했습니다.');
						showCommList();
					},
					error : function(){
						alert('삭제중 오류발생');
					}
				});
			}
			else {
				return false;
			}
		}
		// 댓글 수정 폼
		function fn_editComment(commIdx,commWriter,commContent){
			var htmls = "";
			
			htmls += '<div class="recomments comments1">';
			htmls += '<label class="write">댓글 쓰기</label>';
			htmls += '<a href="javascript:void(0)" onclick="fn_updateComment(' + commIdx + ', \'' + commContent + '\')" style="padding-right:5px"> 저장</a>';
			htmls += '<a href="javascript:void(0)" onClick="showCommList()">취소<a>';
			htmls += '<div class="recomments-text">';
			htmls += '<br><textarea id="write-comments" class="write-comments" cols="50" rows="4">' + commContent + '</textarea></div></div>'
			
			$('#id' + commIdx + '').append(htmls);
		}
		
		// 댓글 수정
		function fn_updateComment(commIdx, commContent){
			var editContent = $('#write-comments').val();
			
			if($('#write-comments').val() == ''){
				alert('댓글 내용을 입력해주세요');
				return false;
			}
			
			$.ajax({
				url : '<c:url value="/comment/editComment"/>',
				type : "post",
				data : {commIdx : commIdx,
						commContent : editContent},
				async: false,
				success : function(){
					alert('해당 댓글을 수정했습니다.');
					showCommList();
				},
				error : function(){
					alert('수정 입력 중 오류발생');
				}
			});
		}
		// 대댓글 등록 폼
		function btn_Recomment(commIdx){
			htmls = '';
			htmls += '<div class="recomments comments2"><label class="write">댓글 쓰기</label><a class="remove-comments" onClick="showCommList()">닫기</a>';
	        htmls += '<div class="recomments-text"><textarea id="recomments'+commIdx+'" class="write-comments" cols="50" rows="4" placeholder="댓글을 입력해주세요."></textarea>';
	        htmls += '<input type="submit" onclick="btn_regRecomment('+commIdx+')" value="등록"></div></div>';
	        $('#id' + commIdx + '').append(htmls);
	        
		}
		// 대댓글 등록
		function btn_regRecomment(commIdx){
			$.ajax({
				url : '<c:url value="/recomment/regComment"/>',
				type : "post",
				data : { postIdx : ${postDetail[1].postIdx},
					commIdx : commIdx,
					memIdx : ${sessionScope.memIdx},
					recommContent : $('#recomments'+commIdx).val()
				},
				async: false,
				success : function(){
					alert('해당 대댓글을 작성했습니다.');
					showCommList();
				},
				error : function(){
					alert('대댓글 등록 중 오류발생');
				}
			});
		}
		// 대댓글 리스트 
		function showRecomment(){
			$.ajax({
				url : '<c:url value="/recomment/recommList"/>',
				type : "post",
				data : {postIdx : ${ postDetail[1].postIdx } },
				async: false,
				success : function(list){
					for(var i=0;i<list.length; i++){
						var date = new Date(list[i].recommRegDate);
						var recommRegDate = date.getFullYear() + ". " + date.getMonth() + ". " + date.getDate() + ". " + date.getHours() + ":" + date.getMinutes();
						var htmls = "";
						
						htmls += '<div id="id-re' + list[i].recommIdx + '" class="re-recomments"' + list[i].recommIdx + '>';
						htmls += '<img src="https://img.icons8.com/ios/50/000000/right3.png"/><div class="re-recomments-profile"><img src="https://img.icons8.com/ios/50/000000/cat-profile.png" ></div>';
						htmls += '<div class="re-comments-info">';
						htmls += '<a><img class="rank imgSelect" data-id="id' + list[i].recommIdx + '" src="https://img.icons8.com/ios/50/fa314a/diamond.png" >' + list[i].recommWriter;
				        htmls += '<div class="nick-box id' + list[i].recommIdx + ' display-none"><ul><li>작성글보기</li><li>회원정보보기</li></ul></div></a>';
				        htmls += '<span class="date"> ' + recommRegDate + '</span>';
				        htmls += '<a href="javascript:void(0)" onclick="fn_editRecomment(' + list[i].recommIdx + ', \'' + list[i].recommWriter + '\', \'' + list[i].recommContent + '\')"> 수정</a>';
				        htmls += '<a href="javascript:void(0)" onClick="fn_deleteRecomment(' + list[i].recommIdx + ')"> 삭제<a>'
				        htmls += '<a onclick="btn_down(\'rep\', \'recomment\', ' + list[i].recommIdx + ', '+ list[i].memIdx +')"><img src="https://img.icons8.com/ios/50/000000/siren.png"/></a>';
				        htmls += '<button onclick="btn_down(\'dislike\', \'recomment\', ' + list[i].recommIdx + ', ' + list[i].memIdx + ')" class="btn-dislike">비추천 : ' + list[i].recommDislike +'</span></button>';
				        htmls += '<button onclick="btn_down(\'like\', \'recomment\', ' + list[i].recommIdx + ', '+ list[i].memIdx +')" class="btn-like">추천 : ' + list[i].recommLike +'</span></button>';
				        htmls += '<div class="comments-text">' + list[i].recommContent.replaceAll("\r\n", "<br>") + '</div></div></div>';
						$('#id' + list[i].commIdx + ' .recommentdiv').append(htmls);
					}
					
				},
				error : function(){
					alert('대댓글 리스트 출력 중 오류발생');
				}
			});
		}
		// 대댓글 삭제
		function fn_deleteRecomment(recommIdx){

			var msg = confirm("정말로 삭제하시겠습니까??");

			if(msg){
				$.ajax({
					url : '<c:url value="/recomment/deleteRecomment"/>',
					type : "post",
					data : {recommIdx : recommIdx},
					async: false,
					success : function(){
						alert('해당 게시물을 삭제했습니다.');
						showCommList();
					},
					error : function(){
						alert('삭제중 오류발생');
					}
				});
			}
			else {
				return false;
			}
		}
		// 대댓글 수정 폼
		function fn_editRecomment(recommIdx,recommWriter,recommContent){
			var htmls = "";
			
			htmls += '<div class="recomments comments1">';
			htmls += '<label class="write">댓글 쓰기</label>';
			htmls += '<a href="javascript:void(0)" onclick="fn_updateRecomment(' + recommIdx + ', \'' + recommContent + '\')" style="padding-right:5px"> 저장</a>';
			htmls += '<a href="javascript:void(0)" onClick="showCommList()">취소<a>';
			htmls += '<div class="recomments-text">';
			htmls += '<br><textarea id="write-recomments" class="write-comments" cols="50" rows="4">' + recommContent + '</textarea></div></div>'
			
			$('#id-re' + recommIdx + '').append(htmls);
		}
		// 대댓글 수정
		function fn_updateRecomment(recommIdx, recommContent){
			var editContent = $('#write-recomments').val();
			
			if($('#write-comments').val() == ''){
				alert('댓글 내용을 입력해주세요');
				return false;
			}
			
			$.ajax({
				url : '<c:url value="/recomment/editRecomment"/>',
				type : "post",
				data : {recommIdx : recommIdx,
						recommContent : editContent},
				async: false,
				success : function(){
					alert('해당 댓글을 수정했습니다.');
					showCommList();
				},
				error : function(){
					alert('수정 입력 중 오류발생');
				}
			});
		}
    </script>
</body>
</html> 