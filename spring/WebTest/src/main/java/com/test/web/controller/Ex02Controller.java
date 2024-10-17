package com.test.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.test.web.repository.SpringDAO;

public class Ex02Controller implements Controller {

	//1.
	private SpringDAO dao;
	 
	
	//2. 
	public Ex02Controller(SpringDAO dao) {
		this.dao = dao;
	}
	
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//Controller > DAO 호출(의존) > 의존 객체 
		
		//의존 객체 > 직접 생성 
		SpringDAO dao = new SpringDAO();
		
		int count = dao.getCount();
		
		
		ModelAndView mv = new ModelAndView("ex02"); //생성자 오버로딩 > jsp 이름 넣기

		mv.addObject("count", count);
		
		return mv;
	}
}
