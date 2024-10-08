package com.test.java;

public class Ex17_Method {

	public static void main(String[] args) {
	
		/*
		 
			메서드 오버로딩, Method Overloading (면접에서 질문 가능)
			
			- 같은 이름의 메서드를 여러개 만드는 기술
			- 메서드의 인자 리스트를 다양한 형태로 구성해서, 같은 이름의 메서드를 여러 개 만드는 기술
			
			메서드 오버로딩을 하는 이유?
			
			- 성능 향상(X)
			- 개발자에게 도움(O)
			
			메서드 오버로딩 구현 조건 가능
			
			1. 매개변수의 개수
			2. 매개변수의 자료형
			
			메서드 오버로딩 구현 조건 불가능
			
			1. 매개변수의 이름
			2. 반환 값의 자료형
			
			메서드를 만드는 중..
			
			1. public static void test() {}               // O 
			2. public static void test() {}              //  X, 1번
			3. public static void test(int n) {}          // O → 메서드 오버로딩 (매개변수의 자료형이 다름)
			4. public static void test(int m) {}          // X, 3번 → 매개변수의 이름
			5. public static void test(String s) {}       // O → 매개변수의 자료형
			6. public static void test(int n, int ,) {}  //  O
			7. public static int test() {}                       // X, 1번 
			
			메서드 호출하기 (오버로딩 가능 유무 검증!!!) 
			
			test(); // 1번 정의는 가능해도 사용이 어려움 → 식별 불가 
			
			test(10); // 3번 인자 값으로 호출 식별 
			
			test(”홍길동”); // 5번
			
			test(10, 20); // 6번
			
			int num = test(); // 오른쪽부터 실행 (1번과 식별 불가 - 반환 값의 자료형)
		
		*/
		
		// [요구사항] 선을 그리는 메서드를 구현하시오.
		// [요구사항] ----------
		// [요구사항] **********
		
		drawLine();
		drawLine("$");
		
		System.out.println(100);
		System.out.println("문자열");
		System.out.println(true);
		System.out.println(3.14);
		// 서로 다른 메서드 -> 오버로딩 
		
		
	} 
	
	public static void pintln(int num) {
		
	}
	
	public static void pintln(String txt) {
		
	}
	
	public static void drawLine() {
		
		System.out.println("==========");
		
	}
	
//	public static void drawLine() {
//		
//		System.out.println("---------");
//		
//	}
//	
//	public static void drawLine() {
//		
//		System.out.println("**********");
//		
//	}
	
	public static void drawLine(String c) { 
		// 메서드 오버로딩 - String 변수로 구성 > 같은 이름의 메서드를 여러개 만들 수 있음 
		
		System.out.print(c);
		System.out.print(c);
		System.out.print(c);
		System.out.print(c);
		System.out.print(c);
		System.out.print(c);
		System.out.print(c);
		System.out.print(c);
		System.out.print(c);
		System.out.print(c);
		System.out.println();
	}
}
