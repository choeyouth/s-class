package com.test.question;

import java.util.Scanner;

public class Q001 {
	public static void main(String[] args) {
		
		// [요구사항] 태어난 년도를 입력받아 나이를 출력하시오.
		
		// [흐름]
		// 1. scanner 생성
		// 2. 안내 메시지 출력
		// 3. 숫자 입력
		// 4. 나이 변환
		// 5. 출력 
		
		// 1. scanner 생성
		Scanner scan = new Scanner(System.in);
		
		// 2. 안내 메시지 출력
		System.out.print("태어난 년도: ");
		
		// 3. 숫자 입력
		int year = scan.nextInt();
		
		// 4. 나이 변환
		int age = 2024 - year;
		
		// 5. 출력 
		System.out.printf("나이: %d세", age);
		
		scan.close();
	}
}
