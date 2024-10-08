package com.test.java;

public class Ex05_Escape {

	public static void main(String[] args) {
		
		int a= 10;
		System.out.println(a);
		
		// 특수 문자 > Escape Sequence
		// - 컴파일러가 번역할 때 > 소스 상의 문자를 그대로 화면 출력하지 않고 미리 약속된 표현으로 바꿔서 출력하는 요소
		
		// - \n,\r, \t, \', \", \b, \\
		
		// 1. \n
		// - new line. line feed
		// - 개행 문자(엔터) 
		
		// [요구사항] "안녕하세요. 홍길돈님." 출력해주세요.
		// [요구사항] 3번 출력 
		System.out.println("안녕하세요. 홍길동님.");
		System.out.println("안녕하세요. 홍길동님.");
		System.out.println("안녕하세요. 홍길동님.");
		
		// 상수를 바로 사용하지 말것! (하드코드) 
		
		String msg = "안녕하세요. 홍길돈님.";
		System.out.println(msg);
		System.out.println(msg);
		System.out.println(msg);
		
		// [요구사항] "안녕하세요."  "홍길돈님." 각각 다른 라인 출력해주세요.
		// ** 문자열 리터럴 내에는 개행문자를 직접 작성할 수 없다.
		msg = "안녕하세요. \n홍길돈님.";
		System.out.println(msg);
		
		// 2. \r
		// - carriage return
		// - 캐럿(carret)의 위치를 현재 라인의 맨 앞으로 이동
		
		msg = "안녕하세요. \r홍길동님";
		System.out.println(msg);
		
		// 운영체제의 엔터
		// 1. 윈도우 : \r\n
		// 2. 맥OS : \r
		// 3. 리눅스 : \n
		
		System.out.println("하나\r\n둘\r\n셋");
		System.out.println("하나\r둘\n셋");
		
		
		// 3. \t
		// - 탭문자, tab
		// - 탭이 뭐에요?
		// shift + tab 백탭
		
		msg = "하나	둘  	셋";
		System.out.println(msg);
		
		msg = "하나\t둘\t셋";
		System.out.println(msg);
		
		// 4. \b 
		// - backspace 
		msg = "홍길동\b입니다.";
		System.out.println(msg);
		
		
		
		// 5. \", \', \\
		// - 이미 역할이 있는 문자들을 역할을 못하게 만든다.
		
		// 요구사항] 출력 > 홍길동: "안녕하세요." 
		msg = "홍길동 : \"안녕하세요.\"";
		System.out.println(msg);
		
		// 요구사항] 수업 폴더가 어디냐?
		// - C:\class\code\java
		String path = "C:\\class\\code\\java"; // Invalid escape sequence (valid ones are  \b  \t  \n  \f  \r  \"  \'  \\ ) 
		System.out.println(path);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
