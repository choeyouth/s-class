package com.test.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

//JSP Model 2 > (발전) > Spring MVC

//서블릿 역할 
public class Ex01Controller implements Controller {

	//요청 메서드
	//doGet/doPost == handlRequest
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//업무 처리
		
		//JSP 호출
		//RequestDispatcher < forward(req, resp)
//		System.out.println(111);
		
		int count = 100;
		request.setAttribute("count", count);
		
		String id = "hong";
		
		//Model > 계층간 데이터 전송
		//View  > 페이지(JSP)
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("id", id);
		//model에 담는 것과 request에 담는 것과 같은 역할을 함 
		
		//Spring > View Resolver 동작(servlet-context.xml)
		
		//mv.setViewName("/WEB-INF/views/ex01.jsp");
		mv.setViewName("ex01");
		
		return mv;
	}
}
