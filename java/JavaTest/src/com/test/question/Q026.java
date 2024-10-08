package com.test.question;

import java.util.Scanner;

public class Q026 {

	public static void main(String[] args) {
		
		// [요구사항] 학생의 국어 점수를 입력받아 성적을 출력하시오.
		
		// [조건] 
//		90 ~ 100: A
//		80 ~  89: B
//		70 ~  79: C
//		60 ~  69: D
//		 0 ~  59: F
//		유효성 검사를 하시오.(점수: 0 ~ 100점 이내)
		
		// [흐름]
		// 스캐너 생성
		// 라벨 출력
		// 입력 받은 국어 점수 값에 저장 
		// if문 조건식 유효성 검사
		// 중첩 if문 성적 출력
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("점수: ");
		int score = scan.nextInt();
		
		if (score >= 0 && score <= 100) {
			
			if (score >= 90) {
				System.out.printf("입력한 %d점은 성적 A입니다.", score);
			} else if(score >= 80) {
				System.out.printf("입력한 %d점은 성적 B입니다.", score);
			} else if(score >= 70) {
				System.out.printf("입력한 %d점은 성적 C입니다.", score);
			} else if(score >= 60) {
				System.out.printf("입력한 %d점은 성적 D입니다.", score);
			} else {
				System.out.printf("입력한 %d점은 성적 F입니다.", score);
			}
			
		} else {
			System.out.println("점수가 올바르지 않습니다. 0~100사이의 값을 입력하시오.");
		}
		
		scan.close();
		
	}
}
