
/*
    
    ex04_operator.sql

    1. 산술 연산자
    - +, -, *, /
    - %(없음) > 함수로 제공(mod())
    
    2. 문자열 연산자 
    - +(X) > ||(+)
    
    3. 비교 연산자 
    - >, >=, <, <=
    - =(==), <>(!=)
    - 논리값 반환 > boolean 존재X > 명시적 표현 불가능 > select절에서 사용X
    
    4. 비교 연산자
    - and(&&), or(||), not(!)
    - 컬럼 리스트에서 사용 불가 
    - 조건절에서 사용 
    
    5. 대입 연산자 
    - = 
    - 컬럽 = 값 
    - update문
    - 복합 대입 연산자(+=, -=..) 없음 
    
    6. 3항 연산자 
    - 없음
    - 제어문 없음 
    
    7. 증감 연산자
    - 없음 
    
    8. SQL 연산자 
    - 자바 > 객체 instanceof 타입
    - 오라클 > int, between, like, is 등..
    

*/


select 
    population, area,
    population + area,
    population - area,
    population * area,
    population / area
from tblCountry;
    
-- ORA-01722: invalid number
select name + capital
from tblCountry;

select name|| capital
from tblCountry;

--select name <> capital
--from tblCountry;

--select population > area
--from tblCountry;

/*

    컴럼의 별칭(Alias) 
    - 결과셋의 컬럼명을 원하는 컬럼명으로 바꾸는 기술 
    - *** 결과셋의 컬럼명이 식별자로 적합하지 않을 때 > 적합한 식별자로 수정



*/


select 
    name,
    age - 1 as 만나이, -- 컬럼명 별칭
    age - 1 as age,
    couple
from tblMen;

select 
    * 
from tblWomen;

select name, age, height from tblMen;

select tblMen.name, tblMen.age, tblMen.height from tblMen;
-- 생략 

select hr.tblMen.name, hr.tblMen.age, hr.tblMen.height from hr.tblMen;
-- 실제 전체 구문 


select m.name, m.age, m.height from tblMen m; -- 짧게 만들려고 만든 식별자 > 보통 한 글자

-- ORA-00904: "TBLMEN"."HEIGHT": invalid identifier
select tblMen.name, tblMen.age, tblMen.height   -- 2.
from tblMen m;                                  -- 1.

select m.name, m.age, m.height   -- 2.
from tblMen m;                   -- 1.


















