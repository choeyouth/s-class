select * from employees;

select sysdate from dual; --24/08/07
select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') from dual;

-- 2024-08-07 05:05:38
-- 2024-08-07 14:05:38


/*
    
    요구사항
    
    - 계정 > 관리자 계정, 교사 계정, 학생 계정
           > 오라클 계정(system, hr 등..)
            
    create table tblStudent (
        id varchar2()
        pw varchar2()
    );
    
    insert into tblStudent values ('hong', '111', '홍길동'..)
    
    - 로그인 > 권한 체크 > SQL + 자바
    
    1. 요구분석서 > 7일 ~ 8일(오전) 
    2. 순서도 > 8일
    3. ERD > 12 ~ 13일
    4. 테이블 정의서(DDL) > 13일 
    5. 데이터 정의서(DML) > 16일
    6. 쿼리문 정의서(ANSI-SQL) > 20일
    7. 오브젝트 스크립트(PLSQL) > 20일
    8. PPT > 21일 발표
    9. 최종 요약본
    
    
    
    
    
    
    
*/















