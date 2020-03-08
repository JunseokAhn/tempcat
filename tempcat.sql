commit;

--회원 정보 테이블
drop table tempcat_member;
create table tempcat_member (
	id			varchar2(40) primary key,	--회원ID
	pw      	varchar2(40) not null,		--비밀번호
	name		varchar2(40) not null,		--이름
	nickname	varchar2(40),				--닉네임
	email		varchar2(100),				--이메일
	inputdate date default sysdate, 		--아이디 생성일
    logindate date default sysdate          --최근 로그인
);


--리퀘스트 전용 테이블
drop table request;
create table request(
request_num number       primary key,   
name		varchar2(40) not null,		--이름
email		varchar2(100) not null,		--이메일
category    varchar2(40) not null,      --카테고리
message     varchar2(2000) not null     --내용
);

--리퀘스트 번호에 사용할 시퀀스
drop sequence request_seq;
create sequence request_seq;


--공지게시판 테이블
drop table tempcat_notice;
create table tempcat_notice(
	noticenum	number primary key,			--글번호
	id			varchar2(40) not null, 		--작성자ID
	title		varchar2(100) not null,		--제목
	contents	varchar2(2000) not null, 	--내용
	inputdate	date default sysdate, 		--작성일
	hits		number default 0,			--조회수
    heart       number default 0,           --받은 좋아요 수
    originalfile	varchar2(200),			--첨부파일 원래이름
	savedfile		varchar2(200),			--첨부파일 저장된 이름
    nickname    varchar2(40) not null,      --닉네임   
    comments    number default 0,           --달린 댓글 수
    foreign key (id) REFERENCES tempcat_member (id) on delete cascade
);
--공지게시판 번호에 사용할 시퀀스
drop sequence tempcat_notice_seq;
create sequence tempcat_notice_seq;

--공지게시판 댓글 테이블
drop table notice_reply;
create table notice_reply (
	num         number primary key,
    id			varchar2(40)         not null, 	--회원ID
	nickname	varchar2(40),                   --닉네임
    noticenum   number               not null,  --게시글번호
	contents    varchar2(1000)       not null,  --코멘트
	inputdate	date default sysdate, 		    --작성일
    foreign key (id) references tempcat_member (id) on delete cascade,
    foreign key (noticenum)references tempcat_notice (noticenum) on delete cascade
);

--공지게시판 댓글 시퀀스
drop sequence notice_reply_seq;
create sequence notice_reply_seq;



--자유게시판 테이블
drop table tempcat_free;
create table tempcat_free(
	freenum	    number primary key,			--글번호
	id			varchar2(40) not null, 		--작성자ID
	title		varchar2(100) not null,		--제목
	contents	varchar2(2000) not null, 	--내용
	inputdate	date default sysdate, 		--작성일
	hits		number default 0,			--조회수
    heart       number default 0,           --받은 좋아요 수
	originalfile	varchar2(200),			--첨부파일 원래이름
	savedfile		varchar2(200),			--첨부파일 저장된 이름
    nickname    varchar2(40) not null,      --닉네임   
    comments    number default 0,           --달린 댓글 수
    foreign key (id) REFERENCES tempcat_member (id) on delete cascade
);
--자유게시판 번호에 사용할 시퀀스
drop sequence tempcat_free_seq;
create sequence tempcat_free_seq;


--자유게시판 댓글 테이블
drop table free_reply;
create table free_reply (
	num         number primary key,
    id			varchar2(40)         not null, 	--회원ID
	nickname	varchar2(40),                   --닉네임
    freenum     number               not null,  --게시글번호
	contents    varchar2(1000)       not null,  --코멘트
	inputdate	date default sysdate, 		    --작성일
    foreign key (id) references tempcat_member (id) on delete cascade,
    foreign key (freenum)references tempcat_free (freenum) on delete cascade
);

--자유게시판 댓글 시퀀스
drop sequence free_reply_seq;
create sequence free_reply_seq;


