package com.test.java;

import java.util.Scanner;

public class Ex23_While {

	public static void main(String[] args) {
		
		/*
		
		
		
		*/
		
		//m1(); // 스캐너 추가 설명
		//m2(); // while문 작성 방법
		//m3(); //for문을 while문으로 작성해보기 
		m4(); // 자판기 
		//m5(); // do while 
		
		
	} 

	private static void m5() {
		
		/*
		 
		 K&R 스타일 
		 
		 while (조건) {
		 	문장;
		 }
		 
		 
		 Allman 스타일 (엔터. 스크롤이 길어진다, 괄호 길이 짝을 맞추기 쉽다)
		 
		 while (조건) 
		 {
		 	문장;
		 }
		 
		 while문
		 - 조건을 먼저 만남
		 - 선 조건 후 실행 
		 
		 
		 do while문 
		 - 실행문을 먼저 만남
		 - 무조건 1번은 실행 
		 - 선 실행 후 조건
		 
		 
		 do
		 {
		 	문장;
		 }
		 while (조건);
		 
		 do {
		 	문장; 
		 } while (조건);
		 
		 
		 
		 */
		
		
		int num = 11;
		
		while(num<=10) {
			System.out.println(num);
			num++;
		}
		System.out.println();
		
		num = 11;
		
		do {
			System.out.println(num);
			num++;
		} while (num<=10);
		
		
		
	}

	private static void m4() {
		
		// 자판기
		// - (메뉴 출력 > 음료 선택 > 가격 출력) x 루프 (회전수 미정 -> 무한 루프 -> while문이 더 편함) 
		
		Scanner scan = new Scanner(System.in);
		boolean loop = true;
		String sel = ""; // while문에서 반복하면 메모리 용량을 많이 잡아먹음 
		int price = 0;
		
		while (loop) {
			System.out.println("==========");
			System.out.println("  자판기");
			System.out.println("==========");
			System.out.println("1. 콜라");
			System.out.println("2. 사이다");
			System.out.println("3. 박카스");
			System.out.println("4. 종료");
			System.out.println("----------");
			
			System.out.print("선택: ");
			sel = scan.nextLine();
			
			if (sel.equals("1")) {
				price = 700;
			} else if (sel.equals("2")) {
				price = 600;
			} else if (sel.equals("3")) {
				price = 500;
			} else {
				// 프로그램 종료? > 무한 루프 탈출
				loop = false;
				// break;
			} // if
			
			System.out.println(price + "원입니다.");
			
			System.out.println();
			System.out.println("계속하시려면 엔터를 입력하세요.");
			
			scan.nextLine(); // 일시 정지
			
			
			
			
			
		} // while
		
		System.out.println("프로그램 종료");
		
	} // main

	private static void m3() {
		// 1~10 누적
		int sum = 0;
		for (int i = 1; i<=10; i++) {
			sum += i;
		}
		System.out.println(sum);
		
		
		//---
		
		
		sum = 0;
		int num = 1;
		
		while (num <= 10) {
			sum += num;
			num++;
		}
		System.out.println(sum);
		
		
		
	}

	private static void m2() {
		
		/*
			반복문
			
			1. for
			2. while
			3. do while
			4. for
			
			while (조건식) {
			
			} 
			
			- if문을 연속적으로 실행하는 것과 같음
			
			if (조건식) {
			
			}
		*/
		
		
		// [요구사항] 1~10출력 
		
		for (int i=1; i<=10; i++) {
			System.out.println(i);
		}
		System.out.println();
		
		int num = 1; // 초기식 
		
		while (num <= 10) { // 조건식 
			System.out.println(num);
			num++; // 증감식 
		} 
		
		
		
		// 무한루프 
//		for(;;) {
//			
//		}
		
//		while (true) {
//			
//		} 
		
		
		
	}

	private static void m1() {
		
		Scanner scan = new Scanner(System.in);
		
		
		
		System.out.println("이름: "); // 키보드로 입력받고 Int가 숫자는 가져가고, 엔터를 버려줌
		String name = scan.nextLine();
		
		System.out.println("나이: ");
		int age = scan.nextInt(); // 키보드로 입력받고 Int가 숫자는 가져가고, 엔터를 남김
		
		//scan.skip("\r\n"); // 방법1. 값을 버림
		scan.nextLine(); // 방법2. \r\n 문자를 가져감 
		
		System.out.println("주소: ");
		String address = scan.nextLine();
		
		System.out.println(name);
		System.out.println(address);
		System.out.println(age);
			
	}
}
