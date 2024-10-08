-- tblHousekeeping 테이블 문제

-- 1. 각 날짜별로 구매한 물품의 총 개수와 총 금액을 구하시오.
SELECT buydate, SUM(qty) AS total_qty, SUM(price * qty) AS total_amount
FROM tblHousekeeping
GROUP BY buydate
ORDER BY buydate;

-- 2. 가격대별로 구매한 물품의 수를 구하시오. (가격대는 1000원 단위로 나누어 주세요)
SELECT FLOOR(price/1000)*1000 AS price_range, COUNT(*) AS item_count
FROM tblHousekeeping
GROUP BY FLOOR(price/1000)*1000
ORDER BY price_range;

-- 3. 각 물품별로 총 구매 금액을 구하고, 구매 금액이 높은 순으로 정렬하시오.
SELECT item, SUM(price * qty) AS total_amount
FROM tblHousekeeping
GROUP BY item
ORDER BY total_amount DESC;

-- 4. 각 주차별로 구매한 물품의 총 개수와 총 금액을 구하시오. (주는 일요일부터 시작합니다)
SELECT TO_CHAR(buydate, 'YYYY-WW') AS week, SUM(qty) AS total_qty, SUM(price * qty) AS total_amount
FROM tblHousekeeping
GROUP BY TO_CHAR(buydate, 'YYYY-WW')
ORDER BY week;

-- 5. 구매 수량이 10개 이상인 물품들의 평균 가격을 구하시오.
SELECT AVG(price) AS avg_price
FROM tblHousekeeping
WHERE qty >= 10;

-- 6. 각 물품별로 구매 횟수를 구하고, 구매 횟수가 1회 초과인 물품만 출력하시오.
SELECT item, COUNT(*) AS purchase_count
FROM tblHousekeeping
GROUP BY item
HAVING COUNT(*) > 1
ORDER BY purchase_count DESC;

-- 7. 구매 날짜별로 가장 비싼 물품의 가격을 구하시오.
SELECT buydate, MAX(price) AS highest_price
FROM tblHousekeeping
GROUP BY buydate
ORDER BY buydate;

-- 8. 각 물품 종류별로 총 구매 금액을 구하고, 10만원 이상 구매한 물품 종류만 출력하시오.
SELECT item, SUM(price * qty) AS total_amount
FROM tblHousekeeping
GROUP BY item
HAVING SUM(price * qty) >= 100000
ORDER BY total_amount DESC;

-- 9. 요일별로 평균 구매 금액을 구하고, 평균 금액이 높은 순으로 정렬하시오.
SELECT TO_CHAR(buydate, 'DAY') AS day_of_week, AVG(price * qty) AS avg_amount
FROM tblHousekeeping
GROUP BY TO_CHAR(buydate, 'DAY')
ORDER BY avg_amount DESC;

-- 10. 월별로 구매한 물품의 총 개수와 총 금액을 구하시오.
SELECT TO_CHAR(buydate, 'YYYY-MM') AS month, SUM(qty) AS total_qty, SUM(price * qty) AS total_amount
FROM tblHousekeeping
GROUP BY TO_CHAR(buydate, 'YYYY-MM')
ORDER BY month;

-- tblInsa 테이블 문제

-- 1. 각 부서별로 직원 수와 평균 급여(기본급+수당)를 구하시오.
SELECT buseo, COUNT(*) AS employee_count, AVG(basicpay + sudang) AS avg_salary
FROM tblInsa
GROUP BY buseo
ORDER BY employee_count DESC;

-- 2. 직위별로 직원 수와 최고 급여, 최저 급여를 구하시오.
SELECT jikwi, COUNT(*) AS employee_count, 
       MAX(basicpay + sudang) AS max_salary, 
       MIN(basicpay + sudang) AS min_salary
FROM tblInsa
GROUP BY jikwi
ORDER BY employee_count DESC;

-- 3. 입사년도별로 직원 수를 구하고, 가장 많은 직원이 입사한 연도 3개를 구하시오.
SELECT TO_CHAR(ibsadate, 'YYYY') AS hire_year, COUNT(*) AS employee_count
FROM tblInsa
GROUP BY TO_CHAR(ibsadate, 'YYYY')
ORDER BY employee_count DESC;

