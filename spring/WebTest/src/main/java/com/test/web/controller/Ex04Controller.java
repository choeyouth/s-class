package com.test.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/member")
public class Ex04Controller {
	
	@RequestMapping(value="/ex04_1.do")
	public String ex04_1() {
		
		return "ex04_1";
	}
	
	@RequestMapping(value="/ex04_2.do")
	public String ex04_2() {
		
		
		
		
		return "ex04_2";
	}
}
