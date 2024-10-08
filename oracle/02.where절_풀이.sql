-- tblInsa

-- 1. 급여(basicPay)가 1,500,000원 이상인 직원들의 이름과 급여를 조회하세요.
SELECT name, basicPay FROM tblInsa WHERE basicPay >= 1500000;

-- 2. 부서(buseo)가 '개발부'인 직원들의 이름과 직위(jikwi)를 조회하세요.
SELECT name, jikwi FROM tblInsa WHERE buseo = '개발부';

-- 3. 서울에 사는 직원 중 직위가 '부장'인 사람의 이름과 급여를 조회하세요.
SELECT name, basicPay FROM tblInsa WHERE city = '서울' AND jikwi = '부장';

-- 4. 입사일(ibsaDate)이 2010년 1월 1일 이후인 직원의 이름과 입사일을 조회하세요.
SELECT name, ibsaDate FROM tblInsa WHERE ibsaDate > '2010-01-01';

-- 5. 급여가 2,000,000원 이상이고 수당(sudang)이 150,000원 이상인 직원의 이름과 급여, 수당을 조회하세요.
SELECT name, basicPay, sudang FROM tblInsa WHERE basicPay >= 2000000 AND sudang >= 150000;

-- 6. 이름이 '김'으로 시작하는 직원의 이름과 주민번호(ssn)를 조회하세요.
SELECT name, ssn FROM tblInsa WHERE name LIKE '김%';

-- 7. 부서가 '인사부'이거나 '영업부'인 직원의 이름과 부서를 조회하세요.
SELECT name, buseo FROM tblInsa WHERE buseo IN ('인사부', '영업부');

-- 8. 급여가 1,500,000원 이상 2,500,000원 이하인 직원의 이름과 급여를 조회하세요.
SELECT name, basicPay FROM tblInsa WHERE basicPay BETWEEN 1500000 AND 2500000;

-- 9. 전화번호(tel)가 없는 직원의 이름과 부서를 조회하세요.
SELECT name, buseo FROM tblInsa WHERE tel IS NULL;

-- 10. 수당이 급여의 20% 이상인 직원의 이름과 급여, 수당을 조회하세요.
SELECT name, basicPay, sudang FROM tblInsa WHERE sudang >= basicPay * 0.2;


-- tblCountry

-- 11. 인구(population)가 5000만 명 이상인 국가의 이름과 인구수를 조회하세요.
SELECT name, population FROM tblCountry WHERE population >= 50000000;

-- 12. 대륙(continent)이 'AS'인 국가의 이름과 수도를 조회하세요.
SELECT name, capital FROM tblCountry WHERE continent = 'AS';

-- 13. 면적(area)이 100보다 작은 국가의 이름과 면적을 조회하세요.
SELECT name, area FROM tblCountry WHERE area < 100;

-- 14. 국가명에 '한' 이 포함된 국가의 모든 정보를 조회하세요.
SELECT * FROM tblCountry WHERE name LIKE '%한%';

-- 15. 수도 이름이 '산'로 시작하는 국가의 이름과 수도를 조회하세요.
SELECT name, capital FROM tblCountry WHERE capital LIKE '산%';

-- 16. 인구가 1000만 명 이상이고 면적이 50 이상인 국가의 이름, 인구, 면적을 조회하세요.
SELECT name, population, area FROM tblCountry WHERE population >= 10000000 AND area >= 50;

-- 17. 대륙이 'AS'이거나 'EU'인 국가의 이름과 대륙을 조회하세요.
SELECT name, continent FROM tblCountry WHERE continent IN ('AS', 'EU');

-- 18. 인구 정보가 없는 국가의 이름과 수도를 조회하세요.
SELECT name, capital FROM tblCountry WHERE population IS NULL;

-- 19. 면적이 10 이상 100 이하인 국가의 이름과 면적을 조회하세요.
SELECT name, area FROM tblCountry WHERE area BETWEEN 10 AND 100;

-- 20. 국가 이름이 'K'로 시작하거나 'a'로 끝나는 국가의 이름을 조회하세요.
SELECT name FROM tblCountry WHERE name LIKE 'K%' OR name LIKE '%a';


-- tblComedian

-- 21. 몸무게(weight)가 70kg 이상인 코미디언의 이름(first, last)과 몸무게를 조회하세요.
SELECT first || ' ' || last AS name, weight FROM tblComedian WHERE weight >= 70;

