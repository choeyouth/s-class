/*

    ex24_pseudo.sql
    
    의사 컬럼, Pseodo column
    - 실제 컬럼이 아닌데 컬럼처럼 행동하는 객체 
    
    rownum
    - 행번호
    - 결과셋의 행번호 반환 
    - 오라클 전용 
    
*/

select 
    name, buseo,     --컬럼(속성). 래코드(객체)에 따라 각자 다른 값을 가진다. 
    100,             --상수. 모든 레코드(객체)가 동일한 값을 가진다.
    substr(name, 2), --함수. 레코드(객체)에 따라 다른 값을 가진다.
    rownum           --의사 컬럼
from tblInsa;

select name, buseo, rownum from tblInsa where rownum = 1;
select name, buseo, rownum from tblInsa where rownum <= 5;
-- 위치를 통해 조건을 건다.

-- 게시판 > 페이징
-- 1페이지 > where rownum between 1 and 10
-- 2페이지 > where rownum between 11 and 20
-- 3페이지 > where rownum between 21 and 30

select name, buseo, rownum from tblInsa where rownum >= 1 and rownum <= 10;
select name, buseo, rownum from tblInsa where rownum >= 11 and rownum <= 20;
select name, buseo, rownum from tblInsa where rownum >= 21 and rownum <= 30;
select name, buseo, rownum from tblInsa where rownum = 1;
select name, buseo, rownum from tblInsa where rownum = 3;

-- *** 1. rownum은 from절이 실행하는 순간 생성된다.
-- *** 2. where절에 의해서 결과셋에 변화가 생기면 rownum은 다시 계산된다.

select name, buseo, rownum  --2.  rownum > 1번에서 만들어진 rownum을 그냥 가져온다. (읽기)
from tblInsa;               --1. from절이 실행되는 순간 모든 레코드에 rownum이 할당

select name, buseo, rownum  --3. 읽기
from tblInsa                --1. 할당
where rownum = 1;           --2. 조건

select name, buseo, rownum              --3. 읽기
from tblInsa                            --1. 할당
where rownum >= 5 and rownum <= 10;     --2. 조건



-- rownum + 서브쿼리 > 원하는 영역을 가져오기
-- 서브쿼리 > 1~2개

-- 급여가 많은 1~3등 가져오기
select name, basicpay from tblInsa where rownum <= 3 order by basicpay desc;

select name, basicpay, rownum 
from tblInsa                    --1.
order by basicpay desc;         --2.

select name, basicpay, rnum, rownum
from (select name, basicpay, rownum as rnum
      from tblInsa  
      order by basicpay desc)
where rownum <= 3;






-- 급여가 많은 5~10등 가져오기
select name, basicpay from tblInsa order by basicpay desc;

select * from (select name, basicpay from tblInsa order by basicpay desc)
    where rownum >= 5 and rownum <= 10;

select
    b.*
from (select a.*, rownum as rnum 
         from (select name, basicpay 
                from tblInsa order by basicpay desc) a) b
                    where rnum >= 5 and rnum <= 10;

create or replace view vwBasicpay
as
select
    *
from (select a.*, rownum as rnum 
         from (select name, basicpay 
                from tblInsa order by basicpay desc) a);

select * from vwBasicpay where rnum between 1 and 10;
select * from vwBasicpay where rnum between 11 and 20;
select * from vwBasicpay where rnum between 21 and 30;


-- 12c 지원
select
    *
from tblInsa
    order by basicpay desc
        offset 4 rows fetch next 6 rows only; --5 and 10





































































































