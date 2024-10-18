-- MyBatisTest > script.sql

show user;
create user spring identified by java1234;
grant connect, resource, dba to spring;
alter user spring default tablespace users;

drop table tblAddress;


create table tblAddress (
    seq number primary key,
    name varchar2(30) not null,
    age number not null,
    address varchar2(100) not null,
    gender char(1) not null
);

create sequence seqAddress;
drop sequence seqAddress;

insert into tblAddress values (seqAddress.nextVal, '강아지', 3, '서울시 강남구 역삼동 한독빌딩 8층', 'm');
insert into tblAddress values (seqAddress.nextVal, '고양이', 2, '서울시 강남구 역삼동 한독빌딩 3층', 'f');
insert into tblAddress values (seqAddress.nextVal, '병아리', 1, '서울시 강남구 역삼동 한독빌딩 2층', 'f');
insert into tblAddress values (seqAddress.nextVal, '사자', 7, '서울시 강남구 대치동', 'm');
insert into tblAddress values (seqAddress.nextVal, '호랑이', 6, '서울시 강남구 압구정동', 'f');
insert into tblAddress values (seqAddress.nextVal, '비둘기', 3, '서울시 강동구 천호동', 'f');
insert into tblAddress values (seqAddress.nextVal, '타조', 4, '서울시 강동구 암사동', 'm');
insert into tblAddress values (seqAddress.nextVal, '햄스터', 1, '서울시 강북구 우이동', 'm');
insert into tblAddress values (seqAddress.nextVal, '낙타', 5, '서울시 강북구 번동', 'm');
insert into tblAddress values (seqAddress.nextVal, '독수리', 3, '서울시 강북구 미아동', 'm');
insert into tblAddress values (seqAddress.nextVal, '카피바라', 10, '서울시 강남구 역삼동 한독빌딩 8층', 'm');

select * from tblAddress;

commit;
delete from tblAddress where seq = 1;
rollback;

