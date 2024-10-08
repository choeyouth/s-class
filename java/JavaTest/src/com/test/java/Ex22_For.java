package com.test.java;

import java.util.Scanner;

public class Ex22_For {

	public static void main(String[] args) {
	
		/*
		
			반복문 

			- 코드를 원하는 횟수만큼 반복 실행하는 제어
			- 생산성 + 유지보수
			
			for문
			
			for (초기식 ; 조건식; 증감식 ) {
			
			구현부;
			
			}	
		
		
		*/
		
		
		
		
		//m1(); // for문 작성 방법
		//m2(); // 1. 회전수 제어
		//m3(); // 2. 루프 변수 제어★★★★★★★★★★
		//m4(); // 누적 연산 
		//m5(); // 1 ~ 사용자가 입력한 숫자까지의 합
		//m6(); // 1 ~ 사용자가 입력한 숫자들의 합
		//m7(); // 구구단 출력
		//m8(); // 무한 루프, Infinite Loop
		//m9(); // 분기문
		//m10();
		//m11(); // /b
		//m12(); // 지역 변수의 영역
		//m13(); // 난수 만들기 (Math 클래스)
		
	}

	private static void m13() {
		
		// 난수 만들기
		// - 임의의 수 만들기 
		
		// 1, 1, 1, 1, 1, 1, 1, 1, 0, 0 
		
		//1. Math 클래스
		//2. Random 클래스
		
		// 0.06309614149889098
		// System.out.println(Math.random());
		
		// Math.random()
		// Returns a double value with a positive sign, 
		// greaterthan or equal to 0.0 and 
		// less than 1.0.Returned values are 
		
		// 0~0.9999999999999999999
		
		
		for (int i = 0 ; i < 10 ; i++) {
			// System.out.println(Math.random()  );
		
			// 가공
			// 0.0 > 0.0 > 90
 			// 0.1 > 1.0 > 1
			// 0.345678 > 3.45678 > 3
			// 0.5 > 5.0 > 5
			// 0.9 > 9.0 > 9
			
			// System.out.println((int)(Math.random() * 10));
			
			// 주사위 (1 ~ 6) 
			// 0.1 > 0.0 > 1
			// 0.2 > 0.6
			// 0.3 > 1.2
			// 0.4 > 2.4
			// 0.5 > 3.0
			// 0.6 > 3.6
			// 0.7 > 4.2
			// 0.8 > 4.8
			// 0.9 > 5.4 > 5 > 6
		
			System.out.println((int)(Math.random()*6) + 1);
			
		}
		
		
		
		
		
		
	}

	private static void m12() {
		
		// 지역 변수의 영역
		// - 자신이 포함된 메서드 영역
		// - 자신이 포함된 제어문 영역
		// > 블록 스코프를 가진다. (Block Scope) 
		
		
		
		int a = 10; // 영역(m12)
		
		// 초기화
		// - 초깃값? > 업무를 살펴보고 판단
		// 			  1. 필요한 값
		//		      2. 최대한 피해를 주지 않는 값 	
		int b = 0; // 초기화 (컴파일과 런타임의 차이 // 컴파일은 문법 검사만 함) 
		double c = 0.0;
		char d = '\0';
		boolean e = false;
		String f = "";
		

		
		if (a > 0) {
			System.out.println(a);
			b = a * 2; // 영역(if)
			
			if (b > 0) {
				int g = 10;
			}
			
			if (b > 0) {
				int g = 10;
			}
			
		}
		System.out.println(b); // b cannot be resolved to a variable 
		//	int aa;
		//	System.out.println(aa); // b cannot be resolved to a variable : 초기화 안 함
		//  -> 이렇게 인식
		
		
		for (int i=0; i<10; i++) {
			System.out.println("반복");
		}
		// System.out.println(i); // i cannot be resolved to a variable : 지역변수라서 인식 못함
		System.out.println();
		
		int i=0;
		for (i=0; i<10; i++) {
			System.out.println("반복");
		}
		System.out.println(i);
		
		
	}

