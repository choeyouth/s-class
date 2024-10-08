package com.test.question;

import java.util.Scanner;

public class Q027 {

	public static void main(String[] args) {
		
		// [요구사항] 문자 1개를 입력받아 아래와 같이 출력하시오.
		// [조건]
//			f, F → Father
//			m, M → Mother
//			s, S → Sister
//			b, B → Brother
//			유효성 검사를 하시오.(위의 문자가 아닌 문자는 예외 처리)
		
		// [흐름]
		// 사용할 변수 선언
		// 스캐너 생성
		// 라벨 출력
		// 선언한 변수에 값 저장
		// if문 유효성 검사 
		// if문 대문자 -> 소문자 / 소문자 -> 대문자 
		
		String c = "";
		
		Scanner scan = new Scanner(System.in);
		System.out.print("문자: ");
		c = scan.nextLine();
		
		if (c.equals("f") || c.equals("F") 
			|| c.equals("m") || c.equals("M") 
			|| c.equals("s") || c.equals("S") 
			|| c.equals("b") || c.equals("B")) {
			
			if (c.equals("f") || c.equals("F")) {
				System.out.println("Father");
			} else if (c.equals("m") || c.equals("M")) {
				System.out.println("Mother");
			} else if (c.equals("s") || c.equals("S")) {
				System.out.println("Sister");
			} else {
				System.out.println("Brother");
			}
			
		} else {
			System.out.println("입력한 문자가 올바르지 않습니다. ");
		} 
		
		scan.close();
		
		
		
	}
	
	
	
}
