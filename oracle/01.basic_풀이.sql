-- select절 + from절

-- 1. tblCountry
-- 모든 행과 모든 컬럼을 가져오시오.
SELECT * FROM tblCountry;

-- 2.tblCountry
-- 국가명과 수도명을 가져오시오.
SELECT name, capital FROM tblCountry;

-- 3.tblCountry
-- 아래와 같이 가져오시오
-- [국가명]    [수도명]   [인구수]   [면적]    [대륙] <- 컬럼명(Alias)
-- 대한민국   서울        4403       101       AS     <- 데이터
SELECT 
    name AS "[국가명]",
    capital AS "[수도명]",
    population AS "[인구수]",
    area AS "[면적]",
    continent AS "[대륙]"
FROM tblCountry;

-- 4.tblCountry
-- 아래와 같이 가져오시오
-- [국가정보] <- 컬럼명
-- 국가명: 대한민국, 수도명: 서울, 인구수: 4403   <- 데이터
SELECT 
    '국가명: ' || name || ', 수도명: ' || capital || ', 인구수: ' || population AS "[국가정보]"
FROM tblCountry;

-- 5. employees
-- 아래와 같이 가져오시오.
-- [이름]       [이메일]         [연락처]     [급여]
-- Steven King  SKING@gmail.com	 515.123.4567 $24000
SELECT 
    first_name || ' ' || last_name AS "[이름]",
    email || '@gmail.com' AS "[이메일]",
    phone_number AS "[연락처]",
    '$' || salary AS "[급여]"
FROM employees;

