	private static void m11() {
		// 1 + 2 + 3 = 6
		
		int sum = 0;
		
		for (int i = 1; i<=3; i++) {
			sum += i;
			System.out.print(i + " + ");
			
		}
		
		System.out.println("\b\b= " + sum);
	}

	private static void m10() {
		
		// 1 + 2 + 3 = 6
		
		int sum = 0;
		
		for (int i = 1; i<=3; i++) {
			sum += i;
			System.out.print(i);
			
			if (i != 3) {
				System.out.print(" + ");
			} 
		}
		
		System.out.print(" = " + sum);
	}

	private static void m9() {
		// 분기문 > 단독으로 사용 불가. 조건문 or 반복문과 같이 사용 
		// - break > 자신이 포함된 제어문을 탈출 
		// - continue
		
//		for (int i = 1; i <=10 ; i++) {
//		
//			break; // 완전 중단 
//			
//			System.out.println(i); // Unreachable code : 도달할 수 없는 코드
//		
//		}
		
		for (int i = 1; i <=10 ; i++) {
			
				if (i == 5) {
					break; // 조건부 탈출 장치
				}
				
				System.out.println(i); 
			
		}
		
		
		for (int i = 1; i <=10 ; i++) {
			
			System.out.println(i); 
			
			continue; // 처음의 위치로 돌아가세요 
		
		}
		
		for (int i = 1; i <=10 ; i++) {
			
			if (i == 5) {
				continue; // for문으로 돌아감 - for문의 처음 위치 -> print 실행 x
			}
			
			System.out.println(i); 
			
		}
		
		
		// 사용자 숫자 입력 > 홀수의 합? 
		// - 숫자를 몇개 입력? > 사용자 맘대로~ > 회전수? > 무한 루프
		// - 0을 입력하면 프로그램 종료 
		
		int sum = 0;
		Scanner scan = new Scanner(System.in);
		
		for(;;) {
			
			System.out.print("숫자: ");
			int num = scan.nextInt();
				
			if (num == 0) {
				break;
			}
			
			if(num % 2 == 1) {
				// 홀수
				sum += num;
			} else {
				// 짝수
				System.out.println("짝수를 입력 > 프로그램 종료");
				break;
			}
			
		}
		
		System.out.printf("합: %d",sum);
		
	}

	private static void m8() {
		// 무한 루프, Infinite Loop
		// 몇 번을 돌아야하는 지 모를 때 사용
		
		// 약 21억 회전
		for (int i=0; i<10; i--) {
			System.out.println(i);
		}
		
		// 무한 루프 직접 생성하기 
//		for (int i = 0; ; i++) { // 조건절 생략 or true 작성 - 주로 생략한다. 
//			System.out.println(i);
//		}
		
		for (;;) { // 루프 변수가 필요 없을 때, 모두 생략
			System.out.println("실행문");
		}
		
		
	}

	private static void m7() {
		
		// 구구단 출력
		
		/*
		
			5 x 1 = 5
			5 x 2 = 10
			5 x 3 = 15
			..
			5 x 9 = 45
		
		*/
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("단 입력: ");
		
		int dan = scan.nextInt();
		
		for (int i=1; i<10; i++) {
			System.out.printf("%d x %d = %2d\n",dan, i, dan * i);
		}
		
		scan.close();
		
		
		
	}

	private static void m6() {
		
		// 1 ~ 사용자가 입력한 숫자들의 합 > 10개 입력
		
		Scanner scan = new Scanner(System.in);
		
		int sum = 0;
		
		for(int i=0; i<10; i++) {
			
			//사용자 숫자 입력 > 누적
			System.out.print("숫자: ");
			int num = scan.nextInt();
			sum += num;
			
		}
		
		System.out.println("합: " + sum);
		
		scan.close();
		
		 
	}

	private static void m5() {
		// [요구사항] 1 ~ 사용자가 입력한 숫자까지의 합
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("숫자: ");
		int num = scan.nextInt();
		
		int sum = 0; // 누적 변수
		
		for (int i = 1; i <= num; i++) {
			sum += i;
		}
		System.out.printf("1 ~ %d = %d\n", num, sum);
		
		scan.close();
		
	}

