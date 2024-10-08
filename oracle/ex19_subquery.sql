/*

    ex19_subquery.sql
    
    sub Query
    - 하나의 SQL 안에 또 다른 SQL을 사용하는 기술
    
    1. Main Query
        - 일반 SQL 구문(select, insert, update, create 등..)
        - 또 다른 SQL을 포함하는 바깥쪽 SQL 
    
    2. Sub Query
        - 하나의 SQL 안에 포함된 또 다른 SQL 
        - select(main) <- select(sub)
        - insert(main) <- select(sub)
        - update(main) <- select(sub)
        - delete(main) <- select(sub)
        - 서브 쿼리 삽입 위치 > 대부분의 절에 가능 (select절, where절, order절..)
                              > 값을 넣을 수 있는 곳이면 사용 가능
                              > 상수 or 컬럼명 or 함수 호출 or 서브 쿼리
                              
        
        
*/

-- tblCounty. 인구수가 가장 많은 나라의 이름? 중국

select max(population) from tblCountry; --120660
select name from tblCountry where population = 120660; --max(population)

-- where절(개인에 대한 조건)에서는 집계 함수를 사용할 수 없다.
select name from tblCountry where population = max(population);

-- 서브 쿼리는 소괄호로 묶어준다
select name from tblCountry -- 메인 쿼리
    where population = (select max(population) from tblCountry); -- 서브 쿼리
    
-- tblComedian. 몸무게가 가장 많이 나가는 사람?
select * from tblComedian;

select max(weight) from tblComedian; --129
select * from tblComedian where weight = 129;

select * from tblComedian where weight = (select max(weight) from tblComedian);
select * from tblComedian where weight = (select min(weight) from tblComedian);


-- tblInsa. 평균 급여보다 많이 받는 직원?
select * from tblInsa where basicpay >= (select avg(basicpay) from tblInsa);

-- tblMen, tblWomen
select * from tblMen;
select * from tblWomen;

-- 남자(166cm)의 여자친구 키?
select * from tblMen where height = 166;
select * from tblWomen where couple = (select name from tblMen where height = 166);




--------------------------------------------------------------------------------




/*
    
    서브쿼리 삽입 위치
    1. 조건절 > 비교값으로 사용하기 위해
        a. 반환값이 1행 1열 > 단일값 반환 > 상수 취급 > 값 1개
        b. 반환값이 N형 1열 > 다중값 반환 > 열거형 비교 > in 사용
        c. 반환값이 1행 N열 > 다중값 반환 > 그룹 비교 > N컬럼:N컬럼
        d. 반환값이 N행 N열 > 다중값 반환 > b + c > in + 그룹 비교

    
*/

-- 급여가 260만원 이상 받는 직원이 > 근무하는 부서의 직원들 명단을 가져오시오.
-- ORA-01427: single-row subquery returns more than one row
select * from tblInsa 
    where buseo = (select buseo from tblInsa where basicpay >= 2600000);

select * from tblInsa 
    where buseo = '기획부' or buseo = '총무부';

select * from tblInsa 
    where buseo in ('기획부', '총무부');

select * from tblInsa 
    where buseo in (select buseo from tblInsa where basicpay >= 2600000);


-- '홍길동'과 같은 지역(city), 같은 부서(buseo)인 직원 명단 > 
select city, buseo from tblInsa where name = '홍길동';

select * from tblInsa where city = '서울' and buseo = '기획부';

select * from tblInsa 
    where city = (select city from tblInsa where name = '홍길동') 
        and buseo = (select buseo from tblInsa where name = '홍길동');
    
select * from tblInsa 
    where (city, buseo) = (select city, buseo from tblInsa where name = '홍길동');


-- 급여가 260만원 이상 받는 직원과 같은 지역, 같은 부서의 직원 명단
select * from tblInsa
    where (buseo, city) in (select buseo, city from tblInsa 
                                              where basicpay >= 2600000); 




--------------------------------------------------------------------------------


/*
    
    서브쿼리 삽입 위치
    1. 조건절 > 비교값으로 사용하기 위해
        a. 반환값이 1행 1열 > 단일값 반환 > 상수 취급 > 값 1개
        b. 반환값이 N형 1열 > 다중값 반환 > 열거형 비교 > in 사용
        c. 반환값이 1행 N열 > 다중값 반환 > 그룹 비교 > N컬럼:N컬럼
        d. 반환값이 N행 N열 > 다중값 반환 > b + c > in + 그룹 비교

    2. 컬럼리스트 > 결과셋의 컬럼값으로 사용
        - 반드시 1행 1열을 반환하는 서브쿼리만 사용할 수 있다. (***)
            > Scalar 쿼리(원자값 반환)
        a. 정적 서브 쿼리 > 모든 행에 동일한 값을 반환 
        b. 상관 서브 쿼리 > 메인 쿼리의 일부 컬럼값을 서브쿼리에서 사용
        - *** 대부분의 컬럼리스트의 서브 쿼리는 상관 서브 쿼리이다.
    
    
    
*/

select 
    name, buseo, basicpay,
    (select avg(basicpay) from tblInsa)
from tblInsa;

-- ORA-01427: single-row subquery returns more than one row
select 
    name, buseo, basicpay,
    (select jikwi from tblInsa)
from tblInsa;

-- ORA-00913: too many values
select 
    name, buseo, basicpay,
    (select jikwi, sudang from tblInsa where num = 1001)
from tblInsa;



select 
    a.name, buseo, basicpay,
    (select avg(basicpay) from tblInsa where buseo = a.buseo)
from tblInsa a;



-- 남자(이름, 키, 몸무게) + 여자(이름, 키, 몸무게)
select 
    name, 
    height, 
    weight,
    couple,
    (select height from tblWomen where name = tblMen.couple),
    (select weight from tblWomen where name = tblMen.couple) 
from tblMen;

select * from tblWomen;



--------------------------------------------------------------------------------

/*
    
    서브쿼리 삽입 위치
    1. 조건절 > 비교값으로 사용하기 위해
        a. 반환값이 1행 1열 > 단일값 반환 > 상수 취급 > 값 1개
        b. 반환값이 N형 1열 > 다중값 반환 > 열거형 비교 > in 사용
        c. 반환값이 1행 N열 > 다중값 반환 > 그룹 비교 > N컬럼:N컬럼
        d. 반환값이 N행 N열 > 다중값 반환 > b + c > in + 그룹 비교

    2. 컬럼리스트 > 결과셋의 컬럼값으로 사용
        - 반드시 1행 1열을 반환하는 서브쿼리만 사용할 수 있다. (***)
            > Scalar 쿼리(원자값 반환)
        a. 정적 서브 쿼리 > 모든 행에 동일한 값을 반환 
        b. 상관 서브 쿼리 > 메인 쿼리의 일부 컬럼값을 서브쿼리에서 사용
        - *** 대부분의 컬럼리스트의 서브 쿼리는 상관 서브 쿼리이다.
    
    3. from절에서 사용
        - 서브쿼리의 결과셋을 또 하나의 테이블이라고 생각하고 메인 쿼리를 실행 
        - 인라인 뷰(Inline View)
            
    
*/


select * from (select * from tblInsa);

select * from (select * from tblInsa where buseo = '기획부');























