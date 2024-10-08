package com.test.java.lambda;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Random;

public class Ex63_Lambda {

	public static void main(String[] args) {
		
		/*
			 람다식, Lambda Expression
			- 함수형 프로그래밍 기법 중 하나
			- 익명 함수를 간단하게 표현하는 방법
			
			람다식 형식
			- 인터페이스 변수 = 람다식;
		 
		*/
		
		// [요구사항] MyInterface를 구현(상속)한 객체를 생성하시오.
		
		// Case 1. 클래스 선언 + 객체 생성
		MyInterface m1 = new MyClass();
		m1.test();
		
		// Case 2. 익명 객체 생성
		MyInterface m2 = new MyInterface() {

			@Override
			public void test() {
				System.out.println("익명 객체에서 구현한 메서드");
			}
		};
		m2.test();
		
		// Case 3. 람다식 > 익명 클래스의 추상 메서드를 간단한 표현으로 구현하는 기술
		MyInterface m3 = () -> {
			System.out.println("람다식에서 구현한 메서드");
		};
		m3.test();
		
		TestInterface t1 = new TestInterface() {
			@Override
			public void aaa() {
				
			}
			@Override
			public void bbb() {
				// TODO Auto-generated method stub
			}
		};
		
		t1.aaa();
		t1.bbb();
		
		//The target type of this expression must be a functional interface
		//TestInterface t2 = () -> {
			
		//};
		
		//추상메서드의 형식
		//1. 매개 변수 유/무
		//2. 반환값 유/무
		
		NoParameterNoReturn pr1 = new NoParameterNoReturn() {
			@Override
			public void call() {
				System.out.println("pr1");
			}
		};
		pr1.call();
		
		NoParameterNoReturn pr2 = () -> {
			System.out.println("pr2");
		};
		pr2.call();
		
		// *** 람다식 구현부 > 문장 딱 1개 > {} 생략 가능
		NoParameterNoReturn pr3 = () -> System.out.println("pr3");
		pr3.call();
		
		// void call(int n)
		ParameterNoreturn pr4 = (int n) -> {
			System.out.println("pr4: " + n);
		};
		pr4.call(10);
		
		//*** 람다식의 매개변수 자료형을 생략이 가능하다.
		ParameterNoreturn pr5 = (n) -> {
			System.out.println("pr5: " + n);
		};
		pr5.call(10);
		pr5.call(20);
		
		//*** 람다식의 매개변수 ()을 생략이 가능하다.
		ParameterNoreturn pr6 = n -> {
			System.out.println("pr6: " + n);
		};
		pr6.call(10);
		pr6.call(20);
		
		ParameterNoreturn pr7 = n -> System.out.println("pr7: " + n);
		pr7.call(10);
		pr7.call(20);

	
		MuntiParameterNoreturn pr8 = (String name, int age) -> {
			System.out.println(name + "," + age);
		};
		pr8.call("홍길동", 20);

		MuntiParameterNoreturn pr9 = (name, age) -> {
			System.out.println(name + "," + age);
		};
		pr9.call("아무개", 20);
		
		// *** 매개변수의 ()는 매개변수가 딱 1개일 때만 생략 가능하다. 
//		MuntiParameterNoreturn pr10 = () -> {
//			System.out.println(name + "," + age);
//		};
//		pr9.call("아무개", 20);
		
		NoParameterReturn pr11 = () -> {
			return 10;
		};
		System.out.println(pr11.call());
		
		NoParameterReturn pr12 = () -> 20;
		System.out.println(pr12.call());
		
		ParameterReturn pr13 = (int a, int b) -> {
			return a + b;
		};
		System.out.println(pr13.call(10, 20));
		
		ParameterReturn pr14 = (a, b) -> a + b;
		System.out.println(pr14.call(30, 40));
		
		
		
		// 배열, 컬렉션 > 정렬 > sort()
		ArrayList<Integer> nums = new ArrayList<Integer>();
		Random rnd = new Random();
		
		for(int i=0; i<10; i++) {
			nums.add(rnd.nextInt(100));
		}
		
		System.out.println(nums);
		
		
		nums.sort(new Comparator<Integer>() {

			@Override
			public int compare(Integer o1, Integer o2) {
				return o2 - o1;
			}
		
		});
		
		nums.sort((o1, o2) -> o2 - o1); 
		System.out.println(nums);
		
		
		
		
		
		
		
		
		
		
	}
	
}

@FunctionalInterface
interface MyInterface {
	void test();
}

class MyClass implements MyInterface {
	@Override
	public void test() {
		System.out.println("MyClass 클래스에서 구현한 메서드");
	}
}

// @FunctionalInterface
interface TestInterface {
	void aaa();
	void bbb();
}

interface NoParameterNoReturn {
	void call();
}

interface ParameterNoreturn {
	void call(int n);
}

interface MuntiParameterNoreturn {
	void call(String name, int age);
}

interface NoParameterReturn {
	int call();
}

interface ParameterReturn {
	int call(int a, int b);
}

















