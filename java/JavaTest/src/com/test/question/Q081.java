package com.test.question;

import java.util.Scanner;

public class Q081 {

	public static void main(String[] args) {
		
		// [요구사항] 이메일 주소를 입력받아 아이디와 도메인을 각각 추출하시오.
		
		Scanner scan = new Scanner(System.in);
		
		String email = "";
		
		System.out.print("이메일: ");
		email = scan.nextLine();
		
		String[] list = email.split("@");
		
		System.out.println("아이디: " + list[0]);
		System.out.println("도메인: " + list[1]);
		
		scan.close();
		
	}
	
}
