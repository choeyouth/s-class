package com.test.question;

import java.util.Scanner;

public class Q088 {

	public static void main(String[] args) {
		
		// [요구사항] 금지어를 마스킹 처리 하시오.
		// [조건]
		//	금지어
		//	- 바보
	 	//	- 멍청이
		
		Scanner scan = new Scanner(System.in);
		
		int sum = 0;
		String stop1 = "바보"; 
		String stop2 = "멍청이"; 
		
		System.out.print("입력: ");
		String content = scan.nextLine();
		
//		if(content.contains(stop1) || content.contains(stop2)) {
//			sum++;
//		} 
		
		for (int i=0; i<content.length(); i++) {
			
			if(content.indexOf(stop1) > -1)  {
				sum++;
				content = content.replace(stop1, "**");
			} 
			
			if(content.indexOf(stop2) > -1) {
				sum++;
				content = content.replace(stop2, "**");
			} 
		}
		
		System.out.println(content);
		System.out.printf("금지어를 %d회 마스킹했습니다.", sum);
		
		scan.close();
		
	}
	
}
