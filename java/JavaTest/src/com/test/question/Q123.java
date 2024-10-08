package com.test.question;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.Scanner;

public class Q123 {

	public static void main(String[] args) {
		
		//[요구사항] 이름을 입력받아 회원 정보를 검색 후 출력하시오.
		
		String path = "C:\\Users\\ee\\Downloads\\파일 입출력 문제\\단일검색.dat";
		String search = "";
		
		Scanner scan = new Scanner(System.in);
		System.out.print("이름: ");
		search = scan.nextLine();
		
		File file = new File(path);
		
		if(file.exists()) {
			
			try {
				
				BufferedReader reader = new BufferedReader(new FileReader(path));
				String line = null;
				String num;
				String name;
				String address;
				String phoneNum;
				
				
				while ((line = reader.readLine()) != null) {
					
					String[] temp = line.split(",");
					num = temp[0];
					name = temp[1];
					address = temp[2];
					phoneNum = temp[3];

					if(name.contains(search)) {
						System.out.printf("[%s]\n", search);
						System.out.printf("번호: %s\n", num);
						System.out.printf("주소: %s\n", address);
						System.out.printf("전화:%s\n", phoneNum);
					} 
				}
				
				reader.close();
				
			} catch (Exception e) {
				System.out.println("Q123.main");
				e.printStackTrace();
			}
		}
		
		scan.close();
		
	}
}
