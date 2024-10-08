package com.test.question;

import java.util.Scanner;

public class Q006 {
	public static void main(String[] args) {
		
		// [요구사항] 사용자의 한달 수입을 입력받아 세후 금액을 출력하시오.
		
		// [조건]
		// - 세금: 수입의 3.3%
		
		// [흐름]
		// 1. 스캐너 생성
		// 2. 사용할 변수 선언
		// 3. 안내 메시지 출력
		// 4. 수입 입력
		// 5. 세후금액 연산
		// 6. 세금 연산
		// 7. 출력
		
		// System.out.println(1000000 * 0.033);
		
		// 1. 스캐너 생성
		Scanner scan = new Scanner(System.in);
		
		// 2. 사용할 변수 선언
		int importation = 0;
		
		// 3. 안내 메시지 출력
		System.out.print("한달 수입 금액(원): ");
		
		// 4. 수입 입력
		importation = scan.nextInt();
		
		// 퍼센트 계산
		// 5. 세후금액 연산
		double result1 = importation - (importation * 0.033);
											  // == * 3.3/100
		
		// 6. 세금 연산
		double result2 = importation * 0.033;
		
		// 7. 출력
		System.out.printf("세후 금액(원): %,.0f원\n", result1);
		System.out.printf("세금(원): %,.0f원\n", result2);
		
		scan.close();
		
		
	}
}
