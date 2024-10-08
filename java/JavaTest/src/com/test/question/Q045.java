package com.test.question;

import java.util.Scanner;

public class Q045 {

	public static void main(String[] args) {
		
		// [요구사항] 사용자가 입력한 범위의 숫자까지 369 게임 과정을 출력하시오.

		// [조건]
		//  - 최대 3자리까지만 입력하시오.
		
		Scanner scan = new Scanner(System.in);
		
		int num = 0;
		String txt = "";
		int one = 0; 
		int ten = 0; 
		int hund = 0; 
		int hundTen = 0;
		
		System.out.print("최대 숫자: ");
		
		num = scan.nextInt();
		
		
		if (num > 999) {
			System.out.println("1000 이하로 입력해주세요.");
		} else {
			for(int i=1; i<=num; i++) {
				
				one = i % 10; // 한 자리 수일 때 
				ten = i / 10; // 두 자리 수일 때 
				hund = i / 100; // 세 자리 수일 때 
				hundTen = (i / 10) % 10; // 세 자리 수일 때 10의 자리  
				
				if(one == 3 || one == 6 || one == 9
				|| ten == 3 || ten == 6 || ten == 9
				|| hund == 3 || hund == 6 || hund == 9
				|| hundTen == 3 || hundTen == 6 || hundTen == 9) {
					txt += "짝 ";
				} else {
					txt += i + " ";
				}
				
			}
			System.out.println(txt);
		}
		
		scan.close();
		
	}
}
