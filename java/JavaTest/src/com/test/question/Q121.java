package com.test.question;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

public class Q121 {
	
	public static void main(String[] args) {
		
		//[요구사항] 숫자를 한글로 바꾼 뒤 파일을 다른 이름으로 저장하시오.
		//[조건]
		// - 0 → 영, 1 → 일 ... 9 → 구
		// - 저장할 파일명: 숫자_변환.dat
		
		String path = "C:\\Users\\ee\\Downloads\\파일 입출력 문제\\숫자.dat";
		String editPath = "C:\\Users\\ee\\Downloads\\파일 입출력 문제\\숫자_변환.dat";
		String line = null;
		
		try {
			
			BufferedReader reader = new BufferedReader(new FileReader(path));
			BufferedWriter writer = new BufferedWriter(new FileWriter(editPath));
			
			while((line = reader.readLine()) != null) {
				line = line.replace("0", "영");
				line = line.replace("1", "일");
				line = line.replace("2", "이");
				line = line.replace("3", "삼");
				line = line.replace("4", "사");
				line = line.replace("5", "오");
				line = line.replace("6", "육");
				line = line.replace("7", "칠");
				line = line.replace("8", "팔");
				line = line.replace("9", "구");
				writer.write(line);
			}
			
			reader.close();
			writer.close();
			
			System.out.println("변환 후 다른 이름으로 저장하였습니다.");
			
		} catch (Exception e) {
			System.out.println("Q121.main");
			e.printStackTrace();
		}
		
		
		
	}



}
