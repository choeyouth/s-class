package com.test.question;

import java.util.Scanner;

public class Q004 {
	public static void main(String[] args) {
		
		// [요구사항] 섭씨 온도를 입력받아서 화씨 온도로 변환하시오.
		
		// [조건] 
		// - ℉ = ℃ × 1.8 + 32
		// - 소수 입력 가능
		// - 소수 이하 1자리까지 출력하시오.
		
		// [흐름]
		// 1. 스캐너 생성
		// 2. 사용할 변수 선언
		// 3. 안내 메시지 출력
		// 4. 섭씨 온도 입력
		// 5. 화씨 온도로 변환 연산
		// 6. 출력(소수 이하 1자리까지)
		
		// 1. 스캐너 생성
		Scanner scan = new Scanner(System.in);
		
		// 2. 사용할 변수 선언
		double celsius = 0;

		// 3. 안내 메시지 출력
		System.out.print("섭씨(℃): ");
		
		// 4. 섭씨 온도 입력
		celsius = scan.nextDouble();
		
		// 5. 화씨 온도로 변환 연산
		double fahrenheit = celsius * 1.8 + 32;

		// 6. 출력(소수 이하 1자리까지)
		System.out.printf("섭씨 %.1f℃는 화씨 %.1f℉입니다.", celsius, fahrenheit);
		
		scan.close();
		
		
		
		
	}
}
