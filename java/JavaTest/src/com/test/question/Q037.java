package com.test.question;

import java.util.Scanner;

public class Q037 {

	public static void main(String[] args) {
		
		// [요구사항] 숫자 1개를 입력받아 1부터 입력한 숫자까지의 합을 출력하시오.
		
		// [흐름]
		// 사용할 변수 선언 (입력 받을 숫자, 합)
		// 스캐너 생성
		// 라벨 출력
		// 입력 받은 숫자 변수에 저장
		// for문
		
		int last = 0;
		int sum = 0;
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("숫자: ");
		last = scan.nextInt();
		
		for (int i = 1; i <= last ; i ++) {
			sum = sum + i;
		}
		System.out.printf("1 ~ %,d = %,d\n", last, sum);
		
		scan.close();
		
	}
	
	
}
