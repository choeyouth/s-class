/*
     
     ex09_numerical_function.sql

    숫자 함수
    - Math.XXX()
    
    round()
    - 반올림 함수 
    - number round(컬럼명) : 정수 반환
    - number round(컬럼명, 소수이하 자릿수) : 원하는 자릿수 반환(실수)
    

*/

select avg(basicpay) from tblInsa;           --1556526.66666666666666666666666666666667
select round(avg(basicpay)) from tblInsa;    --1556527
select round(avg(basicpay), 1) from tblInsa; --1556526.7


-- 시스템 테이블
select * from tabs;
select * from dual; --X(dummy) > 1헹 1열짜리 테이블 

select round(3.14) from tblInsa;
select round(3.14) from dual;


select 
    3.5678,
    round(3.5678),
    round(3.5678, 1),
    round(3.5678, 2),
    round(3.5678, 0)
from dual;



--------------------------------------------------------------------------------

/*

    floor(), trunc()
    - 절삭 함수
    - 무조건 내림 함수
    - number floor(컬럼명)
    - number trunc(컬럼명)
    - number trunc(컬럼명, 소수이하 자릿수)

*/

select
    3.9999,
    floor(3.9999),
    trunc(3.9999),
    trunc(3.9999, 1)
from dual;


--------------------------------------------------------------------------------

/*

    ceil()
    - 무조건 올림 함수
    - 천장
    - number ceil(컬럼명)

*/

select 
    3.14,
    ceil(3.14)
from dual;

select 
    floor(3.999999999999),
    ceil(3.0000000000001)
from dual;


--------------------------------------------------------------------------------


/*

    mod()
    - 나머지 함수 
    - number mod(피제수, 제수)

*/

select
    10 / 3,
    floor(10 / 3) as 몫,
    mod(10, 3) as 나머지
from dual;

select 
    abs(10), abs(-10),
    power(2, 2), power(2, 3), power(2, 4),
    sqrt(4), sqrt(9), sqrt(16)
from dual;



--------------------------------------------------------------------------------











