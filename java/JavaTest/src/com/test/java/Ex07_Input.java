package com.test.java;

import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;

//import java.sql.Date; // 동시에 임포트하면 에러 - 어느 클래스인지 알 수 없기 때문에
//import java.util.Date; 
//import java.util.ArrayList;
//import java.util.Scanner;

// import java.util.Scanner; // 클래스로 임포트한다. 
// import java.util.ArrayList; 
// 같은 상자에 있는 모든 기능을 다 가져오는 기능
// import java.util.*;
// 자동완성할 때 헷갈리는 경우가 생기기 때문에 개별적으로 가져오는 것을 권함 



public class Ex07_Input {

	public static void main(String[] args) {
		
		/*
		
			콘솔 입력

			1. System.in.read(); 
    		   System.out.print(); 
    
			2. BufferedReader 클래스
			3. Scanner 클래스 
				- 문자열 입력 > ***
				- 숫자 입력
    				- 정수 입력 > ***
    				- 실수 입력
				- 논리 입력
		
		*/
		
		
		
		
		
		
		/*
		
		// [요구사항] 사용자로부터 문자를 1개를 입력 > 그대로 화면에 출력
		// 자바가 기본적으로 주는 도구가 많아서 감춰놓은 것을 빼오는 행위 : import
		
		// java.lang 패키지 
		// - 기본 패키지 (언제든지 가져다 쓸 수 있기 때문에 생략 가능 / 가장 기본이 되는 패키지이기 때문에 임포트 생략 가능)
		java.lang.String txt; 
		String txt2;
		
		// java.util 패키지
		// java.util.Scanner scan; // 계속 쓰기 번거롭기 때문에 상단에 import 시킴
		// Scanner cannot be resolved to a type // 아랫 줄에 자동 import 기능 클릭 
		
		// Ctrl + Shift + o
		Scanner scan0; 
		ArrayList list;
		Date now; // 서로 다른 이름의 패키지에 같은 이름의 클래스 (어느 상자에 있는지 미리 알고 있어야 함) 
		
		// 동시에 임포트하면 에러 - 어느 클래스인지 알 수 없기 때문에
		// main 메서드에서 직접 작성하면 됨 
		java.sql.Date now2;
		
		
		
				
		/////////////////////////////////////////////////////////////////////////////////////////
		
		// java.util 패키지
		// Ctrl + Shift + o
		Scanner scan = new Scanner(System.in);
		
		System.out.println("프로그램 시작");
		
		int a = 10; // 문장은 하나지만, 오른쪽 먼저 실행
		
		// 사용자로부터 키보드 입력을 받는다.
		String input = scan.next(); // 메서드 : 소괄호
		
		System.out.println("입력: " + input);
		
		System.out.println("프로그램 종료");
		
		
		*/
		
		
		
		
		// 자료형별로 키보드 입력 받기
		Scanner scan = new Scanner(System.in);
		
		/*
		
		System.out.print("문자열 입력 : ");
		
		// - next() > 토큰(Token) 입력 > 공백을 구분자로 하는 각 요소 (단어)
		// - nextLine() > 문장 입력 
		String input = scan.nextLine();

		System.out.println(input);
		
		*/
		
		// [요구사항] 사용자로부터 숫자를 1개 입력 받아서 x2 출력
		
		
		/* 
		System.out.println("숫자 입력: ");
		
		int input = scan.nextInt(); // 10 입력 
		
		System.out.println(input * 2); 
		*/
		
		/*
		System.out.print("실수 입럭 : ");
		double input = scan.nextDouble();
		System.out.println(input);
		
		// scan.nextChar // 캐릭터는 없음
		
		*/
		
		
		// 숫자 2개를 입력 > 그 합을 구하시오.
		
		// [초간단 계산기]
		// 숫자1: 10(사용자 입력 숫자) 
		// 숫자2: 5(
		// 결과: 10 + 5 = 15
		
		System.out.println("[초간단 계산기]");
		
		System.out.print("사용자명: ");
		String name = scan.nextLine();
		
		System.out.print("숫자1: ");
		int num1 = scan.nextInt();
		
		System.out.print("숫자2: ");
		int num2 = scan.nextInt();
		
		System.out.printf("%s님이 입력한 결과: %d + %d = %d",name, num1, num2, num1 + num2);
		
		
		// 자동 줄바꿈 : Alt + Shift + Y
		
		
		
		
	}

}
