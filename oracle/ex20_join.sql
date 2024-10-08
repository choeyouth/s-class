/*

    ex20_join.sql ***
    
    
    관계형 데이터베이스 시스템이 지양하는 것들
    
    1. 테이블에 기본키가 없는 상태 > 데이터 조작 불가능(레코드 식별 불가능)
    2. NULL이 많은 상태의 테이블  > 공간 낭비 + SQL 작업 불편
    3. 데이터가 중복되는 상태 > 공간 낭비 + 데이터 조작 문제 발생(일관성 저하)
    4. 하나의 속성값이 원자값이 아닌 상태 > 더 이상 쪼개지지 않는 값을 넣는다.
    
    
    
*/

-- 직원 정보 
-- 직원(번호(PK), 직원명, 급여, 거주지, 담당프로젝트)
create table tblStaff (
    seq number primary key,         --직원번호(PK)
    name varchar2(30) not null,     --직원명
    salary number not null,         --급여
    address varchar2(300) not null, --거주지
    project varchar2(300)           --담당프로젝트
);

insert into tblStaff(seq, name, salary, address, project)
    values (1, '홍길동', 300, '서울시', '홍콩 수출');

insert into tblStaff(seq, name, salary, address, project)
    values (2, '아무개', 250, '인천시', 'TV 광고');

insert into tblStaff(seq, name, salary, address, project)
    values (3, '하하하', 350, '의정부시', '매출 분석');


-- '홍길동'에게 담당 프로젝트 1건 추가 > '고객 관리'
-- '홍콩 수출' + '고객 관리'

update tblStaff set project = project || ',고객 관리' where seq = 1;
update tblStaff set project = '홍콩 수출' where seq = 1;

insert into tblStaff(seq, name, salary, address, project)
    values (4, '홍길동', 300, '서울시', '고객 관리');


select * from tblStaff;


-- 원인: 테이블 스키마(구조)가 잘못된 상태 
-- 해결: 테이블 재구성

delete from tblProject;
delete from tblStaff;

drop table tblStaff;
drop table tblProject;

-- 직원 정보 
-- 직원(번호(PK), 직원명, 급여, 거주지)
-- 부모 테이블
create table tblStaff (
    seq number primary key,         --직원번호(PK)
    name varchar2(30) not null,     --직원명
    salary number not null,         --급여
    address varchar2(300) not null  --거주지
);

 
-- 프로젝트 정보 
-- 프로젝트(번호(PK), 담당프로젝트)
-- 자식 테이블
create table tblProject (
    seq number primary key,         --프로젝트번호
    project varchar2(300),          --담당프로젝트
    staff_seq number references tblStaff(seq) not null  --담당직원번호(FK)
);
 


insert into tblStaff(seq, name, salary, address)
    values (1, '홍길동', 300, '서울시');

insert into tblStaff(seq, name, salary, address)
    values (2, '아무개', 250, '인천시');

insert into tblStaff(seq, name, salary, address)
    values (3, '하하하', 350, '의정부시');

insert into tblProject(seq, project, staff_seq) values (1, '홍콩 수출', 1);
insert into tblProject(seq, project, staff_seq) values (2, 'TV 광고', 2);
insert into tblProject(seq, project, staff_seq) values (3, '매출 분석', 3);
insert into tblProject(seq, project, staff_seq) values (4, '노조 협상', 1);
insert into tblProject(seq, project, staff_seq) values (5, '대리점 분양', 2);

select * from (select * from tblInsa where buseo = '기획부');

-- A. 신입 사원 입사 > 신규 프로젝트 배정
-- A.1 신입 사원 추가 >  성공!! 
insert into tblStaff(seq, name, salary, address)
    values (4, '호호호', 250, '성남시');

-- A.2 신규 프로젝트 발주 + 담당자 배정 > 성공!!
insert into tblProject(seq, project, staff_seq) 
    values (6, '자재 매입', 4);

-- A.3 신규 프로젝트 발주 + 담당자 배정 > 성공!!
-- ORA-02291: integrity constraint (HR.SYS_C007100) violated 
--         - parent key not found
insert into tblProject(seq, project, staff_seq) 
    values (7, '고객 유치', 5);

