package com.test.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Ex07Controller {

	@GetMapping("/ex07.do")
	public String ex07() {

		return "ex07";
	}
	
}
