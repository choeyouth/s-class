package com.test.java;

public class Ex09_Casting {

	public static void main(String[] args) {
		
		/*
		 
		  형 변환, 자료형변환
		  - Casting, Promotion
		  - 하나의 자료형을 다른 자료형으로 변화하는 작업
		  - 코드 작성을 유연하게 하기 위해서 (개발자 편의성?)
		  - int > double
		  - long > float
		  - byte > short
		
			1. 암시적(묵시적) 형 변환, 자동 형 변환, Promotion
			- 큰 형 = 작은 형 (자료형의 범위) (작은 형을 큰 형에)
			- 작은 주머니에 있는 것을 큰 주머니에 넣는 것 : 당연히 가능 
			
			2. 명시적 형 변환, 강제 형 변환, Casting
			- 작은 형 = 큰 형
			- 경우에 따라 다르다.
    			- 오버플로우 발생 가능~!
		 
		 */
		
		
		byte b1; // 1byte
		short s1; // 2byte
		
		b1 = -128; // 원본
		
		// LValue = RValue
		// 공간	  = 값
		// *** 절대 규칙 > LValue와 RValue의 자료형은 반드시 동리해야 한다. 
		// 			     > 만약 동일하지 않으면 무조건 컴파일 오류 
		
		// short = byte
		// s1 = b1; // = : 공간, 오른쪽 : 값, -> 변수 안의 데이터의 의미 
		
		
		/*
			이항연산자
			1 + 2
			+ : 연산자
			1, 2 : 피연산자 
			
			단항연산자
			(short)b1
			(short) : 연산자
			b1 : 피연산자
		*/
		
		// (자료형) : 형변환 연산자 
		s1 = (short)b1; // 둘 다 short이기 때문에 오류 발생하지 않음 -> (short)구문은 눈에 보이지 않음 -> 암시적인 형변환
		
		
		// 검증
		System.out.println(s1);
		
		
		
		
		
		
		byte b2;
		short s2;
		
		s2 = 128; 
		// 2진수 환산시 
		// 원본 : 000000100000
		// 복사 : ------100000 -> 첫번째 수가 0이면 양수, 1이면 음수 > 음수가 나옴
		
		b2 = (byte)s2; // Type mismatch: cannot convert from short to byte
		// (byte) > 자동형변환을 지원하지 않음 > 직접 작성해야만 함
		// 이유 : 문제가 생길 수도, 아닐 수도 있기 때문에 직접 작성하여, 확인해야 함  
		// 		  > 명시적 형변환
		// byte가 지원하고 있는 범위의 값만 입력해야 함
		
		System.out.println(b2);
		
		// 원하는 값과 다른 경우 : 논리 에러
		
		int money = 2100000000;
		// System.out.printf("%,d", money);
		
		short money2;
		
		// short가 감당할 수 있는 범위를 벗어남 
		// > 오버 플로우(Overflow) 
		// > 언더 플로우(Underflow)
		money2 = (short)money;
		
		System.out.println("계좌 이체 결과 잔액 : " + money2);
		// short는 3만 2천 까지만. 논리 에러 
		// short 범위를 벗어날 가능성이 있는지 예상해야 함
		
		// 중요한 것은 오버플로우 발생시 조치.............
		
		
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		
		// (값형끼리의[7개]) 형변환
		// - 값형과 참조형 간에는 형변환 불가능하다.
		// byte, short, int, long
		// float, double
		// char
		// boolean(X) 
		// String(X) - 참조형
		
		
		float f1; // 4byte
		double d1; // 8byte
		
		f1 = 3.14F;
		
		// 8 = 4 => 암시적 형변환 
		d1 = f1;
		
		System.out.println(d1);
		
		
		
		d1 = 3.123456789123456789;
		
		// 4 = 8 => 명시적 형변환
		f1 = (float)d1; 
		// float가 감당할 수 있는 숫자 
		
		System.out.println(d1); // 원본 (16자리) 
		System.out.println(f1); // 복사본 - 유효자리가 잘리는 현상 발생 가능  
		
		
		
		// 정수 > 정수
		// 실수 > 실수
		// 정수 > 실수
		// 실수 > 정수
		
		
		int n1 = Integer.MAX_VALUE; // 원본(4)
		float n2; // 복사본(4)
		
		// 4 = 4 
		n2 = n1; // 에러가 없으면 암시적 형변환 즉, 100퍼 성공
		
		System.out.println(Integer.MAX_VALUE); // 2147483647
		System.out.println(n2); // 2.14748365E9
		// 암시적 형변환임에도 불구하고 값 변화 가능
		
		int n3; // 복사본(4)
		float n4 = 10000000000F; // 원본(4)
		
		// 4 = 4  
		n3 = (int)n4; // Type mismatch: cannot convert from float to int
		// 명시적 형변환이 아닌 이유 : 물리적인 길이만 같음 (저장할 수 있는 데이터의 범위가 float가 훨씬 크기 때문에) 
		
		System.out.println("n3: " + n3);
		// 오버플로우 발생 안 하고 최댓값으로 출력 
		
		// 숫자형 크기 비교
		// byte(1) < short(2) < int(4) < long(8) <<< float(4)(표현하는 범위가) < double(8)
		
		
		// char 형변환
		// - 문자 코드값 <- (형변환) -> 숫자
		// - 일종의 정수형 변환이다. 
		
		System.out.println(65);
		System.out.println((char)65); // A
		System.out.println('a');
		System.out.println((int)'a'); // 97 - a의 문자코드값
		
		System.out.println("A"); // String
		// System.out.println((int)"A"); // 참조형과 값형 간의 형변환 불가능 
		
		// 주의할 점
		// *** 문자를 정수로 형변환할 때는 반드시 int로 변환한다.  (short 사용 금지) 
		char c1; // 정수(2byte)
		short t1; // 정수(2byte)
		
		c1 = '가'; // 문자 코드값: 44032
		t1 = (short)c1; // ~ 32767
		System.out.println(t1); // -21504 (제대로된 문자코드 값 표현 x) 
		
		char c2;
		short t2; 
		
		t2 = 97; // 'a'
		c2 = (char)t2; 
		
		System.out.println(c2); 
		
		// 표현할 수 있는 숫자의 범위는 같지만, 서로 영역이 다름 (short는 음수부터 ~~.. char은 0부터 ~...) 
		// short에 음수를 넣는다면, char에 명시적 x
		// char가 32,000을 넘는 숫자를 넣는다면, short 명시적 x
		// 중요하지 않음
		
	
		// "100" -> 100
		String txt = "100";
		int result; 
		
		// 참조형 = 값형(X)
		// result = (int)txt
		
		// 문자열을 숫자로 바꾸는 방법
		result = Integer.parseInt(txt);
		
		System.out.println(result);
		
		txt = "3.14"; // "3.14" -> 3.14
		double result2 = Double.parseDouble(txt);
		System.out.println(result2);
		
		// Wrapper 별로 문자열을 자신의 자료형으로 바꿔주는 메서드
		// - Byte.parseByte("100")
		// - Short.parseShort("100")
		// - Float.parseFloat("3.14")
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
