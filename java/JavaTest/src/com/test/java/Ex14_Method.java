package com.test.java;

public class Ex14_Method {
	
	public static void main(String[] args) {
		
		// public static void hello() 
		
		// - hello : 메서드명 > 캐멀 표기법 + 의미있게 ( = 변수명, 첫문자 소문자, 두번째 단어부터 첫 글자 대문자) 
		// - () : 인자리스트(Parameters, Arguments), 매개변수
		
		// [요구사항] '홍길동'에게 인사를 하는 메서드를 구현하시오.
		// [요구사항] '아무개'에게 인사를 하는 메서드를 구현하시오.
		// [요구사항] '테스트'에게 인사를 하는 메서드를 구현하시오.
		// [요구사항] 우리 강의실의 모든 사람에게 각각 ~23명
		// [요구사항] 대한민국 모든 국민에게 ~4천만개 
		
		hello();
		hello2();
		hello3();
		
		// The method helloEveryone(String) in the type Ex14_Method is not applicable for the arguments () 
		helloEveryone("홍길동"); 
		helloEveryone("아무개"); 
		helloEveryone("테스트"); // 실인자 
		
		// 인자값과 매개변수의 자료형이 동일해야 한다.
		// helloEveryone(100); //The method helloEveryone(String) in the type Ex14_Method is not applicable for the arguments (int)
		System.out.println();
		
		
		int age = 20;
		checkAge(age); // 집합은 메소드로 빼는 습관 기르기 -> 코드관리 위함 // 변수명을 잘 지어야 함 
		// checkAge("스무살");
		
		byte age2 = 20;
		checkAge(age2); // 암시적 형변환 
		
		// 성적 계산
		// - 매개변수의 순서(★★★)
		// - 매개변수의 개수(★★★)
		checkScore(100, 90, 80); // 매개변수가 많아지면 변수명을 기억해야함.. 2~3개까지
		// checkScore(100, 90); // 변수 초기화 안 함  : The method checkScore(int, int, int) in the type Ex14_Method is not applicable for the arguments (int, int) 
		// checkScore(100, 90, 80, 70); // 많아도 안 됨 : The method checkScore(int, int, int) in the type Ex14_Method is not applicable for the arguments (int, int, int, int)
		checkScore(100, 90, 80); // void com.test.aaa.Ex14_Method.checkScore(int kor, int eng, int math)
		
		
	} // main

	public static void hello() {
		
		System.out.println("홍길동님 안녕하세요.");
		
		
	}
						// 넘버링 -> 의미를 알 수 없기 때문에 좋지 않음 => 의미있게 
	public static void hello2() { // Duplicate method hello() in type Ex14_Method : 메서드 이름 중복 불가 
		
		System.out.println("아무개님 안녕하세요.");
		
		
	}
	
	public static void hello3() {
		
		System.out.println("테스트님 안녕하세요.");
		
		
	}
									// 변수 선언 
	public static void helloEveryone(String name) { // 매개변수, 가인자(형식적인 인자) 
		
		// String name = "테스트"; // Duplicate local variable name : 변수 중복 
		
		System.out.println(name + "님 안녕하세요.");
		
		
	} 
	
	public static void checkAge(int age) {
		
		String result = age >= 18 ? "통과" : "거절";
		
		System.out.printf("입력한 나이 %d세는 %s입니다.\n", age, result);
		
		
	}
	
	// 도큐먼트 주석 /** + 엔터 (메서드 설명 주석)
	/**  
	 * 성적을 계산합니다. 
	 * @param kor 국어 
	 * @param eng 영어 
	 * @param math 수학 
	 */
								  // 개수 여러개 가능 
	public static void checkScore(int kor, int eng, int math) {
		
		int total = kor + eng + math;
		
		// double avg = (double)total / 3;
		double avg = total / 3.0;
		
		String result = avg >= 60 ? "합격" : "불합격";
		
		System.out.printf("평균 점수 %.1f점을 %s입니다. \n", avg, result);
		
	}
	
}