	private static void m4() {
		// [요구사항] 1~10까지의 합 > 누적 연산
		
		// *** 누적값 구하기 
		
		// sum = 0 + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
		
		// 1. 누적 변수
		int sum = 0;
		// The local variable sum may not have been initialized : 값 초기화
		
		// 2. 원하는 수열 만들기 
		for (int i = 1; i <= 10 ; i++) {
			sum = sum + i; 
			//i(1) 1 = 0 + 1;
			//i(2) 3 = (0 + 1) + 2
			//i(3) 6 = (0 + 1 + 2) + 3
			//i(4) 10 = (0 + 1 + 2 + 3) + 4
			// ..
			// i(10) 55 = (0 + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9) + 10
		}
		System.out.println(sum);
		
		
	}

	private static void m3() {
		
		// 반복문 목적
		// 1. 회전수 제어
		// 2. 루프 변수 제어★★★★★★★★★★
		
		// *** 업무 구현 > 특정한 숫자의 패턴 사용 > 반복문의 루프 변수
		// [요구사항] 숫자 1~10까지 출력
		
		System.out.println(1);
		System.out.println(2);
		System.out.println(3);
		System.out.println(4);
		System.out.println(5);
		System.out.println(6);
		System.out.println(7);
		System.out.println(8);
		System.out.println(9);
		System.out.println(10);

		int num = 1;
		
		System.out.println(num);
		num++;
		
		System.out.println(num);
		num++;
		
		System.out.println(num);
		num++;
		
		System.out.println(num);
		num++;
		
		System.out.println(num);
		System.out.println();
		
		
		num = 1;
		
		for (int i=0; i<10; i++) {
			System.out.println(num);
			num++;
		}
		System.out.println();
		
		for (int i=0; i<10; i++) {
			System.out.println(i + 1);
		}
		System.out.println();
		
		for (int i=1; i<11; i++) {
			System.out.println(i);
		}
		System.out.println();
		
		for (int i=1; i<11; i=i+2) { // 홀수
			System.out.println(i);
		}
		System.out.println();
		
		for (int i=2; i<11; i+=2) { // 짝수
			System.out.println(i);
		}
		System.out.println();
		
		// 1~100 사이의 7의 배수 
		for (int i=7; i<=100; i+=7) { 
			System.out.println(i);
		}
		System.out.println();
		
		
		
		
	}

	private static void m2() {
		
		// 반복문 목적
		// 1. 회전수 제어
		// 2. 루프 변수 제어
		
		for (int i=123; i<128; i++) {
			System.out.println("실행문");
		}
		System.out.println();
		
		for (int i=1; i<=5; i++) {
			System.out.println("실행문");
		}
		System.out.println();
		
		for (int i=5; i>0; i--) {
			System.out.println("실행문");
		}
		System.out.println();
		
		for (int i=1; i<=41; i = i + 10) {
			System.out.println("실행문");
		}
		System.out.println();
		
		// 가장 보편적인 방법
		// - 루프 변수 > 0부터 
		for (int i=0; i<5; i++) {
			System.out.println("실행문");
		}
		
		
		
		
		
		
		
		
		
	}
	
	private static void m1() {
	
		// [요구사항] "안녕하세요" x5 출력
		
		System.out.println("안녕하세요.");
		System.out.println("안녕하세요.");
		System.out.println("안녕하세요.");
		System.out.println("안녕하세요.");
		System.out.println("안녕하세요.");
		
		
		hello();
		hello();
		hello();
		hello();
		hello();
		
		
		//순서
		// 1. int i=0; > 초기식
		// 2. i<5; > 조건식
		//	==  if (i < 5) { }
		// 3. 구현부 실행 
		// 4. i++ > 증감식 ( == ++i // 하나의 문장, 연산자 우선순의의 의미가 없다) 
		// 5. i<5; > 조건식
		// 6. 구현부 실행 
		// 7. i++ > 증감식 
		
		for (int i=0 ; i<5; i++) {
			
			System.out.println("Hello~");
			//hello();
			
		} 
	
	}

	private static void hello() {
		System.out.println("반갑습니다.");
	}
	
	
	
	
	
	
}
