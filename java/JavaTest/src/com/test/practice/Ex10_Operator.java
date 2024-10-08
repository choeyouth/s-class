package com.test.practice;

import java.util.Scanner;

public class Ex10_Operator {
	
	public static void main(String[] args) {
		
		// [요구사항] 사용자로부터 문자 1개 입력 > 영문자 혹은 숫자인지? 
		
		// [흐름] 공부!! 기승전결 파악, 구성 (순서에 따른 체계 분석)
		// 1. Scanner 생성
		// 2. 안내 메시지 출력(Label)
		// 3. 문자 입력
		// 4. 유효성 검사 
		// 5. 결과 처리 + 출력 
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("문자 입력 : ");
		
		String input = scan.nextLine();
		
		char c = input.charAt(0); // String -> char 변환  
		
		int n1 = (int)c; // char 문자를 숫자코드로 변환 
		System.out.println("소문자");
		System.out.println(n1 >= 'a' && n1 <= 'z' ? "올바른 문자" : "올바르지 않는 문자"); // 소문자인 경우
		System.out.println();
		
		System.out.println("대문자");
		System.out.println(n1 >= 'A' && n1 <= 'Z' ? "올바른 문자" : "올바르지 않는 문자"); // 대문자인 경우 
		System.out.println();
		
		System.out.println("숫자");
		System.out.println(n1 >= '0' && n1 <= '9' ? "올바른 문자" : "올바르지 않는 문자"); // 숫자인 경우 	
		System.out.println();
		
		// 영문자 혹은 숫자인 경우
		System.out.println("영문자 혹은 숫자");
		System.out.println(n1 >= 'a' && n1 <= 'z' 
							|| n1 >= 'A' && n1 <= 'Z'
							|| n1 >= '0' && n1 <= '9'
							? "올바른 문자" : "올바르지 않는 문자");
		
		
		
	}
	
}
