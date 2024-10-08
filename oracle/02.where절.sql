
-- tblInsa
select * from tblInsa;

-- 1. 급여(basicPay)가 1,500,000원 이상인 직원들의 이름과 급여를 조회하세요.
select name, basicpay from tblInsa where basicpay >= 1500000;


-- 2. 부서(buseo)가 '개발부'인 직원들의 이름과 직위(jikwi)를 조회하세요.
select name, jikwi from tblInsa where buseo = '개발부';

-- 3. 서울에 사는 직원 중 직위가 '부장'인 사람의 이름과 급여를 조회하세요.
select name, basicpay from tblInsa where jikwi = '부장';

-- 4. 입사일(ibsaDate)이 2010년 1월 1일 이후인 직원의 이름과 입사일을 조회하세요.
select name, ibsadate from tblInsa where ibsadate > '2010-01-01';

-- 5. 급여가 2,000,000원 이상이고 수당(sudang)이 150,000원 이상인 직원의 이름과 급여, 수당을 조회하세요.
select name, basicpay, sudang from tblInsa
    where basicpay >= 2000000 and sudang >= 150000;

-- 6. 이름이 '김'으로 시작하는 직원의 이름과 주민번호(ssn)를 조회하세요.
select name, ssn from tblInsa where name like '김%';


-- 7. 부서가 '인사부'이거나 '영업부'인 직원의 이름과 부서를 조회하세요.
select name, buseo from tblInsa
    where buseo in ('인사부', '영업부');

-- 8. 급여가 1,500,000원 이상 2,500,000원 이하인 직원의 이름과 급여를 조회하세요.
select name, basicpay from tblInsa
    where basicpay BETWEEN 1500000 and 2500000;

-- 9. 전화번호(tel)가 없는 직원의 이름과 부서를 조회하세요.
select name, buseo from tblInsa
    where tel is null;


-- 10. 수당이 급여의 20% 이상인 직원의 이름과 급여, 수당을 조회하세요.
select name, basicpay, sudang from tblInsa
    where tblInsa.sudang >= (tblInsa.basicpay * 0.2);


-- tblCountry
select * from tblCountry;

-- 11. 인구(population)가 5000만 명 이상인 국가의 이름과 인구수를 조회하세요.
select name, population from tblCountry
    where population >= 5000;

-- 12. 대륙(continent)이 'AS'인 국가의 이름과 수도를 조회하세요.
select name, capital from tblCountry
    where continent = 'AS';

-- 13. 면적(area)이 100보다 작은 국가의 이름과 면적을 조회하세요.
select name, area from tblCountry
    where area < 100;

-- 14. 국가명에 '한' 이 포함된 국가의 모든 정보를 조회하세요.
select * from tblCountry
    WHERE name like '%한%';

-- 15. 수도 이름이 '산'로 시작하는 국가의 이름과 수도를 조회하세요.
select name, capital from tblCountry
    WHERE capital like '산%';


-- 16. 인구가 1000만 명 이상이고 면적이 50 이상인 국가의 이름, 인구, 면적을 조회하세요.
select name, population, area from tblCountry
    where population >= 1000 and area >= 50;

-- 17. 대륙이 'AS'이거나 'EU'인 국가의 이름과 대륙을 조회하세요.
select name, continent from tblCountry
    where continent in ('AS', 'EU');

-- 18. 인구 정보가 없는 국가의 이름과 수도를 조회하세요.
select name, capital from tblCountry
    where population is null;

-- 19. 면적이 10 이상 100 이하인 국가의 이름과 면적을 조회하세요.
select name, area from tblCountry
    where area BETWEEN 10 and 100;

-- 20. 국가 이름이 '인'로 시작하거나 '국'로 끝나는 국가의 이름을 조회하세요.
select name from tblCountry
    where name like '인%' or name like '%국';

-- tblComedian
select * from tblComedian;

-- 21. 몸무게(weight)가 70kg 이상인 코미디언의 이름(first, last)과 몸무게를 조회하세요.
select last || first from tblComedian
    where weight >= 70; 

-- 22. 성별(gender)이 'f'인 코미디언의 이름과 키(height)를 조회하세요.
select last || first as 이름, height from tblComedian
    where gender = 'f';

-- 23. 키가 170cm 이상이고 몸무게가 80kg 이하인 코미디언의 이름과 키, 몸무게를 조회하세요.
select last || first as 이름, height,weight from tblComedian
    where height >= 170 and weight < 80;

