drop table member1;
create table member1(
memIdx int not null auto_increment primary key,
memId varchar(20) unique key not null,
nickName varchar(20) unique key not null,
memPassword varchar(20) not null,
memName varchar(20) not null,
memBirth timestamp,
memGender varchar(10),
preferAddr varchar(255),
memTel varchar(15) not null,
memEmail varchar(40) not null,
memPhoto varchar(255) default 'photo.png',
memAuth varchar(10) not null default 'member' -- member, manager, ban, cafe
);

drop table post;
create table post(
postIdx int not null auto_increment primary key,
memIdx int not null,
postSort varchar(20) not null,
postWriter varchar(20) not null,
postTitle varchar(20) not null,
postContent text not null,
postRegDate timestamp not null default current_timestamp,
views int not null default 0,
postLike int not null default 0,
postDislike int not null default 0,
postRep int not null default 0,
constraint fk_memIdx foreign key(memIdx) references member1(memIdx)
);


drop table comment;
create table comment(
commIdx int auto_increment primary key,
postIdx int not null,
commContent text not null,
commRegDate timestamp not null default current_timestamp,
commLike int not null default 0,
commDislike int not null default 0,
commRep int not null default 0,
foreign key(postIdx) references post(postIdx)
);

drop table recomment;
create table recomment(
recommIdx int auto_increment primary key,
commIdx int not null,
recommContent text not null,
recommRegDate timestamp not null default current_timestamp,
recommLike int not null default 0,
recommDislike int not null default 0,
recommRep int not null default 0,
foreign key(commIdx) references comment(commIdx)
);

drop table gamegroup;
create table gamegroup(
 grpIdx int auto_increment primary key,
 memIdx int not null,
 grpPostDate timestamp not null default current_timestamp,
 grpPostEndDate timestamp not null,
 grpDate timestamp not null,
 grpPhoto varchar(255),
 grpContent text,
 grpMaxMem int,
 grpRegMem int,
 gameIdx int, -- 외래키로 가져와야함.
 constraint fk_memIdx foreign key(memIdx) references member1(memIdx),
 constraint fk_gameIdx foreign key(gameIdx) references gamelist(gameIdx)
);

drop table boardgamecafe;
CREATE TABLE `project`.`boardgamecafe` (
  `cafeIdx` INT NOT NULL auto_increment primary key,
  `memIdx` INT NOT NULL,
  `cafeName` VARCHAR(20) NOT NULL,
  `cafeAddress` VARCHAR(255) NOT NULL,
  `cafeTime` VARCHAR(20) NOT NULL,
  `stdFee` INT NOT NULL,
  `tenPerFee` INT NOT NULL,
  `fourTable` INT NOT NULL,
  `grpTable` INT NOT NULL,
  `cafeTel` TEXT NOT NULL,
  `cafeRating` INT NOT NULL default 0,
  constraint fk_memIdx_boardgamecafe foreign key(memIdx) references member1(memIdx)
);

drop table cafereview;
CREATE TABLE `project`.`cafereview` (
  `revIdx` INT NOT NULL auto_increment primary key,
  `cafeIdx` INT NOT NULL,
  `memIdx` INT NOT NULL,
  `revContent` TEXT NOT NULL,
  `revRegDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `revRating` INT NOT NULL,
  constraint fk_cafeIdx_cafereview foreign key(cafeIdx) references boardgamecafe(cafeIdx),
  constraint fk_memIdx_cafereview foreign key(memIdx) references member1(memIdx)
  );
  
  drop table gamelist;
  create table project.gamelist(
    gameIdx int auto_increment primary key,
    gameName varchar(50) not null,
    gameSort varchar(20) not null,
    gamePerson varchar(30) ,
    gameTime varchar(30) ,
    gameLmtAge int,
    gamePublisher varchar(30),
    gamePubDate varchar(20),
    gamePhoto varchar(255) default 'photo.png',
    gameIntro text ,
    gameRule text not null,
    gameVideo text 
);

drop table gamereview;
CREATE TABLE `project`.`gamereview` (
  `revIdx` INT NOT NULL auto_increment primary key,
  `gameIdx` INT NOT NULL,
  `memIdx` INT NOT NULL,
  `revContent` TEXT NOT NULL,
  `revRegDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `revRating` INT NOT NULL,
  constraint fk_gameIdx_gamereview foreign key(gameIdx) references gamelist(gameIdx),
  constraint fk_memIdx_gamereview foreign key(memIdx) references member1(memIdx)
  );
  
  drop table prefergame;
  CREATE TABLE `prefergame` (
  `gameIdx` int DEFAULT NULL,
  `memIdx` int DEFAULT NULL,
  CONSTRAINT `fk_gameIdx_prefergame` FOREIGN KEY (`gameIdx`) REFERENCES `gamelist` (`gameIdx`),
  CONSTRAINT `fk_memIdx_prefergame` FOREIGN KEY (`memIdx`) REFERENCES `member1` (`memIdx`)
);

