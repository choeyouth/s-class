package com.test.question;

import java.io.File;
import java.util.Scanner;

public class Q110 {

	public static void main(String[] args) {
		
		//[요구사항] 파일의 경로를 입력받아 파일 정보를 출력하시오.
		//[조건] 파일 크기 단위 변환 출력(소수이하 1자리까지) : B, KB, MB, GB, TB
		
		Scanner scan = new Scanner(System.in);
		
		String path = "";
		long volume = 0;
		
		System.out.print("파일 경로: ");
		path = scan.nextLine();
		
		File file = new File(path);
		
//		System.out.printf("파일명 : %s\n", path.substring(path.lastIndexOf("\\")+1));
		
		System.out.printf("파일명 : %s\n", file.getName());
		System.out.printf("종류 : %s 파일\n", path.substring(path.lastIndexOf(".") + 1));
		volume = file.length();
		
		if(volume < 1024) {
			System.out.printf("파일 크기 : %dB", volume);
			//byte
		} else if (volume >= 1024) {
			System.out.printf("파일 크기 : %.1fKB\n", volume / 1024.0);
			//1KB
		} else if (volume >= 1024 * 1024) {
			System.out.printf("파일 크기 : %.1fMB\n", volume / 1024.0 / 1024.0);
			//1MB
		} else if (volume >= 1024 * 1024 * 1024) {
			System.out.printf("파일 크기 : %.1fGB\n", volume / 1024.0 / 1024.0 / 1024.0);
			//1GB
		} else if (volume >= 1024 * 1024 * 1024 * 1024) {
			System.out.printf("파일 크기 : %.1fTB\n", volume / 1024.0 / 1024.0 / 1024.0 / 1024.0);
			//1TB
		}
		
		scan.close();
		
	}
	
}
