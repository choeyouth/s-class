/*

    ex21_view.sql

    View, 뷰
    - 데이터베이스 객체 중 하나(테이블, 제약사항, 시퀀스, 뷰..)
    - 가상 테이블, 뷰 테이블 등..
    - 테이블처럼 사용한다.(***)
    - SQL(select)문을 저장하는 객체(***********************)
    
    
    사용 목적
    1. 자주 쓰는 쿼리(select)를 저장
    2. 복잡하고 긴 쿼리(select)를 저장
    3. 저장 객체 > DB Object > 오라클에 저장 > 사용자끼리 공유/재사용/협업 
    4. 권한 통제

    
    create [or relace] view 뷰이름
    as
    select 문;

*/

create or replace view vwInsa
as --연결부(as, is) 
select * from tblInsa;


-- or relace > 없으면 생성, 있으면 수정
create or replace view vwInsa
as --연결부(as, is) 
select * from tblInsa where buseo = '개발부';

update tblInsa set city = '제주' where num = 1060;

select * from vwInsa;   --복사본 > 수정 
select * from (select * from tblInsa where buseo = '개발부');   
select * from tblInsa;  --원본   > 수정 


-- 비디오 대여점 사장 > 출근 > 날마다 업무
create or replace view vwCheck
as
select 
    m.name as 회원,
    v.name as 비디오,
    r.rentdate as 언제,
    r.retdate as 반납,
    g.period as 대여기간,
    r.rentdate + g.period as 반납예정일,
    round(sysdate - (r.rentdate + g.period)) as 연체일,
    round((sysdate - (r.rentdate + g.period)) * g.price * 0.1) as 연체료
from tblRent r
    inner join tblVideo v
        on v.seq = r.video
            inner join tblGenre g
                on g.seq = v.genre
                    inner join tblMember m
                        on m.seq = r.member;

select * from vwCheck;
--  1. 자주 쓰는 쿼리(select)를 저장
--  2. 복잡하고 긴 쿼리(select)를 저장




create or replace view vwInsa
as
select * from tblInsa;

-- 신입 사원 > 담당 업무 > 전직원 문자 메시지 발송 > 전직원 연락처?
-- 데이터베이스 로그인 > systam, hr > 신입 사원용 계정 생성
-- > tblInsa 접근 권한(X)
-- > vwInsa 접근 권한(O)

select * from tblInsa;

create or replace view vwInsa
as
select name, buseo, jikwi, tel from tblInsa;

select * from vwInsa;



-- 뷰 사용 시 주의점!!
-- 1. select > 실행O > 뷰는 읽기 전용으로 한다. == 읽기 전용 테이블 
-- 2. insert > 실행O > 절대 사용 금지!!
-- 3. update > 실행O > 절대 사용 금지!!
-- 4. delete > 실행O > 절대 사용 금지!!

-- 단순 뷰 > 뷰의 select문이 1개의 테이블로 구성
create or replace view vwTodo
as
select * from tblTodo;

select * from vwTodo;
insert into vwTodo values(21, '뷰 만들기', sysdate, null);
update vwTodo set completedate = sysdate where seq = 21;
delete from vwTodo where seq = 21;

-- 복합 뷰 > 뷰의 select문이 2개 이상의 테이블로 구성
select * from vwCheck;
insert into vwCheck (컬럼리스트) values (값리스트);
delete from vwCheck where 기본키 = ?;

-- vwTodo vs vwCheck > 어떤 게 단순뷰? 복합뷰?













































































































































