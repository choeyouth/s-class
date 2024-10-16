package com.test.begin.di3;

import java.io.File;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
 
	public static void main(String[] args) {
		
		//Hong 객체를 누가 만드느냐? + 의존 주입 구현O
		//1. 개발자가 직접 생성(di2)
		//Hong hong = new Hong(); //의존 객체
		
		
		//2. 스프링을 통해서 생성 > 스프링 빈 생성
		//- di3.xml 읽어오기

		//File file = new File(".");
		//System.out.println(file.getAbsolutePath());
		
		//절대경로
		//ApplicationContext context = new ClassPathXmlApplicationContext("/src/main/java/com/test/begin/di3/di3.xml");
		//상대경로
		ApplicationContext context = new ClassPathXmlApplicationContext("com/test/begin/di3/di3.xml");
		
		//1. <bean id="hong" class="com.test.begin.di3.Hong"></bean>
		//2. new Hong();
		//3. 객체 반환
		
		//== Hong hong = new Hong();
		Hong hong = (Hong)context.getBean("hong");
		
		
		//Service service = new Service();
		Service service = (Service)context.getBean("service");
		service.work();
		
		Hong h1 = (Hong)context.getBean("h1");
		h1.coding();
		
		Hong h2 = (Hong)context.getBean("h2");
		
		
		
	}
}
