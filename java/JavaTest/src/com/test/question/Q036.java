package com.test.question;

import java.util.Scanner;

public class Q036 {
	
	public static void main(String[] args) {
		
		// [요구사항] 시작 숫자, 종료 숫자, 증감치를 입력받아 숫자를 순차적으로 출력하시오.
		
		// [흐름]
		// 사용할 변수 선언
		// 스캐너 생성
		// 라벨 출력
		// 입력한 값 변수에 저장
		// for문
		
		int n1 = 0;
		int n2 = 0;
		int plus = 0;
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("시작 숫자: ");
		n1 = scan.nextInt();
		
		System.out.print("종료 숫자: ");
		n2 = scan.nextInt();
		
		System.out.print("증감치: ");
		plus = scan.nextInt();
		
		for (int i = n1; i <= n2 ; i += plus) {
			System.out.println(i);
		}
		
		scan.close();
		
	}

}
