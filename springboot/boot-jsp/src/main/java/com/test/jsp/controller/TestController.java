package com.test.jsp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.jsp.dto.TestDTO;

@Controller
public class TestController {

	@GetMapping("/test.do")
	public String test(Model model, TestDTO dto) {
		
		//test.do?name=홍길동&age=20
		
		dto.setAge(20);
		
		model.addAttribute("dto", dto);
		
		return "test";
	}
	
}
