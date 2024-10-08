package com.test.java.obj.inheritance;

public class Ex39_Overriding {

	public static void main(String[] args) {
		
		/*
		
			메서드 오버로딩, Method Overloading
			- 메서드 이름 동일xN 생성
			
			메서드 오버라이딩, Method Overriding
			- 메서드 재정의 > 상속 받은 메서드를 수정하는 기술
			- 클래스 상속에서 발생
		
		*/

		OverridingParent hong = new OverridingParent();
		hong.name = "홍길동";
		hong.hello();
		
		OverridingChild jhong = new OverridingChild();
		jhong.name = "홍철수";
		jhong.hello();
		//jhong.hi();
		
		
		
	}//main
	
}//class

// 업무 > 동네 사람 
class OverridingParent {
	
	public String name;
	public void hello() {
		System.out.printf("안녕하세요. 좋은 아침입니다. 저는 %s입니다.\n"
							, this.name);
	}
	
}

class OverridingChild extends OverridingParent {
	
//	public void hi() {
//		System.out.printf("하이~ 난 %s야!!!", this.name);
//	}
	
	// 일종의 덮어쓰기 > Overriding
	// 메서드 재정의
    // > 부모 클래스의 것과 자식 클래스의 것이 충돌이 나면 무조건 자식 클래스의 것이 우선임
	public void hello() {
		
		System.out.printf("하이~ 난 %s야!!!", this.name);
		
	}
	
	
}











