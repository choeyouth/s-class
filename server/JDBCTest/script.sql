show user; -- USER이(가) "SYSTEM"입니다.
create user server identified by java1234;
grant connect, resource, dba to server;

select * from tabs;

-- 주소록 테이블
create table tblAddress (
    seq number,                             --번호(PK)
    name varchar2(30) not null,             -- 이름
    age number(3) not null,                 -- 나이
    gender char(1) not null,                -- 성별(m, f)
    tel varchar2(15) not null,              -- 전화번호
    address varchar2(300) not null,         -- 주소
    regdate date default sysdate not null   -- 등록일 
);

alter table tblAddress
    add constraint address_seq_pk primary key(seq);
    
alter table tblAddress
    add constraint address_age_ck check (age between 0 and 150);
    
alter table tblAddress
    add constraint address_gender_ck check (gender in ('m', 'f'));
    
create sequence seqAddress;

-- CRUD
insert into tblAddress (seq, name, age, gender, tel, address, regdate)
    values (seqAddress.nextVal, '홍길동', 20, 'm', '010-1234-5678'
    , '서울시 강남구 역삼동', default);

select * from tblAddress;
select count(*) from tblAddress;

update tblAddress set age = age + 1 where seq = 1;

delete from tblAddress where seq = 1;

create table tblJava (
    seq number primary key,
    data varchar2(100) not null
);
select * from tblAddress where seq = 3;

select * from tblJava;


select name from tblAddress; 

select num, name, buseo, jikwi from tblInsa order by num asc;

select * from tblInsa;
select * from tblInsa order by num;
select i.name as name, b.bonus as bonus, i.num as num from tblInsa i inner join tblBonus b on i.num = b.num where b.seq = (select max(seq) from tblBonus);



-- Ex06_CallableStatement.java
-- m1. 인자값X, 반환값X
create or replace procedure procM1
is
begin
    insert into tblAddress (seq, name, age, gender, tel, address, regdate)
    values (seqAddress.nextVal, '타조', 20, 'm', '010-1234-5678'
    , '서울시 강남구 역삼동', default);
end procM1;
/


select * from tblAddress;



-- m2. 인자값O, 반환값X
create or replace procedure procM2(
    pname varchar2,
    page number,
    pgender varchar2,
    ptel varchar2,
    paddress varchar2
)
is
begin
    insert into tblAddress (seq, name, age, gender, tel, address, regdate)
    values (seqAddress.nextVal, pname, page, pgender, ptel, paddress, default);
end procM2;
/

select * from tblAddress;


-- m3. 인자값X, 반환값O
create or replace procedure procM3 (
    pcnt out number
)
is
begin
    select count(*) into pcnt from tblAddress;
end procM3;
/



-- m4. 인자값O, 반환값O
-- 직원번호 > 이름, 부서, 직위
create or replace procedure procM4 (
    pnum in number,
    pname out varchar2,
    pbuseo out varchar2,
    pjikwi out varchar2
)
is
begin
    select name, buseo, jikwi into pname, pbuseo, pjikwi from tblInsa
        where num = pnum;
end procM4;
/

-- m5. 커서 반환
create or replace procedure procM5 (
    pbuseo in varchar2,
    pcursor out sys_refcursor
)
is
begin
    open cursor
    for
    select * from tblInsa where buseo = pbuseo;
end procM5;
/












