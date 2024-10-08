package com.test.question;

import java.util.Scanner;

public class Q044 {
	
	public static void main(String[] args) {
		
		// [요구사항] 숫자를 N개 입력받아 아래와 같이 출력하시오.
	
		// [조건] 
		//	누적값이 100을 넘어가는 순간 루프를 종료하시오.
		//	짝수는 더하고 홀수는 빼시오.
		
		// [흐름]
		// 사용할 변수 선언 
	
		
		Scanner scan = new Scanner(System.in);
		
		int num = 0;
		int sum = 0;
		boolean loop = true;
		String txt = "";
		
//		while(loop) {
			
			while (loop) {
			
				System.out.print("숫자: ");
				num = scan.nextInt();
				
				if (num % 2 == 0) {
					sum += num;
					txt += " + " + num;
				} else {
					sum -= num;
					txt += " - " + num;
				}
				
				if (sum >= 100) {
					loop = false;
				}
				
			}
			
			System.out.print(txt + "\b\b = " + sum);
//		}
		
		
		
		
		
//		for (int i=0; ; i++) {
//			
//			System.out.print("숫자: ");
//			num = scan.nextInt();
//			
//			if (num % 2 == 0) {
////					System.out.print("+" + num);
//				sum += num; 
//			} else {
////					System.out.print("-" + num);
//				sum -= num;
//			}
//			
//			if (sum >= 100) {
//				break;
//			}
//			
//		}
//		
//		System.out.print(num + " = " + sum);


		
		
		
		


		
//		for (int i=0;  ; i++) {
//			
//			System.out.print("숫자: ");
//			i = scan.nextInt();
//			
//			if(sum <= 100) {
//				
//				
//				if (i % 2 == 0) {
//					sum += i;
//					System.out.print(" + " + i);
//				} else {
//					sum -= i;
//					System.out.print(" - " + i);
//				}
//				
//				
//				
//				break;
//			}
//			
//			
//		}
		
//		for(int i = 0; ; i++) {
//			
//			if (sum <= 100) {
//				
//				System.out.print("숫자: ");
//				i = scan.nextInt();
//				
//				if (i % 2 == 0) {
//					sum += i;
//				} else {
//					sum -= i;
//				}
//				
//			} else {
//				break;
//			}
//			
//			
//		}
		
		
		
		
//		for (int i=0; ; i++) {
			
//			for (int j=0; ; j++) {
//				
//				if (sum < 100) {
//					System.out.print("숫자: ");
//					num = scan.nextInt();
//					
//					if (num % 2 == 0) {
//						sum += num;
//						txt += " + ";
//					} else {
//						sum -= num;
//						txt += " - ";
//					}
//					
//					
//				} else {
//					break;
//				}
//				
//				
//				
//				
//			}
			
			
			
			
			
//		}
		
		
		
		
	}
	
}
