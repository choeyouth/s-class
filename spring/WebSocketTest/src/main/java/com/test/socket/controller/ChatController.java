package com.test.socket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {

	@GetMapping("/index.do")
	public String index() {
		
		return "index";
	}
	
	@GetMapping("/chat.do")
	public String chat() {
		
		return "chat";
	}
}
