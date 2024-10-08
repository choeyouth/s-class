package com.test.java;

import java.util.Scanner;

public class Ex21_Switch {

	public static void main(String[] args) {
		
		/*
		 
		 	switch문, switch case문
		 	- 조건: 값(데이터) > 정수, 문자열, 열거형 
		 	
		 	switch (조건) {
		 		case 값:	
		 			문장;
		 			break;
		 	   [case 값: 
		 			문장;
		 			break;] x N
		 	   [default:
		 	   		문장:
		 	   		break;] // 1개만 가능 
		 		
		 
		 
		 
		 
		 */
		
		
		
		
		
		
		
		//m1(); //
		//m2(); // 자판기
		//m3(); // 양수 판별
		m4(); // 달력
		
	} // main

	private static void m4() {
		
		// 달력 만들기 
		
		// [요구사항] 사용자가 월입력 > 해당 월의 마지막 일? 
		
		int lastDay = 0; // 마지막 일 
		int month = 5;
		
		if (month == 1 
				|| month == 3 
				|| month == 5 
				|| month == 7 
				|| month == 8 
				|| month == 10 
				|| month == 12) {
			lastDay = 31;
		} else if (month == 4 
				|| month == 6 
				|| month == 9 
				|| month == 11) {
			lastDay = 30;
		} else {
			lastDay = 28;
		}
		
		switch (month) {
		 	case 1:
		 	case 3:
		 	case 5:
		 	case 7:
		 	case 8:
		 	case 10:
		 	case 12: 
		 		lastDay = 31;
		 		break;
		 	case 4:
		 	case 6:
		 	case 9:
		 	case 11:
		 		lastDay = 30;
		 		break;
		 	case 2:
		 		lastDay = 28;
		 		break;
		}
		
		
		
		
		
		
		
		
	}

	private static void m3() {
		
		int num = 10;
		
		if (num > 0) {
			System.out.println("양수");
		} else {
			System.out.println("양수 아님");
		}
		
		// Cannot switch on a value of type boolean. Only convertible int values, strings or enum variables are permitted
//		switch (num > 0) {
//		 case true:
//			 System.out.println("양수");
//			 break;
//		 case false:	
//			System.out.println("양수 아님");
//			break;
//		}

	}
	
	private static void m2() {
		
		// [요구사항] 자판기
		// - 메뉴 출력 > 음료 선택 > 가격 출력
		// - 가격 변공 > 사이다 700원 > 앞으로 평생 콜라와 사이다의 가격은 동일하게 책정 
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("=============");
		System.out.println("   자판기");
		System.out.println("=============");
		System.out.println("1. 콜라");
		System.out.println("2. 사이다");
		System.out.println("3. 박카스");
		System.out.println("-------------");
		System.out.print("선택(번호): ");
	
		String input = scan.nextLine();
		
		if (input.equals("1") || (input.equals("2"))) {
			System.out.println("700원입니다.");
		} else if (input.equals("3")) {
			System.out.println("500원입니다.");
		} else {
			System.out.println("선택하신 음료는 없습니다."); // 전제 조건이 되었어야 함
		}
		
		switch (input) {
			case "1": 
			case "2":
				System.out.println("700원입니다.");
					break;
			case "3":
				System.out.println("500원입니다.");
					break;
			default:
				System.out.println("없는 번호");
					break;
		}	
		
	
	
	
	
	
	}

	private static void m1() {
		// [요구사항] 숫자를 1개 입력 > 한글로 출력하세요.
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("숫자: ");
		int num = scan.nextInt();
		
		if (num == 1) {
			System.out.println("하나");
		} else if (num == 2) {
			System.out.println("둘");
		} else if (num == 3) {
			System.out.println("셋");
		}
		
		switch (num) {
			case 1:
				System.out.println("하나");
				break;
			case 2:
				System.out.println("둘");
				break;
			case 3:
				System.out.println("셋");
				break;
		}
		
		
		
		
		
		
		
		
		
		
		
	}
	
}
