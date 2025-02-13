package com.test.jpa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.jpa.repository.AddressRepository;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AddressController {

	private final AddressRepository addressRepository;
	
	@GetMapping("/m1.do")
	public String m01(Model model) {
		
		return "result_dto";
	}
	
	
}
