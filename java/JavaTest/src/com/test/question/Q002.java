package com.test.question;

import java.util.Scanner;

public class Q002 {

	public static void main(String[] args) {
		
		// [요구사항] 숫자 2개를 입력받아 아래의 연산식을 출력하시오.
		
		// [조건]
		// - 출력 숫자에 천단위 표기 하시오.
		// - 결과값은 소수 이하 1자리까지 표기 하시오.
		
		// [흐름]
		// 1. scanner 생성
		// 2. 숫자 1 안내 문자 출력
		// 3. 숫자 1 입력
		// 4. 숫자 2 안내 문자 출력
		// 5. 숫자 2 입력
		// 6. 연산식 출력
		
		// 1. scanner 생성
		Scanner scan = new Scanner(System.in);
		
		// 2. 숫자 1 안내 문자 출력
		System.out.print("첫번째 숫자: ");
		
		// 3. 숫자 1 입력
		int num1 = scan.nextInt();
		
		// 4. 숫자 2 안내 문자 출력
		System.out.print("두번째 숫자: ");
		
		// 5. 숫자 2 입력
		int num2 = scan.nextInt();
		
		int result1 = num1 + num2; 
		int result2 = num1 - num2; 
		int result3 = num1 * num2; 
		double result4 = (double)(num1 / num2); 
		int result5 = num1 % num2; 
		
		// 6. 연산식 출력
		System.out.printf("%d + %d = %d\n", num1, num2, result1);
		System.out.printf("%d - %d = %d\n", num1, num2, result2);
		System.out.printf("%d * %d = %d\n", num1, num2, result3);
		System.out.printf("%d / %d = %.1f\n", num1, num2, result4);
		System.out.printf("%d %% %d = %d", num1, num2, result5);
		
		scan.close();
		
		
	}
	
}
