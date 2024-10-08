package com.test.question;

import java.util.Scanner;

public class Q080 {

	public static void main(String[] args) {
		
		// [요구사항] 문장을 입력받아 역순으로 출력하시오.
		
		Scanner scan = new Scanner(System.in);
		
		String content = "";
		
		System.out.print("문장 입력: ");
		content = scan.nextLine();
		
		System.out.print("역순 결과: \"");
		
		for (int i=content.length()-1; i>=0; i--) {
			System.out.print(content.charAt(i));
		}
		System.out.print("\"");
		
		scan.close();
		
		
	}
	
}
