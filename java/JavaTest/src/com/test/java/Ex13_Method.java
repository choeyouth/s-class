package com.test.java;

public class Ex13_Method {
	
	// main 메서드 
	// - 특수 메서드
	// - 이름이 예약어(main) 
	// - 프로그램을 실행 > 자바가 최우선해서 main 메서드 검색 > main() 호출 
	// - 프로그램의 시작점(Entry Point)
	// - 프로그램의 종착점(End Point) 
	public static void main(String[] args) {
		
		/*		
			메서드, Method
			
			- = 함수(Function), 프로시저(Procedure), 서브 루틴(SubRoutine)
			- 코드의 집합
			- 같은 목적을 가지는 코드의 집합
			- 코드 재사용의 단위(★★★★★)
			
			메서드 사용
			
			1. 메서드 선언 
			2. 메서드 호출(사용한다)
		*/		
		
		// [요구사항] "안녕하세요." x5회 출력 
		// [수정사항] "반갑습니다." 수정
		
		// 하드 코딩 // 두 개 이상 만들면 안 됨
		System.out.println("반갑습니다.");
		System.out.println("반갑습니다.");
		System.out.println("반갑습니다.");
		System.out.println("반갑습니다.");
		System.out.println("반갑습니다.");
		
		
		// 선언한 메서드 > 호출하기
		hello(); 
		hello(); 
		hello(); 
		hello(); 
		hello(); // 생산성, 유지보수에 좋음
		

	} // main 

	// 메서드의 선언 위치 (클래스 내부)  
	// - 메서드는 클래스의 멤버이다. (클래스 -> 메서드 순)
	// - 메서드끼리는 선언 순서가 무관하다.
	
	/*
	 	
	 	메서드 헤더(header), 서명(Signature)
	 	
		접근지정자  정적키워드    반환타입  메서드명  인자리스트
		public      static		 void	   hello	() {
			
			// 메서드 본문(body), 구현부
			- 코드 작성
					
		}
	
	*/
	public static void hello() {
		
		// hello 메서드의 할 일
		System.out.println("안녕하세요.");
		
	} 
} // class






