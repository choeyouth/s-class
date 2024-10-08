package com.test.question;

import java.util.Scanner;

public class Q039 {

	public static void main(String[] args) {
		
		// [요구사항] 아래와 같이 출력하시오.
		
		Scanner scan = new Scanner(System.in);
		
		int start = 0;
		int last = 0;
		int sum = 0;
		
		System.out.print("시작 숫자: ");
		start = scan.nextInt();
		
		System.out.print("종료 숫자: ");
		last = scan.nextInt();
		
		for (int i = start ; i <= last ; i++) {
			sum += i;
			System.out.print(i + " + ");
		}
		System.out.println("\b\b= " + sum);
		
		
		scan.close();
		
		
		
		
		
		
		
		
		
		
	}
	
}
