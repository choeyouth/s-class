package com.test.java;

import java.util.Scanner;

public class Ex12_Operator {
	public static void main(String[] args) {
		
		// [요구사항] 사용자로부터 문자 1개 입력 > 영문자 혹은 숫자인지? 
		
		// [흐름] 공부!! 기승전결 파악, 구성 (순서에 따른 체계 분석)
		// 1. Scanner 생성
		// 2. 안내 메시지 출력(Label)
		// 3. 문자 입력
		// 4. 유효성 검사 
		// 5. 결과 처리 + 출력 
		
		// 1. Scanner 생성
		Scanner scan = new Scanner(System.in);
		
		// 2. 안내 메시지 출력(Label)
		System.out.print("문자 입력 : ");
		
		// 3. 문자 입력
		String input = scan.nextLine();
		
		// 4. 유효성 검사 (핵심!!!!)
		// System.out.println(input );
		
		char c = input.charAt(0);
		int code = (int)c;
		//System.out.println(code);
		// a(97) ~ z(122)
		// A(65) ~ Z(90)
		// 0(48) ~ 9(57)
		// 가(44032) ~ 힣(?)
		
		String result = 
				(c >= 'A' && code <= 'Z') 
				|| (c >= 'a' && code <= 'z') 
				|| (c >= '0' && code <= '9')
				? "올바른 문자" : "올바르지 않은 문자";
		
		// String result = (c >= 'A' && code <= 'Z') || (c >= 'a' && code <= 'z') ? "올바른 문자" : "올바르지 않은 문자";
		// String result = c >= '가' && c <= '힣' ? "올바른 문자" : "올바르지 않은 문자";
		// String result = code >= 97 && code <= 122 ? "올바른 문자" : "올바르지 않은 문자";
		// String result = code >= 65 && code <= 90 ? "올바른 문자" : "올바르지 않은 문자";
		
		// > A 
		// "A" > 문자코드 값 ? 
		// 'A' > (int)'A' > 65
		// System.out.println((int)"A"); // 불가능
		
		// System.out.println("A".charAt(0)); // "A" -> 'A' 
		// char c = "A".charAt(0); 
		// System.out.println((int)c);

		
		// 5. 결과 처리 + 출력 
		System.out.printf("입력한 문자 '%s'는 %s입니다.\n", input, result);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
