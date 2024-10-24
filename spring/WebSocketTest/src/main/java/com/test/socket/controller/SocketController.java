package com.test.socket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SocketController {

	@GetMapping("/socket.do")
	public String socket() {
		
		return "socket";
	}
	
}
