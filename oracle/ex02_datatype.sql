/*

    ex02_datatype.sql

    관계형 데이터베이스 

    - 변수(X) > 프로그래밍 언어
    - SQL > 대화형 언어 > DB와 대화를 목적으로 하는 언어
    - 데이터 조작 > 자료형 > 테이블을 정의할 때 사용 > 컬럼의 자료형
    
    
    
    
    표준 SQL 자료형( = 오라클 자료형)
    
    1. 숫자형
        - 정수, 실수
        a. number
            - (유효자리)38자리 이하의 숫자를 표현하는 자료형 
            - 12345678901234567890123456789012345678000000000000000
            - 5~22byte
            - 정수: -9.223372036854775808E+18 ~ 9.223372036854775807E+18
            - 실수: -1.7976931348623157E+308 ~ 1.7976931348623157E+308
        
            - number: 정수 or 실수
            - number(precision): 정수만 저장
            - number(precision, scale): 정수/실수 저장 
            
            
    2. 문자형 > 주로 varchar2 사용
        - 문자, 문자열
        - n의 의미? 
            - char vs nchar
            - varchar2 vs nvarchar2 
        - var의 의미?
            - char vs varchar
            - nchar vs nvarchar2
            
        a. char
            - 고정 자릿수 문자열 > 공간(칼럼)의 크기가 불변 > 처리 속도가 더 빠름
            - char(n) : 최대 n자리 문자열, n(바이트) 
                - char(n byte)
                - 최소 크기: 1바이트
                - 최대 크기: 2000바이트 
            - char(n char): n(문자수) > UTF-8 
            
        b. nchar
            - national language > 오라클 인코딩과 상관없이 해당 컬럼은 UTF16으로 저장
            - 고정 자릿수 문자열 > 공간(칼럼)의 크기가 불변
            - nchar(n) : 최대 n자리 문자열, n(문자수) 
                - 최소 크기 : 1자
                - 최대 크기 : 1000자
        
        c. varchar2
            - variable character
            - 바차투
            - 가변 자릿수 문자열 > 공간(칼럼)의 크기가 가변
            - varcgar2(n): 최대 n자리 문자열, n(바이트)
                - 최소 크기: 1바이트 
                - 최대 크기: 4000바이트 
            
        d. nvarchar2
            - national language > 오라클 인코딩과 상관없이 해당 컬럼은 UTF16으로 저장
            - 가변 자릿수 문자열 > 공간(칼럼)의 크기가 가변
            - nvarchar2(n) : 최대 n자리 문자열, n(문자수) 
                - 최소 크기 : 1자
                - 최대 크기 : 2000자
        
        e. clob
            - character large object
            - 대용량 텍스트 
            - 4GB
            - 참조형 
        
        f. nclob
            - national character large object
            - 대용량 텍스트 
            - 4GB
            - 참조형 
    
    
    
    
    
    
    
    
    
    3. 날짜 / 시간형
        a. date
            - 년월일시분초
        
        b. timestamp
            - 년월일시분초 + 밀리초 + 나노초
            
        c. interval
            - 시간
            - 틱값 저장용 
        
    4. 이진 데이터형
        a. blob
            - 비 텍스트 데이터
            - 이미지, 동영상, 음악, 실행 파일, 압축 파일 등…
            - 잘 사용 안 함
            ex) 게시판(첨부파일) > 파일명만 저장
        
테이블 선언하기 

create table 테이블명 ( 컬럼, 컬럼, 컬럼 );

create table 테이블명 ( 
    컬럼 선언, 
    컬럼 선언, 
    컬럼 선언,
    컬럼명 자료형 

);


*/

-- 수업 > DB Object 식별자(컬럼빼고) > 헝가리언 표기법 

drop table tblType; -- 테이블 삭제
-- 삭제 후 다시 만들기 -> 수정 

create table tblType (
    -- num number
    -- num number(3) -- -999 ~ 999 정수 
    -- num number(4, 2) -- (전체자릿수, 소수 이하 자릿수) 정수/실수 > -99.99 ~ 99.99
    --txt char(10) --최대 10바이트 > 영어, 한글 > 인코딩(UTF-8) > 영어-1B/한글-3B
   
    txt1 char(10),
    txt2 varchar2(10)

);

-- 현재 계정이 가지는 테이블 목록
select * from tabs;

-- 데이터 추가하기
-- insert into 테이블명(컬럼명) values (값);
insert into tblType(num) values (100); -- 정수 리터럴 
insert into tblType(num) values (3.14); -- 실수 리터럴
insert into tblType(num) values (12345678901234567890123456789012345678901234567890);
insert into tblType(num) values (123456789012345678901234567891012345678901234567890);
insert into tblType(num) values(999);
insert into tblType(num) values(-999);
insert into tblType(num) values(1000); 
insert into tblType(num) values(99.99); 
insert into tblType(num) values(-99.99); 

insert into tblType(txt) values(100); 
insert into tblType(txt) values('ABC'); --문자 리터럴 
insert into tblType(txt) values('ABCDEFGHIJ'); --문자 리터럴 
insert into tblType(txt) values('ABCDEFGHIJK'); --문자 리터럴 -> 오류
insert into tblType(txt) values('홍길동'); 
insert into tblType(txt) values('홍길동님'); -- actual: 12, maximum: 10
 

-- char(10) : 'ABC' > 'ABC       '
-- varchar2(10) : 'ABC' > 'ABC'
-- 똑같이 3바이트를 집어 넣었지만, 나머지 7바이트를 채우는 방식 
-- char > 스페이스 즉, 공백 
-- vatchar2 > 빼버림 > 가변자리수 

insert into tblType(txt1, txt2) values('ABC', 'ABC');
insert into tblType(txt1, txt2) values('ABCDEFGIJ', 'ABCDEFGIJ');

SELECT * from tbltype;





















