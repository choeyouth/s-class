-- subquery  
-- 4(답 3개) 
-- 6(답 너무 많..)
-- 7(문제 이해)


-- 1. employees. 'Munich' 도시에 위치한 부서에 소속된 직원들 명단?
select * from employees where department_id  
in (select department_id from departments where location_id in
    (select location_id from locations where city = 'Munich'));
    
    
-- 2. tblMan. tblWoman. 서로 짝이 있는 사람 중 남자와 여자의 정보를 모두 d가져오시오.
--    [남자]        [남자키]   [남자몸무게]     [여자]    [여자키]   [여자몸무게]
--    홍길동         180       70              장도연     177        65
--    아무개         175       null            이세영     163        null
--    ..
select name, height, weight, 
    (select name from tblWomen where couple = tblMen.name) as couple_name, 
    (select height from tblWomen where couple = tblMen.name) as couple_height, 
    (select weight from tblWomen where couple = tblMen.name) as couple_weight from tblMen
        where couple is not null;


select * from tbladdressbook;
-- 3. tblAddressBook. 가장 많은 사람들이 가지고 있는 직업은 주로 어느 지역 태생(hometown)인가?

select hometown from tbladdressbook
    where job = (select job
                 from tbladdressbook 
                 group by job
                 having count(job) = (select max(count(*))
                                      from tbladdressbook 
                                      group by job)) and rownum = 1
        group by hometown;
        

-- 4. tblAddressBook. 이메일 도메인들 중 평균 아이디 길이가 가장 긴 이메일 사이트의 도메인은 무엇인가?
select substr(email, instr(email, '@') + 1) as domain from tblAddressBook
    group by substr(email, instr(email, '@') + 1)
            having avg(length(substr(email, 1, instr(email, '@') - 1))) 
            >= (select max(avg(length(substr(email, 1, instr(email, '@') - 1))))
                from tbladdressbook group by substr(email, instr(email, '@') + 1));


-- 5. tblAddressBook. 평균 나이가 가장 많은 출신(hometown)들이 가지고 있는 직업 중 가장 많은 직업은?
select job from tbladdressbook 
where hometown = (select hometown from tblAddressBook
                  group by hometown
                  having avg(age) = (select max(avg(age)) from tblAddressBook group by hometown))
    group by job
        having count(job) >= (select max(count(job)) from tbladdressbook where hometown 
        = (select hometown from tblAddressBook
           group by hometown
           having avg(age) 
           = (select max(avg(age)) from tblAddressBook group by hometown)) group by job);

-- 6. tblAddressBook. 남자 평균 나이보다 나이가 많은 서울 태생 + 직업을 가지고 있는 사람들을 가져오시오.
select name from tblAddressBook 
    where age > (select avg(age) from tblAddressBook group by gender having gender = 'm')
    and hometown = '서울'
    and job is not null
    and gender = 'm';


-- 7. tblAddressBook. gmail.com을 사용하는 사람들의 성별 > 세대별(10,20,30,40대) 인원수를 가져오시오.
select gender, floor(age / 10) || '0대' as age, count(*) as count
from tblAddressBook 
where email like '%gmail.com' 
group by gender, floor(age / 10)
    order by age;


-- 8. tblAddressBook. 가장 나이가 많으면서 가장 몸무게가 많이 나가는 사람과 같은 직업을 가지는 사람들을 가져오시오.
-- 구급대원 
select * from tblAddressbook 
where job = (select job from tblAddressBook 
            where age >= (select max(age) from tblAddressBook)
            and weight = (select max(weight) from tbladdressbook));


-- 9. tblAddressBook.  동명이인이 여러명 있습니다. 이 중 가장 인원수가 많은 동명이인의 명단을 가져오시오.(모든 이도윤)
select * from tblAddressBook 
where name = (select name from tblAddressBook 
                          group by name 
                          having count(name) = (select max(count(name)) 
                          from tblAddressBook group by name));


-- 10. tblAddressBook. 가장 사람이 많은 직업의(332명) 세대별 비율을 구하시오.
--    [10대]       [20대]       [30대]       [40대]
--    8.7%        30.7%        28.3%        32.2%
select floor(age / 10) || '0대' as age, 
       round((count(*) / (select max(count(job)) 
             from tblAddressBook group by job)) * 100, 1) || '%' as ratio
       from tblAddressBook 
where job = (select job from tblAddressBook group by job having count(job) 
         >= (select max(count(job)) from tblAddressBook group by job))
group by floor(age / 10);

