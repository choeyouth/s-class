package com.test.question;

import java.util.Scanner;

public class Q040 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		int start = 0;
		int last = 0;
		int sum = 0;
		
		System.out.print("시작 숫자: ");
		start = scan.nextInt();

		System.out.print("종료 숫자: ");
		last = scan.nextInt();
	
		for (int i = start ; i<=last ; i++) {
			
			if (i % 2 == 0) {
				sum -= i;
				System.out.print(i + " + ");
			} else {
				sum += i;
				System.out.print(i + " - ");
			}
		}
		
		System.out.println("\b\b=" + sum);
	
		scan.close();
	
	
	}
	
}
