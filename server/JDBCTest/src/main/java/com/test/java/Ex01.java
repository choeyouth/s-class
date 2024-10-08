package com.test.java;

import java.sql.Connection;
import java.sql.DriverManager;

public class Ex01 {

	public static void main(String[] args) {
		
		//Ex01.java
		
		/*
		 
		  	JDBC, Java Database Connectivity

			- 자바 응용 프로그램 ← JDBC(연결) → 오라클 데이터베이스
			- 중간 계층
			- 영속성 계층(Persostence Layer)
			- 기술 > 클래스 집합
			
			1. JDBC
			    1.5…
			2. Sprint-JDBC
			3. MyBatis
			4. JPA
			- 주로 2~3을 씀  JDBC는 no…
		  
		  	
		    JDBC Driver 설치
			- JDBC Library(*.jar)
			- DBMS별로 다르다. > 각 DB 제조사 홈페이지에서 제공
			- ojdbcXXX.jar
			
			[사람 + SQL Developer ← (SQL) → Oracle Server]
			
			1. 클라이언트 툴 실행
			    
			    
			2. DB 서버 접속
			    - 호스트명: localhost
			    - 포트번호: 1521
			    - SID: xe
			    - 드라이버: thin
			    - 사용자명: hr
			    - 암호: java1234
			
			3. 질의
			    - SQL 사용
			    
			    3.1 반환값이 없는 쿼리
			    
			    - select를 제외한 쿼리
			    
			    3.2 반환값이 있는 쿼리
			    
			    - select
			    - 반환값(결과셋)
			
			4. 접속 종료
			    - commit/rollback
			    
			    
			------------------------------
			
		    [자바 + SQL Developer ← (SQL) → Oracle Server]

			1. 자바 프로그램 실행(+JDBC)
			    
			    
			2. DB 서버 접속     
			    - JDBC > Connection 클래스 사용
			    - 호스트명: localhost
			    - 포트번호: 1521
			    - SID: xe
			    - 드라이버: thin
			    - 사용자명: hr
			    - 암호: java1234
			
			3. 질의
			    - SQL 사용
			    - JDBC > Statement 클래스 사용
			    
			    3.1 반환값이 없는 쿼리
			    
			    - void executeUpdate()
			    - select를 제외한 쿼리
			    
			    3.2 반환값이 있는 쿼리
			    
			    - ResultSet executeQuery()
			    - select
			    - 반환값(결과 셋)
			    - ResultSet > 탐색 > 자바에서 사용
			
			4. 접속 종료
			    - JDBC > Connection 클래스 사용
			    - commit/rollback
			
			
			JDBC 라이브러리 클래스
			- Connection, Statement, ResultSet 클래스
			
			
			
			접속 시 발생하는 에러
			1. 서버 주소 X 
			- IO 오류: The Network Adapter could not establish the connection
			- java.net.UnknownHostException: 알려진 호스트가 없습니다 (locahost)
			
			2. 포트 번호 X
			- Connection refused: connect
			
			3. SID X
			- Listener refused the connection with the following error:
			  ORA-12505, TNS:listener does not currently know of SID given in connect descriptor
			
			4. 아이디X, 암호X
			- ORA-01017: invalid username/password; logon denied
			
			5. 드라이버 로딩 X
			- oracle.jdbc.driver.OracleDriver //잘못된 글자 포함해서 보여줌 
			
			6. Listener 중단 
			- Connection refused: connect
			
			7. Oracle 중단
			- Listener refused the connection with the following error:
			  ORA-12505, TNS:listener does not currently know of SID given in connect descriptor
			
			8. odjbc6.jar 안 가져옴
			- oracle.jdbc.driver.OracleDriver
			
			
		 */
		
		
		System.out.println("[데이터베이스 접속하기]");
		Connection conn = null;
		
		//접속 정보 > 연결 문자열(Connection String)
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "server";
		String pw = "java1234";
		
		
		//JDBC 작업 > 외부 입출력 > 예외 처리 필수 
		try {
			
			//JDBC 드라이버(클래스) 로딩 
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//DB 연결
			//- 접속 정보를 가지고 있는 Connection 객체를 반환
			conn = DriverManager.getConnection(url, id, pw);
			
			//현재 접속 상태?
			//- 접속X > true
			//- 접속O > false
			System.out.println(conn.isClosed()); //false
			
			//업무 실행 ~ SQL 실행
			System.out.println("업무 진행");
			
			//접속 종료
			conn.close();
			System.out.println(conn.isClosed()); //true
			
		} catch (Exception e) {
			System.out.println("Ex01.main");
			e.printStackTrace();
		}
		
	}//main
}
















