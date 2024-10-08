package com.test.java.obj;

public class Ex34_Constructor {
	
	public static void main(String[] args) {
		
		/*
		
			생성자, Constructor
			- (특수한 목적을 가지는)메서드
			- 객체의 멤버(변수)를 초기화하는 전용 메서드
			
			자료형 객체명 = new 생성자;
			
			Book b1 = new Book();
		
		
		*/
		
		// Box() > 메서드 호출 구문(O)
		
		// 호출 순서 
		// 1. new > 객체 생성 연산자 
		// 2. Box() 
		Box b1 = new Box();
		
		b1.setSize("대형");
		b1.setWeight(50);
		
		// 사이즈(null), 무게(0)
		System.out.println(b1.info());
		
		// b1.Box(); // 생성자는 평생 단 1회 호출이 가능하다. (객체 생성 시)
		
		
		b1.setSize("중형");
		b1.setWeight(200);
		// 초기화보다 수정의 역할을 함 
		
		
		// [요구사항] "대형" + 100 > 1000개씩
		Box b2 = new Box();

		//b2.setSize("대형");
		//b2.setWeight(100);
		// -> 비효율적인 방법 
		// 반복적인 초기화는 생성자 사용
		
		System.out.println(b2.info());
		
		// 가끔씩 > "소형" + 50 > 10개씩
		Box b3 = new Box();

		b3.setSize("소형");
		b3.setWeight(50);
		
		
		// [요구사항] "대형" + 100 > 500개씩
		// 	   		  "소형" + 50 > 500개씩
		
		Box b4 = new Box("소형", 50);
		Box b5 = new Box("중형"); // 무게 지정 x
		Box b6 = new Box(30); // 크기 지정 x
		
		
		
		
	}
	
}

class Box {
	
	private String size;
	private int weight;
	
	// 메서드 > 생성자 > 기본 생성자(Default)
	// 1. 메서드명 == 클래스명
	// 2. 반환타입 > 없음 > return 소유 불가능  
	public Box() {
		//this.size = "대형";
		//this.weight = 100;
		//this(); // 객체 내부에서 생성자를 호출하는 방법
		this("대형", 100);
	}
	
	
	// 메서드 오버로딩 > 생성자 오버로딩 
	public Box(String size, int weight) {
		
		if (!(this.size.equals("대형") 
			|| this.size.equals("중형") 
			|| this.size.equals("소형"))) {
			return;
		}
		
		if (weight <= 0) {
			return;
		}
		
		this.size = size;
		this.weight = weight;
	}
	
	public Box(String size) {
		//this.size = size;
		//this.weight = 0;
		this(size, 0);
	}
	
	public Box(int weight) {
		//this.weight = weight;
		//this.size = null;
		this(null, weight);
	
	}
	
	
	
	
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	
	public String info() {
		
		return String.format("사이즈(%s), 무게(%d)"
							, this.size, this.weight);
		
	}
	
}
