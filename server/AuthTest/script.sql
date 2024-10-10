-- AuthTest > script.sql

-- 회원 테이블
create table tblUser (
    id varchar2(30) primary key,                      -- 아이디(PK)
    pw varchar2(30) not null,                         -- 암호
    name varchar2(30) not null,                       -- 이름
    lv number(1) not null check (lv between 1 and 2)  -- 1(회원), 2(관리자)
);

insert into tblUser values ('hong', '1111', '홍길동', 1);
insert into tblUser values ('dog', '1111', '강아지', 1);
insert into tblUser values ('cat', '1111', '고양이', 2);

commit;


--게시판 테이블
create table tblBoard (
    seq number primary key,                         --글번호(PK)
    subject varchar2(300) not null,                 --제목
    content varchar2(4000) not null,                --내용
    regdate date default sysdate not null,          --날짜
    readcount number default 0 not null,            --조회수
    id varchar2(50) not null references tblUser(id)  --아이디(FK)
);

create sequence seqBoard;

update tblBoard set readcount = readcount + 1 where seq = 1;

select * from tblBoard;

rollback;
delete from tblBoard where seq = 1;


-- 작성날짜 or 작성시간 함수 
--1. 조회 시각이 오늘과 같은 날짜면 > 시간 반환
--2. 조회 시각이 오늘과 다른 날짜면 > 날짜 반환

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

select fnRegdate(regdate) from tblBoard order by seq desc;

--system으로 실행
alter user toy default tablespace users;


select * from tblBoard order by seq desc;

update tblBoard set regdate = regdate - 1 where seq = 8;
update tblBoard set regdate = regdate - 2.5 where seq = 7;
update tblBoard set regdate = regdate - 5 where seq = 6;


commit;

create or replace view vwBoard
as
select tblBoard.*, fnRegdate(regdate) as regtime, 
    (select name from tblUser where id = tblBoard.id) as name,
    (sysdate - regdate) as isnew
    from tblBoard order by seq desc;

select * from vwBoard;

update tblBoard set readcount = readcount + 1 where seq = 10;

