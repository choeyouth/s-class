package com.test.java.array;

import java.util.Scanner;

public class Ex27_String {

	public static void main(String[] args) {
		
		// 문자열, String
		// - String 클래스에서 문자열 조작 관련 기능을 제공
		
		// - int length()
		// - char charAt(int)
		// - String trim()
		// - int indexOf(String), int lastIndexOf(String)
		// - String toUpperCase(), String toLowerCase()
		// - boolean startsWith(String word), boolean endsWith(String word)
		
		
		
		//m1(); // 문자열 길이
		//m2(); // 문자열 추출
		//m3(); // 주민등록번호 입력 - 유효성 검사 
		//m4(); // 문자열 공백 제거 
		//m5(); // 문자열 검색(★★★★★)
		//m6(); // 게시판 글쓰기 > 금지어!!
		//m7(); // 문자열 대소문자 변경
		//m8(); // 문자열 패턴 검색
		//m9(); // 문자열 추출
		//m10(); // 문자열 검색
		m11(); // 문자열 치환(바꾸기)
		//m12(); // 문자열 분리
		
		
		
		
	}

	private static void m12() {
		
		// 문자열 분리
		// - String[] split(String delimiter)
		
		String txt = "홍길동,아무개,강아지,고양이,병아리";
		
		String[] list = txt.split(","); // 구분자는 사라짐 
		
		for (int i=0; i<list.length; i++) {
			System.out.println("이름: " + list[i]);
		}
		
		
		
		
		
	}

	private static void m11() {
		
		
		// 문자열 치환(바꾸기)
		// - String replace(char old, char new)
		// - String replace(String old, String new)
		
		String txt = "안녕하세요. 홍길동님";
		
		System.out.println(txt.replace("홍길동", "아무개"));
		
		String content = "게시판 글쓰기입니다. 바보야!!";
		String stop = "바보";
		
		// masking
		System.out.println(content.replace(stop, "**"));
		
		txt = "안녕하세요. 홍길동님. 홍길동님. 홍길동님";
		System.out.println(txt.replace("홍길동", "아무개"));
		// 대상이 여러개여도 해당되는 문자열은 모두 치환해줌 
		
		txt = "     하나     둘     셋     ";
		System.out.println(txt.trim()); // 하나     둘     셋
		// 모든 공백을 제거해야할 때
		System.out.println(txt.replace(" ", "")); // 삭제 - 하나둘셋
		
		txt = "안녕하세요. 홍길동님. 홍길동님. 홍길동님";
		System.out.println(txt.replace("홍길동", "")); // 제거 - 안녕하세요. 님. 님. 님
		
		txt = "홍 길동";
		System.out.println(txt.length()); // 4글자 > 12바이트 
		System.out.println(txt.replace(" ", "")); // 3글자 > 9바이트
		System.out.println(txt.length());
	}

	private static void m10() {

		// 문자열 검색
		// - indexOf(), lastIndexOf(0
		// - boolean contains(String s)
		
		String txt = "안녕하세요. 홍길동님.";
		if (txt.indexOf("홍길동") > -1) {
			System.out.println("O");
		} else {
			System.out.println("X");
		}
		
		txt = "안녕하세요. 아무개님.";
		
		if (txt.contains("홍길동")) {
			System.out.println("O");
		} else {
			System.out.println("X");
		}
		
		
		
		
	}

	private static void m9() {
		
		// 문자열 추출
		// - char charAt(int) - 글자 하나를 가져옴 
		// - String subString(int beginIndex, int endIndex) - 문자열을 가져옴 (charAt을 여러번 반복) 
		// - String sunString(int beginIndex)
			// - beginIndex: 포함(inclusive)
			// - endIndex: 미포함(exclusive)
		
		// 			  0 1 2 3 4 5 6 7 8 910111213
		String txt = "가나다라마바사아자차카타파하";
		
		System.out.println(txt.substring(3, 8)); // 라마바사아 (8 미포함)
		System.out.println(txt.substring(5, 6)); // 바 - 한글자만 반환하더라도 String 값임 
		System.out.println(txt.substring(5)); // 바사아자차카타파하 - 5부터 끝까지
		
		char num2 = 'A';
		System.out.println((int)num2); // 65
		System.out.println();
		
		String num = "A";
		//System.out.println((int)num); // 오류
		
		String jumin = "970702-1234567";
		
		// 성별? 
		System.out.println(jumin.charAt(7) == '1' ? "남자" : "여자");
		System.out.println(jumin.substring(7, 8).equals("1") ? "남자" : "여자");
		
		// 몇년생?
		System.out.println("" + jumin.charAt(0) + jumin.charAt(1)); // 문자코드값끼리 산술연산 // "" 더해서 String값으로
		System.out.println(jumin.substring(0, 2)); // 97
		
		// 몇월생?
		System.out.println(jumin.substring(2, 4)); // 07
		
		// 몇일생?
		System.out.println(jumin.substring(4, 6)); // 02
		System.out.println();
		
		// 파일 경로     \\: 한 글자로 인식함
		String path = "C:\\class\\code\\java\\Hello.java";
		
		// 1. 파일명 추출 > Hello.java
		int index = path.lastIndexOf("\\"); 
		//System.out.println(index);
		String fileName = path.substring(index + 1);
		System.out.println("파일명: " + fileName);
		
		// 2. 파일명 > 확장자 없는 순수 파일 > Hello
		index = fileName.lastIndexOf("."); // 파일 이름에도 "."이 들어있을 수 있음
		//System.out.println(index);
		String fileNameWithotExtension = fileName.substring(0, index);
		System.out.println("순수 파일명: " + fileNameWithotExtension);

		// 3. 확장자 추출 > .java
		String extension = fileName.substring(index);
		System.out.println("확장자: " + extension);
		
	}