-- B. '홍길동' 퇴사
-- B.1 '홍길동' 삭제
-- ORA-02292: integrity constraint (HR.SYS_C007100) violated 
--          - child record found
delete from tblStaff where seq = 1;

-- B.2 '홍길동' 삭제 > 업무 인수 인계(위임)
update tblProject set staff_seq = 2 where staff_seq = 1;

-- B.3 '홍길동' 삭제
delete from tblStaff where seq = 1;


select * from tblStaff;
select * from tblProject;




/*
    
    조인, Join
    - (서로 관계를 맺고 있는) 2개(1개) 이상의 테이블을 1개의 결과셋으로 만드는 기술
    
    조인의 종류
    1. 단순 조인, Cross Join
    2. 내부 조인, Inner Join
    3. 외부 조인, Outer Join
    4. 셀프 조인, Self Join
    5. 전체 외부 조인, Full Outer Join

    
    1. 단순 조인, Cross Join, 카티션 곱, 데카르트 곱
    - 모든 조인의 기본 동작
    - A 테이블 X B 테이블 
    - 쓸모없다. > 가치 있는 행과 가치 없는 행이 뒤섞여 있어서..
    - 대량의 더미 생산용(유효성 낮음)
    
    
*/

select * from tblCustomer; -- 3명
select * from tblSales;    -- 9건

--3 x 9 = 27개 
select * from tblCustomer cross join tblSales; --표준 SQL > 권장!!
select * from tblCustomer, tblSales; --오라클 전용



--------------------------------------------------------------------------------

/*

    2. 내부 조인, Inner Join *********
    - 단순 조인에서 유효한 레코드만 추출한 조인
    
    select 컬럼리스트 from 테이블A cross join 테이블B;
    
    select 
        컬럼리스트
    from 테이블A 
        inner join 테이블B 
            on 부모테이블.컬럼(PK) = 자식테이블.컬럼(FK); --조인의 where절

*/

select
    *
from tblCustomer 
    inner join tblSales
        on tblCustomer.seq = tblSales.cseq;
            --where절 따로 존재
select 
    *
from tblStaff
    cross join tblProject;

select 
    *
from tblStaff
    inner join tblProject    
        on tblStaff.seq = tblProject.staf_avg;



--------------------------------------------------------------------------------



-- 고객 변호, 고객명(tblCustomer), 상품 번호, 상품명(tblSales)
select
    tblCustomer.seq as caseq,
    tblCustomer.name as, 
    tblSales.item sseq,
    tblSales.seq
    from tblCustomer 
    inner join tblSales
        on tblCustomer.seq = tblSales.cseq;
            --where절 따로 존재

select
    c.seq as caseq,
    c.name as, 
    s.item sseq,
    s.seq
    from tblCustomer c
    inner join tblSales s
        on c.seq = s.cseq;
            --where절 따로 존재


-- 고객 + 판매
-- 어떤 고객(c.name)이 어떤 물건(s.item)을 몇 개(s.qty) 사갔는지?
select 
    c.name as 고객명,
    s.item as 상품명,
    s.qty as 수량
from tblCustomer c
    inner join tblSales s
        on c.seq = s.cseq;


-- 어떤 고객(c.name)이 어떤 물건(s.item)을 몇 개(s.qty) 사갔는지?
-- 메인 SQL > 자식 테이블
-- 서브 SQL > 부모 테이블
select 
    item as 상품명,
    qty as 수량,
    (select name from tblCustomer where seq = tblsales.cseq) as 고객명
from tblSales;



--------------------------------------------------------------------------------

-- 장르 + 비디오
select 
    *
from tblGenre g
    inner join tblVideo v
        on g.seq = v.genre;


-- 장르 + 비디오 + 대여
select 
    *
from tblGenre g
    inner join tblVideo v
        on g.seq = v.genre
            inner join tblRent r
                on v.seq = r.video;

-- 장르 + 비디오 + 대여 + 회원
select 
    m.name as 누가,
    v.name as 무엇을,
    r.rentdate as 언제,
    g.price as 얼마에
