package com.test.begin.di2;

public class Service {

	//의존 주입 도구
	//1. 생성자
	//2. Setter
	private Hong hong;
	
	public Service(Hong hong) {
		this.hong = hong;
	}
	
	public void setHong(Hong hong) {
		this.hong = hong;
	}
	
	public void work() {
		
		//기존 방식
		//Hong hong = new Hong();
		//hong.coding();
		
		//DI
		hong.coding();
		
	}
}
