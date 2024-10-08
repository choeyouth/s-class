package com.test.question;

import java.util.Scanner;

public class Q030 {

	public static void main(String[] args) {
		
		// [요구사항] 영문자 1개를 입력받아 대/소문자 변환을 한 뒤 출력하시오.
		// [조건] 유효성 검사를 하시오.(영문자만 입력 가능)
		
		// [흐름]
		// 사용할 변수 선언 (영문자)
		// 스캐너 생성
		// 라벨 출력
		// 입력한 영문자 변수에 저장
		// 입력한 String값을 char로 변환
		// char 문자를 int값으로 저장
		// if문으로 대 -> 소 / 소 -> 대문자 변환
		// 유효성 검사
		
		String input = "";
		char c = '\0';
		int code = 0;
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("문자: ");
		input = scan.nextLine();
		
		c = input.charAt(0);
		code = (int)c;
		
				
		// System.out.println(code);
		
		// A(65) ~ Z(90)
		// a(97) ~ z(122)
		
		// code >= 97 && code <= 122)
		
		if (code >= 65 && code <= 90) {
			c += 32;
			System.out.printf("'%s'의 소문자는 '%s'입니다.", input, c);
		} else if (code >= 97 && code <= 122) {
			c -= 32;
			System.out.println(c);
			System.out.printf("'%s'의 대문자는 '%s'입니다.", input, c);
		} else {
			System.out.println("영문자만 입력하시오.");
		}
		
		scan.close();
		
		
		
		
		
		
	}
	
	
}
