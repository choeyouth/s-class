-- OpenAPITest > “script.sql”

-- 좌표(마커) 테이블
create table tblMarker (
    seq number primary key,     --PK
    lat number not null,        --위도(Latitude)
    lng number not null         --경도(Longitude)    
);

create sequence seqMarker;


insert into tblMarker values (seqMarker.nextVal, 37.499330, 127.033181);
insert into tblMarker values (seqMarker.nextVal, 37.500089, 127.035399);
insert into tblMarker values (seqMarker.nextVal, 37.498556, 127.030443);
insert into tblMarker values (seqMarker.nextVal, 37.499707, 127.032141);
insert into tblMarker values (seqMarker.nextVal, 37.499944, 127.035494);
insert into tblMarker values (seqMarker.nextVal, 37.499378, 127.034302);
insert into tblMarker values (seqMarker.nextVal, 37.499097, 127.034532);
insert into tblMarker values (seqMarker.nextVal, 37.499028, 127.033160);
insert into tblMarker values (seqMarker.nextVal, 37.498798, 127.033485);
insert into tblMarker values (seqMarker.nextVal, 37.498982, 127.032267);

commit;

select * from tblMarker;


-- Food
create table tblCategory (
    seq number primary key,         --PK
    name varchar2(100) not null,    --카테고리명(한식, 중식, 양식, 음료.. 등)
    img varchar2(100) not null      --카테고리별 마커 이미지
);

create table tblFood (
    seq number primary key,         --PK
    name varchar2(300) not null,    --장소명
    lat number not null,            --위도
    lng number not null,            -- 경도
    category number not null references tblCategory(seq), --카테고리(FK)
    address varchar2(500) null,     -- 주소
    star number(1) not null,        -- 별점
    menu varchar2(1000) null        -- 추천 메뉴
);

drop table tblFood;

create sequence seqFood;

insert into tblCategory values (1, '한식', 'forest.png');
insert into tblCategory values (2, '양식', 'restaurant.png');
insert into tblCategory values (3, '중식', 'town-hall.png');
insert into tblCategory values (4, '일식', 'sea.png');
insert into tblCategory values (5, '분식', 'bakery.png');
insert into tblCategory values (6, '패스트푸드', 'store.png');
insert into tblCategory values (7, '음료', 'bar.png');
insert into tblCategory values (8, '편의점/마트', 'shopping.png');
insert into tblCategory values (9, '기타', 'harbor.png');

commit;

select * from tblCategory;
select * from tblFood;