	private static void m8() {
		
		// 문자열 패턴 검색
		// - boolean startsWith(String word)
		// - boolean endsWith(String word)
		
		String name = "홍길동";
		
		// '홍'씨? > boolean
		System.out.println(name.charAt(0) == '홍'); // true
		System.out.println(name.indexOf('홍') == 0); // true
		System.out.println(name.startsWith("홍")); // true // 맨 앞의 시작하는 글자
		System.out.println();
		
		// '동'으로 끝나? 
		System.out.println(name.charAt(name.length() - 1) == '동'); // true
		System.out.println(name.indexOf('동') == name.length() - 1); // true
		System.out.println(name.endsWith("동")); // true
		
		
		// 자원 경로
		String path = "C:\\class\\code\\java\\Hello.java";
		
		// 위의 자원이 자바 소스 파일인가? > 확장자 .java > 확장자 검사 
		// 확장자 대문자도 가능한
		path = "C:\\class\\code\\java\\Hello.JAVA";
		if (path.toLowerCase().endsWith(".java")) {
			System.out.println("O");
		} else {
			System.out.println("X");
		}
		
		
		
		
		
		
		
		
	}

	private static void m7() {
		
		// 문자열 대소문자 변경
		// - String toUpperCase()
		// - String toLowerCase()
		
		String txt = "오늘은 Java를 공부하는 시간입니다.";
		String word = "java"; // 검색어
		
		//System.out.println(txt.toUpperCase()); // 오늘은 JAVA를 공부하는 시간입니다.
		//System.out.println(txt.toLowerCase()); // 오늘은 java를 공부하는 시간입니다.
		
		// 대소문자 구분(Case sensitive) 
		// - 정확도 높음
		// - 검색율 낮음 
		if (txt.indexOf(word) > -1 ) {
			System.out.println("검색 결과 O");
		} else {
			System.out.println("검색 결과 X");
		}
		
		// 메서드 체인
		// 메서드().메서드().메서드()
		//txt.toLowerCase().indexOf();
		// 바뀐소문자.indexOf()
		
		// 대소문자 구분X (Case insensitive)
		// - 검색율 높음
		// - 정확도 낮음
		if (txt.toLowerCase().indexOf(word.toLowerCase()) > -1 ) {
			System.out.println("검색 결과 O");
		} else {
			System.out.println("검색 결과 X");
		}
		
	}

	private static void m6() {
		
		// 게시판 글쓰기 > 금지어!!
		
		String stop = "바보"; //금지어
		String content = "안녕하세요. ㅂㅏㅂㅗ야!! 저는 홍길동입니다. ";
		
		if (content.indexOf(stop) > -1) { // 0보다 큰 값이 나오면 검색어 존재 // 못 찾으면 -1 반환
			System.out.println("금지어 금지!!");
		} else {
			System.out.println("글쓰기 처리~");
		}
		System.out.println();
		
		content = "안녕하세요. 바보 저는 멍청이 홍길동입니다. "; 
		String[] stops = { "바보", "멍청이", "메롱", "ㅂㅏㅂㅗ" };
		
		for (int i=0; i<stops.length; i++) {
			
			if (content.indexOf(stops[i]) > -1) { 
				System.out.println("금지어!! ");
				break; // 앞에서 바보를 발견하면 뒤에 다른 단어가 나와도 똑같이 금지어... 메모리 낭비 
			} 
			
		}
		
		System.out.println("종료");
		
	}