-- 4. 각 도시별로 직원 수와 평균 급여를 구하고, 직원 수가 5명 이상인 도시만 출력하시오.
SELECT city, COUNT(*) AS employee_count, AVG(basicpay + sudang) AS avg_salary
FROM tblInsa
GROUP BY city
HAVING COUNT(*) >= 5
ORDER BY employee_count DESC;

-- 5. 부서별, 직위별로 평균 급여를 구하고, 부서와 직위 순으로 정렬하시오.
SELECT buseo, jikwi, AVG(basicpay + sudang) AS avg_salary
FROM tblInsa
GROUP BY buseo, jikwi
ORDER BY buseo, jikwi;

-- 6. 나이대별(20대, 30대, 40대 등)로 직원 수와 평균 급여를 구하시오.
SELECT FLOOR(TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - TO_NUMBER(SUBSTR(ssn, 1, 2)) + 
    CASE WHEN SUBSTR(ssn, 8, 1) IN ('1', '2') THEN 1900 ELSE 2000 END, -1) || '대' AS age_group,
       COUNT(*) AS employee_count,
       AVG(basicpay + sudang) AS avg_salary
FROM tblInsa
GROUP BY FLOOR(TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - TO_NUMBER(SUBSTR(ssn, 1, 2)) + 
    CASE WHEN SUBSTR(ssn, 8, 1) IN ('1', '2') THEN 1900 ELSE 2000 END, -1)
ORDER BY age_group;

-- 7. 입사월별로 직원 수와 평균 급여를 구하고, 평균 급여가 높은 순으로 정렬하시오.
SELECT TO_CHAR(ibsadate, 'MM') AS hire_month, 
       COUNT(*) AS employee_count, 
       AVG(basicpay + sudang) AS avg_salary
FROM tblInsa
GROUP BY TO_CHAR(ibsadate, 'MM')
ORDER BY avg_salary DESC;

-- 8. 부서별로 가장 높은 급여를 구하시오.
SELECT buseo, MAX(basicpay + sudang) AS max_salary
FROM tblInsa
GROUP BY buseo
ORDER BY max_salary DESC;

-- 9. 직위별로 총 급여 합계를 구하고, 총 급여가 5000만원 이상인 직위만 출력하시오.
SELECT jikwi, SUM(basicpay + sudang) AS total_salary
FROM tblInsa
GROUP BY jikwi
HAVING SUM(basicpay + sudang) >= 50000000
ORDER BY total_salary DESC;

-- 10. 입사년도별, 부서별로 직원 수를 구하고, 직원 수가 5명 이상인 그룹만 출력하시오.
SELECT TO_CHAR(ibsadate, 'YYYY') AS hire_year, buseo, COUNT(*) AS employee_count
FROM tblInsa
GROUP BY TO_CHAR(ibsadate, 'YYYY'), buseo
HAVING COUNT(*) >= 5
ORDER BY hire_year, buseo;

-- tblMen, tblWomen 테이블 문제

-- 1. 남녀별로 평균 나이와 평균 키를 구하시오.
SELECT '남자' AS gender, AVG(age) AS avg_age, AVG(height) AS avg_height
FROM tblMen;

SELECT '여자' AS gender, AVG(age) AS avg_age, AVG(height) AS avg_height
FROM tblWomen;

-- 2. 커플 상태(연인 있음, 없음)별로 남녀 수를 구하시오.
SELECT 
    CASE WHEN couple IS NOT NULL THEN '연인 있음' ELSE '연인 없음' END AS couple_status,
    COUNT(*) AS count
FROM tblMen
GROUP BY CASE WHEN couple IS NOT NULL THEN '연인 있음' ELSE '연인 없음' END;

SELECT 
    CASE WHEN couple IS NOT NULL THEN '연인 있음' ELSE '연인 없음' END AS couple_status,
    COUNT(*) AS count
FROM tblWomen
GROUP BY CASE WHEN couple IS NOT NULL THEN '연인 있음' ELSE '연인 없음' END;

