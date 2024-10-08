package com.test.question;

import java.util.Scanner;

public class Q082 {

	public static void main(String[] args) {
		
		// [요구사항] 숫자를 입력받아 각 자릿수의 수의 합을 구하시오.
		
		Scanner scan = new Scanner(System.in);
		
		String num = "";
		String txt = "";
		int sum = 0;
		
		
		System.out.print("숫자: ");
		num = scan.nextLine();
		
		System.out.print("결과: " );
		
		for (int i=0; i<num.length(); i++) {
			sum += Integer.parseInt(num.substring(i, i+1));
			txt += num.substring(i, i+1) + " + ";
			
			
		}
			
		System.out.print(txt + "\b\b= " +  sum);
		
		scan.close();
		
	}
	
}


//	for(int i=0; i<num.length(); i++) {
//		System.out.printf("%s + ", num.charAt(i));
//	}
//
//	for (int i=0; i<num.length(); i++) {
//	
//		if (num.charAt(i) == '0') {
//			sum += 0;
//		} else if (num.charAt(i) == '1') {
//			sum += 1;
//		} else if (num.charAt(i) == '2') {
//			sum += 2;
//		} else if (num.charAt(i) == '3') {
//			sum += 3;
//		} else if (num.charAt(i) == '4') {
//			sum += 4;
//		} else if (num.charAt(i) == '5') {
//			sum += 5;
//		} else if (num.charAt(i) == '6') {
//			sum += 6;
//		} else if (num.charAt(i) == '7') {
//			sum += 7;
//		} else if (num.charAt(i) == '8') {
//			sum += 8;
//		} else if (num.charAt(i) == '9') {
//			sum += 9;
//		}
