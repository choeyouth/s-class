package com.test.mybatis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.mybatis.dao.MyBatisDAO;
import com.test.mybatis.dto.AddressDTO;


@Controller
public class MyBatisController {

	//Controller > (의존) > DAO > (의존) > SqlSessionTemplate
	@Autowired
	private MyBatisDAO dao;
	
	@GetMapping(value="/test.do")
	public String test() {
		
		System.out.println(dao == null); //false
		
		return "list";
	}
	
	//반환값(X), 매개변수(X)
	@GetMapping(value="/m1.do")
	public String m1() {
		
		//dao는 이미 의존주입을 통해 만들었기 때문에 더이상 만들지 않아도 됨 
		//사용만 하면 됨
		dao.m1(); 
		
		return "list";
	}
	
	//반환값(X), 매개변수(O)
	@GetMapping(value="/m2.do")
	public String m2(Model model, String seq) {
		
		//삭제
		//- delete from tblAddress where seq = 12
		
		int result = dao.m2(seq);
		
		model.addAttribute("result", result);
		
		return "list";
	}
	
	//반환값(X), 매개변수(O)
	@GetMapping(value="/m3.do")
	public String m3() {
		
		//수정
		//10	독수리	3	서울시 강북구 미아동	m
		
		AddressDTO dto = new AddressDTO();
		dto.setSeq("10");
		dto.setAge(5);
		dto.setAddress("서울시 강남구 대치동");
		dto.setGender("f");
		
		int result = dao.m3(dto);
		
		System.out.println(result);
		
		return "list";
	}
	
	
}










