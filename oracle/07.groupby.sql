-- 1-6(답 이상), 2-3(상위 3개 안 배움), 2-6(답 오류, 애매), 
-- 4-3(답 이상), 4-6(답 오류, 안 배움), 4-7(답 오류, 애매)

-- tblHousekeeping 테이블 문제

select * from tblhousekeeping;

-- 1. 각 날짜별로 구매한 물품의 총 개수와 총 금액을 구하시오.
select
    buydate, sum(qty), sum(price * qty)
from tblhousekeeping
    group by buydate
        order by buydate;
        

-- 2. 가격대별로 구매한 물품의 수를 구하시오. (가격대는 1000원 단위로 나누어 주세요)
-- *****
select
    floor(price / 1000) * 1000, sum(qty)
from tblhousekeeping
    group by floor(price / 1000)
        order by floor(price / 1000);
    

-- 3. 각 물품별로 총 구매 금액을 구하고, 구매 금액이 높은 순으로 정렬하시오.
select 
    item, sum(price * qty)
from tblhousekeeping
    group by item
        order by sum(price * qty) desc; 

-- 4. 각 주차별로 구매한 물품의 총 개수와 총 금액을 구하시오. (주는 일요일부터 시작합니다)
select
    floor(to_char(buydate, 'dd') / 7) + 1 || '주', count(qty), sum(price)
from tblhousekeeping
    group by floor(to_char(buydate, 'dd')  / 7)
        order by floor(to_char(buydate, 'dd')  / 7);

-- 5. 구매 수량이 10개 이상인 물품들의 평균 가격을 구하시오.
select avg(price) from tblhousekeeping
    where qty >= 10;


-- 6. 각 물품별로 구매 횟수를 구하고, 구매 횟수가 1회 초과인 물품만 출력하시오.
-- 
select item, qty
    from tblhousekeeping
        where qty > 1
            order by qty;
    
-- 7. 구매 날짜별로 가장 비싼 물품의 가격을 구하시오.
select buydate, max(price)
    from tblhousekeeping
        GROUP by buydate
            order by buydate;

-- 8. 각 물품 종류별로 총 구매 금액을 구하고, 10만원 이상 구매한 물품 종류만 출력하시오.
-- 없음 
select item, sum(price * qty)
    from tblhousekeeping
        group by item
            having sum(price * qty) >= 100000;


-- 9. 요일별로 평균 구매 금액을 구하고, 평균 금액이 높은 순으로 정렬하시오.
select to_char(buydate, 'day'), avg(price * qty)
    from tblhousekeeping
        group by to_char(buydate, 'day')
        -- group by to_char(buydate, 'd')
            order by avg(price * qty) desc;


-- 10. 월별로 구매한 물품의 총 개수와 총 금액을 구하시오.
select to_char(buydate, 'month'), sum(qty), sum(price * qty)
    from tblhousekeeping    
        group by to_char(buydate, 'month')
            order by to_char(buydate, 'month');


-- tblInsa 테이블 문제

select * from tblInsa;

-- 1. 각 부서별로 직원 수와 평균 급여(기본급+수당)를 구하시오.
select buseo, count(*), round(avg(basicpay + sudang))
    from tblInsa
        group by buseo
            order by buseo;

-- 2. 직위별로 직원 수와 최고 급여, 최저 급여를 구하시오.
select jikwi, count(*), max(basicpay + sudang), min(basicpay + sudang)
    from tblInsa
        group by jikwi
            order by 2 desc;


-- 3. 입사년도별로 직원 수를 구하고, 가장 많은 직원이 입사한 연도 3개를 구하시오.
---
select to_char(ibsadate, 'yyyy'), count(*)
    from tblInsa
        group by to_char(ibsadate, 'yyyy')
            having count(*) >= count(*)
                order by count(*) desc;


