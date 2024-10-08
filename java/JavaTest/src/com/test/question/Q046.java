package com.test.question;

import java.util.Scanner;

public class Q046 {

	public static void main(String[] args) {
		
		// [요구사항] 숫자를 10개 입력받아 한글로 변환 후 출력하시오.

		//	[조건]
		// 	 - 1~9까지만 입력하시오.
		
		
		Scanner scan = new Scanner(System.in);
		String txt = "";
		int num = 0;
		
		for (int i=0; i<10; i++) {
		
			System.out.print("숫자: ");
			num = scan.nextInt();
			
			switch (num) {
				case 1: txt += "일";
				break;
				case 2: txt += "이";
				break;
				case 3: txt += "삼";
				break;
				case 4: txt += "사";
				break;
				case 5: txt += "오";
				break;
				case 6: txt += "육";
				break;
				case 7: txt += "칠";
				break;
				case 8: txt += "팔";
				break;
				case 9: txt += "구";
				break;
					
				
			}
			
			
		}
		
		System.out.println(txt);
		
		scan.close();
		
		
		
	}
	
	
}
