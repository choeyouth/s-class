/*

    ex23_alter.sql
    
    DDL > 객체 조작
    - 객체 생성: create
    - 객체 수정: alter
    - 객체 삭제: drop

    DML > 데이터 조작
    - 데이터 생성: insert
    - 데이터 수정: update
    - 데이터 삭제: delete
    
    테이블 수정하기 
    - 테이블 수정 > 테이블 정의(스키마) 수정 > 컬럼 수정
        > 컬럼명 or 자료형(길이) or 제약 사항 수정
    - 되도록 테이블을 수정하는 상황을 발생시키면 안 된다!!!!
    - 테이블 설계를 최대한 문제없게, 수정 발생 최소
    
    테이블 수정해야 하는 상황 발생!!
    1. 테이블 삭제(drop) > 테이블 DDL(create) 수정 > 수정된 DDL로 다시 테이블 생성
        a. 기존 테이블에 데이터가 없을 경우 > 아무 문제 없음
        b. 기존 테이블에 데이터가 있을 경우 > 미리 데이터 백업
            > 테이블 삭제 > 수정된 테이블 생성 > 데이터 복구 
            - 개발 중에 사용 가능 
            - 공부 중에 사용 가능 
            - 서비스 운영 중에는.. 많이 부담되는 방법
    
    2. alter 명령어 사용 > 기존 테이블의 구조 변경 
        a. 기존 테이블에 데이터가 없을 경우 > 아무 문제 없음
        b. 기존 테이블에 데이터가 있을 경우 > 상황에 따라 다름 
            - 개발 중에 사용 가능 
            - 공부 중에 사용 가능 
            - 서비스 운영 중에는.. 덜 부담되는 방법 
    
*/

drop table tblEdit;

create table tblEdit (
    seq number primary key,
    name varchar2(20) not null
);

insert into tblEdit values (1 , '마우스');
insert into tblEdit values (2 , '키보드');
insert into tblEdit values (3 , '모니터');

-- Case 1. 새로운 컬럼을 추가하기 
alter table 테이블
    add (컬럼 정의);

alter table tblEdit
    add (price number);

delete from tblEdit;

-- ORA-01758: table must be empty to add mandatory (NOT NULL) column
alter table tblEdit
    add (qty number not null);

insert into tblEdit values (1 , '마우스', 1000, 1);
insert into tblEdit values (2 , '키보드', 2000, 1);
insert into tblEdit values (3 , '모니터', 3000, 2);

alter table tblEdit
    add (color varchar2(30) default 'white' not null);

-- Case 2. 컬럼을 삭제하기
alter table 테이블명
    drop column 컬럼명;

alter table tblEdit
    drop column name;

-- ORA-12983: cannot drop all columns in a table
alter table tbledit
    drop column seq; --PK 삭제!! > 절대 금지!!


-- Case 3. 컬럼을 수정하기
insert into tblEdit values (4, '맥북 M3 프로 2024 고급형');

-- Case 3.1 컬럼 길이 수정하기(확장/축소)
alter table 테이블명
    modify (컬럼 정의);
    
alter table tblEdit
    modify (name varchar2(100)); --확장

-- ORA-01441: cannot decrease column length because some value is too big
alter table tblEdit
    modify (name varchar2(20)); --축소 

-- Case 3.2 컬럼의 제약 사항 수정하기(not null)
alter table tblEdit
    modify (name varchar2(100) null); -- not null > null

alter table tblEdit
    modify (name varchar2(100) not null); -- null > not null

alter table tblEdit
    modify (name varchar2(100) default '임시' not null); -- null > not null

alter table tblEdit
    modify (name varchar2(100) unique); --나머지 제약 사항도 동일한 방식


-- Case 3.3 컬럼의 자료형을 수정하기 
delete from tblEdit;

alter table tblEdit
    modify (seq varchar2(30));



-- Case 4. 제약 사항 조작하기
-- 제약 사항을 만드는 방법 3. 외부에서 만드는 방법 
-- not null은 컬럼 선언과 동시에 해야만 함
drop table tblEdit;

create table tblEdit (
    seq number,
    name varchar2(20) not null
);

alter table tblEdit
    add constraint tbledit_seq_pk primary key(seq);
    
alter table tblEdit
    add constraint tbledit_name_uq unique(name);

alter table tblEdit
    drop constraint tbledit_name_uq;

insert into tblEdit values (1, '강아지');
insert into tblEdit values (1, '강아지');
insert into tblEdit values (2, '강아지');


desc tblEdit;

select * from tblEdit;














































