-- 24. 이름(first)에 '동' 또는 '민'이 포함된 코미디언의 이름을 조회하세요.
select last || first as 이름 from tblComedian
    where first like '%동%' or first like '%민%'; 

-- 25. 성씨(last)가 '김'씨인 코미디언의 모든 정보를 조회하세요.
select * from tblComedian
    where last like '김%'; 

-- 26. 키가 180cm 이상인 남성 코미디언의 이름과 키를 조회하세요.
select last || first as 이름, height from tblComedian
    where height >= 180 and gender= 'm';

-- 27. 별명(nick)에 '상'이 포함된 코미디언의 이름과 별명을 조회하세요.
select last || first as 이름, nick from tblComedian
    WHERE nick like '%상%';


-- 28. 몸무게가 70kg 이상 80kg 이하인 코미디언의 이름과 몸무게를 조회하세요.
select last || first as 이름, weight from tblcomedian
    where weight BETWEEN 70 and 80;

-- 29. 키가 160cm 이상 170cm 이하인 여성 코미디언의 이름과 키를 조회하세요.
select last || first as 이름, height from tblcomedian
    where height BETWEEN 160 and 170 and gender = 'f';

-- 30. 별명이 '프로'로 시작하는 코미디언의 이름과 별명을 조회하세요.
select last || first as 이름, nick from tblcomedian
    where nick like '프로%';

-- tblDiary
select * from tbldiary;

-- 31. 날씨(weather)가 '맑음'인 날의 제목(subject)과 날짜(regdate)를 조회하세요.
select subject, regdate from tbldiary
    where weather = '맑음';


-- 32. 2024년 2월 20일 이후의 일기 제목과 날짜를 조회하세요.
select subject, regdate from tbldiary
    where regdate > '2024/02/20';


-- 33. 제목에 '에러'가 포함된 일기의 모든 정보를 조회하세요.
select * from tbldiary
    where subject like '%에러%';

-- 34. 날씨가 '흐림'이거나 '비'인 날의 제목과 날씨를 조회하세요.
select subject, weather from tbldiary
    where weather in ('흐림', '비');

-- 35. 2024년 2월 18일에 작성된 일기의 제목과 날씨를 조회하세요.
select subject, weather from tbldiary
    where regdate = '2024/02/18';

-- 36. 제목이 '오라클'로 시작하는 일기의 제목과 날짜를 조회하세요.
select subject, regdate from tbldiary
    where subject like '오라클%';


-- 37. 날짜가 2024년 2월 25일 이전이고 날씨가 '맑음'인 일기의 모든 정보를 조회하세요.
select * from tbldiary
    where regdate < '2024/02/25' and weather = '맑음';


-- 38. 2024년 2월에 작성된 모든 일기의 제목과 날짜를 조회하세요.
select subject, weather from tbldiary
    where regdate BETWEEN '2024/02/01' and '2024/02/29';


-- 39. 날씨가 '맑음'이 아닌 모든 일기의 제목, 날씨, 날짜를 조회하세요.
select subject, weather, regdate from tbldiary
    where weather <> '맑음';

-- 40. 제목에 '영화'가 포함된 일기의 제목과 날짜를 조회하세요.
select subject, regdate from tbldiary
    where subject like '%영화%';

-- tblMen, tblWomen
select * from tblMen;
select * from tblWomen;

-- 41. tblMen에서 나이(age)가 25세 이상인 남성의 이름과 나이를 조회하세요.
select name, age from tblMen
    where age = 25;

-- 42. tblWomen에서 키(height)가 160cm 이상인 여성의 이름과 키를 조회하세요.
select name, height from tblWomen
    where height >= 160;

-- 43. tblMen에서 몸무게(weight) 정보가 없는 남성의 이름을 조회하세요.
select name from tblMen
    where weight is null;

-- 44. tblWomen에서 커플(couple)이 있는 여성의 이름과 커플 이름을 조회하세요.
select name, couple from tblWomen
    where couple is not null;

-- 45. tblMen에서 이름에 '형'이 포함된 남성의 이름과 나이를 조회하세요.
select name, age from tblMen    
    where name like '%형%';

-- 46. tblWomen에서 나이가 25세 이상 30세 이하인 여성의 이름과 나이를 조회하세요.
select name, age from tblWomen 
    where age BETWEEN 25 and 30;

