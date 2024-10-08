package com.test.java.obj.inheritance;

import java.util.Scanner;

public class Ex46_Object {

	public static void main(String[] args) {
		
		/*
		
			object클래스
			- 모든 클래스의 부모 클래스이다.
		
		
		
		*/

		AAA a1 = new AAA();
		AAA a2 = new BBB(); // 부모 변수 = 자식 객체 > 업캐스팅
		AAA a3 = new CCC(); // 할아버지  = 손자 객체 > 업캐스팅
		
		a3.a = 10;
		// 부모 세대의 변수는 자식 세대의 변수 저장 가능
		
		// Object 참조 변수는 만능 타입이다. > 모든 것을 저장할 수 있다.(****)
		Object o1 = new Object();
		Object o2 = new AAA(); // 자식 객체를 부모 타입에 저장
		Object o3 = new BBB();
		Object o4 = new CCC();

		Object o5 = new Scanner(System.in);
		Object o6 = new Test();
		
		Object o7 = new int[3];
		Object o8 = "홍길동";
	
		// 값형의 데이터를 Object 변수에 넣을 때
		// > 박싱 발생 
		//이상함?? > 100(int), true(boolean) > 클래스? X
		Object o9 = 100; // Boxxing 발생 
		// Object o9 = new Integer(100);
		Object o10 = true;
		
		//System.out.println(o10 ? "O" : "X"); // 불가능
		System.out.println((boolean)o10 ? "O" : "X");
		
		//System.out.println(o9 + 100);
		//오류 > Object 클래스와 값의 연산 불가능
		System.out.println((int)o9 + 100); // 언박싱 발생 > 실제 숫자가 필요한 것을 인지해서 숫자를 반환시켜줌 (Integer를 반환)
		System.out.println((Integer)o9 + 100);// 언박싱 발생
		
		
		int a = 100;
		Integer b = new Integer(100);
		
		System.out.println(a == b);
		System.out.println(a + b); 
		
		// Object는 모든 자료형의 데이터를 저장할 수 있다.
		Object[] list = new Object[5];
		list[0] = 100;
		list[1] =  "홍길동";
		list[2] = true;
		list[3] = new AAA();
		list[4] = new Scanner(System.in);
		
		
		// 루프를 돌릴 수 없다 > 배열을 만드는 의미가 없음 
		// 첫 번째 방에 숫자를 넣으면, 나머지 방에도 숫자만 넣어야 함
		list[0] = 100;
		list[1] = 200;
		list[2] = 300;
		list[3] = 400;
		list[4] = 500;
		
		for (int i=0; i<list.length; i++) {
			System.out.println((int)list[i] + 100);
		}
		
		
		
		
		
		
	}//main
}//class

class AAA { // extends Object
	public int a;
}

class BBB extends AAA { 
	public int b;
}

class CCC extends BBB {
	public int c;
}