from tblGenre g
    inner join tblVideo v
        on g.seq = v.genre
            inner join tblRent r
                on v.seq = r.video
                    inner join tblMember m
                        on m.seq = r.member;


-- hr
select
    *
from employees e
    inner join departments d
        on d.department_id = e.department_id
            inner join locations l
                on l.location_id = d.location_id
                    inner join countries c
                        on c.country_id = l.country_id
                            inner join regions r
                                on r.region_id = c.region_id
                                    inner join jobs j
                                        on j.job_id = e.job_id;
        
        
select * from departments;



--------------------------------------------------------------------------------

/*

    3. 외부 조인, Outer Join
    - 내부 조인 반댓말(X)
    - 내부 조인 결과셋 + a(내부 조인에 포함되징 않은 부모 테이블의 나머지 레코드)
    
    
    select 
        컬럼리스트
    from 테이블A
        inner join 테이블B
            on 테이블A.PK = 테이블B.FK
    
    
    select 
        컬럼리스트
    from 테이블A
        (left|right) outer join 테이블B
            on 테이블A.PK = 테이블B.FK
            

*/

select * from tblCustomer; --3 > 5
select * from tblSales; --9

insert into tblCustomer values (4, '호호호', '010-9999-9999', '서울시');
insert into tblCustomer values (5, '후후후', '010-5555-5555', '강릉시');

-- 내부 조인 > 9 (자식 테이블의 개수)
-- > 물건을 한 번이라도 구매한 이력이 있는 고객의 정보 + 구매 내역을 가져오시오.
-- > 구매 이력이 없는 4, 5번 회원은 제외
-- > 내부 조인 > 양쪽 테이블 모두에 존재하는 행만 가져오기 때문에 
select * from tblCustomer c
    inner join tblSales s
        on s.cseq = c.seq;

-- 외부 조인 > 11개 > 9개 + 2명(참여 못한 회원)
-- > 물건을 한 번이라도 구매한 이력이 있는 고객의 정보 + 구매 내역을 가져오시오.
-- > 물건을 한 번도 구매 안 한 고객의 정보까지도 같이 가져오시오.
select 
    *
from tblCustomer c
    left outer join tblSales s
        on c.seq = s.cseq;


-- inner join과 같은 결과
select 
    *
from tblCustomer c
    right outer join tblSales s
        on c.seq = s.cseq;



--------------------------------------------------------------------------------

-- 내부조인 > 프로젝트를 최소 1건 이상 담당하고 있는 직원 명단 + 담당 프로젝트
select 
    *
from tblStaff s
    inner join tblProject p
        on s.seq = p.staff_seq;
-- 5개

-- 외부 조인 > 담당 프로젝트의 유무와 상관없이 모든 직원 + 프로젝트 정보
select 
    *
from tblStaff s
    left outer join tblProject p
        on s.seq = p.staff_seq;
-- 5 + 1 > 6개



--------------------------------------------------------------------------------

-- 비디오(P) + 대여(C) > 대여가 한 번이라도 발생했던 비디오 + 대여 기록
select count(*) from tblVideo;

select * from tblVideo v
    inner join tblRent r
        on v.seq = r.video;

select distinct name from tblVideo v
    inner join tblRent r
        on v.seq = r.video;

-- 비디오(P) + 대여(C) > 대여와 상관없이 모든 비디오 + 대여 기록
select * from tblVideo v
    left outer join tblRent r
        on v.seq = r.video;



-- 회원 + 대여 > 대여를 최소 1회 이상 했던 회원 + 대여 내역
select * from tblMember m
    inner join tblRent r
        on m.seq = r.member;

-- 회원 + 대여 > 대여와 상관없이 모든 회원 + 대여 내역
select * from tblMember m
    left outer join tblRent r
        on m.seq = r.member;

-- 한 번도 빌리지 않은 회원
select * from tblMember m
    left outer join tblRent r
        on m.seq = r.member
            where r.seq is null;


-- 대여 기록이 있는 회원의 이름과 연락처 + 대여 횟수
select 
    m.name,
    --m.tel
    count(*),
    (select tel from tblMember where name = m.name) --상수(컬럼값X)
