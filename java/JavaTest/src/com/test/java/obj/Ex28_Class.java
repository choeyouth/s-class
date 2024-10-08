package com.test.java.obj;

public class Ex28_Class {

	public static void main(String[] args) {
		
		/*
		
			자바

			- 객체 지향 프로그래밍 언어
			- Object Oriented Programming Language > OOP
			- 객체를 중심으로 프로그램을 만드는 방식
			- 클래스라는 설계도를 사용해서,
			    
			    객체라는 것을 만들고,
			    
			    만들어진 객체를 사용해서,
			    
			    내가 원하는 행동을 구현하는 것
			    
			
			1. 클래스, Class
			- 객체를 만드는 설계도
			- 객체를 분류하는 기준
			- 자료형
			- 붕어빵틀
			
			2. 객체, Object
			- 붕어빵
			
			3. 인스턴스, Instance
			- 붕어빵
			- 메모리에 실체화된 객체
			
			4. 추상화
			
			6. 상속
			
			7. 다형성
			
			5. 정보은닉
			
			8. 캡슐화
			
			9. 인터페이스
			
			10. 프로퍼티(Property), 속성(Attribute)
			
			11. 행동(behavior)
		
		
		*/
		
		
		// [요구사항] 지도 > 우리집 > 좌표 저장
		
		// Case 1.
		// - 가장 간단한 방법
		// - 식별자 문제 > 같은 성질의 식별자가 서로 다른 이름을 사용
		// - 구조적 문제 > 규칙(X), 쌍 보장(X)
		
		// 우리집 좌표
		int x = 100;
		int y = 200;
		
		System.out.printf("우리집은 [%d, %d]에 위치합니다.\n", x, y);
		
		// 마트 좌표 
		int x2 = 300;
		int y2 = 400;
		
		System.out.printf("마트는 [%d, %d]에 위치합니다.\n", x2, y2);
		System.out.println();
		
		
		// Case2.
		// - 배열 사용
		// - 데이터 저장 구조 > 집합 > 관리 용이 + 가독성 
		// - 배열 단점 > 요소를 구분할 단서 > 방 번호 > 의미를 부여할 수 없다;;
		
		// ★★★ 배열을 같은 성질의 같은 자료형의 집합 
		
		int[] score = { 100, 90, 80 };
		
		// 우리집 좌표
		// - 정수 2개
		int[] a1 = { 100, 200 };
		System.out.printf("우리집은 [%d, %d]에 위치합니다.\n", a1[0], a1[1]);
		
		// 마트 좌표
		int[] a2 = { 300, 400 };
		System.out.printf("마트는 [%d, %d]에 위치합니다.\n", a2[0], a2[1]);
		System.out.println();
		
		
		// Case 3.
		// - 클래스 사용
		// - 데이터 집합의 역할
		// - 데이터 저장 구조 역할 (x, y)
		// - 각 멤버의 이름을 정의 가능 (x, y) > 멤버의 성질 구분
		// - 초기 비용 발생!! 		
		
		// 선언된 클래스로 > 객체를 생성하는 방법
		// - 자료형 변수명 = new 생성자();
		// - 클래스 객체(명, 변수) = 객체생성연산자 생성자();
		//  Scanner scan = new Scanner(System.in);
		
		// 우리집 좌표
		// - Point 클래스의 p1이라는 인스턴스를 생성했습니다. 
		// - p1 객체를 생성했습니다. (p1은 스택에 생성)
		// p1을 객체로 볼 수 있음 (x, y라는 객체의 주소를 저장한 변수)
		Point p1 = new Point(); // 붕어빵틀 > 붕어빵 1개 생성 
		
		
		// x = 100; // 오류 : 바로 힙에 찾아가지 못함, 스택을 통해서만 찾아갈 수 있음
		
		// 멤버 접근 연산자 
		// p1[0] = 100; // 배열과 비슷함
		p1.x = 100; 
		p1.y = 200;
		
		System.out.printf("우리집은 [%d, %d]에 위치합니다.\n", p1.x, p1.y);
		
		
		// 마트 좌표
		Point p2 = new Point(); // 또 다른 x, y가 생성됨 -> 스택에 p2 객체 생성 
		
		p2.x = 300;
		p2.y = 400;
		
		System.out.printf("마트는 [%d, %d]에 위치합니다.\n", p2.x, p2.y);
		System.out.println();
		
		
		
		
		
		
		
		
		
		Size monitor = new Size();
		monitor.name = "LG 모니터";
		monitor.width = 1920;
		monitor.height = 1080;
		
		System.out.println(monitor.name + ":" 
						 + monitor.width + "," 
						 + monitor.height);
		System.out.println();
		
		
		
		
		
		
		Score s1 = new Score();
		
		s1.name = "홍길동";
		s1.kor = 100;
		s1.eng = 90;
		s1.math = 80;
		
		
		
		
		// 클래스를 왜 자료형이라고 하는가?
		int a = 10;
		boolean b = true;
		
		Point c;
		Score d;
		
		
		
		
	} // main
	
} // class


// 클래스 선언하기 ( = 붕어빵 틀 만들기)
// - 클래스명: 파스칼 표기법
//
//class 클래스 {
//	
//}

class Point {
	
	// 구현부
	// - 클래스의 멤버를 선언하기 
	// 1. 변수
	// 2. 메서드 
	
	// 멤버 변수 ( 멤버 변수는 힙에 생성 ) (클래스 안의 객체) ( <-> 지역 변수 : 스택에 생성) 
	public int x;
	public int y;
	
	
}

class Size {
	
	// 서로 다른 자료형의 집합이 가능 (배열은 같은 자료형의 집합만 가능) 
	public String name;
	public int width;
	public int height;
	
	
	
}


class Score {
	
	public String name;
	public int kor;
	public int eng;
	public int math;
	
}
