drop table owngame;
  CREATE TABLE `owngame` (
  `gameIdx` int DEFAULT NULL,
  `cafeIdx` int DEFAULT NULL,
  CONSTRAINT `fk_gameIdx_owngame` FOREIGN KEY (`gameIdx`) REFERENCES `gamelist` (`gameIdx`),
  CONSTRAINT `fk_cafeIdx_owngame` FOREIGN KEY (`cafeIdx`) REFERENCES `boardgamecafe` (`cafeIdx`)
);

drop table groupreg;
CREATE TABLE `project`.`groupreg` (
  `grpRegIdx` INT NOT NULL,
  `memIdx` INT not NULL,
  `grpIdx` INT not NULL,
  `grpRegDate` TIMESTAMP not NULL DEFAULT current_timestamp,
  `grpConfirm` TINYINT not NULL DEFAULT 0,
  PRIMARY KEY (`grpRegIdx`),
  CONSTRAINT `fk_memIdx_groupreg` FOREIGN KEY (`memIdx`) REFERENCES `project`.`member1` (`memIdx`),
  CONSTRAINT `fk_grpIdx_groupreg` FOREIGN KEY (`grpIdx`) REFERENCES `project`.`gamegroup` (`grpIdx`)
);

update gamegroup set grpRegMem = grpRegMem + 1 where grpIdx=1; -- 참가자가 모임에 참가했을 때 현재 정원 증가
update gamegroup set grpRegMem = grpRegMem - 1 where grpIdx=1; -- 참가자가 모임에서 빠졌을 때 현재 정원 감소



select * from post;
select * from post limit 2; -- 제한 2개
select * from post where postTitle like '%가%';	-- 제목으로 찾기
select * from post where postTitle like '%두%' or postContent like '%파%';	-- 제목, 내용으로 검색
select * from member1 where nickName like '%3%';	-- 닉네임으로 검색
select * from post where postRep>=20;	-- 신고 20이상 찾기
select * from post where postLike>=20;	-- 좋아요 20이상 찾기 / 인기게시글
select * from member1 where nickName = 'park';	-- 닉네임으로 쓴 글 리스트 보여주기
select * from member1 where nickName = (select postWriter from post where postIdx=2);	-- 게시글 번호로 닉네임찾고 정보찾기
update post set views = views + 1 where postIdx=2;	-- 뷰 좋아요 싫어요 신고 증가
update post set postTitle='수정하고 싶은 게시글 제목 수정', postContent='수정하고 싶은 게시글 내용 수정', postSort='카테고리 수정'
where postIdx = 5;	-- 해당 게시글 수정
delete from post where postIdx=1;	-- 해당 게시글 삭제



select * from comment;
select * from comment where postIdx=6;	-- 해당 게시글 댓글 리스트
select count(*) from comment where postIdx=6;	-- 게시글 댓글 숫자
update comment set commContent = '수정된 댓글입니다.ㅎㅎㅎ' where commIdx=6;	-- 게시글 해당 댓글 수정
update comment set commLike = commLike + 1  where commIdx=6;	-- 좋아요 버튼 클릭시 증가
update comment set commDislike = commDislike + 1  where commIdx=6;	-- 싫어요 버튼 클릭시 증가
update comment set commRep = commRep + 1  where commIdx=6;	-- 신고 버튼 클member1member릭시 증가
delete from comment where commIdx=4;	-- 해당 commIdx로 삭제

select * from recomment;
select * from recomment where commIdx = 6;	-- commIdx 댓글 인덱스로 대댓글 찾기

update recomment set recommContent = '수정된 대댓글입니다.' where recommIdx=6;	-- 게시글 댓글 수정
update recomment set recommLike = recommLike + 1  where recommIdx=6;	-- 좋아요 버튼 클릭시 증가
update recomment set recommDislike = recommDislike + 1  where recommIdx=6;	-- 싫어요 버튼 클릭시 증가
update recomment set recommRep = recommRep + 1  where recommIdx=6;	-- 신고 버튼 클릭시 증가

delete from recomment where recommIdx=4;	-- 해당 recommIdx로 삭제


insert into member1 (memId, nickName, memPassword, memName, memBirth, memGender, memAddress, memTel, memEmail, memPhoto) value (
'memId1', 'nickName1', 'password', 'name',  '2021-12-20', true, 'address', 'memTel', 'memEmail', 'memPhoto');

-- 추후 : 예약, 쪽지