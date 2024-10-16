package com.test.begin.di3;

public class Service {
	
	//의존 주입 단계
	//1. 의존 객체를 저장할 멤버 변수를 생성한다.
	public Hong hong;
	
	//2. 의존 주입 도구를 생성한다. 
	//- 생성자 or Setter
//	public Service(Hong hong) {
//		this.hong = hong;
//	}
	
	public void setHong(Hong hong) {
		this.hong = hong;
	}
	
	public void work() {
		//자신의 업무 > 일부가 의존 객체를 의존한다.
		//3. 의존 객체를 사용한다. 
		hong.coding();
	}
	
	
 
}
