package com.test.question;

import java.util.Scanner;

public class Q028 {

	public static void main(String[] args) {
		
		// [요구사항] 근무 년수를 입력받아 아래와 같이 출력하시오.
		// [조건]
//			1 ~ 4년차: 초급 개발자
//			5 ~ 9년차: 중급 개발자
//			10년차 이상: 고급 개발자
//			유효성 검사를 하시오.(1 미만 입력 예외 처리)
		
		// [흐름]
		// 사용할 변수 선언
		// 스캐너 생성
		// 라벨 출력
		// 입력한 값 변수에 저장
		// if문 유효성 검사
		// if문 근무 년수에 따른 조건식 
		// 출력
		
		int career = 0;
		Scanner scan = new Scanner(System.in);
		
		System.out.print("근무 년수: ");
		career = scan.nextInt();
		
		if (career > 0) {
			
			if (career < 5) {
				System.out.printf("%d년차 초급 개발자입니다.\n", career);
				System.out.printf("앞으로 %d년 더 근무를 하면 중급 개발자가 됩니다.\n"
								, (5 - career));
			} else if (career < 10) {
				System.out.printf("%d년차 중급 개발자입니다.\n", career);
				System.out.printf("당신은 %d년 전까지 초급 개발자였습니다.\n", (career - 4));
				System.out.printf("앞으로 %d년 더 근무를 하면 중급 개발자가 됩니다.\n"
								, (10 - career));
			} else {
				System.out.printf("%d년차 고급 개발자입니다.\n", career);
				System.out.printf("당신은 %d년 전까지 중급 개발자였습니다.\n", (career - 9));
			}
			
		} else {
			System.out.println("입력한 값이 올바르지 않습니다. 1이상의 값을 입력하시오.");
		}
		
		scan.close();
		
	}
	
	
}
