/*

    ex16_update.sql


    update문
    - UML
    - 원하는 행의 원하는 컬럼값을 수정하는 명령어
    
    update 테이블명 set 컬렴명 = 값 [, 컬럼명 = 값] x N [where 절]

*/


-- 트랜잭션 처리
commit;
rollback;

-- 대한민국: 서울 > 세종
select * from tblCountry;


update tblCountry set capital = '세종';
update tblCountry set capital = '세종' where name = '대한민국';

update tblCountry set 
    capital = '제주',
    population = 5000,
    continent = 'EU'
        where name = '대한민국';
        
-- EU 속한 나라 > 인구수 증가 10%
update tblCountry set
    population = population * 1.1
    where continent = 'EU';

select * from tblCountry; -- 한국 5500 > 6050