-- 22. 성별(gender)이 'f'인 코미디언의 이름과 키(height)를 조회하세요.
SELECT first || ' ' || last AS name, height FROM tblComedian WHERE gender = 'f';

-- 23. 키가 170cm 이상이고 몸무게가 80kg 이하인 코미디언의 이름과 키, 몸무게를 조회하세요.
SELECT first || ' ' || last AS name, height, weight FROM tblComedian WHERE height >= 170 AND weight <= 80;

-- 24. 이름(first)에 '동' 또는 '민'이 포함된 코미디언의 이름을 조회하세요.
SELECT first || ' ' || last AS name FROM tblComedian WHERE first LIKE '%동%' OR first LIKE '%민%';

-- 25. 성씨(last)가 '김'씨인 코미디언의 모든 정보를 조회하세요.
SELECT * FROM tblComedian WHERE last = '김';

-- 26. 키가 180cm 이상인 남성 코미디언의 이름과 키를 조회하세요.
SELECT first || ' ' || last AS name, height FROM tblComedian WHERE height >= 180 AND gender = 'm';

-- 27. 별명(nick)에 '상'이 포함된 코미디언의 이름과 별명을 조회하세요.
SELECT first || ' ' || last AS name, nick FROM tblComedian WHERE nick LIKE '%상%';

-- 28. 몸무게가 70kg 이상 80kg 이하인 코미디언의 이름과 몸무게를 조회하세요.
SELECT first || ' ' || last AS name, weight FROM tblComedian WHERE weight BETWEEN 70 AND 80;

-- 29. 키가 160cm 이상 170cm 이하인 여성 코미디언의 이름과 키를 조회하세요.
SELECT first || ' ' || last AS name, height FROM tblComedian WHERE height BETWEEN 160 AND 170 AND gender = 'f';

-- 30. 별명이 '프로'로 시작하는 코미디언의 이름과 별명을 조회하세요.
SELECT first || ' ' || last AS name, nick FROM tblComedian WHERE nick LIKE '프로%';


-- tblDiary

-- 31. 날씨(weather)가 '맑음'인 날의 제목(subject)과 날짜(regdate)를 조회하세요.
SELECT subject, regdate FROM tblDiary WHERE weather = '맑음';

-- 32. 2024년 2월 20일 이후의 일기 제목과 날짜를 조회하세요.
SELECT subject, regdate FROM tblDiary WHERE regdate >= '2024-02-20';

-- 33. 제목에 '에러'가 포함된 일기의 모든 정보를 조회하세요.
SELECT * FROM tblDiary WHERE subject LIKE '%에러%';

-- 34. 날씨가 '흐림'이거나 '비'인 날의 제목과 날씨를 조회하세요.
SELECT subject, weather FROM tblDiary WHERE weather IN ('흐림', '비');

-- 35. 2024년 2월 18일에 작성된 일기의 제목과 날씨를 조회하세요.
SELECT subject, weather FROM tblDiary WHERE regdate = '2024-02-18';

-- 36. 제목이 '오라클'로 시작하는 일기의 제목과 날짜를 조회하세요.
SELECT subject, regdate FROM tblDiary WHERE subject LIKE '오라클%';

-- 37. 날짜가 2024년 2월 25일 이전이고 날씨가 '맑음'인 일기의 모든 정보를 조회하세요.
SELECT * FROM tblDiary WHERE regdate <= '2024-02-25' AND weather = '맑음';

-- 38. 2024년 2월에 작성된 모든 일기의 제목과 날짜를 조회하세요.
SELECT subject, regdate FROM tblDiary WHERE regdate BETWEEN '2024-02-01' AND '2024-02-29';

-- 39. 날씨가 '맑음'이 아닌 모든 일기의 제목, 날씨, 날짜를 조회하세요.
SELECT subject, weather, regdate FROM tblDiary WHERE weather != '맑음';

-- 40. 제목에 '영화'가 포함된 일기의 제목과 날짜를 조회하세요.
SELECT subject, regdate FROM tblDiary WHERE subject LIKE '%영화%';


-- tblMen, tblWomen

-- 41. tblMen에서 나이(age)가 25세 이상인 남성의 이름과 나이를 조회하세요.
SELECT name, age FROM tblMen WHERE age >= 25;

