package com.test.mysql.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.mysql.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class TestController {

	private final MemberRepository repo;
	
	@GetMapping("/list")
	public String list(Model model) {
		
		model.addAttribute("list", repo.findAll());
		
		return "index";
	}
	
}
