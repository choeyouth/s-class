/*

    ex10_string_function.sql
    
    문자열 함수 
      
    대소문자 변환
    - upper(), lower(), initcap()
    - varchar2 upper(컬럼명)
    - varchar2 lower(컬럼명)
    - varchar2 initcap(컬럼명)
    
*/

select
    'javaTest',
    upper('javaTest'),  --JAVATEST
    lower('javaTest'),  --javatest
    initcap('javaTest') --Javatest
from dual;


-- employees. 이름에 'de'이 포함된 사람 검색?
select first_name from employees
    where first_name like '%de%'
        or first_name like '%DE%'
        or first_name like '%De%'
        or first_name like '%dE%';


select first_name from employees
    where upper(first_name) like '%DE%';



--------------------------------------------------------------------------------

/*

    문자열 추출 함수
    - subsrt()
    - varchar2 substr(컬럼명, 시작위치, 가져올 문자 개수) -> 길이
    - varchar2 substr(컬럼명, 시작위치) -> 끝까지

*/


select
    name, 
    substr(name, 1, 3), -- 3글자
    substr(name, 1) 
from tblCountry;


select
    name, ssn,
    substr(ssn, 1, 2) as 생년,
    substr(ssn, 3, 2) as 생월,
    substr(ssn, 5, 2) as 생일,
    substr(ssn, 8, 1) as 성별
from tblInsa;

-- tblInsa > 김, 이, 박, 최, 정 > 각각 몇명?
select count(*) from tblInsa where name like '김%'; --12
select count(*) from tblInsa where substr(name, 1, 1) = '김'; --12
select count(*) from tblInsa where substr(name, 1, 1) = '이'; --14
select count(*) from tblInsa where substr(name, 1, 1) = '박'; --2
select count(*) from tblInsa where substr(name, 1, 1) = '최'; --1
select count(*) from tblInsa where substr(name, 1, 1) = '정'; --5

-- 하나의 테이블에 다섯개의 숫자 동시에
select 
    count(case
        when substr(name, 1, 1) = '김' then 1
    end) as 김,
    count(case
        when substr(name, 1, 1) = '이' then 1
    end) as 이,
    count(case
        when substr(name, 1, 1) = '박' then 1
    end) as 박,
    count(case
        when substr(name, 1, 1) = '최' then 1
    end) as 최,
    count(case
        when substr(name, 1, 1) = '정' then 1
    end) as 정,
    count(case
        when substr(name, 1, 1) not in('김', '이', '박', '최', '정') then 1
    end) as 나머지
from tblInsa;



--------------------------------------------------------------------------------

/*

    문자열 길이
    - length()
    - number length(컬럼명)

*/

-- 대부분의 함수 > 적용 가능한 위치
-- 컬럼 리스트 
select name, length(name) from tblCountry;

-- 조건절에서 사용
select 
    name, 
    length(name) as ln 
from tblCountry
    where ln > 3; --select절 순서가 가장 마지막이기 때문에 오류
    
select 
    name, 
    length(name) 
from tblCountry
    where length(name) > 3; 
    


-- 정렬에서 사용
select name, length(name) from tblCountry
    order by length(name) desc;

select name, length(name) from tblCountry
    order by 2 desc;

select name, length(name) as ln from tblCountry
    order by ln desc;

select name from tblCountry
    order by length(name) desc;


select name, ssn from tblInsa order by substr(ssn, 8, 1) asc; --남여 정렬




--------------------------------------------------------------------------------




/*
    
    문자열 검색
    - instr()
    - 검색어의 위치를 반환
    - number instr(컬럼명, 검색어)
    - number instr(컬럼명, 검색어, 시작위치)
    - number instr(컬럼명, 검색어, 시작위치, -1) //lastIndexOf()
    - 못 찾으면 0을 반환
    
*/

select
    '안녕하세요. 홍길동님',
    instr('안녕하세요. 홍길동님', '홍길동'), --8
    instr('안녕하세요. 홍길동님', '아무개'), --0
    instr('안녕하세요. 홍길동님. 홍길동님', '홍길동'), --8
    instr('안녕하세요. 홍길동님. 홍길동님', '홍길동', instr('안녕하세요. 홍길동님. 홍길동님', '홍길동') + length('홍길동')), --14
    instr('안녕하세요. 홍길동님. 홍길동님', '홍길동', -1) --14
from dual;


--------------------------------------------------------------------------------

/*
    
    패딩
    - lpad(), rpad()
    - left padding, right padding
    - varchar2 lpad(컬럼명, 개수, 문자)
    - varchar2 rpad(컬럼명, 개수, 문자)
    
*/

select
    lpad('A', 5),
    lpad('A', 5, 'B'),      --BBBBA
    lpad('AA', 5, 'B'),     --BBBAA
    lpad('AAA', 5, 'B'),    --BBAAA
    lpad('AAAA', 5, 'B'),   --BAAAA
    lpad('AAAAA', 5, 'B'),  --AAAAA
    lpad('AAAAAA', 5, 'B'), --AAAAA
    lpad('1', 3, '0'),      --001
    rpad('1', 3, '0')       --100
from dual;



--------------------------------------------------------------------------------

/*

    공백 제거
    - trim(), ltrim(), rtrim()
    - varchar2 trim(컬럼명)
    - varchar2 ltrim(컬럼명)
    - varchar2 rtrim(컬럼명)
    
*/


select 
    '       하나      둘       셋       ',
    trim('       하나      둘       셋       '),
    ltrim('       하나      둘       셋       '),
    rtrim('       하나      둘       셋       ')
from dual;



--------------------------------------------------------------------------------

/*
    
    문자열 치환
    - replace()
    - varchar2 replace(컬럼명, 찾을 문자열, 바꿀 문자열)
    
    - varchar2 regexp_replace(컬럼명, 찾을 문자열, 바꿀 문자열)

*/

select
    replace('홍길동', '홍', '김'), --김길동
    replace('홍길동', '이', '김'), --홍길동
    replace('홍길홍', '홍', '김')  --김길김
from dual;


select 
    name,
    regexp_replace(name, '김[가-힣]{2}', '김00')
from tblInsa;

select 
    name,
    regexp_replace(name, '김[가-힣]{2}', '김00'),
    tel,
    regexp_replace(tel, '(\d{3})-(\d{4})-\d{4}', '\1-\2-XXXX'),
    regexp_replace(tel, '(\d{3}-\d{4})-\d{4}', '\1-XXXX')
from tblInsa;


--------------------------------------------------------------------------------

-- split() 없음 > 배열(X)

/*

    문자열 치환
    - decode()
    - replace() 유사 x N회
    - varchar2 decode(컬럼명, 찾을 문자열, 바꿀 문자열)
    - varchar2 decode(컬럼명, 찾을 문자열, 바꿀 문자열 [, 찾을 문자열, 바꿀 문자열] x N)
    - 치환할 대상을 못찾으면 null을 반환(*****)
    
*/

-- tblComedian. 성별 > 남자, 여자

select
    gender,
    case
        when gender = 'm' then '남자'
        when gender = 'f' then '여자'
    end as g1,
    replace(replace(gender, 'm', '남자'), 'f', '여자') as g2, --가독성X
    decode(gender, 'm', '남자', 'f', '여자') as g3 
from tblComedian;


-- tblComedian. 남자수? 여자수?
select 
    count(case
        when gender = 'm' then 1
    end), 
    count(case
        when gender = 'f' then 2
    end),
    count(decode(gender, 'm', 1)),
    count(decode(gender, 'f', 2))
from tblComedian;



















