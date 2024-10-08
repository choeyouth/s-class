package com.test.java.obj;

public class Ex31_Access {

	public static void main(String[] args) {
		
		/*
		 
			 00 지정자(제어자)
				- 클래스 or 클래스 멤버 > 여러가지 기능을 제공하는 키워드
			
			접근 지정자(제어자),  Access Modifier
				- 클래스 멤버에 적용한다. (멤버 변수, 멤버 메서드)
				- 클래스에 적용한다.
				- 지역 변수에 적용 불가능
			
			1. public
			    - 객체(클래스) 외부에 100% 공개
			2. private
			    - 객체(클래스) 외부에 100% 비공개
			-----------------------------------------------------------
			
			3. protected
				- public과 private 수준의 중간 어딘가 쯤
			4. (default or package) > 생략
			
			
			클래스 멤버 > 접근 지정자 가이드라인

			1. 멤버 변수는 무조건 private을 사용한다. 
			    > 경우에 따라 Getter, Setter를 구현한다.
			2. 멤버 메서드는 경우에 따라 public or private을 사용한다. 
			    > 나만 쓰는 행동 > private
			    > 외부에서 쓰는 행동 > public
		 
		*/
		
		
		// Ex31 클래스 > 내가 있는 곳 > Book b1 객체 사용
		Book b1 = new Book(); // 같은 패키지(폴더)에 있는 클래스는 다른 파일에서도 선언 가능
		
		b1.title = "이것이 자바다";
		//b1.price = 38000; // The field Book.price is not visible // price 존재를 인식하지 못함
		//b1.color = "white"; // color cannot be resolved or is not a field
		//b1.price = 38000;
		//b1.price = -30000000; // int 값이라 오류는 나지 않지만, 잘못된 데이터 
		
		b1.aaa(3000); // price에 전달 x
		
		System.out.println(b1.title);
		System.out.println(b1.bbb());
		System.out.println();
		
		
		Note n1 = new Note();
		
		// 쓰기 전용 프로퍼티 
		n1.setColor("white");
		
		//System.out.println(n1.getColor());
		//System.out.println(n1.color());
		// 오류
		
		
		// 읽기 전용 프로퍼티 
		System.out.println(n1.getPrice()); // n1.price
		
		// n1.pages
		n1.setPages(30);
		System.out.println(n1.getType()); // 보통 노트 // n1.type (실제로는 없다)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	} // main
	
	
} // class
