package com.test.question;

import java.util.Scanner;

public class Q012 {

	public static void main(String[] args) {
		
		// [요구사항] 숫자를 전달하면 '짝수' 혹은 '홀수'라는 단어를 반환하는 메소드를 선언하시오.
		// [조건]
		// - String getNumber(int)
		
		// [흐름]
		// 1. 스캐너 생성
		// 2. 사용할 변수 선언
		// 3. 안내 메시지 출력
		
		// 4. 메소드 생성
		// 5. 매개변수 선언
		// 6. 짝홀수 연산 작성 및 삼항연산자 선언 (2로 나누었을 때 나머지가 있으면 홀수, 없으면 짝수) 
		// 7. 문장 반환
		
		// 8. 메서드 호출
		// 9. 출력
		
		Scanner scan = new Scanner(System.in);
		
		int n;
		String result;
		
		System.out.print("숫자: ");
		n = scan.nextInt();
		
		scan.close();
		
		result = getNumber(n);
		System.out.printf("입력하신 숫자 '%d'는(은) '%s'입니다.", n, result);
		
	}
	
	public static String getNumber(int n) {
	
		String result;
		
		result = (n % 2 == 0) ? "짝수" : "홀수";
		
		return result;
		
		
	}
}
