package com.test.java;

public class Ex04_Variable {

	public static void main(String[] args) {
		
		//모든 자료형 > 변수 생성하기 
		
		// 정수형
		byte b1;
		b1 = 10; // 10 > 상수(데이터) > 정수형 상수 > *정수형 리터럴 
		System.out.println(b1);
		
		b1 = 127;
		System.out.println(b1);
		
		b1 = -128;
		System.out.println(b1);
		
		// Type mismatch: cannot convert from int to byte : 자료형이 맞지 않음 
		// b1 = 128; // byte 범위 : -128 ~ 127 -> 범위를 벗어난 에러 
		// b1 = 3.14;
		
		
		// 자료형	> 래퍼(Wrapper) 클래스 / 유틸 클래스  
		// byte		> Byte 
		// short	> Short
		// int		> Integer
		// long 	> Long
		// float	> Float
		// double 	> Double
		// boolean	> Boolean
		// char		> Character
		
		System.out.println(Byte.MAX_VALUE); // byte 자료형이 가질 수 있는 최댓값
		System.out.println(Byte.MIN_VALUE); // byte 자료형이 가질 수 있는 최솟값
		
		// short	
		short s1;
		s1 = 10000;
		System.out.println(s1);
		
		System.out.println(Short.MAX_VALUE);
		System.out.println(Short.MIN_VALUE);
		
		
		// int
		int n1;
		n1 = 100000000;
		System.out.println(n1);
		
		System.out.println(Integer.MAX_VALUE);
		System.out.println(Integer.MIN_VALUE);
		
		
		// long
		long l1; 
		l1 = 1000;
		
		
		// Shift + 방향키 > 글자단위
		// Shift + Ctrl + 방향키 > 단어단위 
		// Shift + Home(End)
		
		// Ctrl + Alt + 방향키(위, 아래) (복붙)
		// Alt + 방향키(위, 아래) (드래그한 상태에서 옮김) 
		System.out.println(l1);
		
		// The literal 10000000000 of type int is out of range : 리터럴 범위 벗어남 
		// l1 = 10000000000; // 상수 자체를 메모리에 넣지 못함 -> int 자료형으로 인식하기 때문 
		// 빨간 줄 에러 : 컴파일러가 번역하는 과정에서 에러 알려줌  
		
		
		// long 자료형의 최댓값 : 9223372036854775807
		System.out.println(Long.MAX_VALUE);
		
		l1 = 10000000000L; // long 자료형 위해, 정수 뒤에 L로 표시 (대소문자 안 가리지만 대문자 권장)
		System.out.println(l1);

		
		// b1의 자료형?
		// n1의 자료형?
		// 모든 100은 int 이다. 
		// - 자바에서 모든 정수형 상수(리터럴)은 int 자료형을 가진다. 
		b1 = 100; 
		s1 = 100;
		n1 = 100;
		l1 = 100;
		
		System.out.println(100);
		
		
		// 실수
		float f1;
		f1 = 3.14F; // float는 double로 인식하기 때문에 뒤에 ( f ) 필요
		System.out.println(f1);
		
		double d1;
		d1 = 5.28D;
		System.out.println(d1);
		
		// float > 단전도형
		// double > 배정도형
		f1 = 100000000000000000000000000000000.0F;
		d1 = 100000000000000000000000000000000.0D;
		
		System.out.println(f1);
		System.out.println(d1);
		
		f1 = 123456789012345678901234567890123456789.0F; // 결과 : 1.2345679E38
		d1 = 123456789012345678901234567890123456789.0D; // 결과 : 1.2345678901234568E38 // 유효 자리 특징으로 뒤에 숫자가 잘림
		
		System.out.println(f1);
		System.out.println(d1);
		
		double d2 = 0.2;	
		double d3 = 0.1;
		System.out.println(d2 + d3); // 결과 : 0.30000000000000004
		
		// 0.2 x 10 = 2 (정수로)
		// 0.1 x 10 = 1 
		// 2 + 1 = 3
		// 3 / 10 = 0.3
		
		// 실수형은 기억할 수 있는 가수부 범위가 짧다 
		
		
		// 문자형
		char c1;
		// c1 = A; // A cannot be resolved to a variable : A라는 변수를 해석하지 못함
		c1 = 'A'; // 'A' > 문자형 리터럴 
		System.out.println(c1);
		
		c1 = '가';
		System.out.println(c1);
		
		c1 = '&';
		System.out.println(c1);
		
		c1 = '5';
		System.out.println(c1); // 숫자 5가 아닌, 글자 5
		
		// c1 = 'ABC'; // 에러 : char 은 한 글자만 넣을 수 있음 
		System.out.println(c1);
		
		// c1 = '홍길동';
		
		char name1 = '홍';
		char name2 = '길';
		char name3 = '동';
		
		// String > 문자열 : 참조형 - 한 번에 여러 글자를 저장할 수 있는 자료형 (char의 집합) 
		String name = "홍길동"; // "홍길동" > 문자열 리터럴 
		System.out.println(name);
		
		
		
		// 논리형 
		boolean flag; 
		
		flag = true; // true > 논리형 리터럴 
		System.out.println(flag);
		
		flag = false; // false > 논리형 리터럴 
		System.out.println(flag);
		
		
		// 각 자료형 별 (9가지) > 변수 1개 생성 > 값을 대입 > 출력
		// x 10번씩
		
		// 샘플 
		// 1. 데이터 선정 
		// - 몸무게
		
		// 2. 1의 데이터를 저장될 자료형 선택?
		// - 몸무게 데이터 > 형태 + 범위 
		// - 1kg ~ 200kg > 실수 = float/double > float
		
		// 3. 변수 생성 + 초기화(리터럴) 
		float weight;
		weight = 72.5F;
		
		// 4. 마무리 > 출력(문장)  
		System.out.println("제 몸무게는 " + weight + "kg입니다."); // " " : 문자열로 인식 - 바깥으로 꺼내야 함 -> 더하기(+) 기호로 연결
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		///////////////////////////////////////////////////////////////////////////////
		
		
		
		
		// 정수형 > byte (-128 ~ 127)
		System.out.println(Byte.MAX_VALUE);
		
		// 1. 숫자 > 0부터 9까지 > 정수 >byte
		byte num; 
		num = 0;
		System.out.println("b1. 숫자는 " + num + "부터 시작합니다.");
		
		// 2. 지하철 노선 > 1~9호선 > 정수 > byte
		byte subwayLine;
		subwayLine = 1;
		System.out.println("b2. 저는 주로 " + subwayLine + "호선을 이용합니다.");
		
		// 3. 할인율 > 0~100 > 정수 > byte
		byte discount;
		discount = 50;
		System.out.println("b3. 이 제품은 " + discount + "% 할인됩니다.");
		
		// 4. 로또번호 > 1 ~ 45 > 정수 > byte
		byte lottoNum;
		lottoNum = 31;
		System.out.println("b4. 로또 첫 번째 번호는 " + lottoNum + " 입니다.");

		// 5. 시간 > 1 ~ 12 > 정수 > byte
		byte hour;
		hour = 7;
		System.out.println("b5. 현재 시간은 " + hour + "시 입니다.");

		// 6. 핸드폰 배터리 > 0~100 > 정수 > byte
		byte phoneBattery;
		phoneBattery = 79;
		System.out.println("b6. 현재 핸드폰 배터리는 " + phoneBattery + "% 입니다.");

		// 7. 건물 층수 > 0~100 > 정수 > byte
		byte floor;
		floor = 8;
		System.out.println("b7. 학원은 " + floor + "층 입니다.");

		
		// 정수형 > short (32767)
		System.out.println(Short.MAX_VALUE);
		
		//1. 키 > 1cm ~ 200cm > 정수 > short
		short height;
		height = 160;
		System.out.println("s1. 제 키는 " + height + "cm입니다.");
				
		// 2. 나이 > 1 ~ 150 > 정수 > short
		short age;
		age = 15;
		System.out.println("s2. 저는 " + age + "살 입니다.");
		
		// 3. 년도 > 1년 ~ 년 > 정수 > short
		short year;
		year = 2024;
		System.out.println("s3. 올해는 " + year + "년입니다.");
		
		
		
		
		
						
		// 정수형 > int (2147483647)
		System.out.println(Integer.MAX_VALUE);
		
		// 1. 거리 > 0km ~ 9999...km > 정수 > int
		int dis;
		dis = 320;
		System.out.println("i1. 서울에서 부산까지의 거리는 " + dis + "km입니다.");

		// 2. 칼로리 > 0 ~ 9998... kcal > 정수 > int
		int kcal;
		kcal = 600;
		System.out.println("i2. 프라푸치노는 " + kcal + "kcal 입니다.");

		// 3. 버스번호 > 1 ~ 9999... > 정수 > int
		int bus;
		bus = 5001;
		System.out.println("i3. 자주 타는 버스는 " + bus + "번 입니다.");

		// 4. 돈 > 0~9999... > 정수 > int
		int money;
		money = 1000000;
		System.out.println("i4. 저는 한 달에 " + money + "원 씁니다. ");
		
		// 5. 주민번호 뒷자리 > 4000000 > 정수 > int
		int juminBackNum;
		juminBackNum = 4156789;
		System.out.println("i5. 제 주민번호 뒷자리는 " + juminBackNum + " 입니다.");

		// 6. 생년월일(주민번호 잎자리) > 990505 > 정수 > int
		int yymmdd;
		yymmdd = 990505;
		System.out.println("i6. 제 생년월일은 " + yymmdd + " 입니다.");
		
		
		
		
		
		
		
		
		
		
		
		// 정수형 > long (9223372036854775807)
		System.out.println(Long.MAX_VALUE);
				
		// 1. 카드번호 > 1111-1111-1111-1111 > 정수 > long
		long creditNum;
		creditNum = 1234567890123456L;
		System.out.println("l1. 제 카드 번호는 " + creditNum + " 입니다.");

		// 2. 조회수 > 0 ~ 9999999 .. > 정수 > long
		long viewCount;
		viewCount = 1000000000L;
		System.out.println("l2. 아이돌 그룹 뉴진스의 뮤직비디오 조회수가 " + viewCount + "뷰를 돌파했습니다.");
		
		
		
		
		
		// 실수형 > float

		
		
		
		
		// 실수형 > double
		// 1. 온도 > 0.0 ~ 100.0도 > 실수 > double
		double temp;
		temp = 33.5;
		System.out.println("d1. 오늘은 " + temp + " 도입니다. ");
		
		// 2. 샤프심 > 0.5m 0.7m ... > 실수 > double
		double sharpLead;
		sharpLead = 0.5;
		System.out.println("d2. 이 샤프심은 " + sharpLead + "m입니다.");
		
		// 3. 시험점수 평균 > 0 ~ 100.0 > 실수 > double
		double average;
		average = 95.6;
		System.out.println("d3. 이번 학기 시험 점수의 평균은 " + average + "점 입니다.");
		
		
		
		
		// 논리형 > boolean 
		
		
		
		
		// 문자형 > char 
		// 1. 알파벳 > A ~ Z > 문자 > char
		char alphabet; 
		alphabet = 'Z';
		System.out.println("c1. 알파벳은 " + alphabet + "까지 있습니다.");
		
		// 2. 학점 > A ~ F > 문자 > char
		char score;
		score = 'A';
		System.out.println("c2. 이번 학기 성적은 " + score + "학점 입니다.");

		// 3. mbti 외향, 내향 > I or E > 문자 > char
		char mbtiFirst;
		mbtiFirst = 'I';
		System.out.println("c3. 제 MBTI의 첫 글자는 " + mbtiFirst + "입니다. ");
		
		
		
		
		// 문자열 > String 
		//1. 애완동물 > 고양이, 강아지 > 문자열 > String
		String pet;
		pet = "고양이";
		System.out.println("S1. 저희 집은 " + pet + "을 키웁니다.");
		
		//2. 요일 > 월요일 ~ 금요일 > 문자열 > String
		String week;
		week = "목";
		System.out.println("S2. 오늘은 " + week + "요일 입니다. ");
		 
		// 3. 전화번호 > 010-1234-1234 > 문자열 > String
		String phoneNum;
		phoneNum = "010-7777-7777";
		System.out.println("S3. 제 전화번호는 " + phoneNum + " 입니다.");
		
		// 4. 와이파이 비밀번호 > sist2N0301 > 문자열 > Stirng
		String wifiPassword;
		wifiPassword = "sist34821";
		System.out.println("S4. 와이파이 비밀번호는 " + wifiPassword + "입니다.");
		
		// 5. 과목명 > 국어, 영어, 자바 > 문자열 > String
		String subject; 
		subject = "자바";
		System.out.println("S5. 강의 시간에는" +subject + "를 배웁니다.");
		
		// 6. 날씨 > 맑음, 비, 흐림 > 문자열 > String
		String weather;
		weather = "맑음";
		System.out.println("S6. 오늘의 날씨는" + weather);
		
		// 7. 색 > 빨간색 ~ 보라색 > 문자 > String
		String color;
		color = "초록색";
		System.out.println("S7. 제가 좋아하는 색은 " + color + "입니다.");
						
		// 8. 도시 > 서울, 경기, 인천 ... > 문자열 > String
		String city;
		city = "서울";
		System.out.println("S8. " + city + "은 살기 좋은 도시입니다.");
		
		// 9. 과일 > 복숭아, 딸기 ... > 문자열 > String
		String fruit;
		fruit = "딸기";
		System.out.println("S9. 제가 좋아하는 과일은 " + fruit + "입니다.");
		
		// 10. 나라 이름 > 미국, 캐나다, 호주 ... > 문자열 > String
		String country;
		country = "캐나다";
		System.out.println("S10. 저는 " + country + "에 살고 싶습니다.");
		
		
		
		
		System.out.println("////////////////////////////////////////////////////////////////");
		
		// 주민등록번호 입력 > 출력
		// ex) 950621
		// 숫자처럼 생겼지만 수치가 아닌 경우 (전화번호 등) -> 숫자 변수에 넣으면 안 됨
		// 주민번호는 수치가 아닌, 식별자 
		
		int jumin = 95021;
		System.out.println("주민등록번호 : " + jumin);
		
		jumin = 030731; // 결과 : 12761 > 8진수 
		System.out.println("주민등록번호 : " + jumin);
		
		// 자바의 기수법
		// - 10진수 0~9
		// - 8진수 0~7
		// - 16진수 0~F (16개)  16 0~F (16개) 
		// - 2진수 일부 지원 0, 1 
		System.out.println(10); // 10진수 
		System.out.println(010); // 8진수 - 결과 : 8 < 자바는 10진수로 표현 
		System.out.println(0x10); // 16진수 - 결과 : 16 
		System.out.println(0b10); // 2진수 - 결과 : 2	
		
		// String 클래스 > 모든 클래스의 이름 > 파스칼 
		String jumin2;
		jumin2 = "030731";
		System.out.println(jumin2);
		
		
		// 실수 리터럴 
		double d4 = 12000000000000.0;
		double d5 = 1.2e+13; // 10의 3승 (지수 표현) 
		
		double d6 = 0.012;
		double d7 = 1.2e-1;
		System.out.println(d7);
		
		
		
		
		
		
	}

}
