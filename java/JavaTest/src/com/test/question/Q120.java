package com.test.question;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

public class Q120 {
	
	public static void main(String[] args) {
		
		// [요구사항] 특정 이름을 찾아 다른 이름으로 변환 후 파일을 다른 이름으로 저장하시오.
		// [조건]
		// - '유재석' → '메뚜기'
		// - 저장할 파일명: 이름수정_변환.dat
		
		String path = "C:\\Users\\ee\\Downloads\\파일 입출력 문제\\이름수정.dat";
		String editPath = "C:\\Users\\ee\\Downloads\\파일 입출력 문제\\이름수정_변환.dat";
		String line = null;
		String temp = ""; //누적 변수
		//int code = -1;
		
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader(path));
				
			while ((line = reader.readLine()) != null) {
				//
				line = line.replace("유재석", "메뚜기");
				temp += line + "\r\n";
//				if(!(line.contains("유재석"))) {
//					temp += line + "\r\n";
//				} else {
//					while((code = reader.read()) != -1) {
//						if(!(line.contains("유재석"))) {
//							temp += (char)code;
//						} else {
//							temp += " 메뚜기 ";
//						}
//					}
//				}
				
			}
			
			reader.close();

			BufferedWriter writer 
			= new BufferedWriter(new FileWriter(editPath)); 
		
			writer.write(temp);
			
			writer.close();
			
			System.out.println("변환 후 다른 이름으로 저장하였습니다.");
			
		} catch (Exception e) {
			System.out.println("Q120.main");
			e.printStackTrace();
		}
		
		
	}

}