-- 4. 각 도시별로 직원 수와 평균 급여를 구하고, 직원 수가 5명 이상인 도시만 출력하시오.
select city, count(*), round(avg(basicpay + sudang))
    from tblInsa
        group by city
            having count(*) >= 5
                order by count(*) desc;


-- 5. 부서별, 직위별로 평균 급여를 구하고, 부서와 직위 순으로 정렬하시오.
select buseo, jikwi, round(avg(basicpay + sudang))
    from tblInsa
        group by buseo, jikwi
            order by buseo, jikwi;
            
select to_number(to_char(sysdate, 'yyyy')) from dual;
select to_date('87/02/01', 'yyyy-mm-dd') from dual;
select to_date(ssn, 'yyyy-mm-dd') from tblInsa;

-- 6. 나이대별(20대, 30대, 40대 등)로 직원 수와 평균 급여를 구하시오.
select to_date((substr(ssn, 1, 2) || '/' || substr(ssn, 3, 2) || '/' || substr(ssn, 5, 2)), 'yyyy-mm-dd') from tblInsa;
select case
            when (to_number(to_char(sysdate, 'yyyy'))) - 
                (case
                    when substr(ssn, 8, 1) in ('1', '2') then (to_number(substr(ssn, 1, 2)) + 1900)
                    else (to_number(substr(ssn, 1, 2)) + 2000)
                end) between 10 and 19 then '10대'
            when (to_number(to_char(sysdate, 'yyyy'))) - 
                (case
                    when substr(ssn, 8, 1) in ('1', '2') then (to_number(substr(ssn, 1, 2)) + 1900)
                    else (to_number(substr(ssn, 1, 2)) + 2000)
                end) between 20 and 29 then '20대'
            when (to_number(to_char(sysdate, 'yyyy'))) - 
                (case
                    when substr(ssn, 8, 1) in ('1', '2') then (to_number(substr(ssn, 1, 2)) + 1900)
                    else (to_number(substr(ssn, 1, 2)) + 2000)
                end) between 30 and 39 then '30대'
            when (to_number(to_char(sysdate, 'yyyy'))) - 
                (case
                    when substr(ssn, 8, 1) in ('1', '2') then (to_number(substr(ssn, 1, 2)) + 1900)
                    else (to_number(substr(ssn, 1, 2)) + 2000)
                end) between 40 and 49 then '40대'
            when (to_number(to_char(sysdate, 'yyyy'))) - 
                (case
                    when substr(ssn, 8, 1) in ('1', '2') then (to_number(substr(ssn, 1, 2)) + 1900)
                    else (to_number(substr(ssn, 1, 2)) + 2000)
                end) between 50 and 59 then '50대'   
            when (to_number(to_char(sysdate, 'yyyy'))) - 
                (case
                    when substr(ssn, 8, 1) in ('1', '2') then (to_number(substr(ssn, 1, 2)) + 1900)
                    else (to_number(substr(ssn, 1, 2)) + 2000)
                end) between 60 and 69 then '60대'  
            else '70대 이상'
        end as age, count(*), round(avg(basicpay + sudang))
