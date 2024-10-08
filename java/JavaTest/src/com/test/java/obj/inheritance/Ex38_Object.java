package com.test.java.obj.inheritance;

import java.util.Scanner;

public class Ex38_Object {

	public static void main(String[] args) {
		
		/*
		
			Object 클래스
			- 개발자가 선언하는 모든 클래스는 자동으로 Object를 상속 받는다.
			- 모든 클래스의 근원 클래스 > 루트 클래스 (Root)
			- Object 클래스 멤버 9개 > 상속 > 모든 클래스는 상속 받은 9개를 가지고 있다. (공통 기능) 
			
		*/
	
		Test t1 = new Test();
		
		t1.a = 10;
		t1.b = 20;
		
		int[] nums = new int[3];
		
		
		/*
		Class Object is the root of the class hierarchy.
		Every class has Object as a superclass. 
		All objects,including arrays, implement the methods of this class.
		*/
		
		Object o1 = new Object();
		
		Scanner scan = new Scanner(System.in);
		
		
	}
	
}

class Test extends Object { // Object 클래스를 무조건 상속 받음 (코드를 작성하지 않아도 자동으로 생성)
	
	public int a;
	public int b;
	public void ccc() {
	
	}
	
}