--회원 정보 테이블2
drop table tempcat_profile;
create table tempcat_profile(
    id			varchar2(40) not null,  	--회원ID
    mynotice    number  null,               --내가 쓴 공지글
    myfree      number  null,               --내가 쓴 자유글
    noticereply number  null,               --내가 쓴 공지리플
    freereply   number  null,               --내가 쓴 자유리플
    heartnotice number  null,               --좋아요 누른 공지글
    heartfree   number  null,               --좋아요 누른 자유글
    foreign key (id) references tempcat_member (id) on delete cascade,
    foreign key (mynotice) references tempcat_notice (noticenum) on delete cascade,
    foreign key (myfree) references tempcat_free (freenum) on delete cascade,
    foreign key (noticereply) references notice_reply (num) on delete cascade,
    foreign key (freereply) references free_reply (num) on delete cascade,
    foreign key (heartnotice) references tempcat_notice (noticenum) on delete cascade,
    foreign key (heartfree) references tempcat_free (freenum) on delete cascade
   );
   
   
--업데이트 캐스캐이딩 트리거
drop trigger tempcat_notice_tr;
create or replace trigger tempcat_notice_tr
after update of nickname on tempcat_member for each row
begin
    update tempcat_notice
    set nickname = :new.nickname where nickname = :old.nickname;
end;
/

drop trigger tempcat_free_tr;
create or replace trigger tempcat_free_tr
after update of nickname on tempcat_member for each row
begin
    update tempcat_free
    set nickname = :new.nickname where nickname = :old.nickname;
end;
/

drop trigger notice_reply_tr;
create or replace trigger notice_reply_tr
after update of nickname on tempcat_member for each row
begin
    update notice_reply
    set nickname = :new.nickname where nickname = :old.nickname;
end;
/

drop trigger free_reply_tr;
create or replace trigger free_reply_tr
after update of nickname on tempcat_member for each row
begin
    update free_reply
    set nickname = :new.nickname where nickname = :old.nickname;
end;
/

commit;

--강제로 noticeboard작성하는 쿼리, id 1(관리자ID, notice board작성가능)으로 회원가입후 사용
--단, 이렇게 작성할 시 프로필에 카운트되지않습니다. 페이징처리용으로만 써주세요.
insert into tempcat_notice
(noticenum, id, title, contents, nickname)
values
(tempcat_notice_seq.nextval, 1, 'ICT MASTER 38', 'SC IT MASTER 만세!!', '안준석');


--강제로 freeboard작성하는 쿼리(가입된id 맞춰줄것)으로 회원가입후 사용
--단, 이렇게 작성할 시 프로필에 카운트되지않습니다. 페이징처리용으로만 써주세요.
insert into tempcat_free
(freenum, id, title, contents, nickname)
values
(tempcat_free_seq.nextval, 1, 'ICT MASTER 38', 'SC IT MASTER 만세!!', '안준석');

insert into tempcat_free
(freenum, id, title, contents, nickname)
values
(tempcat_free_seq.nextval, 2, 'ICT MASTER 38', 'SC IT MASTER 万歳!!', 'ジュンソク案');

--강제로 notice리플라이 다는 쿼리(가입된id로, 작성된noticenum맞춰줄것)으로 회원가입후 사용
--단, 이렇게 작성할 시 프로필에 카운트되지않습니다. 페이징처리용으로만 써주세요.
insert into notice_reply
(num, id, nickname, noticenum, contents)
values
(NOTICE_REPLY_SEQ.nextval, 2, '안준석', 1, 'SC IT MASTER 만세!!');

--강제로 free리플라이 다는 쿼리(가입된id로, 작성된freenum맞춰줄것)으로 회원가입후 사용
--단, 이렇게 작성할 시 프로필에 카운트되지않습니다. 페이징처리용으로만 써주세요.
insert into free_reply
(num, id, nickname, freenum, contents)
values
(FREE_REPLY_SEQ.nextval, 1, '안준석', 1, 'SC IT MASTER 만세!!');
insert into free_reply
(num, id, nickname, freenum, contents)
values
(FREE_REPLY_SEQ.nextval, 2, 'ジュンソク案', 1, 'SC IT MASTER 万歳!!');


commit;

select * from tempcat_notice;   --notice게시판 테이블
select * from tempcat_free;     --free게시판 테이블
select * from notice_reply;     --notice게시판 댓글테이블
select * from free_reply;       --free게시판 댓글테이블
