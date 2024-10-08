package com.test.java.obj;

import java.util.Scanner;

public class Ex49_Exception {

	public static void main(String[] args) {
		
		/*
		
			예외, Exception
			- 런타임 오류
			- 컴파일 발견(X) > 실행 중 발견(O)
			- 개발자 미리 예측 > 사전 조치
			
			예외 처리, Exception Handling
			1. 제어문 사용
			2. try ~ catch문 사용
		
		*/
		
		//m1();
		//m2();
		//m3();
		//m4();
		
		try {
			m5();
		} catch (Exception e) {
			System.out.println("예외 처리");
		}
		
		
		
	}//main

	private static void m5() throws Exception {

		//예외 미루기 
		int n = 0;
		System.out.println(100 / n);
	}

	private static void m4() {
		
		Scanner scan = new Scanner(System.in);
		System.out.print("숫자: ");
		int num = scan.nextInt();
		
		try {
			// 비즈니스 코드 영역
			System.out.println(100 / num);
			return; //호출했던 곳으로 돌아감 > 메서드 종료 > finally는 거치고 종료됨
		} catch (Exception e) {
			// 예외 처리 코드 영역
			System.out.println("예외 처리");
		} finally {
			// 성공 or 실패 > 무조건 실행
			// 자원 해제 코드 영역 > clean-up code
			System.out.println("finally");
			//scan.close();
		}
		System.out.println("종료");
		
	}

	private static void m3() {
		
		// 사용자 입력 받는 상황
		
		try {
			
			int num = 0; 
			System.out.println(100/num); // throw new ArithmeticException()
			
			int[] nums = { 10, 20, 30 }; // throw new ArrayIndexOutOfBoundsException()
			System.out.println(nums[5]); 
			
			Scanner scan = null; // throw new NullPointerException()
			scan.nextInt(); 
			
		} catch (ArithmeticException e) {
			System.out.println("0으로 나누기");
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("배열 첨자");
		} catch (NullPointerException e) {
			System.out.println("널 참조");
		} catch (Exception e) { // 예측하지 못한 에러 예외 처리 
			System.out.println("예외 처리");
		} 
		
		
	}

	private static void m2() {
		
		try {
		int num = 0;
		System.out.println(100/num);
		} catch (Exception e) {
			System.out.println("0으로 나누려고 시도");
		}
				
		try {
			int[] nums = { 10, 20, 30 };
			System.out.println(nums[5]); //런타임 오류 (컴파일러는 방의 개수를 알지 못함)
		} catch(Exception c) {
			System.out.println("배열 첨자 오류");
		}
		
		try {
			Scanner scan = null;
			scan.nextInt(); //객체가 없음 > 메서드 호출(X)
		} catch(Exception e) {
			System.out.println("널 참조");
		}
		
		
		
	}

	private static void m1() {
		
		// [요구사항] 숫자를 입력 > 업무 처리
		Scanner scan = new Scanner(System.in);
		
		System.out.print("숫자: ");
		int num = scan.nextInt();
		
		// ** 예외 처리
		// 예외 조건
		if(num != 0) {
			// 비즈니스 코드(업무 코드) 
			System.out.printf("100 / %d = %d\n", num, 100/num);
		} else { 
			// 에외 처리 코드 
			System.out.println("0을 입력하지 마시오.");
		}
		
		
		
		// ** try catch문 
		// - try문 > 자신의 영역에서 오류가 발생하는지 감시!!
		// - catch문 > 오류가 발생 > 처리하는 역할
		
		try {
			// 비즈니스 코드(업무 코드) 
			System.out.println(111);
			System.out.printf("100 / %d = %d\n", num, 100/num);
			System.out.println(222);
		} catch(Exception e) {
			// 에외 처리 코드 
			System.out.println("0을 입력하지 마시오.");
		}
		System.out.println("종료");
		
		
		
	}
	
}//class
