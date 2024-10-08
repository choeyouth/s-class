package com.test.question;

import java.util.Scanner;

public class Q015 {
	
	public static void main(String[] args) {
		
		// [요구사항] 사과 나무가 있다. 사과 나무 씨앗을 심을 날로부터 특정 시간이 흘렀을 때 사과 총 몇개가 열리는지 구하는 메소드를 선언하시오.
		
		// [조건]
		// int getApple(int sunny, int foggy)
		// 사과 나무를 처음 심었을 때 나무의 길이: 0m
		// 맑은 날 사과 나무의 성장률: 5㎝
		// 흐린 날 사과 나무의 성잘률: 2㎝
		// 사과 나무는 길이가 1m 넘는 시점부터 사과가 열린다.
		// 1m 넘는 시점부터 10㎝ 자랄 때마다 사과가 1개씩 열린다.
		
		// [흐름]
		// 1. 메서드 생성
		// 2. 매개변수 선언
		// 3. 나무 길이 연산
		// 4. 사과 개수 연산
		
		// 5. 스캐너 생성
		// 6. 변수 선언
		// 7. 안내메시지 출력
		// 8. 메서드 호출
		// 9. 출력
	
		Scanner scan = new Scanner(System.in);
		
		int sunny, foggy, apple;
		
		System.out.print("맑은 날: ");
		sunny = scan.nextInt();
		
		System.out.print("흐린 날: ");
		foggy = scan.nextInt();
		
		scan.close();
		
		apple = getApple(sunny, foggy);
		System.out.printf("사과가 총 %d개 열렸습니다.", apple);
		
	}
	
	public static int getApple(int sunny, int foggy) {
		
		int growth = 0;
		int apple = 0;
		
		growth = sunny * 5 + foggy * 2;
		
		
		apple = growth >= 100 // 나무가 100cm가 넘으면
				? (growth - 100) / 10 // 참: 110 - 100 / 10 -> 1개 
				: 0; // 거짓: 열매가 열리지 않음  

		return apple;
		
	}
}
