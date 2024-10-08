package com.test.question;

import java.util.Scanner;

public class Q029 {
	
	public static void main(String[] args) {
		
		// [요구사항] 숫자 2개와 연산자 1개를 입력받아 연산 과정과 결과를 출력하시오.
		// [조건] 
//			정수만 입력하시오.(유효성 검사 필요없음)
//			나머지 연산 결과는 소수이하 첫째자리까지 출력 하시오.
//			연산자는 산술 연산자(+, -, *, /, %)만 입력하시오.
		
		// [흐름]
		// 사용할 변수 선언 
		// 스캐너 생성
		// 라벨 출력
		// 입력한 값 변수에 저장
		// if 조건식 연산
		// 산술연산자 유효성 검사
		
		int n1 = 0;
		int n2 = 0;
		String operator = "";
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("첫번째 숫자: ");
		n1 = scan.nextInt();
		
		System.out.print("두번째 숫자: ");
		n2 = scan.nextInt();
		scan.skip("\r\n");
		
		System.out.print("연산자: ");
		operator = scan.nextLine();
		
		int result1 = n1 + n2;
		int result2 = n1 - n2;
		int result3 = n1 * n2;
		double result4 = n1 / n2;
		int result5 = n1 % n2;
		
		if (operator.equals("+")) {
			System.out.printf("%d + %d = %d", n1, n2, result1);
		} else if (operator.equals("-")) {
			System.out.printf("%d - %d = %d", n1, n2, result2);
		} else if (operator.equals("*")) {
			System.out.printf("%d * %d = %d", n1, n2, result3);
		} else if (operator.equals("/")) {
			System.out.printf("%d / %d = %.1f", n1, n2, result4);
		} else if (operator.equals("%")) {
			System.out.printf("%d %% %d = %d", n1, n2, result5);
		} else {
			System.out.println("연산이 불가능합니다.");
		} 
		
		scan.close();
		
		
		
	}
	
	
	
}