	private static void m5() {
		
		// 문자열 검색(★★★★★)
		// - 문자열 내에서 원하는 문자(열)을 검색 > 발견된 위치(index) 반환
		// - int indexOf(char c)
		// - int indexOf(String s)
		// - int indexOf(char c, int beginIndex)
		// - int indexOf(String s, int beginIndex)
		
		String txt = "안녕하세요. 홍길동입니다.";
		
		System.out.println(txt.indexOf('홍')); // 7 (검색 함수)
		System.out.println(txt.indexOf("홍길동")); // 7 - 검색 위치의 시작의 값만 반환
		System.out.println(txt.indexOf('김')); // -1 (음수 : 가장 적은 index의 값보다 1 작은 값 -> 존재하지 않는 값) 
		System.out.println();
		
		txt = "안녕하세요. 홍길동입니다. 반갑습니다. 홍길동입니다. 안녕히가세요. 홍길동입니다.";
		
		// 찾는 위치 0번째가 기본값
		System.out.println(txt.indexOf("홍길동")); // 7 (첫 번째 길동이만 찾아줌) 
		System.out.println(txt.indexOf("홍길동", 10)); // 7 > 22 // 두 번째 홍길동 
		System.out.println(txt.indexOf("홍길동", 25)); // 7 > 38 // 세 번째 홍길동 
		
		//int index = -1; // 피해가 최소가 되는 값
		int index = 0;
		
		index = txt.indexOf("홍길동", index); // 7
		System.out.println(index);
		
		//index += 3;
		
		index = txt.indexOf("홍길동", index + 3); // 22
		System.out.println(index);
		
		index = txt.indexOf("홍길동", index + 3); // 38
		System.out.println(index);
		
		index = txt.indexOf("홍길동", index + 3); // 45
		System.out.println(index);
		System.out.println();
		System.out.println();
	
		txt = "안녕하세요. 홍길동입니다. 반갑습니다. 홍길동입니다. 안녕히가세요. 홍길동입니다.";
		
		// - int lastIndexOf(매개변수)
		// - int lastIndexOf(char c)
		// - int lastIndexOf(String s)
		// - int lastIndexOf(char c, int beginIndex)
		// - int lastIndexOf(String s, int beginIndex)
		
		System.out.println(txt.lastIndexOf("홍길동")); // 38 - 검색 방향이 반대 (끝에서부터 시작) 
		System.out.println(txt.lastIndexOf("홍길동", 37)); // 22 
		System.out.println(txt.lastIndexOf("홍길동", 21)); // 7
		
	}

	private static void m4() {
		
		// 문자열 공백 제거 
		// - String trim()
		// - 문자열의 시작과 끝에 있는 공백 문자(Whitespace > 스페이스, 탭, 개행)를 제거한다. 
		
		String txt = "     하나     둘     셋     ";
		
		System.out.printf("[%s]\n", txt);
		System.out.printf("[%s]\n", txt.trim()); // 앞 뒤 공백만 제거 
		
		System.out.println("자바".equals("자바")); // true
		System.out.println(" 자바 ".equals("자바")); // false
		// 검색창 입력시에 앞뒤 공백을 실수할 경우 제거해줌
		
		
	}

	private static void m3() {
		// 주민등록번호 입력
		// ex) 950701-1234567
		// - 유효성 검사 
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("주민번호('-'필수): "); 
		String jumin = scan.nextLine();
		
		if (jumin.charAt(6) == '-') { // '-'의 위치: 6
			System.out.println("올바른 주민번호");
		} else {
			System.out.println("잘못된 주민번호");
		}
	}

	private static void m2() {

		// 문자열 추출
		// - char charAt(int index)
		// - 원하는 위치의 문자를 추출
		// - zero-based index
		
		String txt = "안녕하세요. 홍길동님."; 
		
		// java.lang.StringIndexOutOfBoundsException: index 12,length 12 
		char c = txt.charAt(txt.length() - 1); // 문자열의 변화가 있어도 항상 마지막 문자를 반환해줌 
		System.out.println(c);
		
	}

	private static void m1() {

		// 문자열 생성하기 
		// 1. 리터럴
		// 2. 객체 생성
		
		String str1 = "홍길동";
		String str2 = new String("홍길동");
		
		// 문자열 == 문자의 집합 
		// String = char[]
		
		// 문자열 길이 
		// - int length()
		// - 문자의 개수
		String txt = "홍길동";
		System.out.println(txt.length()); //nums.length 
		System.out.println("자바".length());
		System.out.println("한글ABC123!@#".length());
		
		// [요구사항] 사용자 입력 > 문자수? 
		Scanner scan = new Scanner(System.in);
		
		System.out.print("문장 입력: ");
		String statement = scan.nextLine();
		
		System.out.printf("%s > %d문자\n", statement, statement.length());
		
		// [요구사항] 이름 입력
		// - 2자 ~ 5자 이내
		
		System.out.print("이름: ");
		String name = scan.nextLine();
		
		if (name.length() >= 2 && name.length() <= 5) {
			System.out.println("올바른 이름");
		} else {
			System.out.println("이름을 2자~5자 이내로 입력하세요.");
		} 
		
		
		
		
		
		
		
		
		
		
		
		
	}// m1
	
}
