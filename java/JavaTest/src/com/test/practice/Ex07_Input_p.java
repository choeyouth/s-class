package com.test.practice;

import java.util.Scanner;

public class Ex07_Input_p {

	public static void main(String[] args) {
		
		
		
		Scanner scan = new Scanner(System.in);
		
		/* 
		System.out.println("현재 시간을 입력하시오.");
		
		String now = s.next();
		
		System.out.printf("현재 시간은 %s시 입니다.\n", now);
		System.out.println("종료되었습니다.");
		*/
		
		System.out.println("[곱하기 계산기]");
		
		System.out.print("이름: ");
		String name = scan.nextLine(); 
		
		System.out.print("숫자 1: ");
		int num1 = scan.nextInt();
		
		System.out.print("숫자 2: ");
		int num2 = scan.nextInt();
	
		System.out.printf("결과: %d x %d = %d", num1, num2, num1 * num2);
		
		
		

	}

}
