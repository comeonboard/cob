<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty loginInfo}">
   <script>
   let loginmemIdx = null;
   </script>
</c:if>   
<c:if test="${!empty loginInfo}">
   <script>
   let loginmemIdx = ${loginInfo.memIdx};
   </script>
</c:if>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Come on, Board : 상세 게시글</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>
</head>
<link rel="stylesheet" href="/cob/css/postDetail.css">
<link rel="stylesheet" href="/cob/css/postList.css">
<script src="https://code.jquery.com/jquery-1.12.4.js" 
integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" 
crossorigin="anonymous">
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script >
    $(document).ready(function(){
		commentCount();
		showBestComm();
		let page = 1;
    	showCommList(1);
    	
/*     	$('#naverSearch').click(function(){
    		var searchkeyword = $('#searchkeyword').val();
    		naverSearch(searchkeyword);
    	}) */
    	
    	shareKakao();	// 카카오 초기 호출
    	bringPostList();
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
    /* function naverSearch(searchkeyword){
    	$.ajax({
			url : '<c:url value="/craw/crawling_ajax"/>',    			
			type : "post",
			async : false,
			data : { keyword : searchkeyword },
			success : function(data){
				const obj = JSON.parse(data);
				console.log(obj.items[0].link);
				console.log(obj.items[0].title);
			},
			error : function(){
				alert("오류발생");
			}
		});
    } */
    
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
                    webUrl : "http://localhost:8080/cob/post/postDetail?postIdx=${postDetail[1].postIdx}"
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
 		if( loginmemIdx == null){
 			alert('로그인이 필요합니다.');
 			return false;
 		}
 		if( memIdx == loginmemIdx){
 			alert('작성자는 누를 수 없습니다!');
 		}else{
 			$.ajax({
 	 			url : '<c:url value="/check/addLike"/>',
 				type : "post",
 				data : { type : type,
 					tableType : tableType,
 					idx : idx,
 					memIdx : loginmemIdx
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
 					location.reload();
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
	function bringPostList(){
		$("#test").load("<c:url value='/post/postList'/> #content");
    }
</script>
<!-- <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style> -->
<body>
	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<!-- <div class="map_wrap">
	    <div id="map" style="width:80%;height:100%;position:relative;overflow:hidden;"></div>
	
	    <div id="menu_wrap" class="bg_white">
	        <div class="option">
	            <div>
	                <form onsubmit="searchPlaces(); return false;">
	                    키워드 : <input type="text" value="보드게임" id="keyword" size="15"> 
	                    <button type="submit">검색하기</button> 
	                </form>
	            </div>
	        </div>
	        <hr>
	        <ul id="placesList"></ul>
	        <div id="pagination"></div>
	    </div>
	</div> -->
<!-- <script>
//마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <a href="#" onclick="naverSearch(\''+ places.place_name +'\')"><h5>' + places.place_name + '</h5></a>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script> -->

<!-- 	<div id="searchKeyword">
		<input id="searchkeyword" type="text">
		<button id="naverSearch">검색</button>
	</div> -->
	<div class="Wrapper">
        <div class="WritingWrap">
            <div class="contents">
                <div class="board_header">
                    <h3><a href="<c:url value='/post/postList'/>">COB 게시판</a></h3>
                    <a href="<c:url value='post/postList'/>" class="categori">잡담</a>
                    <c:if test="${ !empty loginInfo }">
                    	<a href="<c:url value='/post/write'/>" class="categori-write">글쓰기</a>
                    </c:if>
                    <a href="<c:url value='/post/postDetail?postIdx=${postDetail[0].postIdx}'/>" class="categori-right">다음글</a>
                    <c:if test="${ !empty postDetail[2] }">
                    	<a href="<c:url value='/post/postDetail?postIdx=${postDetail[2].postIdx}'/>" class="categori-right">이전글</a>
                    </c:if>
                    <a href="<c:url value='/post/postList'/>" class="categori-right">목록</a>
                </div>
                <div class="contents-wrap">
                    <div class="contents-header">
                        <div class="header1">
                            <span class="title">${postDetail[1].postTitle}</span>
                            <span class="time"><fmt:formatDate value="${postDetail[1].postRegDate}" type="date"
							pattern="yyyy.MM.dd" /></span>
                            <a herf="#">
                                <img class="copy-url" src="/cob/images/copy--v1.png" alt="링크 주소복사 아이콘" title="주소복사">
                            </a>
                        </div>
                        <div class="header2">
                            <a class="imgSelect" data-id="post${postDetail[1].postIdx}">
                            	<img src="<c:url value="/uploadfile/member/${postDetail[1].memPhoto}"/>"/>
                            </a>
                            <h3>${postDetail[1].postWriter}</h3>
                            <div class="nick-box post${postDetail[1].postIdx} display-none">
                                <ul>
                                    <li><a href="<c:url value='/post/searchList1?memIdx=${postDetail[1].memIdx}'/>">작성글보기</a></li>
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
                            <img onclick="btn_down('rep', 'post', ${ postDetail[1].postIdx },${ postDetail[1].memIdx })" class="rep" src="https://img.icons8.com/ios/50/000000/siren.png"/>
                            <!-- 카카오 공유 -->
							<img id="btnKakao" class="btn px-1" src="/cob/images/kakao_logo.png" alt="카카오톡 공유">
							<!-- facebook 공유 -->
							<img id="shareFacebook" onclick="shareFacebook()" src="/cob/images/facebook_logo.png" alt="페이스북 공유">
							<!-- 트위터 공유 -->
							<img id="shareTwitter" onclick="shareTwitter()" src="/cob/images/twitter_logo.png" alt="트위터 공유">
							<!-- 네이버 공유 -->
							<img id="shareNaver" onclick="shareNaver()" src="/cob/images/naverblog_logo.png" alt="네이버 공유하기">
							<form id="myform" style="display:none">
								<input type="hidden" id="url" value="https://marsland.tistory.com/471"><br/>
								<input type="hidden" id="title" value="${ postDetail[1].postTitle }"><br/>
							</form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="contents-crud">
            	<c:if test="${ !empty loginInfo }">
                    <a href="<c:url value='/post/write'/>" class="contents-c">글쓰기</a>
                </c:if>
	            <c:if test="${ loginInfo.memIdx == postDetail[1].memIdx}">
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
	                    	<textarea id="commText" class="write-comments" name="commContent" cols="95" rows="4" style="resize: none;" placeholder="댓글을 입력해주세요."></textarea>
	                        <input id="postIdx" type="hidden" name="postIdx" value="${postDetail[1].postIdx}">
	                        <input id="memIdx" type="hidden" name="memIdx" value="${loginInfo.memIdx}">
	                        <input id="insert_comment" type="button" form="commForm" value="등록">
                    	</form>
                    </div>
                </div>
                <div class="comments-paging">
                </div>
            </div>
            <div id="test">
			</div>
        </div>
        <div class="control-bar">
            <a href="#top">⬆</a><br>
            <a href="#bottom">⬇</a><br>
            <a href="#comments">💬</a>
        </div>
    </div>
    <script>
    	// 댓글 등록
    	$('#insert_comment').on("click", function(){
    		if(loginmemIdx==null){
    			alert('로그인이 필요합니다');
    			$('#commText').val('');
    			return false;
    		}else{
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
        				alert("댓글 등록 중 오류 발생!");
        			}
        		});
    		}
    	});
		/* // 댓글 리스트 조회
		function showCommList(pageNum){
			var postIdx = $('#postIdx').val();
			console.log(pageNum);
			$.ajax({
				url : '<c:url value="/comment/commentList1"/>',
				type : "post",
				data : {postIdx : postIdx,
						page : pageNum
				},
				dataType:"json",
				async: false,
				success : function(data){
					var htmls = "";
					var page = data.page;
					var startpage = data.startpage;
					var endpage = data.endpage;
					var list = data.List;
					
					$.each(list, function(key,value){
						console.log("data : " + list);
						console.log(list);
		                console.log(page + "," + startpage + "," + endpage);
		                console.log("start : " + startpage);
		                console.log("end : " + endpage);
		                htmls += '<div class="commentArea" style="boarder-bottom:1px solid darkgray; margin-bottom: 15px;">';
		                htmls += '<div class="commentInfo'+value.commIdx+'">'+'댓글번호 : '+value.commIdx+' / 작성자 : '+value.mem_id;
		                htmls += '<a onclick="commentUpdate('+value.commIdx+',\''+value.commContent+'\');"> 수정 </a>';
						htmls += '<a onclick="commentDelete('+value.commIdx+');"> 삭제 </a> </div>';
		                htmls += '<div class="commentContent'+value.commIdx+'"> <p> 내용 : '+value.commContent +'</p>';
		                htmls += '</div></div>';

					})
					for (var num=startpage; num<=endpage; num++) {
		                 if (num == page) {
		                      htmls += '<a href="#" onclick="showCommList(' + num + '); return false;" class="page-btn">' + num + '</a>';
		                 } else {
		                      htmls += '<a href="#" onclick="showCommList(' + num + '); return false;" class="page-btn">' + num + '</a>';
		                 }
		              }
					$('.comments').html(htmls);
				},
				error : function(){
					alert("오류 발생!");
				}
			});
		} */
		// 댓글 리스트 조회
 		function showCommList(pageNum){
			var postIdx = $('#postIdx').val();
			//console.log(pageNum);
			$.ajax({
				url : '<c:url value="/comment/commentList"/>',
				type : "post",
				data : {postIdx : postIdx,
					page : pageNum
			},
			dataType:"json",
			async: false,
			success : function(data){
					var htmls = "";
					var pagehtmls = "";
					var page = data.page;
					var startpage = data.startpage;
					var endpage = data.endpage;
					var list = data.List;
					
					if(list.length<1){
						htmls = "등록된 댓글이 없습니다.";
					}else{
						$.each(list, function(key,value){
							//var date = new Date(value.commRegDate);
							//var month = date.getMonth() + 1;
							//var commRegDate = date.getFullYear() + ". " + month + ". " + date.getDate() + ". " + date.getHours() + ":" + date.getMinutes();
						
							//console.log("data : " + list);
							//console.log(list);
			                //console.log(page + "," + startpage + "," + endpage);
			                //console.log("start : " + startpage);
			                //console.log("end : " + endpage);
			                htmls += '<ul><li><div id="comm' + value.commIdx + '" class="id">';
							htmls += '<div class="comments-profile"><img src="<c:url value="/uploadfile/member/'+value.memPhoto+'"/>" ></div>';
							htmls += '<div class="comments-info">';
							htmls += '<a><img class="rank imgSelect" data-id="comm' + value.commIdx + '" src="https://img.icons8.com/ios/50/fa314a/diamond.png" >' + value.commWriter;
					        htmls += '<div class="nick-box comm' + value.commIdx + ' display-none"><ul><li><a href="<c:url value="/post/searchList1?memIdx='+value.memIdx+'"/>">작성글보기</a></li><li>회원정보보기</li></ul></div></a>';
					        htmls += '<span class="date"> ' + value.commRegDate + ' </span>';
					        if(loginmemIdx != null){
					        	htmls += '<a class="add-recomments" data-recomments="comments2" onclick="btn_Recomment('+value.commIdx+')">답글쓰기</a>';
					        }
					        if(loginmemIdx == value.memIdx){
					        	htmls += '<a href="javascript:void(0)" onclick="fn_editComment(' + value.commIdx + ', \'' + value.commWriter + '\', \'' + value.commContent + '\')"> 수정</a>';
						        htmls += '<a href="javascript:void(0)" onClick="fn_deleteComment(' + value.commIdx + ')"> 삭제<a>'
					        }
					        htmls += '<a><img onclick="btn_down(\'rep\', \'comment\', ' + value.commIdx + ', '+ value.memIdx +')" class="rep" src="https://img.icons8.com/ios/50/000000/siren.png"/></a>';
					        htmls += '<button onclick="btn_down(\'dislike\', \'comment\', ' + value.commIdx + ',' + value.memIdx + ')" class="btn-dislike">비추천 : ' + value.commDislike +'</span></button>';
					        htmls += '<button onclick="btn_down(\'like\', \'comment\', '+ value.commIdx +',' + value.memIdx + ')" class="btn-like comm'+value.commIdx+'">추천 : ' + value.commLike +'</span></button>';
					        htmls += '<div class="comments-text">' + value.commContent.replaceAll("\r\n", "<br>") + '<div class="recommentdiv"></div></div></div></div></li></ul>';
						})
						for (var num=startpage; num<=endpage; num++) {
			                 if (num == page) {
			                	 pagehtmls += '<b>' + num + ' </b>';
			                 } else {
			                	 pagehtmls += '<a href="#" onclick="showCommList(' + num + '); return false;" class="page-btn">' + num + ' </a>';
			                 }
			              }
						$('.comments').html(htmls);
						$('.comments-paging').html(pagehtmls);
						showRecomment();
					}
				},
				error : function(){
					alert("오류 발생!");
				}
			})
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
						htmls += '<div><div class="comments-profile"><img src="/cob/uploadfile/member/'+ list.memPhoto +'" ></div>';
						htmls += '<div class="comments-info">';	
						htmls += '<a><img class="rank imgSelect" data-id="id' + list.commIdx + '" src="https://img.icons8.com/ios/50/fa314a/diamond.png">'+list.commWriter;
						htmls += '<div class="nick-box id display-none"><ul><li>작성글보기</li><li>회원정보보기</li></ul></div></a>';
						htmls += '<span class="date"> '+ commRegDate + '</span>';  
						htmls += '<a><img class="rep" src="https://img.icons8.com/ios/50/000000/siren.png"/></a>';
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
			
			htmls += '<div class="editRecomments comments1">';
			htmls += '<label class="write">댓글 쓰기</label>';
			htmls += '<a href="javascript:void(0)" onclick="fn_updateComment(' + commIdx + ', \'' + commContent + '\')" style="padding-right:5px"> 저장</a>';
			htmls += '<a href="javascript:void(0)" onClick="showCommList()">취소<a>';
			htmls += '<div class="recomments-text">';
			htmls += '<br><textarea id="write-comments" class="write-comments" cols="50" rows="4" style="resize:none;">' + commContent + '</textarea></div></div>'
			
			$('#comm' + commIdx + '').append(htmls);
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
			htmls += '<div class="editRecomments comments2"><label class="write">댓글 쓰기</label><a class="remove-comments" onClick="showCommList()">닫기</a>';
	        htmls += '<div class="recomments-text"><textarea id="recomments'+commIdx+'" class="write-comments" cols="50" rows="4" placeholder="댓글을 입력해주세요."></textarea>';
	        htmls += '<input type="submit" onclick="btn_regRecomment('+commIdx+')" value="등록"></div></div>';
	        $('#comm' + commIdx + '').append(htmls);
	        
		}
		// 대댓글 등록
		function btn_regRecomment(commIdx){
			$.ajax({
				url : '<c:url value="/recomment/regComment"/>',
				type : "post",
				data : { postIdx : ${postDetail[1].postIdx},
					commIdx : commIdx,
					memIdx : loginmemIdx,
					recommContent : $('#recomments'+commIdx).val()
				},
				async: false,
				success : function(){
					alert('대댓글을 등록했습니다.');
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
						
						htmls += '<div id="id-re' + list[i].recommIdx + '" class="recomments"' + list[i].recommIdx + '>';
						htmls += '<img src="https://img.icons8.com/ios/50/000000/right3.png"/><div class="recomments-profile"><img src="<c:url value="/uploadfile/member/'+list[i].memPhoto+'"/>" ></div>';
						htmls += '<div class="re-comments-info">';
						htmls += '<a><img class="rank imgSelect" data-id="recomm' + list[i].recommIdx + '" src="https://img.icons8.com/ios/50/fa314a/diamond.png" >' + list[i].recommWriter;
				        htmls += '<div class="nick-box recomm' + list[i].recommIdx + ' display-none"><ul><li><a href="<c:url value="/post/searchList1?memIdx='+list[i].memIdx+'"/>">작성글보기</a></li><li>회원정보보기</li></ul></div></a>';
				        htmls += '<span class="date"> ' + recommRegDate + '</span>';
				        if(loginmemIdx == list[i].memIdx){
				        	htmls += '<a href="javascript:void(0)" onclick="fn_editRecomment(' + list[i].recommIdx + ', \'' + list[i].recommWriter + '\', \'' + list[i].recommContent + '\')"> 수정</a>';
					        htmls += '<a href="javascript:void(0)" onClick="fn_deleteRecomment(' + list[i].recommIdx + ')"> 삭제<a>'
				        }
				        htmls += '<a onclick="btn_down(\'rep\', \'recomment\', ' + list[i].recommIdx + ', '+ list[i].memIdx +')"><img class="rep" src="https://img.icons8.com/ios/50/000000/siren.png"/></a>';
				        htmls += '<button onclick="btn_down(\'dislike\', \'recomment\', ' + list[i].recommIdx + ', ' + list[i].memIdx + ')" class="btn-dislike">비추천 : ' + list[i].recommDislike +'</span></button>';
				        htmls += '<button onclick="btn_down(\'like\', \'recomment\', ' + list[i].recommIdx + ', '+ list[i].memIdx +')" class="btn-like">추천 : ' + list[i].recommLike +'</span></button>';
				        htmls += '<div class="recomments-text">' + list[i].recommContent.replaceAll("\r\n", "<br>") + '</div></div></div>';
						$('#comm' + list[i].commIdx + ' .recommentdiv').append(htmls);
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
			
			htmls += '<div class="editRecomments comments1">';
			htmls += '<label class="write">댓글 쓰기</label>';
			htmls += '<a href="javascript:void(0)" onclick="fn_updateRecomment(' + recommIdx + ', \'' + recommContent + '\')" style="padding-right:5px"> 저장</a>';
			htmls += '<a href="javascript:void(0)" onClick="showCommList()">취소<a>';
			htmls += '<div class="recomments-text">';
			htmls += '<br><textarea id="write-recomments" class="write-comments" cols="50" rows="4" style="width:100%; resize:none">' + recommContent + '</textarea></div></div>'
			
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