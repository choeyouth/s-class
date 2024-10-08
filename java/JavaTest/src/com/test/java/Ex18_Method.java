package com.test.java;

public class Ex18_Method {
	
	public static void main(String[] args) {
		
		// 재귀 메서드
		// - 재귀 구조를 가지는 메서드
		// - 메서드 구현부에서 자기 자신을 호출하는 메서드 
		// - 특정 행동을 반복해야 하는 경우에 사용(몇 번 반복해야 할지 모르는 경우) ★★★
			
		
		// m1();
		// m2();
		// m3();
		
		
		
		// 팩토리얼
		// 4! = 4 x 3 x 2 x 1
		
		// [요구사항] 팩토리얼 메서드를 구현하시오. 
		
		int n = 4;
		
		
		int result = factorial(n); // Ctrl + 1 -> 메서드 자동 생성 
		
		System.out.printf("%d! = %d\n", n, result);
		
	
		
		//////////////////////////////////////////////////////////////
		
		System.out.println(10.0 / 3.0);
		System.out.printf("%.1f\n", 10.0 / 3.0);
		
		String result2 = String.format("%.1f\n", 10.0 / 3.0);
		System.out.println(result2);
		
		
		
	} // main

	private static int factorial(int n) {
		// TODO Auto-generated method stub(코드 조각) : 자동으로 생성된 메서드 -> 잊지말고 구현하라는 메시지 
		// TODO : Windows -> show view -> Tasks => 확인해야할 중요한 일 보여주는 이클립스 기능
		// TODO 김대리 > 점심 후 반드시 확인할 것!!!
		
		return (n==1) ? 1 : n * factorial(n - 1);
		// 상황에 따라 반복 횟수 조절 
	}
	

	public static void m1() {
		
		System.out.println("첫번째 메서드");
		// m2(); // 메서드는 독립적임 
	}
	
	public static void m2() {
		
		System.out.println("두번째 메서드");
		
	}
	
	// 재귀 메서드 
	public static void m3() {
		
		System.out.println("세번째 메서드");
		// m3(); // 재귀 호출 
		// Exception in thread "main" java.lang.StackOverflowError : 메모리가 꽉차서 중간에 강제 종료 -> 무한반복
	}
}
