-- Memo > script.sql
-- server 계정

create table tblMemo (
    seq number primary key,                 -- 메모번호
    name varchar2(30) not null,             -- 작성자  
    pw varchar2(30) not null,               -- 암호
    memo varchar2(2000) not null,           -- 메모
    regdate date default sysdate not null   -- 작성일
);

create sequence seqMemo;

-- 테스트 & 업무 SQL
-- 업무 이해가 되었다는 가정 하에 진행

-- 메모쓰기
insert into tblMemo (seq, name, pw, memo, regdate) 
    values (seqMemo.nextVal, '홍길동', '1111', '메모입니다.', default);

-- 메모읽기 > 목록보기
select * from tblMemo order by seq desc;

-- 메모수정
update tblMemo set memo = '수정합니다.' where seq = 1;

-- 메모삭제
delete from tblMemo where seq = 10;

-- 수정/삭제 권한 확인하기
select count(*) from tblMemo where seq = 1 and pw = '1234';
-- 암호 틀렸을 때 결과: 0
-- 암호가 맞을 때 결과: 1 
-- 1 또는 0을 반환하는 쿼리
-- 1: 권한O
-- 0: 권한X

commit;

drop sequence seqMemo;























