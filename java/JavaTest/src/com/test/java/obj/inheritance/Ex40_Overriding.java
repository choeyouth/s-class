package com.test.java.obj.inheritance;

import java.util.Calendar;

public class Ex40_Overriding {

	public static void main(String[] args) {
		
		Time t1 = new Time(2, 30);
		Time t2 = new Time(3, 40);
		
		System.out.println(t1.info());
		System.out.println(t2.info());
		
		System.out.println(t1); // com.test.java.obj.inheritance.Time@73a28541
		System.out.println(t1.toString()); // Object 클래스가 물려준 것
		// 결과가 같음
		// t1을 입력하면 자동으로 두 번째 방식으로 바꿔서 컴파일됨
		
		// Calendar now = new Calendar(); -> 다른 방식.. 나중에 설명
		Calendar now = Calendar.getInstance();
		System.out.println(now);
		System.out.println(now.toString()); // 객체를 찍으면 toString 값을 자동으로 추가해서 출력
		// 주소 값이 아닌 긴... 데이터가 출력됨 -> 즉 오버라이딩 된 것 
		
		
		
	}//main
	
}//class


// 시간 클래스
class Time { // extends Object
	
	private int hour;
	private int min;
	
	public Time(int hour, int min) {
		
		this.hour = hour;
		this.min = min;
		
	}
	
	public String info() {
		return this.hour + ":" + this.min;
	}

	@Override
	public String toString() {
		return "Time [hour=" + hour + ", min=" + min + "]";
		// 결과: Time [hour=2, min=30]
	}
	
	
	// Ctrl + space -> 오버라이딩 할 수 있는 값 추가 
//	@Override //어노테이션(일종의 주석) 
//	public String toString() {
//
//		return this.hour + ":" + this.min;
//	
//	}
	
	// —> info() 의 역할이 toString 을 오버라이딩한 것과 같음
	// —> info() 보다 toString을 활용할 것 
	// 전세계 모든 개발자들이 알고 있기 때문 
	// -> 전달력이 높음 [사용자 경험]
	
	
}
