-- 42. tblWomen에서 키(height)가 160cm 이상인 여성의 이름과 키를 조회하세요.
SELECT name, height FROM tblWomen WHERE height >= 160;

-- 43. tblMen에서 몸무게(weight) 정보가 없는 남성의 이름을 조회하세요.
SELECT name FROM tblMen WHERE weight IS NULL;

-- 44. tblWomen에서 커플(couple)이 있는 여성의 이름과 커플 이름을 조회하세요.
SELECT name, couple FROM tblWomen WHERE couple IS NOT NULL;

-- 45. tblMen에서 이름에 '형'이 포함된 남성의 이름과 나이를 조회하세요.
SELECT name, age FROM tblMen WHERE name LIKE '%형%';

-- 46. tblWomen에서 나이가 25세 이상 30세 이하인 여성의 이름과 나이를 조회하세요.
SELECT name, age FROM tblWomen WHERE age BETWEEN 25 AND 30;

-- 47. tblMen에서 키가 175cm 이상이고 몸무게가 70kg 이상인 남성의 이름, 키, 몸무게를 조회하세요.
SELECT name, height, weight FROM tblMen WHERE height >= 175 AND weight >= 70;

-- 48. tblWomen에서 커플이 없는 여성의 이름과 나이를 조회하세요.
SELECT name, age FROM tblWomen WHERE couple IS NULL;

-- 49. tblMen에서 이름이 '김'으로 시작하는 남성의 이름과 나이를 조회하세요.
SELECT name, age FROM tblMen WHERE name LIKE '김%';

-- 50. tblWomen에서 몸무게가 50kg 이상 60kg 이하인 여성의 이름과 몸무게를 조회하세요.
SELECT name, weight FROM tblWomen WHERE weight BETWEEN 50 AND 60;


-- tblHousekeeping

-- 51. 가격(price)이 5000원 이상인 물건의 이름(item)과 가격을 조회하세요.
SELECT item, price FROM tblHousekeeping WHERE price >= 5000;

-- 52. 구매일(buydate)이 2024년 2월 10일 이후인 물건의 이름과 구매일을 조회하세요.
SELECT item, buydate FROM tblHousekeeping WHERE buydate >= '2024-02-10';

-- 53. 수량(qty)이 5개 이상인 물건의 이름과 수량을 조회하세요.
SELECT item, qty FROM tblHousekeeping WHERE qty >= 5;

-- 54. 메모(memo) 정보가 없는 물건의 이름과 가격을 조회하세요.
SELECT item, price FROM tblHousekeeping WHERE memo IS NULL;

-- 55. 물건 이름에 '세트'가 포함된 항목의 이름과 가격을 조회하세요.
SELECT item, price FROM tblHousekeeping WHERE item LIKE '%세트%';

-- 56. 가격이 1000원 이상 5000원 이하인 물건의 이름과 가격을 조회하세요.
SELECT item, price FROM tblHousekeeping WHERE price BETWEEN 1000 AND 5000;

-- 57. 구매일이 2024년 2월 15일 이전이고 가격이 10000원 이상인 물건의 이름, 가격, 구매일을 조회하세요.
SELECT item, price, buydate FROM tblHousekeeping WHERE buydate <= '2024-02-15' AND price >= 10000;

-- 58. 수량이 10개 이상이거나 가격이 50000원 이상인 물건의 이름, 수량, 가격을 조회하세요.
SELECT item, qty, price FROM tblHousekeeping WHERE qty >= 10 OR price >= 50000;

-- 59. 물건 이름이 '치'로 시작하는 항목의 이름과 가격을 조회하세요.
SELECT item, price FROM tblHousekeeping WHERE item LIKE '치%';

-- 60. 구매일이 2024년 2월 1일부터 2024년 2월 15일 사이인 물건의 이름과 구매일을 조회하세요.
SELECT item, buydate FROM tblHousekeeping WHERE buydate BETWEEN '2024-02-01' AND '2024-02-15';


-- tblTodo

-- 61. 상태가 미완료(completedate가 null)인 할 일의 제목(title)과 추가된 날짜(adddate)를 조회하세요.
SELECT title, adddate FROM tblTodo WHERE completedate IS NULL;

-- 62. 2024년 2월 5일 이후에 추가된 할 일의 제목과 추가된 날짜를 조회하세요.
SELECT title, adddate FROM tblTodo WHERE adddate > '2024-02-05';

