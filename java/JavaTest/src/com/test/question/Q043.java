package com.test.question;

import java.util.Scanner;

public class Q043 {

	public static void main(String[] args) {
		
		// [요구사항] 컴퓨터가 1~10 사이의 숫자 1개를 생각하면 사용자가 맞추는 프로그램을 구현하시오.
		// [조건] 시도 횟수가 10회가 넘어가면 프로그램을 종료하시오.
		
		// [흐름]
		
		int num = 0;
		int one = (int)(Math.random()*10) + 1;
		
		Scanner scan = new Scanner(System.in);
		
		System.out.println("컴퓨터가 1~10 사이의 숫자를 1개 생각했습니다.\n");
		
		int i = 0;
		
		for(i=0; i<10; i++) {
		
			System.out.print("숫자: ");
			num = scan.nextInt();
			
			if (one == num) {
				System.out.println("맞았습니다.\n");
				break;
			} else {
				System.out.println("틀렸습니다.\n");
			}  
			
		}
		
		System.out.printf("컴퓨터가 생각한 숫자는 %d입니다.\n", one);
		
		if (i<10) {
			System.out.printf("정답을 맞추는데 시도한 횟수는 %d회입니다.\n\n", i + 1);
		} else {
			System.out.println("모든 기회를 실패했습니다.\n");
		}
		
		System.out.println("프로그램을 종료합니다.");
		
		
		
	}
}
