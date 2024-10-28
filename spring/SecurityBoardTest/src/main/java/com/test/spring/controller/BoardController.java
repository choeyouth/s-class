package com.test.spring.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.spring.dao.BoardDAO;
import com.test.spring.dto.BoardDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

	private final BoardDAO dao;

	@GetMapping("/list.do")
	public String list(Model model) {
		
		List<BoardDTO> list = dao.list();
		
		model.addAttribute("list", list);
		
		return "board/list";
	}

	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/add.do")
	public String add(Model model) {
		
		return "board/add";
	}
	
	@PreAuthorize("isAuthenticated()")	
	@PostMapping("/addok.do")
	public String addok(Model model, BoardDTO dto) {
		
		int result = dao.add(dto);
		
		return "redirect:/board/list.do";
	}

	@GetMapping("/view.do")
	public String view(Model model, String seq) {
		
		BoardDTO dto = dao.get(seq);
		
		model.addAttribute("dto", dto);
		
		return "board/view";
	}
	
	//로그인한 사람이 본인의 글만 수정이 가능해야함 
	@PreAuthorize("isAuthenticated() and (principal.username == #id or hasRole('ROLE_ADMIN'))") //#id > 바인딩	
	@GetMapping("/edit.do") 
	public String edit(Model model, String seq, String id) { 
		
		BoardDTO dto = dao.get(seq);
		
		model.addAttribute("dto", dto);
		
		return "board/edit"; 
	}
	
	//edit에서 이미 걸러짐 
	@PreAuthorize("isAuthenticated()")	
	@PostMapping("/editok.do") 
	public String editok(Model model, BoardDTO dto) { 
		
		int result = dao.edit(dto);
		
		return "redirect:/board/view.do?seq=" + dto.getSeq(); 
	}

	@PreAuthorize("isAuthenticated() and (principal.username == #id or hasRole('ROLE_ADMIN'))") //#id > 바인딩	
	@GetMapping("/del.do")
	public String del(Model model, String seq, String id) {
		
		model.addAttribute("seq", seq);
		
		return "board/del";
	}
	
	@PreAuthorize("isAuthenticated()")	
	@PostMapping("/delok.do")
	public String delok(Model model, BoardDTO dto) {
		
		int result = dao.del(dto);
		
		return "redirect:/board/list.do";
	}
	
}
