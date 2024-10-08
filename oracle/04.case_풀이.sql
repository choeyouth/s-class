-- case

-- tblInsa

-- 1. 직원의 급여가 3000000 이상이면 '고급', 2000000 이상이면 '중급', 그 외는 '초급'으로 분류하세요.
SELECT name, basicpay,
    CASE
        WHEN basicpay >= 3000000 THEN '고급'
        WHEN basicpay >= 2000000 THEN '중급'
        ELSE '초급'
    END AS salary_class
FROM tblInsa;

-- 2. 직원의 직위가 '부장'이나 '과장'이면 '관리자', 그 외는 '직원'으로 분류하세요.
SELECT name, jikwi,
    CASE
        WHEN jikwi IN ('부장', '과장') THEN '관리자'
        ELSE '직원'
    END AS position_class
FROM tblInsa;

-- 3. 직원의 주민번호 뒷자리 첫번째 숫자가 1이나 3이면 '남자', 2나 4면 '여자'로 분류하세요.
SELECT name, ssn,
    CASE
        WHEN SUBSTR(ssn, 8, 1) IN ('1', '3') THEN '남자'
        WHEN SUBSTR(ssn, 8, 1) IN ('2', '4') THEN '여자'
    END AS gender
FROM tblInsa;

-- 4. 부서가 '영업부'면 5%, '총무부'면 3%, '개발부'면 7%, 나머지는 2%의 보너스율을 적용하세요.
SELECT name, buseo,
    CASE
        WHEN buseo = '영업부' THEN basicpay * 0.05
        WHEN buseo = '총무부' THEN basicpay * 0.03
        WHEN buseo = '개발부' THEN basicpay * 0.07
        ELSE basicpay * 0.02
    END AS bonus
FROM tblInsa;

-- 5. 직원의 급여와 수당의 합이 5000000 이상이면 '관리대상', 그 외는 '일반'으로 분류하세요.
SELECT name, basicpay, sudang,
    CASE
        WHEN (basicpay + sudang) >= 5000000 THEN '관리대상'
        ELSE '일반'
    END AS management_class
FROM tblInsa;


-- tblCountry

-- 6. 인구가 5000만 이상이면 '대국가', 1000만 이상이면 '중국가', 그 외는 '소국가'로 분류하세요.
SELECT name, population,
    CASE
        WHEN population >= 5000 THEN '대국가'
        WHEN population >= 1000 THEN '중국가'
        ELSE '소국가'
    END AS country_size
FROM tblCountry;

-- 7. 대륙별로 'AS'는 '아시아', 'EU'는 '유럽', 'AF'는 '아프리카', 그 외는 '기타'로 출력하세요.
SELECT name, continent,
    CASE
        WHEN continent = 'AS' THEN '아시아'
        WHEN continent = 'EU' THEN '유럽'
        WHEN continent = 'AF' THEN '아프리카'
        ELSE '기타'
    END AS continent_greeting
FROM tblCountry;

-- 8. 국가 이름의 길이가 4자 이상이면 '긴 이름', 그 외는 '짧은 이름'으로 분류하세요. 길이 함수: length(컬럼명)
SELECT name,
    CASE
        WHEN LENGTH(name) >= 4 THEN '긴 이름'
        ELSE '짧은 이름'
    END AS name_length
FROM tblCountry;

-- 9. 면적이 10만 이상이면 '대면적', 1만 이상이면 '중면적', 그 외는 '소면적'으로 분류하세요.
SELECT name, area,
    CASE
        WHEN area >= 100000 THEN '대면적'
        WHEN area >= 10000 THEN '중면적'
        ELSE '소면적'
    END AS area_class
FROM tblCountry;

-- 10. 수도 이름이 '서울'이면 '한국', '베이징'이면 '중국', '도쿄'면 '일본', 그 외는 '기타'로 분류하세요.
SELECT name, capital,
    CASE
        WHEN capital = '서울' THEN '한국'
        WHEN capital = '베이징' THEN '중국'
        WHEN capital = '도쿄' THEN '일본'
        ELSE '기타'
    END AS country
FROM tblCountry;


-- tblComedian

-- 11. 몸무게가 70kg 이상이면 '과체중', 50kg 이상이면 '정상체중', 그 외는 '저체중'으로 분류하세요.
SELECT first || ' ' || last AS name, weight,
    CASE
        WHEN weight >= 70 THEN '과체중'
        WHEN weight >= 50 THEN '정상체중'
        ELSE '저체중'
    END AS weight_class
FROM tblComedian;

-- 12. 성별이 'm'이면 '남자', 'f'면 '여자'로 표시하세요.
SELECT first || ' ' || last AS name,
    CASE
        WHEN gender = 'm' THEN '남자'
        WHEN gender = 'f' THEN '여자'
    END AS gender_kr
FROM tblComedian;

-- 13. 키가 180cm 이상이면 '장신', 170cm 이상이면 '중간', 그 외는 '단신'으로 분류하세요.
SELECT first || ' ' || last AS name, height,
    CASE
        WHEN height >= 180 THEN '장신'
        WHEN height >= 170 THEN '중간'
        ELSE '단신'
    END AS height_class
FROM tblComedian;

-- 14. 이름의 길이가 3자 이상이면 '긴 이름', 그 외는 '짧은 이름'으로 분류하세요.
SELECT first || ' ' || last AS name,
    CASE
        WHEN LENGTH(first || last) >= 3 THEN '긴 이름'
        ELSE '짧은 이름'
    END AS name_length
FROM tblComedian;

-- 15. 코미디언의 나이(2024년 기준)를 계산하여 30세 이상이면 '중견', 그 외는 '신인'으로 분류하세요.
SELECT first || ' ' || last AS name, 
    2024 - TO_NUMBER(CASE 
        WHEN SUBSTR(ssn, 8, 1) IN ('1', '2') THEN '19'
        ELSE '20'
    END || SUBSTR(ssn, 1, 2)) + 1 AS age,
    CASE
        WHEN 2024 - TO_NUMBER(CASE 
            WHEN SUBSTR(ssn, 8, 1) IN ('1', '2') THEN '19'
            ELSE '20'
        END || SUBSTR(ssn, 1, 2)) + 1 >= 30 THEN '중견'
        ELSE '신인'
    END AS comedian_class
FROM tblComedian;

-- tblDiary

-- 16. 날씨가 '맑음'이면 '야외활동', '흐림'이면 '실내활동', 그 외는 '휴식'으로 분류하세요.
SELECT subject, weather,
    CASE
        WHEN weather = '맑음' THEN '야외활동'
        WHEN weather = '흐림' THEN '실내활동'
        ELSE '휴식'
    END AS activity
FROM tblDiary;

-- 17. 일기의 제목이 '오늘'로 시작하면 '일상', '영화'로 시작하면 '문화생활', 그 외는 '기타'로 분류하세요.
SELECT subject,
    CASE
        WHEN subject LIKE '오늘%' THEN '일상'
        WHEN subject LIKE '영화%' THEN '문화생활'
        ELSE '기타'
    END AS category
FROM tblDiary;

