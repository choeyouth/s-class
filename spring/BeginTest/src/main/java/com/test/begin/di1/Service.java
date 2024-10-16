package com.test.begin.di1;

public class Service {

	public void work() {
		
		
		//Service > Hong 필요 == 의존 객체
		//Hong이 필요해서 직접 Hong을 만들어서 사용
		Hong hong = new Hong();
		hong.coding();
		
	}
}
