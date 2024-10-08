package com.test.java;

import java.sql.Connection;
import java.sql.Statement;
import java.util.Scanner;

public class Ex03_Statement {

	public static void main(String[] args) {
		
		//Ex03_Statement.java
		
		/*
		
			Connection
			
			- 연결/종료
			
			Statement 
			
			- 모든 SQL 실행하는 역할
			
			1. Statement
			- 기본
			
			2. PreparedStatement
			- Statement 개량 > 매개 변수 처리 특화
			
			3. CallableStatement
			- Statement 개량 > 프로시저 호출 전용
		
		
		*/
		
		//m1();
		//m2();
		//m3();
		//m4();
		m5();
		
	}

	private static void m5() {

		//UI + SQL + 데이터 사용자 입력
		Scanner scan = new Scanner(System.in);
		
		
		//*** 자바와 오라클은 아무 관계가 없다.
		//- 자바는 오라클의 자료형이 뭔지 모른다. 
		System.out.print("이름: ");
		String name = scan.nextLine();
		
		System.out.print("나이: ");
		String age = scan.nextLine();
		
		System.out.print("성별(m,f): ");
		String gender = scan.nextLine();
		
		System.out.print("전화번호: ");
		String tel = scan.nextLine();
		
		System.out.print("주소: ");
		String address = scan.nextLine();
		
		String sql =  String.format("insert into tblAddress (seq, name, age, gender, tel, address, regdate)"
				+ " values (seqAddress.nextVal, '%s', %s, '%s', '%s'"
				+ " , '%s', default)", name, age, gender, tel, address);
		
		Connection conn = null;
		Statement stat = null;
		
		try {
			
			conn = DBUtil.open();
			stat = conn.createStatement();
			
			System.out.println(stat.executeUpdate(sql));
			
			stat.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("Ex03_Statement.m5");
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

	private static void m4() {
		
		Connection conn = null;
		Statement stat = null;
		
		try {
			
			conn = DBUtil.open();
			
			if (!conn.isClosed()) {
				
//				String sql = "create table tblJava ("
//						  + " seq number primary key,"
//						  + "  data varchar2(100) not null"
//						  + ")";

				String sql = "drop table tblJava";
				
				stat = conn.createStatement();
				int result = stat.executeUpdate(sql);
				
				if (result > 0) {
					System.out.println("테이블 생성 성공");
				} else {
					System.out.println("테이블 생성 실패");
				}
				
				stat.close();
				conn.close();
				
			} else {
				System.out.println("DB 접속 실패");
			}
			
		} catch (Exception e) {
			System.out.println("Ex03_Statement.m2");
			e.printStackTrace();
		}
	}

	private static void m3() {


		Connection conn = null;
		Statement stat = null;
		
		try {
			
			conn = DBUtil.open();
			
			if (!conn.isClosed()) {
				
				String sql = "delete from tblAddress where seq = 2";
				stat = conn.createStatement();
				int result = stat.executeUpdate(sql);
				
				if (result > 0) {
					System.out.println("삭제 성공");
					System.out.println(result + "개 행 이(가) 삭제되었습니다.");
				} else {
					System.out.println("삭제 실패");
				}
				
				stat.close();
				conn.close();
				
			} else {
				System.out.println("DB 접속 실패");
			}
			
		} catch (Exception e) {
			System.out.println("Ex03_Statement.m2");
			e.printStackTrace();
		}
		
	}

	private static void m2() {
		
		Connection conn = null;
		Statement stat = null;
		
		try {
			
			conn = DBUtil.open();
			
			if (!conn.isClosed()) {
				
				String sql = "update tblAddress set age = age + 1";
				stat = conn.createStatement();
				int result = stat.executeUpdate(sql);
				
				if (result > 0) {
					System.out.println("수정 성공");
					System.out.println(result + "개 행 이(가) 업데이트되었습니다.");
				} else {
					System.out.println("수정 실패");
				}
				
				stat.close();
				conn.close();
				
			} else {
				System.out.println("DB 접속 실패");
			}
			
		} catch (Exception e) {
			System.out.println("Ex03_Statement.m2");
			e.printStackTrace();
		}
		
	}

	private static void m1() {
		
		Connection conn = null;
		Statement stat = null;
		
		
		try {
			
			//1.
			conn = DBUtil.open();
			
			if (!conn.isClosed()) {
				
				//2. 
				//- 자바는 SQL을 모른다. > SQL을 문자열로 취급한다. 
				String sql = "insert into tblAddress (seq, name, age, gender, tel, address, regdate)"
						+ " values (seqAddress.nextVal, '거북이', 20, 'm', '010-1234-5678'"
						+ " , '서울시 강남구 역삼동', default)";
				
				stat = conn.createStatement();
				
				//반환값 없는 쿼리 > 오라클에게 전달되어 실행
				// - SQLDeveloper : Ctrl + Enter
				// 몇 개의 행이 쿼리에 적용되었는가? > int 값에 저장
				// - ***** SQL 실행하는 순간 자동으로 commit이 발생한다. (JDBC) == Auto Commit 
				int result = stat.executeUpdate(sql);
				
				if (result == 1) {
					System.out.println("등록 성공");
				} else {
					System.out.println("등록 실패");
				}
				
				//conn.rollback();
				//conn.commit();
				
				Scanner scan = new Scanner(System.in);
				scan.nextLine();
				
				//자원 해제
				stat.close();
				conn.close();
				
			} else {
				System.out.println("DB 접속 실패");
			}
			
		} catch (Exception e) {
			System.out.println("Ex03_Statement.m1");
			e.printStackTrace();
		}
		
		
		
	}
	
}




























