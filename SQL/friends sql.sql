SELECT * FROM project.friends;

insert into project.friends (memIdxFollow, memIdxFollowing) value(4, 12);

select *, (select count(*) from friends where memIdxFollow = 12 and memIdxFollowing = 10) as followingChk
 , (select count(*) from friends where memIdxFollow = 10 and memIdxFollowing = 12) as followChk from member1 m where memIdx = 10;
 
select *, (select count(*) from project.friends f where m.memIdx = f.memIdxFollow and memIdxFollowing = 12) as followChk 
		from project.member1 m where preferAddr = "서울 도봉구"; 
-- 서울 도봉구를 선호지역으로 선택한 회원 정보 + 12번을 팔로우하고 있는지 여부.

select *, (select count(*) from project.friends f where m.memIdx = f.memIdxFollow and memIdxFollowing = 12) as followChk from project.member1 m join project.friends f where m.memIdx=f.memIdxFollowing and f.memIdxFollow = 12;
-- 12번"이" 팔로우 하고 있는 친구의 목록을 프렌드에서 보여달라. + 맞팔하고 있는지 여부

select *, (select count(*) from project.friends f where m.memIdx = f.memIdxFollow and memIdxFollowing = 12) as followChk from project.member1 where memIdx = any (select memIdxFollow from project.friends where memIdxFollowing = 12);
-- 12번"을" 팔로우 하고 있는 친구의 목록을 프렌드에서 보여달라.

