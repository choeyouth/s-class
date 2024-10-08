/*

    ex06_column.sql
    
    컬럼 리스트에서 할 수 있는 행동
    - SELECT 컬럼리스트

*/

-- 컬럼명
select name from tblcountry;

-- 연산 > 결과셋의 컬럼명이 유효한지 확인? > 별칭 사용!
select area + 100, name || '나라' from tblcountry;

-- 상수 
select 100 from tblcountry;
-- 고정값을 가져옴 (100) 

-- 함수(메서드) == 데이터
select length(name) from tblcountry;

/*

    distinct
    - Java Stream: list.stream().distinct().forEach();
    - 컬럼 리스트에서 사용
    - 중복값 제거 
    - 컬럼의 중복값 제거(X) > 레코드 전체의 중복값 제거(O)
    

*/

-- tblCountry에 어떤 종류의 대륙들이 있습니까?
select DISTINCT continent from tblcountry;


-- tblInsa. 이 회사는 어떤 부서가 있어요?
select buseo from tblInsa;
select Distinct buseo from tblInsa;

SELECT jikwi from tblInsa;
SELECT DISTINCT jikwi from tblInsa;

SELECT name from tblInsa;
SELECT distinct name from tblInsa; -- 동명이인 없음.


-- 어떤 부서 존재? + 그 부서에 속한 직원명 
SELECT DISTINCT buseo, name from tblInsa; -- 60개
-- distinct > 뒤에 붙은 모든 컬럼 리스트에게 해당 >> 레코드의 중복값 제거 

SELECT buseo, DISTINCT name from tblInsa; -- 60개


/*

    case
    - 대부분의 절에서 사용
    - switch case문 역할 
    - 조건을 만족하면 then을 반환
    - 조건을 불만족하면 null을 반환

*/

select
    last || first as name,
    gender,
    case
        -- when 조건 then 값 
        when gender = 'm' then '남자'
        when gender = 'f' then '여자'
    end as kgender                                                                                                                                 
from tblComedian; 

select
    name, continent,
    case
        when continent = 'AS' then '아시아'
        when continent = 'EU' then '유럽'
        when continent = 'AF' then '아프리카'
        --else '기타'
        --else continent -- 그대로 돌려줌
        --else 100 --자료형이 맞지 않으면 오류
        else name -- 같은 포맷을 가지는 값만 리턴
    end as continentName
from tblCountry;

select
    last || first as name,
    weight,
    case
        when weight > 90 then '과체중'
        when weight > 50 then '보통체중' -- 위에 거 먼저 검사
        else '저체중'
    end as state,
    case
        when weight >= 50 and weight <= 90 then '보통체중'
        else '주의체중'
    end as state,
    case
        when weight between 50 and 90 then '보통체중'
        else '주의체중'
    end as state
from tblComedian;


-- 사원, 대리 > 현장직
-- 과장, 부장 > 관리직

select
    name, jikwi,
    case
        when jikwi = '과장' or jikwi = '부장' then '관리직'
        else '현장직'
    end,
    case
        when jikwi in ('과장', '부장') then '관리직'
        else '현장직'
    end,
    case
        when jikwi like '%장' then '관리직'
        else '현장직'
    end
from tblInsa;


select 
    title,
    case
        when completedate is not null then '완료'
        when completedate is null then '미완료'
    end 
from tblTodo;















