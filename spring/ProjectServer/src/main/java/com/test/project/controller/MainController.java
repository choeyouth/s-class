package com.test.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/main.do")
	public String main() {
		
		/*
		  	
		  	웹 페이지 제작 방법
		  	1. SSR, Server Side Rendering 
		  		- JSP/Servlet, Spring, Spring Boot
		  		- 페이지를 만드는 데 필요한 모든 데이터와 화면 처리 관련 코드를 서버에서 구현
		  		- 웹페이지 > 출력 집중!!
		  	
		  	2. CSR, Client Side Rendering
		  		- Anqular, Vue, React > Ajax
		  		- 페이지를 만드는 데 필요한 최소한(필수) 처리는 서버에서 구현
		  		- 나머지 웹 페이지 출력과 관련된 모든 업무 > 클라이언트
		  	
		  
		 */
		
		
		return "main";
	}
	
	
}
