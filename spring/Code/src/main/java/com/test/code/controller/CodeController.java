package com.test.code.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.code.dao.CodeDAO;
import com.test.code.dto.CodeDTO;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class CodeController {

	private final CodeDAO dao;
	
	@GetMapping(value="/list.do")
	public String list(Model model) {
		
		List<CodeDTO> list = dao.list();
		
		model.addAttribute("list", list);
		
		return "list";
	}

	@GetMapping(value="/add.do")
	public String add(Model model) {
		
		return "add";
	}

	@PostMapping(value="/addok.do")
	public String addok(Model model, CodeDTO dto) {
		
		//1. 데이터 가져오기
		//2. DB 작업 > insert
		//3. 마무리
		
		int result = dao.add(dto);
		
		if (result == 1) {
			return "redirect:/list.do";
		} else {
			return "redirect:/add.do";
		}
	}

	@GetMapping(value="/view.do")
	public String view(Model model, String seq) {
		
		CodeDTO dto = dao.view(seq);
		
		model.addAttribute("dto", dto);
		
		return "view";
	}

}