-- 63. 제목에 '청소'가 포함된 할 일의 모든 정보를 조회하세요.
SELECT * FROM tblTodo WHERE title LIKE '%청소%';

-- 64. 완료된(completedate가 not null) 할 일 중 2024년 2월 10일 이전에 완료된 항목의 제목과 완료일을 조회하세요.
SELECT title, completedate FROM tblTodo WHERE completedate IS NOT NULL AND completedate < '2024-02-10';

-- 65. 아직 완료되지 않은 할 일 중 2024년 2월 1일 이전에 추가된 항목의 제목과 추가된 날짜를 조회하세요.
SELECT title, adddate FROM tblTodo WHERE completedate IS NULL AND adddate < '2024-02-01';

-- 66. 제목이 '자바'로 시작하는 할 일의 제목과 추가된 날짜를 조회하세요.
SELECT title, adddate FROM tblTodo WHERE title LIKE '자바%';

-- 67. 2024년 2월 1일부터 2024년 2월 7일 사이에 추가된 할 일의 제목과 추가된 날짜를 조회하세요.
SELECT title, adddate FROM tblTodo WHERE adddate BETWEEN '2024-02-01' AND '2024-02-07';

-- 68. 완료된 할 일 중 추가된 날짜와 완료된 날짜가 같은 항목의 제목을 조회하세요.
SELECT title FROM tblTodo WHERE completedate IS NOT NULL AND adddate = completedate;

-- 69. 아직 완료되지 않은 할 일을 추가된 날짜의 오름차순으로 조회하세요.
SELECT title, adddate FROM tblTodo WHERE completedate IS NULL ORDER BY adddate ASC;

-- 70. 제목에 '예약'이 포함된 완료된 할 일의 제목과 완료일을 조회하세요.
SELECT title, completedate FROM tblTodo WHERE title LIKE '%예약%' AND completedate IS NOT NULL;


-- 추가

-- 71.employees
-- 직업(job_id)이 프로그래머(it_prog)인 직원의 이름(풀네임)과 연락처 가져오시오.
SELECT first_name || ' ' || last_name AS full_name, phone_number FROM employees WHERE job_id = 'IT_PROG';

-- 72.employees
-- last_name이 'Grant'인 직원의 이름, 연락처, 고용날짜를 가져오시오.
SELECT first_name || ' ' || last_name AS name, phone_number, hire_date FROM employees WHERE last_name = 'Grant';

-- 73.employees
-- 특정 매니저(manager_id: 120)이 관리하는 직원의 이름, 급여, 연락처를 가져오시오.
SELECT first_name || ' ' || last_name AS name, salary, phone_number FROM employees WHERE manager_id = 120;

-- 74.employees
-- 특정 부서(60, 80, 100)에 속한 직원들의 이름, 연락처, 이메일, 부서ID 가져오시오.
SELECT first_name || ' ' || last_name AS name, phone_number, email, department_id 
FROM employees WHERE department_id IN (60, 80, 100);

-- 75.tblInsa
-- 기본급여 + 수당 합쳐서 150만원 이상인 직원 중 서울에 직원만 가져오시오.
SELECT * FROM tblInsa WHERE (basicPay + sudang) >= 1500000 AND city = '서울';

-- 76.tblInsa
-- 수당이 15만원 이하인 직원 중 직위가 사원, 대리만 가져오시오.
SELECT * FROM tblInsa WHERE sudang <= 150000 AND jikwi IN ('사원', '대리');

-- 77.tblInsa
-- 수당을 제외한 기본 연봉이 2천만원 이상, 서울, 직위 과장(부장)만 가져오시오.
SELECT * FROM tblInsa WHERE basicPay * 12 >= 20000000 AND city = '서울' AND jikwi IN ('과장', '부장');

-- 78.tblInsa
-- 국가명 'O국'인 나라를 가져오시오.
SELECT * FROM tblCountry WHERE name LIKE '%O국';

-- 79.employees
-- 연락처가 515로 시작하는 직원들 가져오시오.
SELECT * FROM employees WHERE phone_number LIKE '515%';

-- 80.employees
-- 직업 ID가 SA로 시작하는 직원들 가져오시오.
SELECT * FROM employees WHERE job_id LIKE 'SA%';

