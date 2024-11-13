package com.test.thymeleaf.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.thymeleaf.domain.AddressDTO;
import com.test.thymeleaf.mapper.AddressMapper;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ThymeleafController {

	private final AddressMapper mapper;
	
	@GetMapping("/result.do")
	public String result(Model model) {
		
		
		//"templates/" + "result" + ".html"
		return "result";
	}
	
	/*
	@GetMapping("/m.do")
	public String m(Model model) {
		
	}
	*/
	
	@GetMapping("/m01.do")
	public String m01(Model model) {
		
		//단일값 전달
		int num = mapper.num();
		String txt = mapper.txt();
		
		//객체 전달(dto, map)
		AddressDTO dto = mapper.get();
		
		Map<String, Integer> map = new HashMap<>();
		map.put("kor", 100);
		map.put("eng", 90);
		map.put("math", 80);
		
		model.addAttribute("num", num);
		model.addAttribute("txt", txt);
		model.addAttribute("dto", dto);
		model.addAttribute("map", map);
		
		return "m01";
	}
	
	@GetMapping("/m02.do")
	public String m02(Model model) {
		
		//스프링 메시지, Spring Message
		//- 프로젝트 내에서 자주 사용되는(반복되는) 문자열
		//- 다국어 지원 프로그램에서 자주 사용
		
		return "m02";
	}
	
	
	@GetMapping("/m03.do")
	public String m03(Model model) {
		
		
		//연산자
		int a = 10;
		int b = 3;
		String name = "홍길동";
		
		model.addAttribute("a", a);
		model.addAttribute("b", b);
		model.addAttribute("name", name);
		
		return "m03";
	}
	
	@GetMapping("/m04.do")
	public String m04(Model model) {
		
		//타임리프 > HTML 속성 조작
		model.addAttribute("num", mapper.num());
		model.addAttribute("txt", mapper.txt());
		model.addAttribute("color", "cornflowerblue");
		
		return "m04";
	}
}
