package com.test.question;

import java.util.Scanner;

public class Q089 {

	public static void main(String[] args) {
		
		// [요구사항] 입력받은 금액을 한글로 출력하시오.
		// [조건] 입력 범위(원): 0 ~ 99,999,999
		
		Scanner scan = new Scanner(System.in);
		
		String money = "";
		char txt = '\0';
		String won = "";
		String korWon = "";
		String[] wons = { "원", "십", "백", "천", "만", "십", "백", "천", "만" };
		
		
		System.out.print("금액(원): ");
		money = scan.nextLine();
		
		
		for(int i=0; i<money.length(); i++) {
			
			txt = money.charAt(i);
			if(txt == '1') {
				won += '일';
			} else if(txt == '2') {
				won += '이';
			} else if(txt == '3') {
				won += '삼';
			} else if(txt == '4') {
				won += '사';
			} else if(txt == '5') {
				won += '오';
			} else if(txt == '6') {
				won += '육';
			} else if(txt == '7') {
				won += '칠';
			} else if(txt == '8') {
				won += '팔';
			} else if(txt == '9') {
				won += '구';
			} else if(txt == '0') {
				won += '\0';
			} 
		}
		
		for (int i=won.length()-1; i>=0; i--) {
			korWon += won.substring(won.length()-i-1, won.length()-i) + wons[i];
		}
		
		System.out.println(korWon);
		
		scan.close();
		
		
	}
	
}