-- 81.employees
-- first_name에 'de'가 들어간 직원들 가져오시오.
SELECT * FROM employees WHERE first_name LIKE '%de%'
                                or first_name LIKE '%DE%'
                                or first_name LIKE '%De%'
                                or first_name LIKE '%dE%';

-- 82.tblInsa
-- 여름에(7,8,9월) 태어난 직원들 가져오시오.
SELECT * FROM tblInsa WHERE ssn like '__07__-_______'
                            or ssn like '__08%'
                            or ssn like '__09%';

-- 83.tblInsa
-- 서울, 인천에 사는 김씨만 가져오시오.   
SELECT * FROM tblInsa WHERE city IN ('서울', '인천') AND name LIKE '김%';

-- 84.tblInsa
-- 영업부/총무부/개발부 직원 중 사원급(사원/대리) 중에 010을 사용하는 직원들을 가져오시오.
SELECT * FROM tblInsa WHERE buseo IN ('영업부', '총무부', '개발부') 
AND jikwi IN ('사원', '대리') AND tel LIKE '010%';

-- 85.tblInsa
-- 서울/인천/경기에 살고 입사일이 2008~2010년 사이인 직원들을 가져오시오.
SELECT * FROM tblInsa WHERE city IN ('서울', '인천', '경기') 
AND ibsaDate BETWEEN '2008-01-01' AND '2010-12-31';

-- 86.employees
-- 부서가 아직 배정 안된 직원들을 가져오시오. (department_id가 없는 직원)
SELECT * FROM employees WHERE department_id IS NULL;





-- 추가
-- 87.tblInsa에서 기본급(basicPay)과 수당(sudang)의 합이 3,000,000원 이상이면서, 세금(basicPay의 10%)을 제외한 실수령액이 2,800,000원 이상인 직원의 이름, 기본급, 수당, 실수령액을 조회하세요.
SELECT name, basicPay, sudang, (basicPay + sudang - (basicPay * 0.1)) AS 실수령액
FROM tblInsa
WHERE (basicPay + sudang) >= 3000000 
AND (basicPay + sudang - (basicPay * 0.1)) >= 2800000;

-- 88.tblCountry에서 인구밀도(population / area)가 100 이상 500 이하인 국가의 이름, 인구, 면적, 인구밀도를 조회하세요. (인구밀도는 소수점 둘째자리에서 반올림)
SELECT name, population, area, ROUND(population / area, 1) AS 인구밀도
FROM tblCountry
WHERE (population / area) BETWEEN 100 AND 500;

-- 89.tblInsa에서 입사일이 2000년 이후이면서 주민번호 상 생일이 3월에서 5월 사이인 직원의 이름, 주민번호, 입사일을 조회하세요.
SELECT name, ssn, ibsaDate
FROM tblInsa
WHERE ibsaDate >= '2000-01-01'
AND SUBSTR(ssn, 3, 2) IN ('03', '04', '05');

-- 90.tblComedian에서 키가 170cm 이상이면서 몸무게가 (키 - 100) * 0.9 kg 이상인 코미디언의 이름, 키, 몸무게를 조회하세요.
SELECT first || ' ' || last AS name, height, weight
FROM tblComedian
WHERE height >= 170
AND weight >= (height - 100) * 0.9;

-- 91.tblInsa에서 부서가 '개발부'나 '영업부'이면서 주민번호 상 80년대생(80-89년)인 직원의 이름, 부서, 주민번호, 직위를 조회하세요.
SELECT name, buseo, ssn, jikwi
FROM tblInsa
WHERE buseo IN ('개발부', '영업부')
AND SUBSTR(ssn, 1, 2) BETWEEN '80' AND '89';

-- 92.tblDiary에서 날씨가 '맑음'이 아니면서 제목에 '영화' 또는 '운동'이 포함된 일기의 제목, 작성일, 날씨를 조회하세요.
SELECT subject, regdate, weather
FROM tblDiary
WHERE weather != '맑음'
AND (subject LIKE '%영화%' OR subject LIKE '%운동%');

-- 93.tblInsa에서 주민번호 뒷자리가 1이나 3으로 시작하는 (남자) 직원 중 이름에 '자'가 들어가는 직원의 이름, 주민번호, 부서를 조회하세요.
SELECT name, ssn, buseo
FROM tblInsa
WHERE SUBSTR(ssn, 8, 1) IN ('1', '3')
AND name LIKE '%자%';

