package com.test.java.lambda;

import java.util.Calendar;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.BiPredicate;
import java.util.function.BinaryOperator;
import java.util.function.BooleanSupplier;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.IntConsumer;
import java.util.function.IntToDoubleFunction;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.function.UnaryOperator;

public class Ex64_Lambda {
	
	public static void main(String[] args) {
		
		/*
			
			람다식 > 익명 객체의 추상 메서드 < 인터페이스 참조 변수 
			- 람다식을 사용하려면 결국 인터페이스가 필요하다!!
			
			함수형 인터페이스(Functional Interface)
			- 평범한 인터페이스
			- 추상 메서드를 1개 소유
			- 목적 > 람다식을 저장하기 위한 인터페이스
			
			1. 표준 API 함수형 인터페이스 > JDK 제공
			2. 사용자 정의 함수형 인터페이스 > 개발자가 직접 선언(Ex63)
			
			표준 API 함수형 인터페이스
			
			1. Consumer
			    - Consumer<T>
			    - BiConsumer<T, U>
			    - ..
			    - 매개변수O, 반환값X > 추상 메서드를 제공한다.
			2. Supplier
			    - Supplier<T>
			    - …
			    - 매개변수X, 반환값O > 추상 메서드를 제공한다.
			3. Funtion
			    - Funtion<T, R>
			    - BiFuntion<T, U, R>
			    - ..
			    - 매개변수O, 반환값O > 추상 메서드를 제공한다.
			4. Operator
			    - Funtion 하위셋
			    - UnaryOperator<T>
			    - BinaryOperator<T>
			    - ..
			    - 매개변수O, 반환값O > 추상 메서드를 제공한다.
			5. Predicate
			    - Funtion 하위셋
			    - Predicate<T>
			    - BiPredicate<T, U>
			    - 매개변수O, 반환값O > 추상 메서드를 제공한다.

		*/
		
		
		/*
		
		
			람다식 + 함수형 인터페이스

			람다식
			- 익명 객체의 익명 메서드(추상 메서드 구현)를 간단한 표기법으로 선언하는 표현식
			- 고정으로 반복되는 구문을 제거
			- 매개변수 or 구현부를 최소화 표현
			
			함수형 인터페이스
			- 추상 메서드를 1개만 가지는 익명 객체를 저장하는 인터페이스
			- 람다식을 저장하는 인터페이스(***)
			
			표준 API 함수형 인터페이스
			- 자바에서 제공하는 람다식을 저장하기 위한 인터페이스
			- 여러가지 형태의 추상 메서드를 선언한 인터페이스들..
			- 람다식을 사용하기 위해 추가로 인터페이스를 선언하지 않아도 되게 비용을 절감
			
			1. Consumer
			- 반환값X, 매개변수O > 추상 메서드
			- void Consumer<T>.accept(인자);
			
			2. Supplier
			- 반환값O, 매개변수X > 추상 메서드
			- 반환값 Supplier<T>.get();
			
			3. Function
			    - 반환값O, 매개변수O > 추상 메서드
			    
			4. Operator
				- 반환값O, 매개변수O > 추상 메서드
				- Function 하위셋
				
			5. Predicate
				- 반환값O, 매개변수O > 추상 메서드
				- Function 하위셋
		
		*/
		
		//m1(); //Consumer
		//m2(); //Supplier
		//m3(); //Function
		//m4(); //Operator
		m5(); //Predicate
		
		
	}

	private static void m5() {

		// Predicate
		// - 매개변수를 전달하면 처리 후 반환값을 돌려주는 업무를 구현하는 인터페이스
		// - testXXX() 추상 메서드 제공
		// - 반드시 반환값이 Boolean이다.
		
		Function<Integer, Boolean> f1 = num -> num > 0;
		System.out.println(f1.apply(10));
		System.out.println(f1.apply(-10));
		
		Predicate<Integer> p1 = num -> num > 0;
		System.out.println(p1.test(10));
		System.out.println(p1.test(-10));
		
		Predicate<Integer> p2 = age -> age >= 18;
		System.out.println(p2.test(20));
		
		BiPredicate<String, String> p3 = (s1, s2) -> s1.length() > s2.length();
		System.out.println(p3.test("홍길동님", "홍길동"));
		
		
		
	}

