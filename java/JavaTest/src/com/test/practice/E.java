package com.test.practice;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

public class E {

	public static void main(String[] args) {
		
		
		File file = new File("dat\\score.txt");

		if (file.exists()) {
			
			System.out.println("==============================================");
			System.out.println("                    성적표");
			System.out.println("==============================================");
			System.out.println("[이름]\t[국어]\t[영어]\t[수학]\t[총점]\t[평균]");
			
			try {
				
				BufferedReader reader 
					= new BufferedReader(new FileReader(file));
				
				String line = null;
				
				while ((line = reader.readLine()) != null) {
					
					//System.out.println(line); //학생 1명의 정보
					//홍길동,100,90,80
					
					String[] temp = line.split(",");
					
					String name = temp[0];
					int kor  = Integer.parseInt(temp[1]);
					int eng  = Integer.parseInt(temp[2]);
					int math = Integer.parseInt(temp[3]);
					int total = kor + eng + math;
					double avg = total / 3.0;
					
					System.out.printf("%s\t%5d\t%5d\t%5d\t%5d\t%5.1f\n"
							, name, kor, eng, math, total, avg);
					
				}
				
				reader.close();
				
			} catch (Exception e) {
				System.out.println("Ex60_File.m9");
				e.printStackTrace();
			}
			
			
		} else {
			System.out.println("성적파일이 없습니다.");
		}


	}
	
}
