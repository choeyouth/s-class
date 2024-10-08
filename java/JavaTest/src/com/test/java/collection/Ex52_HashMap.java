package com.test.java.collection;

import java.util.ArrayList;
import java.util.HashMap;

public class Ex52_HashMap {

	public static void main(String[] args) {
		
		/*
		
			List > ArrayList
			Map > HashMap
			
			ArrayList
			- 요소 접근 > 첨자(index) 사용 > 방 번호 사용
			- 순서가 있는 집합(순서 == 방 번호)
			    ex) 1강의실, 2강의실, 3강의실..
			- 스칼라 배열(scala array)
			- 요소 = 첨자(index) + 값(value)
			- 첨자(index)는 유일하다.
			- 값(value)은 중복이 가능하다.
			
			HashMap
			- 요소 접근 > 키(Key) 사용 > 방 이름 사용, 방 번호(X)
			- 순서가 없는 집합
			    ex) 햇님반, 달님반, 별님반
			- 연관 배열, 사전 구조(Ditionary)
			    - Apple(Key) ; 사과, 나무에 열리는 열매 중 하나(Value)
			- 요소 = 키(key) + 값(value)
			- 키(key)는 유일하다.
			- 값(value)은 중복이 가능하다.
		
		
		*/
		
		//m1(); //학생 1명 > 국어, 영어, 수학 점수 저장 > 어떤 데이터 집합?
		m2(); // HashMap 사용법
		

		
		
		
		
	}//main

	private static void m2() {

		HashMap<String, Integer> map1 = new HashMap<>();
		
		map1.put("방이름", 100);
		
		HashMap<Boolean, String> map2 = new HashMap<>();
		
		map2.put(true, "참");
		map2.put(false, "거짓");
		
		HashMap<Integer, String> map3 = new HashMap<>();
		
		map3.put(1, "하나");
		map3.put(2, "둘");
		
		System.out.println(map3.get(1));
		// HashMap을 사용하는 이유가 없음
		
		HashMap<String, String> map = new HashMap<>();
		
		//1. 요소 추가
		map.put("red", "빨강");
		map.put("yellow", "노랑");
		map.put("blue", "파랑");
		
		//2. 요소 개수
		System.out.println(map.size());
		System.out.println(map); //red=빨강 > Entry
		
		//3. 요소 읽기
		System.out.println(map.get("red"));
		System.out.println(map.get("yellow"));
		System.out.println(map.get("blue"));
		// 없는 방의 키를 입력하면 null 출력
		
		//4. 요소 수정
		// - key: 식별자(수정 불가)
		// - value: 값(수정 가능)
		map.put("yellow", "옐로우");
		System.out.println(map); //{red=빨강, blue=파랑, yellow=옐로우}
		
		//5. 요소 삭제
		// - 방번호(X) -> Shift 발생 X
		map.remove("yellow");
		System.out.println(map.get("yellow")); //null
		System.out.println(map.size()); //2
		
		// 6. 요소 검색
		// - ArrayList.indexOf()
		// - HashMap.indexOf > X (방 번호와 관련된 행동이 없음)
		System.out.println(map.containsKey("red")); //true
		System.out.println(map.containsValue("빨강")); //true
		
		// 7. 초기화
		map.clear();
		System.out.println(map); //{}
		
	}

	private static void m1() {
		
		// 학생 1명 > 국어, 영어, 수학 점수 저장 > 어떤 데이터 집합?
		
//		1. 배열
//		2. ArrayList
//		3. HashMap
//		4. Class
		
		//1. 배열
		// - 집합
		// - 첨자는 의미가 없다. > 각각의 방이 무슨 데이터인지 파악이 힘들다.
		int[] s1 = new int[3];
		
		s1[0] = 100;
		s1[1] = 90;
		s1[2] = 80;
		
		System.out.println(s1[0] + s1[1] + s1[2]);
		
		
		//2. ArrayList
		// - 집합
		// - 방 번호가 무슨 과목???
		
		ArrayList<Integer> s2 = new ArrayList<Integer>();
		
		s2.add(100);
		s2.add(90);
		s2.add(80);
		
		System.out.println(s2.get(0) + s2.get(1) +s2.get(2));
		
		
		//4. Class
		Score s3 = new Score(100, 90, 80);
		
		s3.setMath(88); //요소의 이름을 알 수 있음 
		
		System.out.println(s3.getTotal());
		
		
		
		//3. HashMap
		HashMap<String, Integer> s4 = new HashMap<String, Integer>();
		
		s4.put("kor", 100);
		s4.put("eng", 90);
		s4.put("math", 80);
		
		System.out.println(s4.get("kor") + s4.get("eng") + s4.get("math"));
		
		
		
		
		
	}
	
}//class

class Score {
	
	private int kor;
	private int eng;
	private int math;
	
	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}
	
	public Score() {
		this.kor = 0;
		this.eng = 0;
		this.math = 0;
	}
	
	public Score(int kor, int eng, int math) {
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}
	
	public int getTotal() {
		return this.kor + this.eng + this.math;
	}
	
}



















