package com.test.java.obj.inheritance;

public class Ex48_Generic {

	public static void main(String[] args) {
		
	
		Item<String> s1 = new Item<String>();
		
		s1.a = 10;
		s1.b = "문자열";
		s1.c = "홍길동";
		// Item 클래스가 String 값이 되는 것이 아님
		
		Item<Integer> s2 = new Item<Integer>();
		
		s2.c = 100;
		// 클래스 생성 시에 값형을 정하지 않고, main에서 사용할 때 정할 수 있음
		
		Pen<Integer> p1 = new Pen<Integer>();
		Pen<Integer> p2 = new Pen<>(); //생략 가능
		p1.a = 10;
		p1.b = 20;
		p1.c = 30;
		
		Desk<Boolean> d1 = new Desk<>();
		
		d1.setData(true);
		System.out.println(d1.getData());
		
		Laptop<String, Integer> l1 = new Laptop<String, Integer>("맥북", 1000);
		
		System.out.println(l1.getA());
		System.out.println(l1.getB());
	}
	
}
//제네릭 클래스 
// - T: 타입 변수(매배견수 역할) > 자료형을 저장하는 변수 
// - ex) T = String 
// - ex) T = int(X) > 값형 불가능
// - ex) T = Integer (O) > Wrapper클래스, 즉 참조형만 가능
 
class Item<T>  { 
	public int a;
	public String b;
	public T c;
}

class Pen<T> {
	public T a;
	public T b;
	public T c;
}

class Desk<T> {
	private T data;
	public void setData(T data) { // 멤버변수에만 쓰는 것이 아닌, 매개변수, Getter, 등 클래스를 설계하는 데 있어서 어디든 자료형을 작성하는 곳이면 사용가능
		this.data = data;
	}
	public T getData() {
		return this.data;
	}
	public void test(T item) {
		System.out.println(item);
	}
	
	public void aaa() {
		T a; // 지역 변수에 적용X > 거의 안 함 // 폐쇄적인 상태이기 때문
	}
}

class Laptop<T, U> { // 타입변수를 여러개 만들 수 있다. > 자료형 따로 가능
	private T a;
	private U b;

	public Laptop(T a, U b) {
		this.a = a;
		this.b = b;
	}
	
	public T getA() {
		return this.a;
	}

	public U getB() {
		return this.b;
	}
}





























