package com.test.mybatis.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.mybatis.dao.AddressDAO;
import com.test.mybatis.dto.AddressDTO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class AddressController {

	private final AddressDAO dao;
	
//	@GetMapping("/address")
//	public AddressDTO get(String seq) {
//		
//		return dao.get(seq);
//	}

	@GetMapping("/address")
	public List<AddressDTO> list() {
		
		return dao.list();
	}

	
}
