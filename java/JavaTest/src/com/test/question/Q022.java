package com.test.question;

import java.util.Calendar;
import java.util.Scanner;

public class Q022 {
	
	public static void main(String[] args) {
		
		// [요구사항] 남녀 커플의 이름과 만난날을 입력받아 기념일을 출력하시오.
		
		// [흐름]
		// 스캐너 생성
		// 사용할 변수 선언
		// 안내 메시지 출력
		// 남자 이름 입력
		// 안내 메시지2 출력
		// 여자 이름 입력
		// 만난날을 저장할 시각 구하기
		// 안내 메시지3,4,5 출력
		// 만난날(년) -> (월) -> (일) 입력
		// 만난날 년월일 쓰기
		// 기념일 연산

		Scanner scan = new Scanner(System.in);
		
		String man, woman;
		int year, month, date;
		
		System.out.print("남자 이름: ");
		man = scan.nextLine();
		
		System.out.print("여자 이름: ");
		woman = scan.nextLine();
		
		
		Calendar first = Calendar.getInstance();
		
		System.out.print("만난날(년):  ");
		year = scan.nextInt();
		
		System.out.print("만난날(월):  ");
		month = (scan.nextInt() - 1); // 컴퓨터 : 월(0~11) 1월 -> 0월  
		
		System.out.print("만난날(일):  ");
		date = scan.nextInt();
		
		scan.close();
		
		System.out.printf("'%s'과(와) '%s'의 기념일\n", man, woman);
		
		first.set(year, month, date);
		
		int n1 = date + 100;
		first.set(year, month, n1);
		System.out.printf("100일: %tF\n" , first);
		first.set(year, month, date);
		
		int n2 = date + 200;
		first.set(year, month, n2);
		System.out.printf("200일: %tF\n" , first);
		first.set(year, month, date);
		
		int n3 = date + 300;
		first.set(year, month, n3);
		System.out.printf("300일: %tF\n" , first);
		first.set(year, month, date);
		
		int n5 = date + 500;
		first.set(year, month, n5);
		System.out.printf("500일: %tF\n" , first);
		first.set(year, month, date);
		
		int n10 = date + 1000;
		first.set(year, month, n10);
		System.out.printf("1000일: %tF\n" , first);
		
		
		
	}
	
	
	
}
