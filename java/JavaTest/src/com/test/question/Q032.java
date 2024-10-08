package com.test.question;

import java.util.Scanner;

public class Q032 {

	public static void main(String[] args) {
		
		// [요구사항] 주차 요금을 계산하시오.
		// [조건]
		//	무료 주차: 30분
		//	초과 10분당: 2,000원
		
		// [흐름]
		// 사용할 변수 선언 (들어온 시간, 분 / 나간 시간, 분 / 요금 /시간)
		// 스캐너 생성
		// 라벨 입력
		// 입력한 들나시분 변수에 저장
		// 시간 연산
		// if문 
		// 호출
		
		int enterHour = 0;
		int enterMinute = 0;
		int enterTime = 0;
		int outHour = 0;
		int outMinute = 0;
		int outTime = 0;
		int fee = 0;
		int duty = 2000;
		int gap = 0;
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("[들어온 시간]");
		System.out.print("시: ");
		enterHour = scan.nextInt();
		
		System.out.print("분: ");
		enterMinute = scan.nextInt();
		
		System.out.println("[나간 시간]");
		System.out.print("시: ");
		outHour = scan.nextInt();
		
		System.out.print("분: ");
		outMinute = scan.nextInt();
		
		
		enterTime = (enterHour * 60) + enterMinute;
		outTime = (outHour * 60) + outMinute;
		gap = (outTime - enterTime);
		
		if (gap > 30) {
			fee = ((gap - 30)/10)  * duty;
		} else {
			fee = 0;
		}
		
		System.out.printf("주차 요금은 %,d원입니다. ", fee);
		
		scan.close();
	}
	
}
