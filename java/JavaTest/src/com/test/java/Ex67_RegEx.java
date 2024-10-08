package com.test.java;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Ex67_RegEx {

	public static void main(String[] args) {
		
		/*
		
			정규 표현식, Regular Expression
			- 정규식
			- “특정 패턴”을 가지는 문자열을 검색하는 도구
			
			
			<정규 표현식 요소(문법)>

			1. x
			    - x는 임의의 문자 1개
			    ex) a > a
			    ex) abc > abc
			    ex) 홍길동 > 홍길동
			    
			2. .
			    - 임의의 문자 1개 (wildcard)
			    ex) . > 문자 1개 
			    ex) .. > 문자 2개
			    ex) a.c > abc, aac, acc, adc, aec, a홍c
			    ex) a..c > abbc, a12c
		
			3. 출현횟수
		    	- 바로 앞의 문자(집합)의 출현 횟수를 표현
			    
			    3.1 생략
			    	- 바로 앞의 대상의 출력 횟수가 생략X, 중복X
			    	- 출현횟수: 1
			    	 ex) abc > abc
			    	
			    
			    3.2 ?
				    - 바로 앞의 대상의 출현 횟수가 생략O, 중복X
				    - 출현횟수: 0~1
				    ex) a?bc > bc, abc, abb(x)
				    ex) 홍?길동 > 안녕~ 길동아~ 네 이름은 홍길동이지?
				    ex) 홍길?동 > 홍길동, 홍동, 길동(X)
					ex) 홍길동? > 홍길동, 홍길, 길동(X)
					ex) (자바)?코드 > 자바코드가 있습니다. 그런데 코드에 에러가 있어요.
					
				3.3 +
					- 바로 앞의 대상의 출현 횟수가 생략X, 중복O
					- 출현 횟수: 1~무한대
					ex) a+bc > bc(X), abc, aabc, aaabc, aaaaaaaabc
					ex) 홍+길동 > 안녕~ 길동(X)아~ 네 이름은 홍길동이지?
						홍홍홍홍홍길동
					ex) (자바)+코드 > 자바코드가 있습니다. 그런데 코드(X)에 에러가 있어요.
						자자자바바바코드(X), 자바자바자바코드(O)
						
				3.4 *
					- 바로 앞의 출현 횟수가 생략O, 중복O
					- 출현 횟수 : 0~무한대
					ex) a*bc > bc, abc, aabc, aaabc, aaaaaaaabc
					ex) 홍*길동 > 안녕~ 길동아~ 네 이름은 홍길동이지?
						홍홍홍홍홍길동
					ex) (자바)*코드 > 자바코드가 있습니다. 그런데 코드에 에러가 있어요.
						자자자바바바코드, 자바자바자바코드(O)
						
						
					ex) a?a?abc > abc, aabc, aaabc
						- aaaabc(X), bc(X) 
						
						
				4. 선택,Choice
				    - 연산자(or) 역할
				    - [ ] 안에 문자 중 1개를 선택
				    
				    4.1 [열거값]
				    ex) [012] > 제 나이는 12살입니다. 제 동생은 10살이에요. 키는 160cm입니다. 몸무게는 50kg입니다.
				    ex) [나생은] > 제 나이는 12살입니다. 제 동생은 10살이에요. 키는 160cm입니다. 몸무게는 50kg입니다.
				    - 0 또는 1 또는 2 / ‘나’ 또는 ‘생’ 또는 ‘은’
				    
				    ex) [홍김박최]길동 > 홍길동, 아무개, 김길동, 박길동, 최길동, 박최길동
				    ex) [홍김박최]?길동 > 홍길동, 아무개, 김길동, 박길동, 최길동, 박최길동
				    ( ? : 출현횟수 1또는 0)
				    ex) [홍김박최]+길동 > 홍길동, 아무개, 김길동, 박길동, 최길동, 박최길동, 김김김김길동
				    
				    ex) 숫자 > [0123456789]+ 
				             > [6475839201]+ > 기능상 문제X
				    ex) 주민등록번호 > 950726-2123456 
				                    > 000103-1928374
				        [0123456789][0123456789][0123456789][0123456789][0123456789][0123456789]-[0123456789][0123456789][0123456789][0123456789][0123456789][0123456789][0123456789] > 연속된 숫자 6자리-연속된 숫자 7자리
				    
				    ex) 전화번호
				         010-1234-5678
				         010-539-0987
				         010-2764-7865
				         010-4321-9734
				         010- [0123456789] [0123456789] [0123456789] [0123456789]?- [0123456789] [0123456789] [0123456789] [0123456789]

				    ex) 영어 소문자 > [abcdefghijklmnopqrstuvwxyz]+
				    ex) 영어 대문자 > [ABCDEFGHIJKLMNOPQRSTUVWXYZ]+
				    ex) 영문자 > [ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]  +
				    ex) 한글 > 
				    
				    *** []에서 **연속된 문자**(코드)를 간단하게 표현하는 방법
				    ex) 숫자 >  [0123456789] > [0-9]
				    ex) 숫자 >  [01236789] > [0-9](X) > [0-36-9](O)
				    ex) 숫자 > [13579] > 못줄임
				    ex) 영어소문자 > [a-z]
				    ex)영어대문자 > [A-Z]
				    ex) 영문자 > [A-Za-z](O), [a-zA-Z](O) > [A-z](X)(대문자와 소문자 사이의 영문자가 아닌 것들..)
				    ex) 한글 > [가-힣]
				    
				    ex) 주민등록번호 > [0-9][0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]
				    ex) 전화번호 > 010-[0-9][0-9][0-9][0-9]?-[0-9][0-9][0-9][0-9]
				    
				    ex) 홍씨 이름? > 홍길동, 홍순신, 홍재석, 홍아지, 홍양이 
				                   > 홍길동입니다.
				        홍[가-힣][가-힣]
				    ex) 영문자 + 숫자 > [A-Za-z0-9]
				    ex) 영문자 + 숫자 + 한글 > [A-Za-z0-9가-힣]
				    ex) 식별자 적합한 문자(영어 + 숫자 + _ )
				    	> [A-Za-z0-9_]
				    	
				    	
				    4.2 [^열거값]
				    	- 4.1의 부정형
				    	- 열거값을 제외한 나머지 검색
				    	ex) [0-9]+ > [^0-9]+
						
					5. 출현횟수
						- 바로 앞의 문자(집합)의 출현 횟수를 표현
						- ?, +, * > 더 세밀한 패턴 지정이 가능
						
						5.1 {n}
							- n: 출현 횟수
							ex) a{1}bc > ab, bc, abc, ac, abbc, abcc, aabc, aaabc
							ex) a{2}bc > ab, bc, abc, ac, abbc, abcc, aabc, aaabc
							ex) a{3}bc > ab, bc, abc, ac, abbc, abcc, aabc, aaabc
							
						5.2 {n,m}
							- n: 최소 출현 횟수
							- m: 최대 출현 횟수
							ex) a{1,2}bc > ab, bc, abc, ac, abbc, abcc, aabc, aaabc
							ex) a{2,3}bc > ab, bc, abc, ac, abbc, abcc, aabc, aaabc
							ex) a{0,2}bc > ab, bc, abc, ac, abbc, abcc, aabc, aaabc

						5.3 {n,}
							- n: 최소 출현 횟수
							- m 생략: 무한대
							ex) a{1,}bc > ab, bc, abc, ac, abbc, abcc, aabc, aaabc
							ex) a{0,}bc > ab, bc, abc, ac, abbc, abcc, aabc, aaabc
							
							ex) a?bc > a{0,1}bc
							ex) a+bc > a{1,}bc
							ex) a*bc > a{0,}bc
							
							ex) 주민등록번호 
								> [0-9][0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]
				    			> [0-9]{6}-[0-9]{7}
				    		ex) 전화번호 
				    			> 010-[0-9][0-9][0-9][0-9]?-[0-9][0-9][0-9][0-9]
								> 010-[0-9]{3,4}[0-9]{4}
								
							ex) 한글 2~4 > [가-힣]{2,4}
							ex) 영문자 5자 이상 > [A-Za-z]{5,}
							
							ex) 영문자 5자 이상 + 단, 첫문자는 대문자로 시작
								> [A-Z][A-Za-z]{4,} 
		
					6. 처음과 끝
					 	- 입력 컨트롤 or 입력 값 등을 대상으로 사용
					 	
					 	6.1 ^ 
					 		- 뒤의 표현으로 반드시 시작
					 		- str.startsWith("홍")
					 		ex) ^홍길동
					 		
					 	6.2 $
					 		- 앞의 표현으로 반드시 끝 
					 		- str.endsWith("동")
					 		ex) 홍길동$
					 	
					 	
					 7. 줄임표현
					 	
					 	7.1 \d or \D
					 		- Digital, 숫자
					 		- [0-9] == \d
					 		- [^0-9] == \D
					 		ex) [0-9]{6}[0-9]{7}
					 		ex) \d{6}-\d{7}
					 		
					 	7.2 \w or \W
					 		- Word > 영어대소문자 + 숫지 + _ 조합
					 		ex) [A-Za-z0-9_]{2,5}
					 		ex) \w{2,5}
					 		
					 	7.3 \s or \S
					 		- 공백 문자(스페이스, 엔터, 개행) 
					 		ex) \s+
					 	
					 	
		
		*/
		
		
		//m1();
		//m2();
		//m3();
		//m4();
		//m5();
		m6();
		
		
	}

	private static void m6() {

		// 유효성 검사 > 회원 가입
		// 1. 아이디 > 필수값, 4~12자 이내, 영문자+숫자+_, 숫자로 시작 X
		// 2. 암호 > 필수값, 4~12자 이내
		// 3. 이름 > 필수값, 한글 2~5자 이내
		// 4. 나이 > 필수값, 숫자, 범위(1~120)
		
		Scanner scan = new Scanner(System.in);
		System.out.println("[회원 가입]");
		
		while(true) {
 		
			System.out.print("아이디: ");
			String id = scan.nextLine();
			
			if (invalid(id)) { //유효성 검사 > 잘못된 것을 찾아라!! (로직을 짜기가 더 쉬움)
				System.out.println("필수값, 4~12자 이내, 영문자+숫자+_, 숫자로 시작 X");
			} else {
				break;
			}
		}
		
		while(true) {
	 		
			System.out.print("암호: ");
			String pw = scan.nextLine();
			
			if (invalidPw(pw)) { //유효성 검사 > 잘못된 것을 찾아라!! (로직을 짜기가 더 쉬움)
				System.out.println("필수값, 4~12자 이내");
			} else {
				break;
			}
		}
		
		while(true) {
			System.out.print("이름: ");
			String name = scan.nextLine();
			
			if (invalidName(name)) { //유효성 검사 > 잘못된 것을 찾아라!! (로직을 짜기가 더 쉬움)
				System.out.println("필수값, 2~5자 이내, 한글만");
			} else {
				break;
			}
		}
		
		while(true) {
			try {
				System.out.print("나이: ");
				int age = scan.nextInt();
				
				if (invalidAge(age)) { //유효성 검사 > 잘못된 것을 찾아라!! (로직을 짜기가 더 쉬움)
					System.out.println("필수값, 숫자만, 범위(1~120)");
				} else {
					break;
				}
			} catch (Exception e) {
				System.out.println("숫자만 입력하시오.");
				scan = new Scanner(System.in);
			}
		}
		
		System.out.println("회원 가입 진행");
		System.out.println("완료");

	}
		

	private static boolean invalidAge(int age) {
		
		//필수값, 숫자만, 범위(1~120)
		//String regex = "[0-9]{1,3}";
		
		if (age < 1 || age > 120) {
			return true;
		}
		
		return false;
	}

	private static boolean invalidName(String name) {
		
		String regex = "^[가-힣]{2,5}$";
		
		Pattern p1 = Pattern.compile(regex);
		Matcher m1 = p1.matcher(name);
		
		return !m1.find();
		
	}

	private static boolean invalidPw(String pw) {
		
		if(pw == null || pw.equals("")) {
			return true; // 잘못된 값
		} 
		
		if(pw.length() < 4 || pw.length() > 12) {
			return true;
		}
		
		return false;
	}

	private static boolean invalid(String id) {
		
		//필수
		//4~12자 이내
		//영문자+숫자+_
		//숫자로 시작 X
		
		String regex = "^[A-Za-z_][A-Za-z0-9_]{3,11}$";
		
		Pattern p1 = Pattern.compile(regex);
		Matcher m1 = p1.matcher(id);
		
		return !m1.find();
	}

	/*
	private static boolean invalid(String id) {

		//필수
		//4~12자 이내
		//영문자+숫자+_
		//숫자로 시작 X
		
		if(id == null || id.equals("")) {
			return true; // 잘못된 값
		} 
		
		if(id.length() < 4 || id.length() > 12) {
			return true;
		}
		
		for(int i=0; i<id.length(); i++) {
			char c = id.charAt(i);
			
			if ((c < 'A' || c > 'Z') 
					&& (c < 'a' || c > 'z') 
					&& (c < '0' || c > '9')
					&& c != '_') {
				return true;
			}
			
		}
		
		char c2 = id.charAt(0);
		
		if (c2 > '0' || c2 < '9') {
			return true;
		}
		
		return false;
	}
	*/

	private static void m5() {

		String txt = "안녕하세요. 홍길동입니다. 당신 이름도 길동이에요? "
				+ "아~ 김길동이군요. 저쪽에 최길동도 있어요. "
				+ "그리고 남궁길동도 있습니다. 궁남길동";
		
		// [요구사항] 모든 길동이 찾기!!
		//String regex = "[홍김최(남궁)]길동";
		String regex = "(홍|김|최|남궁)(길동)";
		
		Pattern p1 = Pattern.compile(regex);
		Matcher m1 = p1.matcher(txt);
		
		while (m1.find()) {
			System.out.println("찾은 이름: " + m1.group());
			System.out.println("성: " + m1.group(1));
			System.out.println("이름: " + m1.group(2));
			System.out.println();
		}
		
		
	}

	private static void m4() {

		String txt = "3. 오렌지 주스\r\n"
				+ "커피와 오렌지 주스를 함께 마시면 위산 분비가 과도하게 증가해 위장에 부담을 줄 수 있다. 이는 속쓰림이나 asdfq@asd.asd소화 불량을 유발할banu9898 수 있다. 오렌지 주스의 산성과 커피의 산도가 결합하여 baysjdw위장 자극을 증가시킬 수 있다. 신선한 오렌지 주스, 포장된 오렌지 주스, 기타 감귤류 주스가 이에 해당한다.\r\n"
				+ "\r\n"
				+ "4. 'E-mail'알코올\r\n"
				+ "커피와 알코올을 함께 섭취하면 두 가지 모두 탈수를 유발할 수 있다. 이는 신체의 수분 균형을 깨뜨린다. 또한 커피의 각성 효score@java.com과가 알코올의 진정 효과를 상쇄시켜 더 많은 양의 알코올을 섭취하게 만들 수 있다. 맥주, 와인, 칵테일 등이 이에 해당한다.\r\n"
				+ "\r\n"
				+ "5. 매운 음식\r\n"
				+ "커피와 매운 음식을 함께 섭취하면 위산 분비가 증가해 속쓰림과 같은 소화 문제를 일으킬 수 있다. 매운 음식 자java@naver.com체가 위를 자극하기 때문에 커피와의 조합은 위장에 더 큰 부'E-mail'담을 줄 수 있다. 매운 타코, 칠리소스, 핫소스가 들어간 음식들이 이에 해당한다.\r\n"
				+ "\r\n"
				+ "커피를 마실 'E-mail'때 이러한 음식들은 피하고, 커피와 잘 어울리는 건강한 간식을 선택하는 것이 좋다. 커피를 더욱 즐겁고 건강하게 즐기기 위한 작은 노력이 필요하다.";
		
		// 정규식 사이트 > http://regexlib.com
		
		//이메일 주소 검색
		String regex = "(\\w+)@([a-zA-Z_]+?\\.[a-zA-Z]{2,3})";
		
		Pattern p1 = Pattern.compile(regex);
		
		Matcher m1 = p1.matcher(txt);
		
		while (m1.find()) {
			System.out.println(m1.group());
			System.out.println("아이디: " + m1.group(1));
			System.out.println("도메인: " + m1.group(2));
			System.out.println();
		}
	}

	private static void m3() {

		// 자바 > 정규식 클래스 제공
		
		String txt = "안녕하세요. 홍길동입니다. 제 연란처는 010-1234-5678입니다. 010-1234-5678  혹시 연락이 안되면 010-8765-2341로 연락주세요.";
		
		// txt 안에 전화번호가 포함되어 있는지?
		String regex = "([0-9]{3})-([0-9]{3,4})-([0-9]{4})";
		
		// 정규 표현식 객체
		Pattern p1 = Pattern.compile(regex);

		// 검색 + 결과
		Matcher m1 = p1.matcher(txt);
		
		//대상(txt)에서 정규식 패턴에 일치하는 부분을 발견했습니다.
//		System.out.println(m1.find());
		
//		if(m1.find()) {
//			System.out.println("txt내에서 전화번호 발견O");
//		} else {
//			System.out.println("txt내에서 전화번호 발견X");
//		}
	
//		System.out.println(m1.find());
//		System.out.println(m1.find());
//		System.out.println(m1.find());
//		System.out.println(m1.find());

//		int count = 0;
//		
//		while (m1.find()) {
//			count++;
//		}
//		
//		System.out.println("전화번호를 총 " + count + "회 발견했습니다.");
		
		
		while (m1.find()) {
			System.out.println("[전화번호 발견]");
			System.out.println("전화번호: " + m1.group());
			System.out.println("전화번호: " + m1.group(0)); //같은 값
			System.out.println("통신사: " + m1.group(1)); 
			System.out.println("앞자리: " + m1.group(2)); 
			System.out.println("뒷자리: " + m1.group(3)); 
			System.out.println();
		}
		
	}

	private static void m2() {

		String names = "홍길동,,아무개.강아지;고양이 병아리";
		String[] list = names.split("[,;\\s.]+");

		for (String name : list) {
			System.out.println(name);
	
//			if(name.contains(";")) {
//				String[] sublist = name.split(";");
//				System.out.println(Arrays.toString(sublist));
//			} else {
//				System.out.println(name);
//			}
		}
		
		
	}

	private static void m1() {
		
		// 자바 > 여러 메서드가 정규 표현식을 지원한다.
		
		// 게시판 > 글쓰기 > 개인정보(전화번호) 마스킹
		String txt = "안녕하세요. 홍길동입니다. 제 연란처는 010-1234-5678입니다."
				+ " 혹시 연락이 안되면 010.8765.2341로 연락주세요.";
		
		//System.out.println(txt.replace("010-1234-5678", "010-XXXX-XXXX"));
		
		System.out.println(
				txt
				.replaceAll("[0-9]{3}-[0-9]{3,4}-[0-9]{4}", "XXX-XXXX-XXXX")
				.replaceAll("[0-9]{3}.[0-9]{3,4}.[0-9]{4}", "XXX-XXXX-XXXX")
		);
		
		System.out.println(txt.replaceFirst("[0-9]{3}-[0-9]{3,4}-[0-9]{4}", "XXX-XXXX-XXXX"));
		
	}
	
}

