from tblInsa
    group by 
        case
            when (to_number(to_char(sysdate, 'yyyy'))) - 
                (case
                    when substr(ssn, 8, 1) in ('1', '2') then (to_number(substr(ssn, 1, 2)) + 1900)
                    else (to_number(substr(ssn, 1, 2)) + 2000)
                end) between 10 and 19 then '10대'
            when (to_number(to_char(sysdate, 'yyyy'))) - 
                (case
                    when substr(ssn, 8, 1) in ('1', '2') then (to_number(substr(ssn, 1, 2)) + 1900)
                    else (to_number(substr(ssn, 1, 2)) + 2000)
                end) between 20 and 29 then '20대'
            when (to_number(to_char(sysdate, 'yyyy'))) - 
                (case
                    when substr(ssn, 8, 1) in ('1', '2') then (to_number(substr(ssn, 1, 2)) + 1900)
                    else (to_number(substr(ssn, 1, 2)) + 2000)
                end) between 30 and 39 then '30대'
            when (to_number(to_char(sysdate, 'yyyy'))) - 
                (case
                    when substr(ssn, 8, 1) in ('1', '2') then (to_number(substr(ssn, 1, 2)) + 1900)
                    else (to_number(substr(ssn, 1, 2)) + 2000)
                end) between 40 and 49 then '40대'
            when (to_number(to_char(sysdate, 'yyyy'))) - 
                (case
                    when substr(ssn, 8, 1) in ('1', '2') then (to_number(substr(ssn, 1, 2)) + 1900)
                    else (to_number(substr(ssn, 1, 2)) + 2000)
                end) between 50 and 59 then '50대'   
            when (to_number(to_char(sysdate, 'yyyy'))) - 
                (case
                    when substr(ssn, 8, 1) in ('1', '2') then (to_number(substr(ssn, 1, 2)) + 1900)
                    else (to_number(substr(ssn, 1, 2)) + 2000)
                end) between 60 and 69 then '60대'  
            else '70대 이상'
        end;


-- 7. 입사월별로 직원 수와 평균 급여를 구하고, 평균 급여가 높은 순으로 정렬하시오.
select to_char(ibsadate, 'mm') || '월' as month_pay, count(*) as employee_count, round(avg(basicpay + sudang)) as pay
    from tblInsa
        group by to_char(ibsadate, 'mm')
            order by pay desc;


-- 8. 부서별로 가장 높은 급여를 구하시오.
select buseo, max(basicpay + sudang)
    from tblInsa
        group by buseo
            order by buseo;

-- 9. 직위별로 총 급여 합계를 구하고, 총 급여가 5000만원 이상인 직위만 출력하시오.
-- 없음 
select jikwi, sum(basicpay + sudang)
    from tblInsa
        group by jikwi
            having sum(basicpay + sudang) >= 50000000;

-- 10. 입사년도별, 부서별로 직원 수를 구하고, 직원 수가 5명 이상인 그룹만 출력하시오.
select to_char(ibsadate, 'yyyy') as ibsa_year, buseo, count(*)
    from tblInsa
        group by to_char(ibsadate, 'yyyy'), buseo
            having count(*) >= 5
                order by to_char(ibsadate, 'yyyy');


-- tblMen, tblWomen 테이블 문제
select * from tblMen;
select * from tblWomen;

-- 1. 남녀별로 평균 나이와 평균 키를 구하시오.
select avg(age), round(avg(height))
    from tblMen;
select avg(age), round(avg(height))
    from tblwomen;

-- 2. 커플 상태(연인 있음, 없음)별로 남녀 수를 구하시오.
select case
            when couple is not null then '연인 있음' 
            when couple is null then '연인 없음' 
        end as state, count(*)
    from tblMen
        group by case
            when couple is not null then '연인 있음' 
            when couple is null then '연인 없음' 
        end;

select case
            when couple is not null then '연인 있음' 
            when couple is null then '연인 없음' 
        end as state, count(*)
    from tblWomen
        group by case
            when couple is not null then '연인 있음' 
            when couple is null then '연인 없음' 
        end;

-- 3. 남녀별로 키 구간(160cm 미만, 160-170cm, 170-180cm, 180cm 이상)에 속하는 사람 수를 구하시오.
select case
            when height is null then 'null'
            when height < 160 then '160cm 미만'
            when height between 160 and 169 then '160-170cm'
            when height between 170 and 179 then '170-180cm'
            else '180cm 이상'
        end as state, count(*)
    from tblMen
        group by case
            when height is null then 'null'
            when height < 160 then '160cm 미만'
            when height between 160 and 169 then '160-170cm'
            when height between 170 and 179 then '170-180cm'
            else '180cm 이상'
        end
            order by state;
            
