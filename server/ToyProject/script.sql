-- ToyProject > script.sql

create user toy identified by java1234;
grant connect, resource, dba to toy;


show user;

-- 유저 테이블
create table tblUser (
    id varchar2(50) primary key,                --아이디
    pw varchar2(50) not null,                   --암호
    name varchar2(50) not null,                 --이름
    email varchar2(100) not null,               --이메일
    lv number(1) not null,                      --등급(1.일반, 2.관리자)
    pic varchar2(100) default 'pic.png' not null, --프로필 사진
    intro varchar2(500) null,                   --소개
    regdate date default sysdate not null,      --가입날짜
    ing number(1) default 1 not null            --탈퇴(1.활동, 0.탈퇴)
);

-- 회원 데이터
insert into tblUser (id, pw, name, email, lv, pic, intro, regdate, ing)
    values ('hong', '1111', '홍길동', 'hong@gmail.com'
            , 1, default, '안녕하세요.', default, default);

insert into tblUser (id, pw, name, email, lv, pic, intro, regdate, ing)
    values ('dog', '1111', '강아지', 'dog@gmail.com'
            , 1, default, '멍멍~', default, default);
    
insert into tblUser (id, pw, name, email, lv, pic, intro, regdate, ing)
    values ('cat', '1111', '고양이', 'cat@gmail.com'
            , 2, default, '냐옹~ 관리자', default, default);    

select * from tblUser;

commit;


-- 로그인
select * from tblUser where id = ? and pw = ?;



-- 게시판 테이블
create table tblBoard (
    seq number primary key,                         --글번호(PK)
    subject varchar2(300) not null,                 --제목
    content varchar2(4000) not null,                --내용
    regdate date default sysdate not null,          --날짜
    readcount number default 0 not null,            --조회수
    id varchar2(50) not null references tblUser(id) --아이디(FK)
);

create sequence seqBoard;

select * from tblBoard;

-- 작성날짜 or 작성시간 함수
-- 1. 조회 시각이 오늘과 같은 날짜면 > 시간 반환
-- 2. 조회 시각이 오늘과 다른 날짜면 > 날짜 반환
create or replace function fnRegdate (
    regdate date
) return varchar2
is
begin

    if to_char(sysdate, 'yyyy-mm-dd') = to_char(regdate, 'yyyy-mm-dd')
        return to_char(regdate, 'hh24:mi:ss');
    else
        return to_char(regdate, 'yyyy-mm-dd');
    end if;

end fnRegdate;
/



-- alter user toy default tablespace users;


create or replace function fnRegdate (
    regdate date
) return varchar2
is
begin

    if to_char(sysdate, 'yyyy-mm-dd') = to_char(regdate, 'yyyy-mm-dd') then
        return to_char(regdate, 'hh24:mi:ss');
    else
        return to_char(regdate, 'yyyy-mm-dd');
    end if;

end fnRegdate;
/









select tblBoard.*, (select name from tblUser where id = tblBoard.id) as name from tblBoard where seq = 10;



select * from (select a.*, rownum as rnum from vwBoard a)
    where rnum between 1 and 10;
    
select * from (select a.*, rownum as rnum from vwBoard a)
    where rnum between 11 and 20;






-- 댓글 테이블
create table tblComment (
    seq number primary key,                             --번호(PK)
    content varchar2(2000) not null,                    --댓글
    regdate date default sysdate not null,              --날짜
    id varchar2(50) not null references tblUser(id),    --유저(FK)
    bseq number not null references tblBoard(seq)       --부모글(FK)
);

create sequence seqComment;

select * from tblBoard;

select * from tblBoard order by seq desc;

drop table tblComment;
drop table tblBoard;

-- 게시판 테이블(+답변 > 계층형)
create table tblBoard (
    seq number primary key,                          --글번호(PK)
    subject varchar2(300) not null,                  --제목
    content varchar2(4000) not null,                 --내용
    regdate date default sysdate not null,           --날짜
    readcount number default 0 not null,             --조회수
    id varchar2(50) not null references tblUser(id), --아이디(FK)
    thread number not null,                          --답변형(그룹+정렬)
    depth number not null,                           --답변형(들여쓰기)
    ing number(1) default 1 not null                 --삭제 유무(1: 기본, 0: 삭제)
);


select * from tblBoard where thread < 1997
    and thread > (select nvl(max(thread), 1000) from tblBoard
                     where thread < 1997 and depth = 1);



          


select * from tblBoard;

select * from vwBoard;




-- 게시판 테이블(첨부파일)
create table tblBoard (
    seq number primary key,                          --글번호(PK)
    subject varchar2(300) not null,                  --제목
    content varchar2(4000) not null,                 --내용
    regdate date default sysdate not null,           --날짜
    readcount number default 0 not null,             --조회수
    id varchar2(50) not null references tblUser(id), --아이디(FK)
    thread number not null,                          --답변형(그룹+정렬)
    depth number not null,                           --답변형(들여쓰기)
    ing number(1) default 1 not null,                --삭제 유무(1: 기본, 0: 삭제)
    attach varchar2(300) null                        --첨부파일
);



-- 좋아요/싫어요 테이블
create table tblGoodBad (
    seq number primary key,                             --PK
    id varchar2(50) not null references tblUser(id),    --아이디(FK)
    bseq number not null references tblBoard(seq),      --게시물(FK)
    state number(1) not null                            --1(좋아요), 0(싫어요)
);

create sequence seqGoodBad;

select state, count(*) as from tblGoodBad where bseq = 298 group by state;


-- 해시태그
create table tblHashtag (
    seq number primary key,             --번호(PK)
    tag varchar2(100) unique not null   --해시태그(UQ)
);

create sequence seqHashtag;