-- 94.tblCountry에서 국가 이름에 'e'가 2번 이상 들어가면서 대륙이 EU나 AS가 아닌 국가의 이름, 수도, 대륙을 조회하세요.
SELECT name, capital, continent
FROM tblCountry
WHERE name LIKE '%e%e%'
AND continent NOT IN ('EU', 'AS');

-- 95.tblInsa에서 전화번호가 없거나 주소가 없는 직원 중 급여(basicPay)가 2,500,000원 이상인 직원의 이름, 주소, 전화번호, 급여를 조회하세요.
SELECT name, city, tel, basicPay
FROM tblInsa
WHERE (tel IS NULL OR city IS NULL)
AND basicPay >= 2500000;

-- 96.tblInsa에서 이름이 '김'으로 시작하거나 '이'로 끝나는 직원 중 부서가 '개발부'인 직원의 이름, 부서, 직위를 조회하세요.
SELECT name, buseo, jikwi
FROM tblInsa
WHERE (name LIKE '김%' OR name LIKE '%이') AND buseo = '개발부';

-- 97.tblCountry에서 면적이 10보다 크고 1000보다 작으면서 인구가 5000만 이상인 국가의 이름, 면적, 인구수를 조회하세요.
SELECT name, area, population
FROM tblCountry
WHERE area BETWEEN 11 AND 999 AND population >= 50000000;

-- 98.tblComedian에서 이름에 '호'가 들어가거나 '형'이 들어가는 코미디언의 이름과 몸무게를 조회하세요. 단, 몸무게가 없는 경우는 제외합니다.
SELECT first || ' ' || last AS name, weight
FROM tblComedian
WHERE (first LIKE '%호%' OR first LIKE '%형%' OR last LIKE '%호%' OR last LIKE '%형%')
AND weight IS NOT NULL;

-- 99.tblInsa에서 1990년대 (1990-01-01 ~ 1999-12-31) 입사한 직원 중 급여가 2,000,000원 이상인 직원의 이름, 입사일, 급여를 조회하세요.
SELECT name, ibsaDate, basicPay
FROM tblInsa
WHERE ibsaDate BETWEEN '1990-01-01' AND '1999-12-31'
AND basicPay >= 2000000;

-- 100.tblMen과 tblWomen에서 키가 170cm 이상이면서 몸무게가 제공되지 않은 사람의 이름과 키를 조회하세요.
SELECT name, height FROM tblMen WHERE height >= 170 AND weight IS NULL
UNION
SELECT name, height FROM tblWomen WHERE height >= 170 AND weight IS NULL;

-- 101.tblInsa에서 주민번호 상 1월이나 2월 생이면서, 급여가 250만원 이상인 직원의 이름, 생년월일, 급여를 조회하세요.
SELECT name, ssn, basicPay
FROM tblInsa
WHERE (SUBSTR(ssn, 3, 2) IN ('01', '02')) AND basicPay >= 2500000;

-- 102.tblDiary에서 2024년 2월에 작성된 일기 중 날씨가 '맑음'이 아니고 제목이 '오늘'로 시작하지 않는 일기의 제목, 작성일, 날씨를 조회하세요.
SELECT subject, regdate, weather
FROM tblDiary
WHERE regdate BETWEEN '2024-02-01' AND '2024-02-29'
AND weather != '맑음' AND subject NOT LIKE '오늘%';

-- 103.tblInsa에서 주소가 '서울'이면서 전화번호가 '010'으로 시작하지 않는 직원의 이름, 주소, 전화번호를 조회하세요.
SELECT name, city, tel
FROM tblInsa
WHERE city LIKE '%서울%' AND (tel NOT LIKE '010%' OR tel IS NULL);

-- 104.tblCountry에서 국가 이름에 공백이 들어가거나 'I'로 시작하는 국가의 이름과 수도를 조회하세요.
SELECT name, capital
FROM tblCountry
WHERE name LIKE '% %' OR name LIKE 'I%';

-- 105.tblInsa에서 부서가 '인사부'나 '총무부'이면서 직위가 '사원'이 아니고 급여가 1,500,000원 에서 2,500,000원 사이인 직원의 이름, 부서, 직위, 급여를 조회하세요.
SELECT name, buseo, jikwi, basicPay
FROM tblInsa
WHERE buseo IN ('인사부', '총무부')
AND jikwi != '사원'
AND basicPay BETWEEN 1500000 AND 2500000;
