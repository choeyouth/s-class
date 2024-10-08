package com.test.question;

import java.util.Scanner;

public class Q049 {

	public static void main(String[] args) {
		
		// [요구사항] 아래와 같이 출력하시오.
		// [조건] 행의 갯수를 입력받으시오.
		
//		행: 5
//		*****
//		 ****
//		  ***
//		   **
//		    *

		
		Scanner scan = new Scanner(System.in);
		
		int num = 0;
		
		System.out.print("행: ");
		num = scan.nextInt();
		
		
		for(int i=0; i<num; i++) {
			
			for(int j=0; j<i; j++) {
				System.out.print(" ");
			}
			
			for(int k=num; k>i; k--) {
				System.out.print("*");
			}
			
			System.out.println();
		}
		
		
		scan.close();
		
		
	}
	
}