-- 연결(관계)
create table tblTagging (
    seq number primary key,                         --번호(PK)
    bseq number not null references tblBoard(seq),  --글번호(FK)
    hseq number not null references tblHashtag(seq) --해시태그번호(FK)
);

create sequence seqTagging;

select * from tblHashtag;
select * from tblTagging;


select h.tag from tblBoard b
    inner join tblTagging t 
    on b.seq = t.bseq 
    inner join tblHashtag h 
    on h.seq = t.hseq
    where b.seq = 214;


select * from (select a.*, rownum as rnum from vwBoard a) b 
    inner join tblTagging t 
    on b.seq = t.bseq 
    inner join tblHashtag h 
    on h.seq = t.hseq
    where h.tag = '테스트';





create or replace view vwBoard
as
select 
    tblBoard.*, fnRegdate(regdate) as regtime, 
    (select name from tblUser where id = tblBoard.id) as name,
    (sysdate - regdate) as isnew,
    (select count(*) from tblComment where bseq = tblBoard.seq) as commentCount,
    (select count(*) from tblBoard b
        inner join tblTagging t 
         on b.seq = t.bseq 
             inner join tblHashtag h 
                 on h.seq = t.hseq
                     where b.seq = tblBoard.seq) as istag
from tblBoard 
    order by thread desc;

select * from vwBoard;

select * from tblUser;


-- 2024년 10월 hong이 무슨 활동
-- 글을 몇 번 썼는지?
-- 댓글을 몇 번 썼는지?
-- 로그인 언제 했는지?
-- 태그 몇 번 썼는지?



-- 접속 기록
create table tblLog (
    seq number primary key,                           --번호(PK)
    id varchar2(50) not null references tblUser(id),  --아이디(FK)
    regdate date default sysdate not null             --접속 시각
);

create sequence seqLog;

insert into tblLog (seq, id, regdate) values (seqLog.nextVal, 'hong', default);

select 
    count(*) as cnt, 
    to_char(regdate, 'yyyy-mm-dd') as regdate,
    (select count(*) from tblBoard 
        where to_char(regdate, 'yyyy-mm-dd') = to_char(l.regdate, 'yyyy-mm-dd') and id = 'dog') as bcnt,
    (select count(*) from tblComment
        where to_char(regdate, 'yyyy-mm-dd') = to_char(l.regdate, 'yyyy-mm-dd') and id = 'dog') as ccnt 
from tblLog l
    where to_char(l.regdate, 'yyyy-mm') = '2024-10' and l.id = 'dog'
        group by to_char(regdate, 'yyyy-mm-dd');
        

select * from tblLog;



-- 테스트용 데이터
delete from tblGoodBad;
delete from tblComment;
delete from tblTagging;
delete from tblBoard;
delete from tblLog;

commit;


-- 로그인 기록(hong)
insert into tblLog values (seqLog.nextVal, 'hong', sysdate);
insert into tblLog values (seqLog.nextVal, 'hong', sysdate - 2);
insert into tblLog values (seqLog.nextVal, 'hong', sysdate - 3);
insert into tblLog values (seqLog.nextVal, 'hong', sysdate - 7);
insert into tblLog values (seqLog.nextVal, 'hong', sysdate - 10);
insert into tblLog values (seqLog.nextVal, 'hong', sysdate - 12);
insert into tblLog values (seqLog.nextVal, 'hong', sysdate - 20);
insert into tblLog values (seqLog.nextVal, 'hong', sysdate - 22);
insert into tblLog values (seqLog.nextVal, 'hong', sysdate - 23);

select * from tblLog;


-- 글쓰기(hong)
insert into tblBoard values (seqBoard.nextVal, '테스트입니다.', '내용', sysdate - 22, default, 'hong', 1000, 0, default, '');
insert into tblBoard values (seqBoard.nextVal, '테스트입니다.', '내용', sysdate - 20, default, 'hong', 2000, 0, default, '');
insert into tblBoard values (seqBoard.nextVal, '테스트입니다.', '내용', sysdate - 20, default, 'hong', 3000, 0, default, '');
insert into tblBoard values (seqBoard.nextVal, '테스트입니다.', '내용', sysdate - 7, default, 'hong', 4000, 0, default, '');
insert into tblBoard values (seqBoard.nextVal, '테스트입니다.', '내용', sysdate - 3, default, 'hong', 5000, 0, default, '');
insert into tblBoard values (seqBoard.nextVal, '테스트입니다.', '내용', sysdate - 3, default, 'hong', 6000, 0, default, '');
insert into tblBoard values (seqBoard.nextVal, '테스트입니다.', '내용', sysdate - 3, default, 'hong', 7000, 0, default, '');
insert into tblBoard values (seqBoard.nextVal, '테스트입니다.', '내용', sysdate, default, 'hong', 8000, 0, default, '');

commit;

insert into tblBoard values (seqBoard.nextVal, '테스트입니다.', '내용', sysdate - 5, default, 'dog', 10000, 0, default, '');
insert into tblBoard values (seqBoard.nextVal, '테스트입니다.', '내용', sysdate - 11, default, '', 9000, 0, default, '');


-- 댓글(hong)
insert into tblComment values (seqComment.nextVal, '댓글입니다.', sysdate, 'hong', 344);
insert into tblComment values (seqComment.nextVal, '댓글입니다.', sysdate, 'hong', 344);
insert into tblComment values (seqComment.nextVal, '댓글입니다.', sysdate - 5, 'hong', 345);
insert into tblComment values (seqComment.nextVal, '댓글입니다.', sysdate, 'hong', 337);
insert into tblComment values (seqComment.nextVal, '댓글입니다.', sysdate, 'hong', 338);

 
select * from tblBoard order by seq desc;