-- 47. tblMen에서 키가 175cm 이상이고 몸무게가 70kg 이상인 남성의 이름, 키, 몸무게를 조회하세요.
select name, height, weight from tblMen
    where height >= 175 and weight >= 70;

-- 48. tblWomen에서 커플이 없는 여성의 이름과 나이를 조회하세요.
select name, age from tblWomen
    where couple is null;

-- 49. tblMen에서 이름이 '김'으로 시작하는 남성의 이름과 나이를 조회하세요.
select name, age from tblMen 
    where name like '김%';

-- 50. tblWomen에서 몸무게가 50kg 이상 60kg 이하인 여성의 이름과 몸무게를 조회하세요.
select name, weight from tblWomen
    where weight BETWEEN 50 and 60;

-- tblHousekeeping

select * from tblhousekeeping;

-- 51. 가격(price)이 5000원 이상인 물건의 이름(item)과 가격을 조회하세요.
select item, price from tblhousekeeping 
    where price >= 5000;

-- 52. 구매일(buydate)이 2024년 2월 10일 이후인 물건의 이름과 구매일을 조회하세요.
select item, buydate from tblhousekeeping
    where buydate > '2024/02/10';

-- 53. 수량(qty)이 5개 이상인 물건의 이름과 수량을 조회하세요.
select item, qty from tblhousekeeping
    where qty >= 5;

-- 54. 메모(memo) 정보가 없는 물건의 이름과 가격을 조회하세요.
select item, price from tblhousekeeping
    where memo is NULL;

-- 55. 물건 이름에 '세트'가 포함된 항목의 이름과 가격을 조회하세요.
select item, price from tblhousekeeping
    where item like '%세트%';

-- 56. 가격이 1000원 이상 5000원 이하인 물건의 이름과 가격을 조회하세요.
select item, price from tblhousekeeping
    where price BETWEEN 1000 and 5000;

-- 57. 구매일이 2024년 2월 15일 이전이고 가격이 10000원 이상인 물건의 이름, 가격, 구매일을 조회하세요.
select item, price, buydate from tblhousekeeping
    where buydate < '2024/02/15' and price >= 10000;

-- 58. 수량이 10개 이상이거나 가격이 50000원 이상인 물건의 이름, 수량, 가격을 조회하세요.
select item, qty, price from tblhousekeeping
    where qty >= 10 or price >= 50000;

-- 59. 물건 이름이 '치'로 시작하는 항목의 이름과 가격을 조회하세요.
select item, price from tblhousekeeping
    where item like '치%';

-- 60. 구매일이 2024년 2월 1일부터 2024년 2월 15일 사이인 물건의 이름과 구매일을 조회하세요.
select item, buydate from tblhousekeeping
    where buydate BETWEEN '2024/02/01' and '2024/02/15';

-- tblTodo

select * from tblTodo;

-- 61. 상태가 미완료(completedate가 null)인 할 일의 제목(title)과 추가된 날짜(adddate)를 조회하세요.
select title, adddate from tblTodo
    WHERE completedate is null;

-- 62. 2024년 2월 5일 이후에 추가된 할 일의 제목과 추가된 날짜를 조회하세요.
select title, adddate from tblTodo
    WHERE adddate > '2024/02/05';

-- 63. 제목에 '청소'가 포함된 할 일의 모든 정보를 조회하세요.
select * from tblTodo 
    where title like '%청소%';

-- 64. 완료된(completedate가 not null) 할 일 중 2024년 2월 10일 이전에 완료된 항목의 제목과 완료일을 조회하세요.
select title, completedate from tblTodo
    where completedate is not null and completedate < '2024/02/10';

-- 65. 아직 완료되지 않은 할 일 중 2024년 2월 1일 이전에 추가된 항목의 제목과 추가된 날짜를 조회하세요.
select title, adddate from tblTodo
    where completedate is null and adddate < '2024/02/01';

-- 66. 제목이 '자바'로 시작하는 할 일의 제목과 추가된 날짜를 조회하세요.
select title, adddate from tblTodo
    where title like '자바%';

-- 67. 2024년 2월 1일부터 2024년 2월 7일 사이에 추가된 할 일의 제목과 추가된 날짜를 조회하세요.
select title, adddate from tblTodo
    where adddate BETWEEN '2024/02/01' and '2024/02/07';

