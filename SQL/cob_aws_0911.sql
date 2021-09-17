
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

-- 게시물
drop table project.post;
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

-- 게시물 댓글
drop table project.comment;
create table project.comment(
commIdx int auto_increment primary key,
postIdx int not null,
commContent text not null,
commRegDate timestamp not null default current_timestamp,
commLike int not null default 0,
commDislike int not null default 0,
commRep int not null default 0,
foreign key(postIdx) references post(postIdx)
);

-- 게시물 대댓글
drop table project.recomment;
create table project.recomment(
recommIdx int auto_increment primary key,
commIdx int not null,
recommContent text not null,
recommRegDate timestamp not null default current_timestamp,
recommLike int not null default 0,
recommDislike int not null default 0,
recommRep int not null default 0,
foreign key(commIdx) references comment(commIdx)
);

-- 모임
drop table project.gamegroup;
create table project.gamegroup(
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
 constraint fk_grp_memIdx foreign key(memIdx) references project.member1(memIdx),
 constraint fk_grp_gameIdx foreign key(gameIdx) references gamelist(gameIdx)
);

-- 보드게임 카페
drop table project.boardgamecafe;
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

-- 카페 리뷰
drop table project.cafereview;
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
  
  -- 게임 리스트
   drop table project.gamelist;
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
    gameVideo text 
);

-- 게임 리뷰
drop table project.gamereview;
CREATE TABLE project.`gamereview` (
  `revIdx` INT NOT NULL auto_increment primary key,
  `gameIdx` INT NOT NULL,
  `memIdx` INT NOT NULL,
  `revContent` TEXT NOT NULL,
  `revRegDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `revRating` INT NOT NULL,
  constraint fk_gameIdx_gamereview foreign key(gameIdx) references gamelist(gameIdx),
  constraint fk_memIdx_gamereview foreign key(memIdx) references member1(memIdx)
  );
  
  -- 선호 게임
  drop table project.prefergame;
  CREATE TABLE project.`prefergame` (
  `gameIdx` int DEFAULT NULL,
  `memIdx` int DEFAULT NULL,
  CONSTRAINT `fk_gameIdx_prefergame` FOREIGN KEY (`gameIdx`) REFERENCES `gamelist` (`gameIdx`),
  CONSTRAINT `fk_memIdx_prefergame` FOREIGN KEY (`memIdx`) REFERENCES `member1` (`memIdx`)
);

-- 보유 게임
drop table project.owngame;
  CREATE TABLE project.`owngame` (
  `gameIdx` int DEFAULT NULL,
  `cafeIdx` int DEFAULT NULL,
  CONSTRAINT `fk_gameIdx_owngame` FOREIGN KEY (`gameIdx`) REFERENCES `gamelist` (`gameIdx`),
  CONSTRAINT `fk_cafeIdx_owngame` FOREIGN KEY (`cafeIdx`) REFERENCES `boardgamecafe` (`cafeIdx`)
);

-- 게임 등록
drop table project.groupreg;
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

