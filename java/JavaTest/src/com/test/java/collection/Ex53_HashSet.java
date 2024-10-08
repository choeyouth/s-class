package com.test.java.collection;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;

public class Ex53_HashSet {
	
	public static void main(String[] args) {
		                                                                    
		/*                                   

			1. List
			    - 순서가 있는 집합
			    - 첨자(방 번호)
			    - 데이터 중복을 허용
			
			2. Map
			    - 순서가 없는 집합
			    - 키(방 이름)
			    - 데이터 중복을 허용
			
			3. Set
			    - 순서가 없는 집합
				- 식별자가 없다. (방 번호X, 방 이름X) > 방을 구분할 수 없다.
				- 데이터 중복을 허용하지 않음(★★★)

			집합 선택? 
			1. 순수 배열 비슷한 상황 > ArrayList
			2. 요소 구분 > 이름 > 가독성 > HashMap
			3. 요소 중복 허용 X > HashSet
			
		*/
		
		//m1(); // 사용 방법
		//m2(); // 다른 것과 차이 // 로또 번호
		//m3(); // List vs Set // 마트 경품 추첨
		m4(); // ★★★ Set + Object
		
	}//main

	private static void m4() {
		
		// ★★★ Set + Object
		
		HashSet<String> set1 = new HashSet<String>();
		
		set1.add("홍길동");
		set1.add("아무개");
		set1.add("하하하");
		
		set1.add("홍길동"); // 중복 X (boolean으로 구분함 > 중복 false / 중복X > true)
		
		System.out.println(set1);
		
		
		//Member[] list;
		//ArrayList<Member> list;
		
		// 중복된 회원(Member) > 배제
		HashSet<Member> set2 = new HashSet<Member>();
		
		set2.add(new Member("홍길동", 20)); //해시코드로 구분
		set2.add(new Member("아무개", 21));
		set2.add(new Member("하하하", 22));
		
		set2.add(new Member("홍길동", 20)); //객체.equals(객체)
		
		System.out.println(set2); //[홍길동(20), 홍길동(20), 아무개(21), 하하하(22)]
		System.out.println();
		
		int a1 = 10;
		int a2 = 10;
		System.out.println(a1 == a2); //true
		
		Member m1 = new Member("홍길동", 20);
		Member m2 = new Member("아무개", 21);
		Member m3 = new Member("홍길동", 20);
		
		// 주소값(참조형) 변수의 비교는 연산자 사용하지 말것 > equals
		System.out.println(m1 == m2); //false
		System.out.println(m1.equals(m2)); //false
		
		System.out.println(m1 == m3); //false
		System.out.println(m1.equals(m3)); //true
		
		System.out.println(m1); //Member@782830e
		System.out.println("m1: " + m1.hashCode()); //m1: 498603628
		System.out.println("m2: " + m2.hashCode()); //m2: 863217387
		System.out.println("m3: " + m3.hashCode()); //m3: 498603628
		// == 서로 다른 객체 
		
		
		
		
	}

	private static void m3() {
		
		// List vs Set
		// 마트 경품 추첨
		// - 중복 당첨 허용 O
		// - 중복 당첨 허용 X
		
		String[] list = { "홍길동", "아무개", "하하하", "호호호"
				, "강아지", "고양이", "병아리", "호랑이", "사자", "햄스터"  };
		
		Random rnd = new Random();
		
		//당첨자 > 배열 저장
		// - 중복 당첨 허용 O
		ArrayList<String> result1 = new ArrayList<String>();
		
		for(int i=0; i<5; i++) {
			result1.add(list[rnd.nextInt(list.length)]);
		}
		
		System.out.println(result1);
		// 방 번호로 값을 저장 > 중복 당첨 허용 
		
		//당첨자 > 배열 저장
		// - 중복 당첨 허용 X
		HashSet<String> result2 = new HashSet<String>();
		
		while (result2.size() < 5) {
			result2.add(list[rnd.nextInt(list.length)]); // 0~9
		}

		System.out.println(result2);
		
		
		
		
		
		
	}

