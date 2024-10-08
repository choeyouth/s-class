package com.test.java;

public class Ex69 {

	public static void main(String[] args) {
		
		//의존 관계 
		Child c1 = new Child();
		c1.aaa();
		
		M305 m1 = new M305();
		M405 m2 = new M405();
	}
	
}

class Parent {
	private int a;
	public void aaa() {
		
	}
}

class Child extends Parent {
	private int b;
	public void bbb() {
		
	}
	
}

interface Mouse {
	void click();
	boolean dblclick();
}

abstract class AbstractMouse implements Mouse{
	private int a;
	public void aaa() {
		
	}
	
	public abstract void drag();
	public abstract void drop();
	
}

class M305 implements Mouse {

	@Override
	public void click() {
		
	}

	@Override
	public boolean dblclick() {
		return false;
	}
}

class M405 extends AbstractMouse {

	@Override
	public void drag() {
		
	}

	@Override
	public void drop() {
		
	}

	@Override
	public void click() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean dblclick() {
		// TODO Auto-generated method stub
		return false;
	}
	
}

/*
 
	일반 클래스 + 추상 클래스 + 인터페이스 > 상속 관계
	
	- [자식]                [부모]
	- 일반 클래스 > 일반 클래스 : O
	- 일반 클래스 > 인터페이스 : O (오버라이드)
	- 일반 클래스 > 추상 클래스 : O(오버라이드)
	- 인터페이스 > 일반 클래스 : X(구현부때문)
	- 추상 클래스 > 일반 클래스 : O(X > 비권장)
	- 인터페이스 > 인터페이스 : O
	- 추상 클래스 > 추상 클래스 : O
	- 추상 클래스 > 인터페이스 : O
	- 인터페이스 > 추상 클래스 : X(구현부 때문)
	- 일반 클래스 > 일반 클래스 > 일반 클래스 > 추상 클래스 > 추상 클래스 > 인터페이스 > 인터페이스 > 인터페이스
	
*/

/*
class AAA {
	public int a;
	public void aaa() {
		
	}
}

//interface BBB extends AAA {
//	
//}

abstract class BBB extends AAA {
	
}


interface DDD {
	void ddd();
}

interface EEE extends DDD {
	void eee();
	void ddd();
//	public void ddd() {
//		
//	}
}

abstract class FFF {
	private int a;
	public abstract void aaa();
}

abstract class GGG extends FFF {
	private int a;
	public abstract void aaa();
	private int b;
	public abstract void bbb();
}

interface HHH {
	void aaa();
}

abstract class III implements HHH {
	public abstract void bbb();

	@Override
	public void aaa() {
		
	}
}

class JJJ extends III {

	@Override
	public void bbb() {
		
	}
}

abstract class KKK {
	public int a;
	public abstract void aaa();
}

interface LLL extends KKK {
	//public int a;
	public abstract void aaa();
}
*/