-- 68. 완료된 할 일 중 추가된 날짜와 완료된 날짜가 같은 항목의 제목을 조회하세요.
select title from tblTodo
    where completedate is not null 
        and adddate like completedate;
-- >> 포맷이 바뀌면 오답이 됨 
        
select 
    title,
    to_char(adddate,'yyyy-mm-dd hh24:mi:ss'),
    to_char(completedate, 'yyyy-mm-dd hh24:mi:ss')
from tblTodo
    where to_char(adddate, 'yyyy-mm-dd') = to_char(completedate, 'yyyy-mm-dd');


-- 69. 아직 완료되지 않은 할 일을 추가된 날짜의 오름차순으로 조회하세요.
select * from tblTodo
    where completedate is null
    order by adddate ASC;

-- 70. 제목에 '예약'이 포함된 완료된 할 일의 제목과 완료일을 조회하세요.
select title, completedate from tblTodo
    where title like '%예약%';

-- 추가

-- 71.employees
-- 직업(job_id)이 프로그래머(it_prog)인 직원의 이름(풀네임)과 연락처 가져오시오.
select * from employees;
select first_name || ' ' || last_name as 이름, phone_number from employees
    where job_id = 'IT_PROG';

-- 72.employees
-- last_name이 'Grant'인 직원의 이름, 연락처, 고용날짜를 가져오시오.
select first_name || ' ' || last_name as 이름, phone_number, hire_date
    from employees
    where last_name = 'Grant';

-- 73.employees
-- 특정 매니저(manager_id: 120)이 관리하는 직원의 이름, 급여, 연락처를 가져오시오.
select first_name || ' ' || last_name as 이름, salary , phone_number
    from employees
    where manager_id = 120;

-- 74.employees
-- 특정 부서(60, 80, 100)에 속한 직원들의 이름, 연락처, 이메일, 부서ID 가져오시오.
select first_name || ' ' || last_name as 이름, phone_number, email, department_id
    from employees
    where department_id in (60, 80, 100);
    
-- 75.tblInsa
-- 기본급여 + 수당 합쳐서 150만원 이상인 직원 중 서울에 직원만 가져오시오.
select *
    from tblInsa
    where sudang + basicpay >= 1500000 and city = '서울';

-- 76.tblInsa
-- 수당이 15만원 이하인 직원 중 직위가 사원, 대리만 가져오시오.
select *
    from tblInsa
    where sudang < 150000 and jikwi in ('사원', '대리');
    
-- 77.tblInsa
-- 수당을 제외한 기본 연봉이 2천만원 이상, 서울, 직위 과장(부장)만 가져오시오.
select * 
    from tblInsa;

select * 
    from tblInsa
    where basicpay >= 20000000 and city = '서울' and jikwi in ('과장', '부장');

-- 78.tblCountry
-- 국가명 'O국'인 나라를 가져오시오.
select *
    from tblcountry
    where name like '_국';


-- 79.employees
-- 연락처가 515로 시작하는 직원들 가져오시오.
select *
    from employees
    where phone_number like '515%';

-- 80.employees
-- 직업 ID가 SA로 시작하는 직원들 가져오시오.
select * 
    from employees
    where job_id like 'SA%';
    
-- 81.employees
-- first_name에 'de'가 들어간 직원들 가져오시오.
select * 
    from employees
    where first_name like '%de%';

-- 82.tblInsa
-- 여름에(7,8,9월) 태어난 직원들 가져오시오.
select *
    from tblInsa
    where ssn like '__07%' or ssn like '__08%' or ssn like '__09%';

-- 83.tblInsa
-- 서울, 인천에 사는 김씨만 가져오시오.    
select *
    from tblInsa
    where city in ('서울', '인천');

-- 84.tblInsa
-- 영업부/총무부/개발부 직원 중 사원급(사원/대리) 중에 010을 사용하는 직원들을 가져오시오.
select * 
    from tblInsa
    where buseo in ('영업부', '총무부', '개발부') and jikwi in ('사원', '대리')
        and tel like '010%';


-- 85.tblInsa
-- 서울/인천/경기에 살고 입사일이 2008~2010년 사이인 직원들을 가져오시오.
select *   
    from tblInsa
    where city in ('서울', '인천', '경기') and ibsadate BETWEEN '2008/01/01' and '2010/12/31';


-- 86.employees
-- 부서가 아직 배정 안된 직원들을 가져오시오. (department_id가 없는 직원)
select * 
    from employees
    where department_id is null;
