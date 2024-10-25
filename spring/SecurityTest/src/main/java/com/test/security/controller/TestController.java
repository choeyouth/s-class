package com.test.security.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/index.do")
	public String index() {
		
		System.out.println("TestController >>> 모든 사용자 페이지");
		
		return "index";
	}

	@GetMapping("/member.do")
	public String member() {
		
		System.out.println("TestController >>> 회원 전용 페이지");
				
		return "member";
	}

	@GetMapping("/admin.do")
	public String admin() {
		
		System.out.println("TestController >>> 관리자 전용 페이지");
				
		return "admin";
	}
}
