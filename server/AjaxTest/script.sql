-- AjaxTest > script.sql

-- 설문 조사 (실제 테이블은 정규화되어서 테이블이 여러 개 나옴)
create table tblSurvey (
    seq number primary key,             -- 번호(PK)
    question varchar2(300) not null,    -- 질문
    item1 varchar2(300) not null,       -- 항목1
    item2 varchar2(300) not null,       -- 항목2
    item3 varchar2(300) not null,       -- 항목3
    item4 varchar2(300) not null,       -- 항목4
    cnt1 number default 0 not null,     -- 선택1
    cnt2 number default 0 not null,     -- 선택2
    cnt3 number default 0 not null,     -- 선택3
    cnt4 number default 0 not null      -- 선택4
);

insert into tblSurvey values 
    (1, '가장 자신있는 프로그래밍 언어는?', 'JAVA', 'C#', 'Python', 'C++', default, default, default, default);

select * from tblSurvey;

update tblSurvey set
    cnt1 = 5, 
    cnt2 = 10, 
    cnt3 = 10,
    cnt4 = 2
        where seq = 1;

commit;



-- 고양이 테이블
create table tblCat (
    catid varchar2(50) primary key, -- <img id="cat1">
    left number not null,
    top number not null
);

insert into tblCat values ('cat1', 0, 0);

select * from tblCat;
select max(to_number(substr(catid, 4))) from tblCat;

commit;

delete from tblCat;

-- 테이블의 데이터 삭제하기
-- 1. delete
-- 2. truncate
-- 3. drop

update tblAddress set address = '경기도' where seq = 20;

select * From tblAddress;
delete from tblAddress;
rollback;

truncate TABLE tblAddress;