	private static void m4() {

		// Operator
		// - 매개변수를 전달하면 처리 후 반환값을 돌려주는 업무를 구현하는 인터페이스
		// - apply() 추상 메서드 제공
		// - 추상 메서드의 매개변수와 변환값의 자료형이 동일하다. 
		
		BiFunction<Integer, Integer, Integer> f1 = (a, b) -> a + b;
		
		BinaryOperator<Integer> o1 = (a, b) -> a + b;
		
		System.out.println(f1.apply(10, 20));
		System.out.println(o1.apply(10, 20));
		
		UnaryOperator<Integer> o2 = a -> a * a;
		System.out.println(o2.apply(5));
		
		
		
	}

	private static void m3() {
 
		// Function
		// - 매개변수를 전달하면 처리 후 반환값을 돌려주는 업무를 구현하는 인터페이스
		// - apply() 추상 메서드 제공
		
		Function<Integer, Boolean> f1 = num -> num > 0;
		System.out.println(f1.apply(10));
		System.out.println(f1.apply(-10));
		
		Function<String, Integer> f2 = str -> str.length();
		System.out.println(f2.apply("홍길동"));
		System.out.println(f2.apply("안녕하세요. 홍길동입니다."));
		
		BiFunction<Integer, Integer, String> f3
			= (a, b) -> {
				
				if(a > b) {
					return "크다";
				} else if(a < b) {
					return "작다";
				} else {
					return "같다";
				}
			};
		
		System.out.println(f3.apply(10, 5));
			
		IntToDoubleFunction f4 = num -> num * 1.0;
		System.out.println(f4.applyAsDouble(10));
		
		
		
		
	}

	private static void m2() {
		
		// Supplier
		// - 매개변수 없이 반환값을 돌려주는 업무를 구현하는 인터페이스 
		// - getXXX() 추상 메서드 제공
		
		Supplier<Integer> s1 = () -> { return 100; };
		Supplier<Integer> s2 = () -> 100;
		System.out.println(s1.get());
		
		Supplier<String> s3 = () -> "홍길동";
		System.out.println(s3.get());
		
		Supplier<Integer> s4 = () -> {
			Calendar now = Calendar.getInstance();
			return now.get(Calendar.HOUR_OF_DAY);
		};
		System.out.println(s4.get());
		
		BooleanSupplier s5 = () -> true;
		System.out.println(s5.getAsBoolean());
		
	}

	private static void m1() {
		// Consumer
		//- 매개변수를 받아서 소비하는 업무를 구현하는 인터페이스
		//- acceptXXX() 추상 메서드 제공 
		
		
		MyConsumer m1 = num -> System.out.println(num);
		m1.test(100);
		
		//java.util.funtion
		Consumer<Integer> c1 = num -> System.out.println(num);
		c1.accept(100); //인터페이스를 만드는 부담을 줄임
		c1.accept(200); 
		
		Consumer<Integer> c2 = num -> System.out.println(num * num);
		c2.accept(5);
		
		Consumer<String> c3 = str -> System.out.println(str.length());
		c3.accept("홍길동");
		
		Consumer<Integer> c4 = count -> {
			
			for(int i=0; i<count; i++) {
				System.out.println(i);
			}
			System.out.println();
			
		};
		c4.accept(10);
	
	
		Consumer<Member> c5 = m -> {
			System.out.println(m.getName());
			System.out.println(m.getAge());
		};
		c5.accept(new Member("홍길동", 20));
	
		
		BiConsumer<String, Integer> bc1 = (name, age) -> {
			System.out.println(name + "," + age);
		};
		bc1.accept("아무개", 22);
		
		BiConsumer<Integer, Integer> bc3 = (a, b) -> System.out.println(a + b);;
		bc3.accept(100, 200);
		
		
		//Consumer<Integer> ic1;
		IntConsumer ic1 = num -> System.out.println(num);
		ic1.accept(10);
		
		
		
		
	}
	
	

}

//람다식을 저장하기 위해서 선언한 인터페이스
@FunctionalInterface
interface MyConsumer {
	void test(int num);
}


class Member {
	private String name;
	private int age;
	
	public Member(String name, int age) {
		this.name = name;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return this.name + ":" + this.age;
	}
	
	@Override
	public int hashCode() {
		return (this.name + this.age).hashCode();
	}
	
	@Override
	public boolean equals(Object obj) {
		return this.hashCode() == obj.hashCode();
	}
	
}






