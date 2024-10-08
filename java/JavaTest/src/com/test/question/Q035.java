package com.test.question;

import java.util.Scanner;

public class Q035 {

	public static void main(String[] args) {
		
		// [요구사항] 사용자의 이름과 인사할 횟수를 입력 받아 출력하시오.
		
		// [흐름]
		// 사용할 변수 선언
		// 스캐서 생성
		// 라벨 출력
		// 입력한 값 변수에 저장
		// for문 생성
		
		String name = "";
		int num = 0;
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("이름: ");
		name = scan.nextLine();
		
		System.out.print("횟수: ");
		num = scan.nextInt();
		
		for(int i = 0; i < num ; i++) {
			System.out.printf("%s님 안녕하세요~\n", name);
		}
		
		scan.close();
		
	}
	
}
