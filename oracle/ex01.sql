-- 한줄 주석 

/*
    여러줄 주석
*/

/*

    - ex01.sql
    
    설치 프로그램
    
    1. Oracle Database 11g Express Edition
        - 데이터베이스(DB)
        - 오라클(회사) > 오라클(제품)
        - 11g > 버전
        - Express Edition > 종류 < 무료 버전
        - 실행 화면이 없는 프로그램 > 눈에 안 보이는 프로그램 > 서비스, 데몬 
            > 조작 가능한 UI가 없다.
    
    2. SQL Developer
        - 데이터베이스 클라이언트 도구(DB Client Tools) > GUI
        - 데이터베이스를 조작하는 프로그램
        - 전체 작업용
    
    3. SQL*Plus
        - 데이터베이스 클라이언트 도구 > CLI(Command Line Interface)
        - 간단한 작업용
        
    Oracle Database 11g Express Edition
    
    - 오라클 서비스
    - Win + R > services.msc
    
    1. OracleServiceXE
        - 오라클 데이터베이스
        - 메인 서비스
        - 서비스 제어
            - net start 서비스명
            - net stop 서비스
    
    2. OracleXETNSListener
        - 클라이언트 접속 관리 (Listener)

    오라클 설치 중..
    
    - 암호 입력(java1234)
    - SYS, SYSTEM 계정 > 기본 계정 > 관리자 계정 > SYS(회장님), SYSTEM(사장님)
    
    SQL Developer 접속
    
    - 오라클 데이터베이스에 접속
    1. 사용자 이름: system
    2. 비밀번호: java1234
    3. 호스트 이름: 오라클이 설치된 컴퓨터 IP 주소 or 도메인 
                    localhost
    4. 포트: 1521 (Listener Port Number) (프로그램을 찾는 번호)
    5. SID: 하나의 컴퓨터에 여러 오라클 설치 > 구분 식별자 > xe
    6. Name: 접속 이력명 > system@localhost
                           localhost.system
                        
    
    DB 계정

    1. SYSTEM 
        - 로컬 접속 가능
        - 원격 접속 가능
    
    2. SYS
        - 로컬 접속 가능
    
    3. 일반 계정
        - 생성 후 사용
        
        3.1 hr, scott
        
        - 학습용 계정
        - 소량의 데이터 제공 > 학습
        
        3.2 직접 생성
        
        - 수업 중
        - 프로젝트



    hr 계정 사용하기 
    
    1. 잠긴 계정 풀기 
        - alter user 유저명 accout unlock; (문장 단위로 이루어짐) 
                                           (하나로써 온전한 문장)
    
    2. 암호 바꾸기
        - alter user 유저명 identified  by 암호;


*/

-- shift : 한글자, shift + ctrl : 한 단어, shift + home : 한 블록
-- Ctrl + Enter : 블록 잡힌 문장 실행
alter user hr account unlock;

alter user hr identified by java1234;


/*

    Database
    - 데이터베이스
    - 데이터의 집합
    
    Database Management System    
    - 데이터베이스 관리 시스템
    - 데이터 집합 + 조작/관리
    - 오라클 > DBMS
    
    Relational Database Management System 
    - 관계형 데이터베이스 관리 시스템
    - RDB, RDBMS
    - 테이블로 데이터 저장하는 DB 
    
    RDBMS
    - Oracle > 기업용 > 자바 
    - MS-SQL > MS > 기업용  
    - DB2 > IBM
    - MySQL > Oracle > 무료 > 유료 
    - MariaDB > MySQL 유사 > 무료 
    - PostreSQL 
    - SQLite > 모바일 
    - H2 > 스프링 > 초경량 DB
    - MS Access > MS 오피스 > 개인용 DB
    
    Oracle Database Version
    - 1.0
    - 11g
    - 23ai
    
    
    
    
    
    
    오라클(DB 서버) ↔ SQL Developer(클라이언트 툴) ↔ 개발자(클라이언트) 

    SQL, Structure Query Language
    - 오라클 사용하는 언어 > 모든 관계형 데이터베이스 관리 시스템이 사용하는 언어
    - RDBMS와 대화하는 언어
    - 구조화된 질의 언어
    - Query(질의) > 오라클에게 질문
    - SQL == Query
    
    
    DB 분야 직군 
    - 오라클 시스템 + SQL 언어
    
    1. 데이터베이스 관리자, DBA
        - 모든 것 취급
    
    2. 데이터베이스 개발자
        - 거의 모든 것
    
    3. 응용 프로그램 개발자(= 자바 개발자)
        - 일부 작업 > SQL 언어 
        
    SQL 
    
    1. 데이터베이스 제작사와 독립적이다. 
        - 모든 데이터베이스에서 공통으로 사용한다.
        - 표준 SQL > 제작사들이 자신의 제품에 적용한다.
    
    2. 표준 SQL, ANSI-SQL
        - 모든 DB에서 사용 가능한 SQL
    
    3. 방언
        - 제작사 별로 자기 제품에서만 동작하는 SQL
        - Oracle > PL/SQL
        - MS-SQL > T-SQL
    
    오라클 수업 = 표준 SQL(60%) + DB 설계(10%) + PL/SQL(30%)
               - 2주 정도
    
    
    
    
    표준 SQL 

    1. DDL
        - Data Definition Languge
        - 데이터 정의어
        - 테이블, 뷰, 사용자, 인덱스 등의 데이터베이스 오브젝트를  생성 / 수정 / 삭제하는 명령어
        - DB 구조를 생성 / 수정 / 삭제하는 명령어
        a. create : 생성 
        b. drop : 삭제
        c. alter : 수정 
        
        - 데이터베이스 관리자
        - 데이터베이스 개발자
        - 프로그래머(일부)
        
    2. DML
        - Data Manipulation Language
        - 데이터 조작어
        - 데이터를 추가/수정/삭제/조회하는 명령어
        - 사용 빈도가 가장 높음
        
        CRUD
        
        a. select : 조회(읽기) > [R]ead
        b. insert : 추가(생성) > [C]reate
        c. update : 수정 > [U]pdate
        d. delete : 삭제 > [D]elete
        
        - 데이터베이스 관리자
        - 데이터베이스 개발자
        - 프로그래머(*****)
    
    3. DCL
        - Data Contol Language
        - 데이터 제어어
        - 계정 관리, 보안 관리, 트랜잭션 처리 등..
        
        a. commit
        b. rollback
        c. grant
        d. revoke
        
        - 데이터베이스 관리자
        - 데이터베이스 개발자
        - 프로그래머(일부)
    
    4. DQL
        - Data Query Language
        - DML 중에서 select문을 따로 부르는 표현
    
    
    5. TCL
        - Transection Control Language
        - DCL 중에서 commit, rollback문을 따로 부르는 표현
        
    
    오라클 인코딩 
    - 1.0 ~ 8 : EUC-KR
    - 9i ~ 현재 : UTF8
    
    SQL > 대소문자를 구분하지 않는다.
    - 파란색 > 키워드 > 대문자
    - 검은색 > 식별자 > 소문자 
    
    
    
*/


SELECT * FROM tabs; -- 수업

SELECT * FROM tabs; -- 기본



















