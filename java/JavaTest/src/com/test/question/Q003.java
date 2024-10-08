package com.test.question;

import java.util.Scanner;

public class Q003 {
	
	public static void main(String[] args) {
		// [요구사항] 사각형의 너비와 높이를 입력받아 넓이와 둘레를 출력하시오.
		
		// [조건]
		// - 사각형 넓이 = 너비 * 높이
		// -사각형 둘레 = 너비 * 2 + 높이 * 2
		
		// [흐름]
		// 1. scanner 생성
		// 2. 사용할 변수 선언
		// 3. 안내 메시지 출력
		// 4. 너비 입력
		// 5. 안내 메시지 출력2 -> 높이 입력
		// 6. 결과값 변수 생성
		// 7. 출력
		
		// 1. scanner 생성
		Scanner scan = new Scanner(System.in);
		
		// 2. 사용할 변수 선언
		int width = 0;
		int height = 0;
		
		// 3. 안내 메시지 출력
		System.out.print("너비(cm): ");
		 
		// 4. 너비 입력
		width = scan.nextInt();
		
		// 5. 안내 메시지 출력2 -> 높이 입력
		System.out.print("높이(cm): ");
		height = scan.nextInt();
		
		// 6. 결과값 변수 생성
		int area = width * height;  
		int circum = width * 2 + height * 2;
		
		// 7. 출력
		System.out.printf("사각형의 넓이는 %,dcm입니다.\n", area);
		System.out.printf("사각형의 둘레는 %,dcm입니다.\n", circum);
		
		
		scan.close();
		
	}
	
	
	
}
