/*

    ex25_rank.sql
    
    순위 함수
    - rownum 기반으로 만들어진 함수
    
    1. rank() over(order by 컬럼명 [asc|desc]) 
        - 동일값 = 동일한 순위 
        - 누적O
        
    2. dense_rank() over(order by 컬럼명 [asc|desc]) 
        - 동일값 = 동일한 순위 
        - 누적X        
    
    3. row_number() over(order by 컬럼명 [asc|desc]) 
        - rownum 동일
    
    
*/

-- tblInsa. 급여순으로 가져오시오. + 순위 표시 
select a.*, rownum from 
    (select name, buseo, basicpay from tblInsa order by basicpay desc) a;

select 
    name, buseo, basicpay,
    rank() over(order by basicpay desc) as rnum
from tblInsa;

select 
    name, buseo, basicpay,
    dense_rank() over(order by basicpay desc) as rnum
from tblInsa;

select 
    name, buseo, basicpay,
    row_number() over(order by basicpay desc) as rnum
from tblInsa; --rownum 사용 결과 동일 


-- 급여 5위
select * from (select 
                    name, buseo, basicpay,
                    row_number() over(order by basicpay desc) as rnum
                from tblInsa)
                    where rnum = 5;


-- 순위 함수(+ order by)
--------------------------------------------------------------------------------
-- 순위 함수(+ order by + patition by) > order by + group by > 그룹별 순위 

select * from (select
                    name, buseo, basicpay,
                    rank() over(order by basicpay desc) as rnum
                from tblInsa) where rnum = 1; --전직원 연봉 1위
            

select * from (select
                    name, buseo, basicpay,
                    rank() over(partition by buseo order by basicpay desc) as rnum
                from tblInsa) where rnum = 1; --각부서별 연봉 1위


with aaa as (select
                name, buseo, basicpay,
                rank() over(partition by buseo order by basicpay desc) as rnum
            from tblInsa)
            
select * from aaa where rnum = 1;









































































































































