package com.test.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.web.service.TestService;

import lombok.RequiredArgsConstructor;

@Controller
//@NoArgsConstuctor			> 매개변수가 없는 기본 생성자
//@AllArgsConstructor		> 모든 멤버변수를 매개변수로 가지는 생성자
@RequiredArgsConstructor	 // > final 멤버변수만 매개변수로 가지는 생성자 
public class Ex08Controller {

	/*
		
		*** 스프링을 통해 관리되는 객체는 반드시 @Component로 선언되어 있어야 한다.(or XML) + <component-scan>에 패키지가 포함되어야 한다.
		
		의존 주입 
		- XML 사용 방식
		- 어노테이션 방식 
		
		1. 필드 주입, Field Injection
		    - @Autowired 사용
		    - 코드가 간결해진다.
		
		2. Setter 주입
		    - Spring 3.X
		    - @Autowired
		
		3. 생성자 주입
		    - @Autowired
		    - 생성자가 1개일 땐 @Autowired 생략 가능
		    - 의존 객체에 final 적용이 가능하다.(*****) 
	
	*/
	
	
	/*
	//멤버 변수 선언 
	//의존 주입 > 멤버 변수를 통해 관리됨
	@Autowired
	private TestService service;
	
	
	@RequestMapping(value="/ex08_1.do")		
	public String ex08_1(Model model) {
		
		//Controller > (의존 객체) > TestService
		TestService service = new TestService();
			
		service.work();
		String result = service.get();
		
		model.addAttribute("result", result);
		
		
		return "ex08"; 
	}
	
	@RequestMapping(value="/ex08_2.do")		
	public String ex08_2(Model model) {
		
		//Controller > (의존 객체) > TestService
		//TestService service = new TestService();
			
		service.work();
		String result = service.get();
		
		model.addAttribute("result", result);
		
		
		return "ex08"; 
	}
	*/
	
	/*
	
	private TestService service;
	
	@Autowired
	public void setService(TestService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/ex08_3.do")		
	public String ex08_3(Model model) {
		
		//Controller > (의존 객체) > TestService
		//TestService service = new TestService();
			
		service.work();
		String result = service.get();
		
		model.addAttribute("result", result);
		
		
		return "ex08"; 
	}
	
	*/
	
	
	/*
	//의존 주입 구현
	//의존 객체(final)
	private final TestService service;
	
	//주입 도구 > 생성자
	//@Autowired
	//생성자 주입에 한해서 생성자의 오토와이어 생략이 가능하다. (생략해도 주입 가능)
	//단, 생성자가 하나일 때만 가능하다. 
	public Ex08Controller(TestService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/ex08_4.do")		
	public String ex08_4(Model model) {
		
		//Controller > (의존 객체) > TestService
		//TestService service = new TestService();
			
		service.work();
		String result = service.get();
		
		//service = new TestService();
		
		
		model.addAttribute("result", result);
		
		
		return "ex08"; 
	}
	*/
	
	private String data;
	private final TestService service;
	
	@RequestMapping(value="/ex08_5.do")		
	public String ex08_5(Model model) {
		
		//Controller > (의존 객체) > TestService
		//TestService service = new TestService();
			
		service.work();
		String result = service.get();
		
		//service = new TestService();
		
		
		model.addAttribute("result", result);
		
		
		return "ex08"; 
	}
	
}
