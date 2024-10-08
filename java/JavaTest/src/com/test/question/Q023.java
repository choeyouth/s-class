package com.test.question;

import java.util.Calendar;
import java.util.Scanner;

public class Q023 {

	public static void main(String[] args) {
		
		// [요구사항] 아빠와 딸의 생일을 입력받아 아빠가 딸보다 며칠을 더 살았는지 출력하시오.
		
		// [흐름]
		// 스캐너 생성
		// 사용할 변수 선언
		// 안내메시지 출력
		// 아빠의 생일 (년, 월, 일) 입력
		// 딸의 생일 (년, 월, 일) 입력
		// 아빠 생일을 저장할 시간
		// 딸 생일을 저장할 시간
		// 아빠의 생일을 시간에 저장
		// 딸의 생일을 시간에 저장
		// 아빠 생일 - 딸 생일 연산
		// 출력
		
		
		Scanner scan = new Scanner(System.in);
		
		int dadYear, dadMonth, dadDate;
		int daughterYear, daughterMonth, daughterDate;
		
		System.out.print("아빠 생일(년): ");
		dadYear = scan.nextInt();
		
		System.out.print("아빠 생일(월): ");
		dadMonth = (scan.nextInt() - 1);
		
		System.out.print("아빠 생일(일): ");
		dadDate = scan.nextInt();
		
		System.out.print("딸 생일(년): ");
		daughterYear = scan.nextInt();
		
		System.out.print("딸 생일(월): ");
		daughterMonth = (scan.nextInt() - 1);
		
		System.out.print("딸 생일(일): ");
		daughterDate = scan.nextInt();
		
		scan.close();
		
		Calendar dadBirth = Calendar.getInstance();
		Calendar daughterBirth = Calendar.getInstance();
		
		dadBirth.set(dadYear, dadMonth, dadDate);
		daughterBirth.set(daughterYear, daughterMonth, daughterDate);
		
//		System.out.printf("%tF\n", dadBirth);
//		System.out.printf("%tF\n", daughterBirth);
		
		long gap = daughterBirth.getTimeInMillis() - dadBirth.getTimeInMillis();
		System.out.printf("아빠는 딸보다 총 %,d일을 더 살았습니다."
							, gap / 1000 / 60 / 60 / 24);
		
		
		
		
		
	}
	
}
