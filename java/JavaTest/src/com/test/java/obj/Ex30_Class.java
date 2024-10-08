package com.test.java.obj;

public class Ex30_Class {

	public static void main(String[] args) {
		
		Member m1 = new Member();
		
		m1.name = "홍길동"; // 특성(Property), 속성(Attribute)
		m1.age = 20;
		m1.hello();
		
		Member m2 = new Member();
		
		m2.name = "아무개";
		m2.age = 25;
		m2.hello();
		
		// 객체 변수의 값이 같아도 서로 구분됨 
		// 생성된 객체의 데이터 위치가 다름 
		
		/*
		
			**클래스 역할**
	
			1. 데이터 집합
			    - 멤버 변수만 구현
			
			2. 데이터 집합 + 행동
			    - 멤버 변수 구현 > 객체 특상(성질)
			    - 멤버 메서드 구현 > 객체 행동
			
			3. 행동 
			    - 멤버 메서드만 구현
		*/
		
		
		
		
		
		
	}
	
}

class Member {
	
	// 멤버 변수
	public String name;
	public int age;
	
	// 멤버 메서드 
	public void hello() {
		//System.out.println("안녕하세요.");
		System.out.printf("안녕하세요 저는 %s입니다.\n", name);
		// 자기만이 가지고 있는 특성을 활용 > 행동에 영향 
		// > 서로 다른 메시지 출력 > 서로 다른 객체의 존재 이유 
	}
		
}