select case
            when height is null then 'null'
            when height < 160 then '160cm 미만'
            when height between 160 and 169 then '160-170cm'
            when height between 170 and 179 then '170-180cm'
            else '180cm 이상'
        end as state, count(*)
    from tblwomen
        group by case
            when height is null then 'null'
            when height < 160 then '160cm 미만'
            when height between 160 and 169 then '160-170cm'
            when height between 170 and 179 then '170-180cm'
            else '180cm 이상'
        end
            order by state;


-- 5. 남녀별로 가장 높은 체중을 구하시오.
SELECT '남자' AS gender, MAX(weight) AS max_weight
FROM tblMen
WHERE weight IS NOT NULL;

SELECT '여자' AS gender, MAX(weight) AS max_weight
FROM tblWomen
WHERE weight IS NOT NULL;

-- 6. 키 구간별(10cm 단위)로 남녀 수를 구하고, 남녀 수가 많은 순으로 정렬하시오.
select case
            when height < 160 then '150~159cm'
            when height between 160 and 169 then '160~169cm'
            when height between 170 and 179 then '170~179cm'
            when height >= 180 then '180~189cm'
        end as height, count(*)
    from tblMen
        where height is not null
            group by case
                when height < 160 then '150~159cm'
                when height between 160 and 169 then '160~169cm'
                when height between 170 and 179 then '170~179cm'
                when height >= 180 then '180~189cm'
            end
            order by count(*) desc;
        
select case
            when height < 160 then '150~159cm'
            when height between 160 and 169 then '160~169cm'
            when height between 170 and 179 then '170~179cm'
            when height >= 180 then '180~189cm'
        end as height, count(*)
    from tblWomen
        where height is not null
            group by case
                when height < 160 then '150~159cm'
                when height between 160 and 169 then '160~169cm'
                when height between 170 and 179 then '170~179cm'
                when height >= 180 then '180~189cm'
            end
            order by count(*) desc;

-- 7. 남녀별로 나이대(20대, 30대 등)에 따른 평균 키를 구하시오.
select case
        when age < 20 then '10대'
        when age between 20 and 29 then '20대'
        when age between 30 and 39 then '30대'
        else '30대 이상'
    end as age, avg(height)
from tblMen
group by case
        when age < 20 then '10대'
        when age between 20 and 29 then '20대'
        when age between 30 and 39 then '30대'
        else '30대 이상'
    end
order by age;

select case
        when age < 20 then '10대'
        when age between 20 and 29 then '20대'
        when age between 30 and 39 then '30대'
        else '30대 이상'
    end as age, avg(height)
from tblWomen
group by case
        when age < 20 then '10대'
        when age between 20 and 29 then '20대'
        when age between 30 and 39 then '30대'
        else '30대 이상'
    end
order by age;


-- 9. 남녀별로 체중이 가장 적게 나가는 사람과 가장 많이 나가는 사람의 몸무게 차이를 구하시오.
select max(weight) - min(weight)
from tblMen;

select max(weight) - min(weight)
from tblWomen;

-- 10. 남녀 모두에서 가장 긴 이름의 글자 수를 구하시오.
--
select max(length(name))
from tblMen;

select max(length(name))
from tblWomen;


-- tblTodo 테이블 문제

select * from tblTodo;

-- 1. 각 날짜별로 등록된 할 일의 수와 완료된 할 일의 수를 구하시오.
select to_char(adddate, 'yyyy-mm-dd'), count(adddate), count(completedate)
    from tblTodo
        group by to_char(adddate, 'yyyy-mm-dd')
            order by to_char(adddate, 'yyyy-mm-dd');

-- 2. 요일별로 할 일 등록 수를 구하고, 가장 많이 등록된 요일부터 정렬하시오.
select case
        when to_char(adddate, 'd') = '1' then '일요일'
        when to_char(adddate, 'd') = '2' then '월요일'
        when to_char(adddate, 'd') = '3' then '화요일'
        when to_char(adddate, 'd') = '4' then '수요일'
        when to_char(adddate, 'd') = '5' then '목요일'
        when to_char(adddate, 'd') = '6' then '금요일'
        when to_char(adddate, 'd') = '7' then '토요일'
    end as day, count(adddate) as count
    from tblTodo
        group by to_char(adddate, 'd')
            order by count desc;

