package com.test.security.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {

	//21.1 
	@GetMapping(value="/accesserror.do")
	public String accesserror(Model model, Authentication auth) {
	
		model.addAttribute("auth", auth);
		
		return "auth/accesserror";
	}
	
	//22 
	@GetMapping(value="/customlogin.do")
	public String customlogin() {
		
		return "auth/customlogin";
	}
	
	//24 
	@GetMapping(value="/customlogout.do")
	public String customlogout() {
		
		return "auth/customlogout";
	}
	
}
