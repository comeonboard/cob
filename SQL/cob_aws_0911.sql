
-- 멤버 
drop table project.member1;
create table project.member1(
memIdx int not null auto_increment primary key,
memId varchar(20) unique key not null,
nickName varchar(20) unique key not null,
memPassword varchar(20) not null,
memName varchar(20) not null,
memBirth timestamp,
memGender varchar(10),
preferAddr varchar(255),
memPoint int,
memTel varchar(15) not null,
memEmail varchar(40) not null,
memPhoto varchar(255) default 'default.png',
memAuth varchar(10) not null default 'member' -- member, manager, ban, cafe
);

-- 친구 
drop table project.friends;
create table project.friends(
memIdxFollow int,
memIdxFollowing int,
agreement boolean default true,
constraint fk_memIdxFollow foreign key(memIdxFollow) references member1(memIdx),
constraint fk_memIdxFollowing foreign key(memIdxFollowing) references member1(memIdx)
);

-- 보유 게임
drop table project.owngame;
  CREATE TABLE project.`owngame` (
  `gameIdx` int DEFAULT NULL,
  `cafeIdx` int DEFAULT NULL,
  CONSTRAINT `fk_gameIdx_owngame` FOREIGN KEY (`gameIdx`) REFERENCES `gamelist` (`gameIdx`),
  CONSTRAINT `fk_cafeIdx_owngame` FOREIGN KEY (`cafeIdx`) REFERENCES `boardgamecafe` (`cafeIdx`)
);

  -- 선호 게임
  drop table project.prefergame;
  CREATE TABLE project.`prefergame` (
  `gameIdx` int DEFAULT NULL,
  `memIdx` int DEFAULT NULL,
  CONSTRAINT `fk_gameIdx_prefergame` FOREIGN KEY (`gameIdx`) REFERENCES `gamelist` (`gameIdx`),
  CONSTRAINT `fk_memIdx_prefergame` FOREIGN KEY (`memIdx`) REFERENCES `member1` (`memIdx`)
);

-- ------------------------------------------종원 ------------------------------------

