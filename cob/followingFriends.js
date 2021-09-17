//친구 리스트 불러오기
function getFriendList(){
    var friendList = null;
    var url = '<c:url value="/members/"/>'+'${loginInfo.memIdx}'+"/friends/following";
    $.ajax({
        url: url,
        type : 'get',
        data : {memIdx : '${loginInfo.memIdx}'},
        dataType: 'json',
        async: false,
        success : function(data) {
            friendList = data;
            $('#table_friend').empty();
            $.each(data, function(index, item){
                if(index > 2) {return false};
                var html = '<tr>';
                html += '<td class="friend_memPhoto">'
                html += '<div class="friend_profile_frame">'
                html += '<img class="friend_photo" src="<c:url value="/uploadfile/member/"/>'+item.memPhoto+'">'
                html += '</div>'
                   html += '</td>'
                   html += '<td class="friend_nickname">'+item.nickName+'</td>'
                   html += '<td><button class="btn_read_friend" data-friend="'+item.memIdx+'">정보 보기</button></td>'
                   html += '</tr>'
                       
                   $('#table_friend').append(html);
                });	
            
            

        },
        error : function(request, status, error) {
            alert('서버 통신에 문제가 발생했습니다. 다시 실행해주세요.');
            console.log(request);
            console.log(status);
            console.log(error);
        }
    });
    
    $('.btn_read_friend').on('click', function(){
        $('#area_friend_info').removeClass('display_none');
        var frIdx = $(this).attr('data-friend');
        
        var friend = friendList.find((friend) => {
            return friend.memIdx == frIdx;
        });
        
        var memPhoto = friend.memPhoto;
        $('#friend_info_profile_frame').html('<img class="photo" src="<c:url value="/uploadfile/member/"/>'+friend.memPhoto+'">')
        $('#friend_nickName').html(friend.nickName);
        $('#friend_memBirth').html(friend.memBirth);
        $('#friend_memGender').html(friend.memGender);
        $('#friend_preferAddr').html(friend.preferAddr);
        if(friend.friendChk>0){
            $('#btn_delete_friend').attr('data-friend', frIdx);		
            $('#btn_delete_friend').removeClass('display_none');
            $('#btn_reg_friend').addClass('display_none');
        } else {
            $('#btn_reg_friend').attr('data-friend', frIdx);
            $('#btn_reg_friend').removeClass('display_none');
            $('#btn_delete_friend').addClass('display_none');
        }
        $('#btn_send_msg').attr('data-friend', frIdx);
    });
    
    return friendList;
}