package com.test.question;

import java.util.Scanner;

public class Q083 {
	
	public static void main(String[] args) {
		
		// [요구사항] 파일명 10개를 입력받아 각 확장자별로 총 개수를 출력하시오.
	
		// 확장자는 다음으로 제한한다.
		// 	- mp3
		// 	- jpg
		// 	- java
		// 	- hwp
		//  - doc
	
		Scanner scan = new Scanner(System.in);
		
		String file = "";
		String extention = "";
		int index = 0;
		int mp3 = 0;
		int jpg = 0;
		int java = 0;
		int hwp = 0;
		int doc = 0;
		
		for (int i=0; i<10; i++) {
			System.out.print("파일명: ");
			file = scan.nextLine();
			index = file.lastIndexOf(".");
			extention = file.substring(index+1);
				
				if (extention.equals("mp3")) {
					mp3++;
				} else if (extention.equals("jpg")) {
					jpg++;
				} else if (extention.equals("java")) {
					java++;
				} else if (extention.equals("hwp")) {
					hwp++;
				} else if (extention.equals("doc")) {
					doc++;
				}
				
		}
		
		System.out.printf("mp3: %d개\n", mp3);
		System.out.printf("jpg: %d개\n", jpg);
		System.out.printf("java: %d개\n", java);
		System.out.printf("hwp: %d개\n", hwp);
		System.out.printf("doc: %d개\n", doc);
		
		scan.close();
	}

}