create table project.post(
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
drop table post;
select * from post;

create table project.comment(
commIdx int auto_increment primary key,
memIdx int not null,
postIdx int not null,
commContent text not null,
commRegDate timestamp not null default current_timestamp,
commLike int not null default 0,
commDislike int not null default 0,
commRep int not null default 0,
foreign key(memIdx) references member1(memIdx),
foreign key(postIdx) references post(postIdx)
);
drop table comment;
select * from comment;

create table project.recomment(
recommIdx int auto_increment primary key,
memIdx int not null,
postIdx int not null,
commIdx int not null,
recommContent text not null,
recommRegDate timestamp not null default current_timestamp,
recommLike int not null default 0,
recommDislike int not null default 0,
recommRep int not null default 0,
foreign key(memIdx) references member1(memIdx),
foreign key(commIdx) references comment(commIdx),
foreign key(postIdx) references post(postIdx)
);
drop table recomment;
select * from recomment;

-- 좋아요 싫어요 신고 체크 테이블
create table project.checklike(
type varchar(20) not null,
tableType varchar(20) not null,
idx int not null,
memIdx int not null
);
drop table checklike;
select * from checklike;

-- ------------------------------------------상명 ------------------------------------

drop table gamelist;
  create table project.gamelist(
    gameIdx int auto_increment primary key,
    gameName varchar(50) unique not null,
    gameSort varchar(20) not null,
    gamePerson varchar(30) ,
    gameTime varchar(30) ,
    gameLmtAge varchar(10),
    gamePublisher varchar(30),
    gamePubDate varchar(20),
    gamePhoto varchar(255) default 'photo.png',
    gameIntro text ,
    gameRule text not null,
    gameVideo text, 
    gamePrcie int default 1000
);

select count(*) from gamelist where  gameidx > 0;
select * from gamelist;
delete from gamelist where gameidx=17;
      select a.* 
      from ( 
      select gl.gameIdx, gl.gamename, gl.gamesort, 
      gl.gamePerson, gl.gameTime, 
      gl.gameLmtAge, gl.gamePhoto, 
      avg(gr.revRating) as avg
      from gamelist gl left outer join gamereview gr 
      on gl.gameidx = gr.gameIdx 
      group by gl.gameidx) a
      where a.gamename = '';

SELECT count(*)
         FROM gamelist where gameidx>0;
   
         SELECT count(*)
         FROM gamelist where gameidx>0;
    select gl.gameIdx, gl.gamename, gl.gamesort, gl.gamePerson, gl.gameTime, 
   gl.gameLmtAge, gl.gamePhoto, avg(gr.revRating) as avg
   from gamelist gl left outer join gamereview gr 
   on gl.gameidx = gr.gameIdx
   group by gl.gameidx
   order by gl.gameIdx desc;

   
drop table gamereview;
CREATE TABLE project.gamereview (
  `revIdx` INT NOT NULL auto_increment primary key,
  `gameIdx` INT NOT NULL ,
  `memIdx` INT NOT NULL,
  `revContent` varchar(80) NOT NULL,
  `revRegDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `revRating` INT NOT NULL,
  constraint fk_gameIdx_gamereview foreign key(gameIdx) references gamelist(gameIdx) on delete cascade,
  constraint fk_memIdx_gamereview foreign key(memIdx) references member1(memIdx) on delete cascade
  );
  
select * from gamereview order by revidx desc ;
select * from gamereview limit 0,3;
select * from gamereview g , member1 m  where g.memidx = m.memidx;
delete from gamereview where revIdx = 16 and memidx=1;
update gamereview set revRating =1 , revContent ="업데이트 테스트~" where revidx = 28;
select @ROWNUM:=@ROWNUM+1 AS ROWNUM,A.* FROM gamelist A, (SELECT @ROWNUM:=0) R order by gameIdx desc;

drop table project.orderlist;
CREATE TABLE `project`.`orderlist`(
`cusIdx` int not null auto_increment primary key,
`memIdx` int not null,
`gameIdx` int not null,
`memName` varchar(20) not null,
`gamePrice` int not null,
`shipAddess` varchar(80) NOT NULL,
`phoneNum` varchar(20) NOT NULL,
`orderDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_memIdx_customer` FOREIGN KEY (`memIdx`) REFERENCES `project`.`member1` (`memIdx`),
  CONSTRAINT `fk_gameIdx_customer` FOREIGN KEY (`gameIdx`) REFERENCES `project`.`gamelist` (`gameIdx`)
);
-- ------------------------------------------재훈 ------------------------------------

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
  `cafeThumbnail` VARCHAR(255),
  constraint fk_memIdx_boardgamecafe foreign key(memIdx) references member1(memIdx)
);

CREATE TABLE `project`.`cafereview` (
  `revIdx` INT NOT NULL auto_increment primary key,
  `cafeIdx` INT NOT NULL,
  `memIdx` INT NOT NULL,
  `revContent` TEXT NOT NULL,
  `revRegTimestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `revRating` INT NOT NULL,
  constraint fk_cafeIdx_cafereview foreign key(cafeIdx) references boardgamecafe(cafeIdx),
  constraint fk_memIdx_cafereview foreign key(memIdx) references member1(memIdx)
  );

CREATE TABLE `project`.`cafeimg` (
  `cafeImgIdx` INT NOT NULL auto_increment primary key,
  `cafeIdx` INT NOT NULL,
  `memIdx` INT NOT NULL,
  `cafeImg` VARCHAR(255),
  constraint fk_memIdx_cafeimg foreign key(memIdx) references member1(memIdx),
  constraint fk_cafeIdx_cafeimg foreign key(cafeIdx) references boardgamecafe(cafeIdx)
);

  
  -- ------------------------------------------현우 ------------------------------------
  
   drop table project.gamegroup1;
 create table project.gamegroup1(
 grpIdx int auto_increment primary key,
 memIdx int,
 grpPostDate timestamp default current_timestamp(), -- 모임등록 작성시간(모집 시작일)
 grpPostEndDate date, -- 모집 마감일
 grpDate text, -- 모임 시작일
 grpContent text,
 grpMaxMem int,
 grpRegMem int,
 gameIdx int, -- 외래키로 가져와야함.
 grpTitle varchar(50),
 nickName varchar(20),
 loc varchar(20),
 genre varchar(20)
);





drop table project.groupreg1;
CREATE TABLE `project`.`groupreg1` (
  `grpRegIdx` int auto_increment,
  `memIdx` int not null unique,
  `grpIdx` int ,
  `grpRegDate` TIMESTAMP DEFAULT current_timestamp,
  `grpConfirm` TINYINT DEFAULT 0,
  PRIMARY KEY (`grpRegIdx`)
  -- CONSTRAINT `fk_memIdx_groupreg1` FOREIGN KEY (`memIdx`) REFERENCES `project`.`member1` (`memIdx`),
  -- CONSTRAINT `fk_grpIdx_groupreg1` FOREIGN KEY (`grpIdx`) REFERENCES `project`.`gamegroup` (`grpIdx`)
);

  -- ------------------------------------------윤성 ------------------------------------