package com.test.question;

import java.io.File;
import java.util.Scanner;

public class Q111 {

	public static void main(String[] args) {
		
		// [요구사항] 지정한 폴더의 특정 파일(확장자)만을 출력하시오.
		// [조건] 확장자 대소문자 구분없이 검색 가능
		
		Scanner scan = new Scanner(System.in);
		
		String path = "";
		String extention = "";
		String ext = "";
		
		System.out.print("폴더: ");
		path = scan.nextLine();
		
		System.out.print("확장자: ");
		extention = scan.nextLine();
		
		File dir = new File(path);
		File[] list = dir.listFiles();
		
		if(dir.exists()) {
		
			for(File file : list) {
				if(file.isFile()) {
					ext = file.getName().toLowerCase().substring(file.getName().lastIndexOf(".")+1);
					if (ext.equals(extention.toLowerCase())) {
						System.out.println(file.getName());
					}
				}
	 		}
		
		} 
		
		scan.close();
		
		
		
		
		
		
		
	}
	
}
