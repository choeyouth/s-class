package com.test.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//스프링 컨트롤러 구현
//1. Controller 인터페이스 구현
//2. @Controller 어노테이션 구현


@Controller
@RequestMapping(value="/ex03.do")
public class Ex03Controller {
	
	//요청 메서드?? > 정해진 형식이 없음 > 맘대로~
//	public void aaa() {}
//	public void bbb() { //페이지 작업 > JSP 호출 }
//	public void ccc() {}

	@RequestMapping
	//public String test(HttpServletRequest req) {
	public String test(Model model) {
		
		//업무 코드
		
		//1. req?
		//2. mv? 
		//어디에다 담아서 jsp에 보내는가???
		//매개변수 > 만들면 됨
		//req.setAttribute("num", 100);
		model.addAttribute("num", 100);
		
		//뷰 호출 > ModelAndView + ViewResolver
		return "ex03";
		
	}
}