-- 3. 각 주차별로 완료된 할 일의 수와 완료되지 않은 할 일의 수를 구하시오.
-- 답 이상 
select ceil(to_char(adddate, 'dd') / 7) || '주차' as week, count(completedate) as complete,
    sum(case
        when completedate is null then 1
        else 0
    end) as not_complete
    from tblTodo
        group by ceil(to_char(adddate, 'dd') / 7);

-- 4. 완료 여부에 따라 평균 소요 시간(완료시간 - 등록시간)을 구하시오.
select case
            when completedate is not null then '완료'
            else '미완료'
        end as state, avg(round(completedate - adddate) * 24) as avg_hour
    from tblTodo
        group by case
                when completedate is not null then '완료'
                else '미완료'
            end;


-- 5. 각 달별로 등록된 할 일의 수와 완료율(완료된 할 일 / 전체 할 일)을 구하시오.
select to_char(adddate, 'mm') as month, 
    count(adddate) as count, 
    sum(case
        when completedate is not null then 1 
        else 0
    end) / count(adddate) * 100 || '%' as com
from tblTodo
group by to_char(adddate, 'mm');


-- 6. 등록 시간대별(0-6시, 6-12시, 12-18시, 18-24시)로 할 일의 수를 구하시오.
select case
            when to_number(to_char(adddate, 'hh24')) between 0 and 5 then '0-6시'
            when to_number(to_char(adddate, 'hh24')) between 6 and 11 then '6-12시'
            when to_number(to_char(adddate, 'hh24')) between 12 and 17 then '12-18시'
            when to_number(to_char(adddate, 'hh24')) between 18 and 23 then '18-24시'
        end as add_hour, count(adddate)
    from tblTodo
        group by case
            when to_number(to_char(adddate, 'hh24')) between 0 and 5 then '0-6시'
            when to_number(to_char(adddate, 'hh24')) between 6 and 11 then '6-12시'
            when to_number(to_char(adddate, 'hh24')) between 12 and 17 then '12-18시'
            when to_number(to_char(adddate, 'hh24')) between 18 and 23 then '18-24시'
        end;
        

-- 7. 완료된 일 중에서, 소요 시간이 가장 긴 일의 소요 시간을 구하시오.
-- title.. 
select max(floor(completedate - adddate) * 24) || '시간' as max_hour
    from tblTodo
        where completedate is not null;



select to_char(adddate, 'yyyy-mm-dd hh24:mi:ss'), to_char(completedate, 'yyyy-mm-dd hh24:mi:ss'), completedate - adddate
    from tblTodo;
-- 8. 등록 후 완료까지 걸린 기간별(당일, 1일, 2일 이상)로 할 일의 수를 구하시오.
select case
            when completedate is null then '미완료'
            when completedate - adddate < 1 then '당일'
            when completedate - adddate < 2 then '1일'
            else '2일 이상'
        end as period, count(*)
    from tblTodo
        -- where completedate is not null
        group by case
            when completedate is null then '미완료'
            when completedate - adddate < 1 then '당일'
            when completedate - adddate < 2 then '1일'
            else '2일 이상'
        end;

-- 9. 각 날짜별로 가장 늦게 완료된 시간을 구하시오.
select to_char(completedate, 'yyyy-mm-dd'), max(to_char(completedate, 'hh24:mi:ss'))
    from tblTodo
        where completedate is not null
            group by to_char(completedate, 'yyyy-mm-dd')
                order by 1;

-- 10. 완료 여부에 따라 제목의 평균 글자 수를 구하시오.
select case
            when completedate is not null then '완료'
            when completedate is null then '미완료'
        end as state, avg(length(title))
    from tblTodo
        group by case
            when completedate is not null then '완료'
            when completedate is null then '미완료'
        end