-- 3. 남녀별로 키 구간(160cm 미만, 160-170cm, 170-180cm, 180cm 이상)에 속하는 사람 수를 구하시오.
SELECT 
    CASE 
        WHEN height < 160 THEN '160cm 미만'
        WHEN height >= 160 AND height < 170 THEN '160-170cm'
        WHEN height >= 170 AND height < 180 THEN '170-180cm'
        ELSE '180cm 이상'
    END AS height_range,
    COUNT(*) AS count
FROM tblMen
WHERE height IS NOT NULL
GROUP BY 
    CASE 
        WHEN height < 160 THEN '160cm 미만'
        WHEN height >= 160 AND height < 170 THEN '160-170cm'
        WHEN height >= 170 AND height < 180 THEN '170-180cm'
        ELSE '180cm 이상'
    END;

-- 여성에 대해서도 동일한 쿼리 실행

-- 5. 남녀별로 가장 높은 체중을 구하시오.
SELECT '남자' AS gender, MAX(weight) AS max_weight
FROM tblMen
WHERE weight IS NOT NULL;

SELECT '여자' AS gender, MAX(weight) AS max_weight
FROM tblWomen
WHERE weight IS NOT NULL;

-- 6. 키 구간별(10cm 단위)로 남녀 수를 구하고, 남녀 수가 많은 순으로 정렬하시오.
SELECT 
    FLOOR(height / 10) * 10 || 'cm ~ ' || (FLOOR(height / 10) * 10 + 9) || 'cm' AS height_range,
    COUNT(*) AS count
FROM tblMen
WHERE height IS NOT NULL
GROUP BY FLOOR(height / 10)
ORDER BY count DESC;

-- 여성에 대해서도 동일한 쿼리 실행

-- 7. 남녀별로 나이대(20대, 30대 등)에 따른 평균 키를 구하시오.
SELECT 
    FLOOR(age / 10) * 10 || '대' AS age_group,
    AVG(height) AS avg_height
FROM tblMen
WHERE height IS NOT NULL
GROUP BY FLOOR(age / 10)
ORDER BY age_group;

-- 여성에 대해서도 동일한 쿼리 실행

-- 9. 남녀별로 체중이 가장 적게 나가는 사람과 가장 많이 나가는 사람의 몸무게 차이를 구하시오.
SELECT '남자' AS gender, MAX(weight) - MIN(weight) AS weight_difference
FROM tblMen
WHERE weight IS NOT NULL;

SELECT '여자' AS gender, MAX(weight) - MIN(weight) AS weight_difference
FROM tblWomen
WHERE weight IS NOT NULL;

-- 10. 남녀 모두에서 가장 긴 이름의 글자 수를 구하시오.
SELECT '남자' AS gender, MAX(LENGTH(name)) AS max_name_length
FROM tblMen;

SELECT '여자' AS gender, MAX(LENGTH(name)) AS max_name_length
FROM tblWomen;

-- tblTodo 테이블 문제

-- 1. 각 날짜별로 등록된 할 일의 수와 완료된 할 일의 수를 구하시오.
SELECT TO_CHAR(adddate, 'YYYY-MM-DD') AS date,
       COUNT(*) AS total_todos,
       SUM(CASE WHEN completedate IS NOT NULL THEN 1 ELSE 0 END) AS completed_todos
FROM tblTodo
GROUP BY TO_CHAR(adddate, 'YYYY-MM-DD')
ORDER BY date;

-- 2. 요일별로 할 일 등록 수를 구하고, 가장 많이 등록된 요일부터 정렬하시오.
SELECT TO_CHAR(adddate, 'DAY') AS day_of_week,
       COUNT(*) AS todo_count
FROM tblTodo
GROUP BY TO_CHAR(adddate, 'DAY')
ORDER BY todo_count DESC;

-- 3. 각 주차별로 완료된 할 일의 수와 완료되지 않은 할 일의 수를 구하시오.
SELECT TO_CHAR(adddate, 'YYYY-WW') AS week,
       SUM(CASE WHEN completedate IS NOT NULL THEN 1 ELSE 0 END) AS completed_todos,
       SUM(CASE WHEN completedate IS NULL THEN 1 ELSE 0 END) AS incomplete_todos
FROM tblTodo
GROUP BY TO_CHAR(adddate, 'YYYY-WW')
ORDER BY week;

