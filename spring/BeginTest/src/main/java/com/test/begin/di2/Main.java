package com.test.begin.di2;

public class Main {

	public static void main(String[] args) {
		//[목적] Hong에게 일을 시키자!
		//Main > (의존) > Service > (의존) > Hong

		Hong hong = new Hong();
	
		Service service = new Service(hong); //의존 주입 발생!! DI 발생 
		
		service.work();
		
		
	}
}
