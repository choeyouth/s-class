-- boot-jpa > script.sql

select * from tblAddress where seq = 1;

select * from tblAddress;
select seqAddress.nextVal from dual;


select * from v$version;

--계정 생성
alter user hr identified by java1234 account unlock;

create user C##springboot identified by java1234;
drop user c##springboot;

alter session set "_ORACLE_SCRIPT" = true;

create user springboot identified by java1234;
grant connect, resource, dba to springboot;