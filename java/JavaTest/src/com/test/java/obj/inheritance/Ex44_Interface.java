package com.test.java.obj.inheritance;

public class Ex44_Interface {

	public static void main(String[] args) {
		
		/*
		 	
		 	인터페이스, Interface
			- 클래스의 일종
			
			
		*/
		
//		Keyboard k1 = new Keyboard();
//		k1.off();
		// 오류 > 추상 클래스 설명과 동일 
		
		
//		A100 a = new A100();
//		
//		a.open();
//		a.set("핸드폰");
//		a.close();
//		a.clean();
//		
//		B200 b = new B200();
//		
//		b.open();
//		b.set("지갑");
//		b.close();
//		b.check();
		// - 인터페이스는 객체를 생성할 수 없다.
		// - 인터페이스는 변수는 만들 수 있다. 
		
		//Bag a; // 인터페이스 참조 변수
		//A100 b; // 클래스 참조 변수
		
		//b = new A100();
		
		// Bag = A100
		// 부모 = 자식
		// 업캐스팅(100% 가능)
		//a = b;
		
		// 한 줄로
		Bag a = new A100();
		a.open();
		a.set("핸드폰");
		a.close();
		//a.clean(); //접근 불가 
		
		Bag b = new A100();
		b.open();
		b.set("핸드폰");
		b.close();
		//b.check(); //접근 불가

		
		
	}
	
}

// 가방 클래스 x 2종류
// - 가방으로서 가져야 할 행동 규칙 > 추상 클래스 or 인터페이스 (***)

interface Bag {
	void open();
	void close();
	String get(String item);
	void set(String item);
}



class A100 implements Bag {
	public String color;
	public int price;
	
	@Override
	public void open() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void close() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public String get(String item) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void set(String item) {
		// TODO Auto-generated method stub
	}
	
	public void clean() {
		// 나만의 기능 (부모x)
		// 자동 세척 기능 
	}
	
}

class B200 implements Bag {
	public int price;
	public String size;
	
	@Override
	public void open() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void close() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public String get(String item) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void set(String item) {
		// TODO Auto-generated method stub
		
	}
	
	public void check() {
		// 점검 기능
		
	}
	
}












// 인터페이스 선언하기
interface Keyboard {
	
	// 인터페이스 멤버 선언하기
	// - 멤버 변수(X)
	// - 메서드 
	// 	- 구현 메서드 (X) > {} 가진 메서드 불가능
	// 	- 추상 메서드(O)
	// *** 인터페이스는 추상 메서드의 집합이다.
	// *** 인터페이스는 구현 멤버를 가질 수 없다. (일반 메서드 X)
	
	
	// abstract methods do not specify a body
	//public void test();
	
	// ***** 키보드가 가져야할 행동 규범(규칙) > 추상 메서드
	
	public void on();
	void off();
	void keydown();
	void keyon();
	
	// 무조건 public이여야 함 (private 불가) - 생략 가능
	
}

// 제가 만든 F87 클래스는 Keyboard 인터페이스를 구현했습니다.
class F87 implements Keyboard { // 인터페이스를 상속 받을 때

	@Override
	public void on() {
		System.out.println("전원 on");
	}

	@Override
	public void off() {
		System.out.println("전원 off");
	}

	@Override
	public void keydown() {
		System.out.println("키다운");
	}
	@Override
	public void keyon() {
		System.out.println("키온");
	} 
}




























