package com.test.question;

import java.util.Scanner;

public class Q085 {

	public static void main(String[] args) {
		
		// [요구사항] 주민 등록 번호 유효성 검사를 하시오.
		// [조건] '-'의 입력 유무 상관없이 검사하시오.
		
		Scanner scan = new Scanner(System.in);
		
		int sum = 0;
		int n = 0;
		String jumin = "";
		
		System.out.print("주민등록번호: ");
		jumin = scan.nextLine();
		
		String front = jumin.substring(0, 6);
		String back = jumin.substring(jumin.length()-7);
		
		for(int i=0; i<6; i++) {
			sum += (i+2) * Integer.parseInt(front.substring(i, i+1));
		}
			
		for(int j=0; j<6; j++) {
			if (j<2){
				sum += (j+8) * Integer.parseInt(back.substring(j, j+1));
			} else {
				sum += j * Integer.parseInt(back.substring(j, j+1));
			}
		}
		
		
		n = sum % 11;
		
		if (n > 9) {
			n = (11 - n) % 10;
		} else {
			n = 11 - n;
		}
		
		if(n == Integer.parseInt(back.substring(6))) {
			System.out.println("올바른 주민등록번호입니다.");
		} else {
			System.out.println("올바르지 않은 주민등록번호입니다.");
		}
		
		scan.close();
		
	}
	
}
