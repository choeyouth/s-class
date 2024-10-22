package com.test.tiles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping(value="index.do")
	public String index() {
		
		return "index";
	}
	
	
	@GetMapping(value="test.do")
	public String test() {
		
		System.out.println("test");
		return "test";
	}

}
