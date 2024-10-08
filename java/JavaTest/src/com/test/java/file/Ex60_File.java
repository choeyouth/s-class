package com.test.java.file;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.Scanner;

public class Ex60_File {

	public static void main(String[] args) {
		
		/*

			1. 파일 / 디렉토리 조작
				- 윈도우 탐색기로 하는 행동 > 자바로 구현
				- 파일/디렉토리 정보 열람
				- 생성, 수정, 삭제, 이동 등..
			
			2. 파일 입출력
				a. 텍스트 입출력
				    - 메모장
				    - 이클립스
				    
				b. 비텍스트 입출력(바이너리 입출력) 
				    - 동영상
				    - 이미지
				    - 음성
				    
			파일 입출력
			- 자바 프로그램 <-> (데이터) <-> 보조기억장치(HDD, SDD, USB)	
			- 			    -> 	         -> 						   : 쓰기(저장)
			- 			    <- 	         <- 						   : 읽기
				
			저장 장치
			- 데이터 > 1, 0으로 저장
			- 저장 장치라는 환경 > 자료형 X
			
			인코딩, Encoding
			- 문자 코드(응용 프로그램의 데이터)를 부호화(0, 1)를 시키는 작업
			- 자바 프로그램(”홍길동”) > 텍스트 파일(101101010101)
			
			디코딩, Decoding
			- 부호 데이터를 문자 코드로 변환 시키는 작업
			- 텍스트 파일(101101010101) > 자바 프로그램(”홍길동”)
			
			인코딩/디코딩 규칙
			- 저장 장치 or 네트워크에서 데이터를 표현하는 규칙
			
			문자 인코딩 방식
			1. ANSI
			2. UTF(Unicode)
			    2.1 UTF-8
			    2.2 UTF-16
			3. ISO-8895-1
			4. EUC-KR
			5. MS949	
			
			ANSI, ISO-8859-1, EUC-KR, MS949
			- 영어, 숫자, 특수문자 등 : 1byte
			- 한글, 한자, 일본어 등 : 2byte
			
			UTF-8 > 표준 > 자바, 오라클 
			- 영어: 1byte
			- 한글: 3byte
			
			UTF-16
			- 영어: 2byte
			- 한글: 2byte
			
			
			영문자 + 숫자 + 특수문자 > 1byte(256) > ASCII
			문자 코드값 > 숫자  
			char c; // 2byte(Unicode)
			
		*/
		
		//m1(); //파일 쓰기(출력)
		//m2(); //파일 읽기(입력)
		//m3(); // FileWriter
		//m4(); //콘솔 메모장 
		//m5(); // FileReader
		//m6(); // BufferedWriter
		//m7(); // BufferedReader
		//m8(); // 콘솔 메모장(읽기 버전)
		m9();
		
	}


