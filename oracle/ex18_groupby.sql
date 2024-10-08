/*

    ex18_groupby.sql
    
    [WITH <Sub Query>]
    SELECT column_list
    FROM table_name
    [WHERE search_condition]
    [GROUP BY group_by_expression]
    [HAVING search_condition]
    [ORDER BY order_expression [ASC|DESC]];
    
    역할
    SELECT 컬럼리스트    -- 원하는 컬럼을 지정 > 지정된 컬럼만 가져와라.
    FROM 테이블;         -- 데이터 소스. 어떤 테이블로부터 데이터를 가져와라.
    WHERE 검색조건;      -- 조건 지정. 원하는 레코드만 걸러낸다. 
    GROUP BY 그룹기준    -- 특정 컬럼값을 기준으로 여러 그룹을 나눈다.
    ORDER BY 정렬기준;   -- 결과셋의 레코드 순서를 정한다. 
    
    순서
    4. SELECT
    1. FROM
    2. WHERE        
    3. GROUP BY
    5. ORDER BY
    
    GROUP BY 절
    - 특정 기준으로 레코드를 그룹으로 나눈다. (수단)
        > 각각의 그룹을 대상으로 집계 함수를 실행한다. (목적) 
    
    
    
    
*/

-- 부서별 평균 급여?
select * from tblInsa;

select round(avg(basicpay)) from tblInsa; --1556527

select distinct buseo from tblInsa;

select round(avg(basicpay)) from tblInsa where buseo = '총무부'; --1714857
select round(avg(basicpay)) from tblInsa where buseo = '개발부'; --1387857
select round(avg(basicpay)) from tblInsa where buseo = '영업부'; --1601513
select round(avg(basicpay)) from tblInsa where buseo = '기획부'; --1855714
select round(avg(basicpay)) from tblInsa where buseo = '인사부'; --1533000
select round(avg(basicpay)) from tblInsa where buseo = '자재부'; --1416733
select round(avg(basicpay)) from tblInsa where buseo = '홍보부'; --1451833

-- 1개의 select문
select 
    buseo, round(avg(basicpay)) as "부서별 평균 급여",
    count(*) as "부서별 인원수",
    sum(basicpay) as "부서별 총지급액",
    max(basicpay) as "부서내의 최고 급여",
    min(basicpay) as "부서내의 최저 급여"
from tblInsa
    group by buseo;
    

-- 남자수? 여자수?
-- 경직된 방법
select 
    count(decode(gender, 'm', 1)) as 남자수,
    count(decode(gender, 'f', 1)) as 여자수
from tblComedian;

-- 유연한 방법
select 
    gender, count(*) 
from tblComedian
    group by gender;


select 
    jikwi, count(*)
from tblInsa
    group by jikwi;
    
select 
    city, count(*)
from tblInsa
    group by city
        order by count(*) desc;


select 
    name, count(*)
from tblInsa
    group by name; --60개


-- 다중 그룹
select 
    buseo, jikwi, count(*)
from tblInsa
    group by buseo, jikwi;


select 
    buseo, jikwi, count(*)
from tblInsa
    group by jikwi, buseo;



-- 급여별 그룹
-- 100만원 이하
-- 100만원 ~ 200만원 이하
-- 200만원 이상
select
    basicpay, count(*)
from tblInsa
    group by basicpay;


select 
    basicpay,
    (floor(basicpay / 1000000) + 1) * 100 || '만원 이하'
from tblInsa;

select 
    floor(basicpay / 1000000), count(*),
    (floor(basicpay / 1000000) + 1) * 100 || '만원 이하'
from tblInsa
    group by floor(basicpay / 1000000);


-- tblInsa. 여자수? 남자수?
select
    case
        when substr(ssn, 8, 1) = '1' then '남자'
        when substr(ssn, 8, 1) = '2' then '여자'
    end as 성별, 
    count(*)
from tblInsa
    group by substr(ssn, 8, 1);


