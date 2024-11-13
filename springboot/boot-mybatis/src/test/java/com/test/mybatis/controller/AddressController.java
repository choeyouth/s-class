package com.test.mybatis.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.mybatis.domain.AddressDTO;
import com.test.mybatis.service.AddressService;

@Controller
public class AddressController {
	
	private final AddressService service;

	@Autowired
	public AddressController(AddressService service) {
		this.service = service;
	}
	
	@GetMapping("/list.do")
	public String list(Model model) {
		
		List<AddressDTO> list = service.list();	
		
		model.addAttribute("list", list);
		
		return "list";
	}
	
}