-- 4. 완료 여부에 따라 평균 소요 시간(완료시간 - 등록시간)을 구하시오.
SELECT 
    CASE WHEN completedate IS NOT NULL THEN '완료' ELSE '미완료' END AS status,
    AVG((completedate - adddate) * 24) AS avg_hours_taken
FROM tblTodo
GROUP BY CASE WHEN completedate IS NOT NULL THEN '완료' ELSE '미완료' END;

-- 5. 각 달별로 등록된 할 일의 수와 완료율(완료된 할 일 / 전체 할 일)을 구하시오.
SELECT TO_CHAR(adddate, 'YYYY-MM') AS month,
       COUNT(*) AS total_todos,
       ROUND(SUM(CASE WHEN completedate IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS completion_rate
FROM tblTodo
GROUP BY TO_CHAR(adddate, 'YYYY-MM')
ORDER BY month;

-- 6. 등록 시간대별(0-6시, 6-12시, 12-18시, 18-24시)로 할 일의 수를 구하시오.
SELECT 
    CASE 
        WHEN TO_NUMBER(TO_CHAR(adddate, 'HH24')) BETWEEN 0 AND 5 THEN '0-6시'
        WHEN TO_NUMBER(TO_CHAR(adddate, 'HH24')) BETWEEN 6 AND 11 THEN '6-12시'
        WHEN TO_NUMBER(TO_CHAR(adddate, 'HH24')) BETWEEN 12 AND 17 THEN '12-18시'
        ELSE '18-24시'
    END AS time_range,
    COUNT(*) AS todo_count
FROM tblTodo
GROUP BY 
    CASE 
        WHEN TO_NUMBER(TO_CHAR(adddate, 'HH24')) BETWEEN 0 AND 5 THEN '0-6시'
        WHEN TO_NUMBER(TO_CHAR(adddate, 'HH24')) BETWEEN 6 AND 11 THEN '6-12시'
        WHEN TO_NUMBER(TO_CHAR(adddate, 'HH24')) BETWEEN 12 AND 17 THEN '12-18시'
        ELSE '18-24시'
    END
ORDER BY 
    CASE time_range
        WHEN '0-6시' THEN 1
        WHEN '6-12시' THEN 2
        WHEN '12-18시' THEN 3
        ELSE 4
    END;

-- 7. 완료된 일 중에서, 소요 시간이 가장 긴 일의 소요 시간을 구하시오.
SELECT MAX((completedate - adddate) * 24) AS max_hours_taken
FROM tblTodo
WHERE completedate IS NOT NULL;

-- 8. 등록 후 완료까지 걸린 기간별(당일, 1일, 2일 이상)로 할 일의 수를 구하시오.
SELECT 
    CASE 
        WHEN completedate IS NULL THEN '미완료'
        WHEN completedate - adddate < 1 THEN '당일'
        WHEN completedate - adddate < 2 THEN '1일'
        ELSE '2일 이상'
    END AS completion_period,
    COUNT(*) AS todo_count
FROM tblTodo
GROUP BY 
    CASE 
        WHEN completedate IS NULL THEN '미완료'
        WHEN completedate - adddate < 1 THEN '당일'
        WHEN completedate - adddate < 2 THEN '1일'
        ELSE '2일 이상'
    END
ORDER BY 
    CASE completion_period
        WHEN '당일' THEN 1
        WHEN '1일' THEN 2
        WHEN '2일 이상' THEN 3
        ELSE 4
    END;

-- 9. 각 날짜별로 가장 늦게 완료된 시간을 구하시오.
SELECT TO_CHAR(completedate, 'YYYY-MM-DD') AS completion_date,
       MAX(TO_CHAR(completedate, 'HH24:MI:SS')) AS latest_completion_time
FROM tblTodo
WHERE completedate IS NOT NULL
GROUP BY TO_CHAR(completedate, 'YYYY-MM-DD')
ORDER BY completion_date;

-- 10. 완료 여부에 따라 제목의 평균 글자 수를 구하시오.
SELECT 
    CASE WHEN completedate IS NOT NULL THEN '완료' ELSE '미완료' END AS status,
    AVG(LENGTH(title)) AS avg_title_length
FROM tblTodo
GROUP BY CASE WHEN completedate IS NOT NULL THEN '완료' ELSE '미완료' END;