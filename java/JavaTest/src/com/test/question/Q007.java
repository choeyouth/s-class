package com.test.question;

import java.util.Scanner;

public class Q007 {
	public static void main(String[] args) {
		// [요구사항] 영문 소문자를 1글자 입력받은 후 대문자로 변환해서 출력하시오.
		
		// [조건] 
		// - 대문자와 소문자의 문자 코드값의 관계
		
		// [흐름]
		// 1. 스캐너 생성
		// 2. 사용할 변수 선언
		// 3. 안내 메시지 출력
		// 4. 문자 입력
		// 5. 소문자 -> 대문자 변환
		// 6. 출력
		
		// 1. 스캐너 생성
		Scanner scan = new Scanner(System.in);
		
		// 2. 사용할 변수 선언
		String input;
		
		// 3. 안내 메시지 출력
		System.out.print("문자 입력: ");
		input = scan.nextLine(); // a
		// 4. 문자 입력
		char c = input.charAt(0); 
		
		// 5. 소문자 -> 대문자 변환
		int code = (int)c; // a -> 97
		
		// 97 -> 65 // -32
		int result = c - 32;
		
		// 6. 출력
		System.out.printf("소문자 '%c'의 대문자는 '%c'입니다.\n", code, result);
		
		scan.close();
		
	}
}
