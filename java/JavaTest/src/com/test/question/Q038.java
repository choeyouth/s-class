package com.test.question;

import java.util.Scanner;

public class Q038 {

	public static void main(String[] args) {
		
		// [요구사항] 입력 횟수(N)와 숫자 N개를 입력받아 짝수의 합과 홀수의 합을 각각 출력하시오.
		
		// 사용할 변수 선언 (입력 횟수, 숫자, 짝수, 홀수, 합)
		// 스캐너 생성
		// 라벨 출력
		// for문
		// 라벨 출력 - 숫자 입력 
		// if문
		
		int count = 0;
		int num = 0;
		int one = 0;
		int two = 0;
		int oneSum = 0;
		int twoSum = 0;
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("입력 횟수: ");
		count = scan.nextInt();
		
		for (int i = 0; i < count ; i++) {
			System.out.print("숫자: ");
			num = scan.nextInt(); 
				if (num % 2 == 0) { 
					two++; 
					twoSum += num; 
				} else { 
					one++; 
					oneSum += num; 
				} 
		} 
		
		System.out.printf("짝수 %d개의 합: %d\n", two, twoSum);
		System.out.printf("홀수 %d개의 합: %d\n", one, oneSum);
		
		
		scan.close();
		
	}
	
	
}
