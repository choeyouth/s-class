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
