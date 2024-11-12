package com.test.begin.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

	@GetMapping("/hello")
	public String hello() {
		
		return "안녕하세요. 스프링 부트입니다.";
	}
	
}
