package com.test.question;

import java.util.Scanner;

public class Q031 {
	
	public static void main(String[] args) {
		
		// [요구사항] 숫자 5개를 입력받아 짝수와 홀수의 개수를 출력하시오.
		// [흐름]
		// 사용할 변수 선언 (숫자 5개, 짝수/홀수 값)
		// 스캐너 생성
		// 라벨 출력
		// 입력 받은 값 변수에 저장
		// if문 - 짝수일 때, 홀수일 때 값 저장
		// if문 짝수 홀수 값 비교하여 연산 및 출력
		
		int n = 0;
		int one = 0; 
		int two = 0;
		
		Scanner scan = new Scanner(System.in);
		
		for (int i = 0 ; i < 5; i++) {
			System.out.print("숫자 입력: ");
			n = scan.nextInt();
			
			if (n % 2 == 1) {
				one++;
			} else if (n % 2 == 0) {
				two++;
			} 
		}
		
		System.out.printf("짝수는 %d개 홀수는 %d개 입력했습니다.\n", two, one);
		
		if (one > two) {
			System.out.printf("홀수가 짝수보다 %d개 더 많습니다.\n", one - two);
		} else if (two > one) {
			System.out.printf("짝수가 홀수보다 %d개 더 많습니다.\n", two - one);
		}
		
		scan.close();
		
		

		
		
		
//		System.out.print("숫자 입력: ");
//		n1 = scan.nextInt();
//		
//		System.out.print("숫자 입력: ");
//		n2 = scan.nextInt();
//		
//		System.out.print("숫자 입력: ");
//		n3 = scan.nextInt();
//		
//		System.out.print("숫자 입력: ");
//		n4 = scan.nextInt();
//		
//		System.out.print("숫자 입력: ");
//		n5 = scan.nextInt();
//		
//		if (n1 % 2 == 1) {
//			one++;
//		} else if (n1 % 2 == 0) {
//			two++;
//		} 
//		
//		if (n2 % 2 == 1) {
//			one++;
//		} else if (n2 % 2 == 0) {
//			two++;
//		} 
//		
//		if (n3 % 2 == 1) {
//			one++;
//		} else if (n3 % 2 == 0) {
//			two++;
//		} 
//		
//		if (n4 % 2 == 1) {
//			one++;
//		} else if (n4 % 2 == 0) {
//			two++;
//		} 
//		
//		if (n5 % 2 == 1) {
//			one++;
//		} else if (n5 % 2 == 0) {
//			two++;
//		} 
//		
//		System.out.printf("짝수는 %d개 홀수는 %d개 입력했습니다.\n", two, one);
//		
//		if (one > two) {
//			System.out.printf("홀수가 짝수보다 %d개 더 많습니다.\n", one - two);
//		} else if (two > one) {
//			System.out.printf("짝수가 홀수보다 %d개 더 많습니다.\n", two - one);
//		}
		

		
//		int n1 = 0;
//		int n2 = 0;
//		int n3 = 0;
//		int n4 = 0;
//		int n5 = 0;
		
//		num(n);

		

//		System.out.printf("짝수는 %d개 홀수는 %d개 입력했습니다.\n", two, one);
//		
//		if (one > two) {
//			System.out.printf("홀수가 짝수보다 %d개 더 많습니다.\n", one - two);
//		} else if (two > one) {
//			System.out.printf("짝수가 홀수보다 %d개 더 많습니다.\n", two - one);
//		}
//		
		
	} // main
	
	public static int num(int n) {
		
		int one = 0;
		int two = 0;
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("숫자 입력: ");
		n = scan.nextInt();
		
		
		if (n % 2 == 1) {
			return one++;
		} else if (n % 2 == 0) {
			return two++;
		}
		
		return n; 
		
		
	}
	
	
}
