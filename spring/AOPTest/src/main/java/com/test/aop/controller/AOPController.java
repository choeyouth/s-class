package com.test.aop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.aop.dao.AOPDAO;
import com.test.aop.dto.AOPDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AOPController {

	private final AOPDAO dao;
	
	@GetMapping("/list.do")
	public String list(Model model) {
		
		List<AOPDTO> list = dao.list();
		
		model.addAttribute("list", list);
		
		return "list";
	}
	
	@GetMapping("/add.do")
	public String add() {
		return "add";
	}

	@PostMapping("/addok.do")
	public String addok(AOPDTO dto) {
		
		dao.add(dto);
		
		return "redirect:/list.do";
	}

	@GetMapping("/view.do")
	public String view(Model model, String name) {
		
		AOPDTO dto = dao.view(name);
		
		model.addAttribute("dto", dto);
		
		return "view";
	}
}
