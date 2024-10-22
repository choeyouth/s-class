package com.test.tiles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping(value="/log.do")
	public String index() {
		
		return "admin.log";
	}
	
	@GetMapping(value="/setting.do")
	public String setting() {
		
		return "admin.setting";
	}
}