-- 한 일 개수? 안 한 일 개수?
select
    case
        when completedate is null then '안한일'
        when completedate is not null then '한일'
    end,
    count(*)
from tblTodo
    group by case
        when completedate is null then '안한일'
        when completedate is not null then '한일'
    end;

select 
    case
        when completedate is null then '안한일'
        when completedate is not null then '한일'
    end
from tblTodo;



-- 직위별 인원 > 과정 + 부장, 사원 + 대리? 
select 
    jikwi, count(*)
from tblInsa
    group by jikwi;


select 
    case
        when jikwi in ('과장', '부장') then '관리직'
        when jikwi in ('사원', '대리') then '현장직'
    end,
    count(*)
from tblInsa
    group by case
        when jikwi in ('과장', '부장') then '관리직'
        when jikwi in ('사원', '대리') then '현장직'
    end;


-- group by 사용 시 주의!!!! > 집계 함수의 주의점과 유사 
-- ORA-00979: not a GROUP BY expression

-- group by가 포함된 select 문은 목적이 그룹에 관련된 질의
-- > select절에서 일반 컬럼(개인 데이터)은 사용이 불가능하다.
-- > 집계함수 또는 group by 기준 컬럼만 사용이 가능하다. 

select 
    count(*), jikwi
from tblInsa
    group by jikwi;
-- 공용 값과 개인 값은 같이 사용할 수 없다.
-- group by절에는 일반 컬럼이 올 수 없다.
-- jikwi > 그룹으로 묶인 값 (집합) 



--------------------------------------------------------------------------------



/*

    
    [WITH <Sub Query>]
    SELECT column_list
    FROM table_name
    [WHERE search_condition]
    [GROUP BY group_by_expression]
    [HAVING search_condition]
    [ORDER BY order_expression [ASC|DESC]];
    
    역할
    SELECT 컬럼리스트    -- 원하는 컬럼을 지정 > 지정된 컬럼만 가져와라.
    FROM 테이블;         -- 데이터 소스. 어떤 테이블로부터 데이터를 가져와라.
    WHERE 검색조건;      -- 조건 지정. 원하는 레코드만 걸러낸다. 
    GROUP BY 그룹기준    -- 특정 컬럼값을 기준으로 여러 그룹을 나눈다.
    HAVING 검색조건      -- 조건 지정. 원하는 그룹만 걸러낸다. 
    ORDER BY 정렬기준;   -- 결과셋의 레코드 순서를 정한다. 
    
    순서
    5. SELECT
 
    1. FROM
    2. WHERE        
 
    3. GROUP BY
    4. HAVING
 
    6. ORDER BY
    

    
*/


select 
    count(*)
from tblInsa
    where basicpay >= 1500000;

select 
    buseo, count(*)
from tblInsa
    group by buseo;

select 
    buseo, count(*)                             --4. 집계함수
from tblInsa                                    --1. 60명의 데이터를 가져온다.
    where basicpay >= 1500000                   --2. 60명을 대상으로 조건을 검사한다.
        group by buseo;                         --3. 2번을 통과한 사람들을 대상으로 그룹 짓기


select 
    buseo, count(*)                             --4. 그룹함수
from tblInsa                                    --1. 60명의 데이터를 가져온다.    
    group by buseo                              --2. 60명을 대상으로 그룹을 짓는다.
        having avg(basicpay) >= 1500000;        --3. 그룹을 대상으로 조건을 검사한다.  
        -- having basicpay >= 1500000; > 오류
        

select 
    buseo, count(*)                             
from tblInsa    
    where basicpay >= 1500000
        group by buseo                              
            having avg(basicpay) >= 1500000;  


-- 부서별로(group by) 과장/부장의(where) 인원수가 3명 이상인(having) 부서들?
select
    buseo, count(*)
from tblInsa
    where jikwi in ('과장', '부장')
        group by buseo
            having count(*) >= 3;




























