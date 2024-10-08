package com.test.question;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.HashSet;

public class Q122 {

	public static void main(String[] args) {
		
		//[요구사항] 성적을 확인 후 합격자/불합격자 명단을 출력하시오.
		// - 합격 조건: 3과목 평균 60점 이상
		// - 과락 조건: 1과목 40점 미만
		
		String path = "C:\\Users\\ee\\Downloads\\파일 입출력 문제\\성적.dat";
		
		File file = new File(path);
		
		if(file.exists()) {

			try {
				
				BufferedReader reader = new BufferedReader(new FileReader(path));
				String line = null;
				
				HashSet<String> pass = new HashSet<>();
				HashSet<String> fail = new HashSet<>();
				
				while((line = reader.readLine()) != null) {
					
					String[] temp = line.split(",");
					
					String name = temp[0];
					int kor = Integer.parseInt(temp[1]);
					int eng = Integer.parseInt(temp[2]);
					int math = Integer.parseInt(temp[3]);
					double avg = (kor + eng + math) / 3.0;
					
					if(kor >= 40 && eng >= 40 && math >= 40 && avg >= 60) {
						for(int i=0; i<line.length(); i++) {
							pass.add(name);
						}
					} else {
						for(int i=0; i<line.length(); i++) {
							fail.add(name);
						}
					}
				}
				
				System.out.println("[합격자]");
				for(String passes : pass) {
					System.out.println(passes);
				}
				System.out.println();
				
				System.out.println("[불합격자]");
				for(String failes : fail) {
					System.out.println(failes);
				}
				
				reader.close();
				
			} catch (Exception e) {
				System.out.println("Q122.main");
				e.printStackTrace();
			}
		}
		
		
	}
	
}