	private static void m9() {

		//성적 관리
		// - 성적표 출력
		// - 성적 데이터 파일(score.txt)
		
		//score.txt 구조 설계
		//- 학생명, 국어, 영어, 수학 x N명
		
		File file = new File("dat\\score.txt");
		// .\\ -> 뿌리 경로 > 지금 작업 중인 파일의 뿌리 경로 (생략 가능)
		
		if(file.exists()) {
			System.out.println("===============================================");
			System.out.println("                    성적표");
			System.out.println("===============================================");
			System.out.println("[이름]\t[국어]\t[영어]\t[수학]\t[총점]\t[평균]");
			
			try {
				
				BufferedReader reader = new BufferedReader(new FileReader(file));
				
				String line = null;
				while ((line = reader.readLine()) != null) {
					//System.out.println(line); //학생 1명의 정보
					//CSV형태의 데이터를 분리한다. 
					
					String[] temp = line.split(",");
					
					String name = temp[0];
					int kor = Integer.parseInt(temp[1]);
					int eng = Integer.parseInt(temp[2]);
					int math = Integer.parseInt(temp[3]);
					int total = kor + eng + math;
					double avg = total/3.0;
					
					System.out.printf("%s\t%5d\t%5d\t%5d\t%5d\t%5.1f\n"
							,name, kor, eng, math, total, avg);
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

	private static void m8() {

		//콘솔 메모장(읽기 버전)
		
		try {
			
			Scanner scan = new Scanner(System.in);
			System.out.print("자바 파일명: "); //Ex01.java
			String filename = scan.nextLine();
			
			String path = "C:\\class\\code\\java\\JavaTest\\src\\com\\test\\java\\" + filename;
			
			BufferedReader reader = new BufferedReader(new FileReader(path));
			
			String line = null;
			int number = 1; //줄번호
			
			while((line = reader.readLine()) != null) {
				System.out.printf("%3d: %s\n", number, line);
				number++;
			}
			
			reader.close();
			
			
		} catch (Exception e) {
			System.out.println("Ex60_File.m8");
			e.printStackTrace();
		}
		
	}

	private static void m7() {

		// FileOutputStream > FileWriter(***)	> BufferedWriter(***)
		// FileInputStream 	> FileReader     	> BufferedReader(***)
		
		try {
			
			BufferedReader reader 
				= new BufferedReader(new FileReader
					("C:\\class\\code\\java\\file\\메모.txt"));
			
			//한글자씩
			int code = reader.read();
			System.out.println((char)code);
			
			//한 문장씩(***) > String
			String line = reader.readLine();
			System.out.println(line);
			
			line = reader.readLine();
			System.out.println(line);

			line = reader.readLine();
			System.out.println(line);
			
			line = reader.readLine();
			System.out.println(line);
			
			reader.close();
			
			// 다시 처음부터 읽으려면 스트림을 새로 생성해야 한다. (기존 빨대 닫고)
			reader = new BufferedReader(new FileReader
				("C:\\class\\code\\java\\file\\메모.txt"));
			
			line = null;
			
			while((line = reader.readLine()) != null) {
				System.out.println(line);
			}
			
			
			
		} catch (Exception e) {
			System.out.println("Ex60_File.m7");
			e.printStackTrace();
		}
		
		
	}

	private static void m6() {

		// java.io 패키지
		// FileOutputStream > FileWriter > BufferedWriter
		// FileInputStream > FileReader > BufferedReader
		
		try {
			
			 BufferedWriter writer 
			 	= new BufferedWriter(new FileWriter
			 		("C:\\class\\code\\java\\file\\성적.txt"));
			
			 writer.write(65);
			 writer.write('A');
			 writer.write("홍길동");
			 writer.newLine(); //writer.write("\r\n");
			 writer.write("아무개");

			 writer.close();
			 System.out.println("종료");
			 
			
		} catch (Exception e) {
			System.out.println("Ex60_File.m6");
			e.printStackTrace();
		}
		
		
		
		
	}

	private static void m5() {

		try {
			
			//FileInputStream > FileReader
			//1. 문자 단위 읽기(2byte)
			
			FileReader reader 
			= new FileReader("C:\\class\\code\\java\\file\\메모.txt");
			
			int code = -1;
			
			while((code = reader.read()) != -1) {
				System.out.print((char)code);
			}
			
			
			
			
		} catch (Exception e) {
			System.out.println("Ex60_File.m5");
			e.printStackTrace();
		}
		
		
	}

	private static void m4() {

		// 콘솔 메모장
		try {
			
			Scanner scan = new Scanner(System.in);
			
			System.out.print("저장할 파일명: ");
			String filename = scan.nextLine();
			
			FileWriter writer
				= new FileWriter("C:\\class\\code\\java\\file\\" + filename);
			
			//내용 입력
			boolean loop = true;
			
			while(loop) {
				
				System.out.print("입력: ");
				String line = scan.nextLine();
				
				if(line.equals("q!")) { //quit
					break;
				}
				
				writer.write(line); //한줄 입력 > 파일 쓰기
				writer.write("\r\n");
				
			}
			
			writer.close();
			System.out.println("종료");
			
			
			
			
			
		} catch (Exception e) {
			System.out.println("Ex60_File.m4");
			e.printStackTrace();
		}
		
		
		
		
	}

	private static void m3() {

		try {
			
			//파일 쓰기
			// - FileOutputStream > FileWriter
			// 1. 문자 단위 쓰기(2byte)
			// 2. 문자열 쓰기 
			
			FileWriter writer 
			= new FileWriter("C:\\class\\code\\java\\file\\test.txt", true);
			// false > 덮어쓰기
			// true > 이어쓰기 
			
			writer.write('가');
			writer.write('나');
			writer.write('다');
			
			writer.write("\r\n");
			writer.write("홍길동");
			
			writer.close();
			
			System.out.println("종료");
			
		} catch (Exception e) {
			System.out.println("Ex60_File.m3");
			e.printStackTrace();
		}
		
		
		
	}

	private static void m2() {

		//읽기 스트림
		
		try {
			
			//파일 읽기(입력)
			FileInputStream stream 
			= new FileInputStream("C:\\class\\code\\java\\file\\test.txt"); 
			
			// 로직 기억(*****)
			int code = -1;
			
			while((code = stream.read()) != -1) {
				System.out.print((char)code);
			}
			
			stream.close();
			
			
		} catch (Exception e) {
			System.out.println("Ex60_File.m2");
			e.printStackTrace();
		}
		
		
		
	}

	private static void m1() {
		
		//파일 쓰기(출력)
		
		try {
			
			//텍스트 파일 참조 객체
			File file = new File("C:\\class\\code\\java\\file\\test.txt");
			
			//파일 객체 > 출력 스트림(Stream) 생성
			/* 
				출력 스트림 모드
				
				1. Create mode > 기본값
					- 새로쓰기
					a. 파일이 없으면 자동으로 생성한다.
					b. 파일이 있으면 덮어쓰기를 한다.
				
				2. Append mode
					- 이어쓰기
					1. 파일이 없으면 자동으로 생성한다.
					2. 파일이 있으면 이어쓰기를 한다.
					
				- 스트림 닫기를 하지 않으면 파일이 저장되지 않는다.
				- 핸들이 잡혀있으면 다른 사람이 그 파일을 건들지 못함
				
				FileOutputStream
				- 바이트 단위 쓰기 지원(1byte)
				- 한글 > 2byte > 쓸 수 없다.
				
			*/
			
			FileOutputStream stream = new FileOutputStream(file, true); // 스트림 열기
			
//			char c = '가';
//			
//			stream.write((int)c); // test.txt에 'A'를 적어라  
//			stream.write(c); 
//			stream.write('M');
//			stream.write('O');

			String line = "Hello World~";
			
			for(int i=0; i<line.length(); i++) {
				char c = line.charAt(i);
				stream.write(c);
			}
			
			stream.close(); // 스트림 닫기(파일 저장X)
			
			System.out.println("종료");
			
		} catch (Exception e) {
			System.out.println("Ex60_File.m1");
			e.printStackTrace();
		}
		
	}
	
}
