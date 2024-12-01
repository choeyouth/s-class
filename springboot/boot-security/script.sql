-- boot-security > script.sql

create table member (
    seq number primary key,
    username varchar2(50) not null unique,
    password varchar2(100) not null,
    role varchar2(50) not null
);

create sequence seqMember;

show user;

-- Oracle 21C 재설치
select * from v$version;

create user springboot identified by java1234;
-- 에러 
-- oracle 12부터 계정명 앞에 c##을 붙여야 계정이 생성 가능하도록 변경됨

create user c##springboot identified by java1234;

drop user c##springboot;
-- 익숙하지 않기 때문에 삭제

-- c##을 안붙이고 유저를 생성하는 방법 존재
alter session set "_ORACLE_SCRIPT"=true;

create user springboot identified by java1234;

grant connect, resource, dba to springboot;