from tblMember m
    inner join tblRent r
        on m.seq = r.member
            group by m.name
                order by count(*) desc;

select 
    m.name,
    m.tel,
    count(*)
from tblMember m
    inner join tblRent r
        on m.seq = r.member
            group by m.name, m.tel
                order by count(*) desc;



--------------------------------------------------------------------------------

/*
    
    inner join > 테이블 2개
    outer join > 테이블 2개
    inner join + self join > 테이블 1개
    outer join + self join > 테이블 1개
    
    4. 셀프 조인, Self Join
    - 1개의 테이블을 사용하는 조인
    - 테이블이 자기 스스로와 관계를 맺는 경우에 사용
    
*/

drop table tblSelf; 

-- 직원 테이블
create table tblSelf (
    seq number primary key,                     --직원번호(PK)
    name varchar2(30) not null,                  --직원명
    department varchar2(30) not null,           --부서명
    super number null references tblSelf(seq)   --상사번호(FK)
);

insert into tblSelf values (1, '홍사장', '사장실', null);
insert into tblSelf values (2, '김부장', '영업부', 1);
insert into tblSelf values (3, '박과장', '영업부', 2);
insert into tblSelf values (4, '최대리', '영업부', 3);
insert into tblSelf values (5, '정사원', '영업부', 4);
insert into tblSelf values (6, '이부장', '개발부', 1);
insert into tblSelf values (7, '하과장', '개발부', 6);
insert into tblSelf values (8, '신과장', '개발부', 6);
insert into tblSelf values (9, '황대리', '개발부', 7);
insert into tblSelf values (10, '허사원', '개발부', 9);



-- 직원 명단을 가져오시오. 단, 상사의 이름도
-- 1. join
-- 2. seb query
-- 3. 계층형 쿼리(오라클 전용)



-- 1. join
select
    s2.name as 직원명,
    s1.name as 상사명,
    s2.department as 부서명
from tblSelf s1                 --역할 : 상사 > 부모 테이블
    inner join tblSelf s2       --역할 : 직원 > 자식 테이블
        on s1.seq = s2.super;

select
    s2.name as 직원명,
    s1.name as 상사명,
    s2.department as 부서명
from tblSelf s1                      --역할 : 상사 > 부모 테이블
    left outer join tblSelf s2       --역할 : 직원 > 자식 테이블
        on s1.seq = s2.super;
-- 자식을 가지고 있지 않은 사원

select
    s2.name as 직원명,
    s1.name as 상사명,
    s2.department as 부서명
from tblSelf s1                       --역할 : 상사 > 부모 테이블
    right outer join tblSelf s2       --역할 : 직원 > 자식 테이블
        on s1.seq = s2.super
        
        
        
-- 2. seb query
select 
    name as 직원명,
    department as 부서명,
    (select name from tblSelf where seq = a.super) as 상사명   --서브 쿼리 > 부모 테이블 > 상사
from tblSelf a;   --메인 쿼리 > 자식 테이블 > 직원



--------------------------------------------------------------------------------


/*

    5. 전체 외부 조인, Full Outer Join
    - 서로 참조하고 있는 관계에서 사용

*/

select * from tblMen; 
select * from tblWomen;

-- 커플인 남/녀를 가져오시오.
select
    m.name as 남자,
    w.name as 여자
from tblMen m               --부모
    inner join tblWomen w   --자식
        on m.name = w.couple;


-- 커플 + 남자 솔로
select
    m.name as 남자,
    w.name as 여자
from tblMen m                    --부모
    left outer join tblWomen w   --자식
        on m.name = w.couple;


-- 커플 + 여자 솔로
select
    m.name as 남자,
    w.name as 여자
from tblMen m                     --부모
    right outer join tblWomen w   --자식
        on m.name = w.couple;


-- 커플 + 남자 솔로 + 여자 솔로
select
    m.name as 남자,
    w.name as 여자
from tblMen m                     --부모
    full outer join tblWomen w   --자식
        on m.name = w.couple
            order by m.name, w.name;





























































































