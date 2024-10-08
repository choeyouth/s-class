package com.test.java;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.Random;

public class Ex68_Dummy {

	public static void main(String[] args) {
		
		//프로젝트 + 데이터
		
		/*
			프로젝트 + 데이터
			1. 주제 선정(아이템)
			2. 요구 분석 
			3. 기능 명세서 
			4. 순서도 
			5. UML 설계서 
			6. 화면 설계
			7. 데이터 구조 설계
			    - 파일 입출력
			    - DB > ERD
			8. 데이터 생성(확보) 
			    - Dummy 데이터
			        - 직접 입력 > 10% ~ 1% > 개발 때 사용  or 시연 때 사용
			        - 프로그램 > 직접 구현 > 90%
			9. 구현(코딩)
			10. 마무리 > 테스트
			11. 발표
		
		*/
		
		//학생 정보 + 시험 점수
		// - 학생 정보(일련번호, 이름, 나이, 주소, 연락처)
		// - 시험 점수(국어, 영어, 수학)
		
		try {
			
			String path = ".\\dat\\dummy.txt";
			BufferedWriter writer = new BufferedWriter(new FileWriter(path));
			Random rnd = new Random();
			
			String[] names1 = { "김", "이", "박", "최", "정", "현", "전", "강"};
			String[] names2 = { "길", "동", "재", "석", "철", "민", "호", "진", "희", "영"    };
			
			String[] address1 = { "서울시", "인천시", "부산시", "대전시", "광주시" };
			String[] address2 = { "강남구", "강동구", "강서구", "강북구", "중구" };
			String[] address3 = { "역삼동", "대치동", "방배동", "압구정동", "천호동" };
			
			for (int i=0; i<=300; i++) {
				
				String line = ""; //"번호,이름,나이,주소,연락처";
				
				line += i + ",";
			
				line += names1[rnd.nextInt(names1.length)] 
						+ names2[rnd.nextInt(names2.length)] 
						+ names2[rnd.nextInt(names2.length)] 
						+ ",";
				
				line += rnd.nextInt(3) + 14 + ",";
				
				line += address1[rnd.nextInt(address1.length)] + " "
						+ address2[rnd.nextInt(address2.length)] + " "
						+ address3[rnd.nextInt(address3.length)] + "";
				
				if( i % 5 == 0) {
					line += " " + (rnd.nextInt(300) + 1) + "번지,";
				} else {
					line += ",";
				}
				
				line += "010-" 
						+ (rnd.nextInt(9000) + 1000)
						+ "-"
						+ (rnd.nextInt(9000) + 1000);
				
				System.out.println(line);
				writer.write(line + "\r\n");
				
			}
			
			writer.close();
			
			System.out.println("완료");
			
			
		} catch (Exception e) {
			System.out.println("Ex68_Dummy.main");
			e.printStackTrace();
		}
		
		
		
		
	}
	
}





