	private static void m2() {
		
		// 로또 번호 > 난수 + 유일한 숫자들만..
		
		//6 + 1~45
		
		
		// 난수 만들기 방법 1.
//		for(int i=0; i<10; i++) {
//			System.out.println((int)(Math.random()*45) + 1);
//		}
		
		// 난수 만들기 방법 2.
		Random rnd = new Random();
		
//		for(int i=0; i<10; i++) {
//			//System.out.println(rnd.nextDouble());
//			//System.out.println(rnd.nextInt()); // -128억 ~ 127억
//			System.out.println(rnd.nextInt(10)); // 0~9
//		}
		
		
		ArrayList<Integer> lotto = new ArrayList<Integer>();
		
//		for (int i=0; i<6; i++) {
//			int n = rnd.nextInt(45) + 1;
//			
//			// 중복 검사
//			if (check(lotto, n)) {
//				lotto.add(n);
//			} else {
//				i--; // for문을 한 바퀴 더 돌게 함 
//			}
//		}
		
		while (lotto.size() < 6) {
			
			int n = rnd.nextInt(45) + 1;
			
			// 중복 검사
			if (check(lotto, n)) {
				lotto.add(n);
				
			}
		}
		
		System.out.println(lotto);
		System.out.println();
		
		HashSet<Integer> lotto2 = new HashSet<Integer>();
		
		while (lotto2.size() < 6) {
			int n = rnd.nextInt(45) + 1;
			
			lotto2.add(n);
 			
		}
		
		System.out.println(lotto2);
		
		// 중복 검사를 할 필요 X 
		// > HashSet은 중복 값을 허용하지 않기 때문에
		
		
		
		
		
		
	}

	private static boolean check(ArrayList<Integer> lotto, int n) {

		for (int i=0; i<lotto.size(); i++) {
			if (lotto.get(i) == n) {
				return false; // 중복 O
			}
		}
		
		return true; // 유일 O
	}

	private static void m1() {

		HashSet<String> set = new HashSet<String>();
		
		System.out.println(set); //[]
		
		//1. 요소 추가
		set.add("사과");
		set.add("딸기");
		set.add("바나나");
		System.out.println(set); // [사과, 바나나, 딸기] > 순서가 상관 없음 (마음대로 정렬함)
		
		//2. 요소 개수
		System.out.println(set.size()); //3
		
		//3. 요소 읽기 > 메서드 제공 안 함
		// - 읽기 도구 제공 > Iterator == 향상된 for문 
		
		// set으로부터 이터레이터를 얻어낸다.
		Iterator<String> iter = set.iterator();
		
//		System.out.println(iter.hasNext()); //읽어올 다음 데이터가 있나? > true
//		System.out.println(iter.next()); //읽어라 > 사과
//		
//		System.out.println(iter.hasNext()); // true
//		System.out.println(iter.next()); // 바나나
//		
//		System.out.println(iter.hasNext()); // true
//		System.out.println(iter.next()); // 딸기
//		
//		System.out.println(iter.hasNext()); // false
 		//System.out.println(iter.next()); // 읽어올 데이터가 없을 때 오류 발생 > EOF(End of File)
		
		while (iter.hasNext()) {
			System.out.println(iter.next());
		}
		
		System.out.println("다시 읽기");
		
		while (iter.hasNext()) {
			System.out.println(iter.next());
		}
		// 불가능 > 화살표 위치 : EOF
		// - 화살표는 전진만 가능함 (재사용 불가)
		
		iter = set.iterator(); // 새로운 반복기 생성 > 커서는 BOF 시작
		
		while (iter.hasNext()) {
			System.out.println(iter.next());
		}
		
		System.out.println();
		
		//향상된 for > 내부에 이터레이터 구현
		for(String item : set)  {
			System.out.println(item);
		}
		
		for(String item : set)  {
			System.out.println(item);
		}
		//- 여러번 반복해서 읽기가 가능함
	
		System.out.println(set); //[사과, 바나나, 딸기]
		set.add("사과");
		System.out.println(set); //[사과, 바나나, 딸기]
		
	}

}//class

class Member {
	
	private String name;
	private int age;
	
	
	public Member(String name, int age) {
		
		this.age = age;
		this.name = name;
	}
	
	public String getName() {
		return name;
	}


	public int getAge() {
		return age;
	}
	
	@Override
	public String toString() {
		
		return String.format("%s(%d)", this.name, this.age);
	}
	
	@Override
	public int hashCode() {
		
//		System.out.println("홍길동20".hashCode()); //498603628
//		System.out.println("홍길동20".hashCode()); //498603628
//		System.out.println("아무개25".hashCode()); //863217391
//		
		return (this.name + this.age).hashCode();
	}
	
	@Override
	public boolean equals(Object obj) {

		//이름과 나이가 동일하면 같은 객체로 판단하겠다.
		
		return this.hashCode() == obj.hashCode();
	}
	
}























