package com.test.thymeleaf.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
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
		
		model.addAttribute("flag", true);
		model.addAttribute("age", 20);
		
		return "m04";
	}
	
	@GetMapping("/m05.do")
	public String m05(Model model) {
		
		//콘텐츠 조작(시작태그 ~ 끝태그 사이 내용)
		//1. PCDATA 조작
		//2. 자식 태그 조작
		
		String txt1 = "홍길동입니다.";
		String txt2 = "<b>아무개</b>입니다.";
		String name= "홍길동";
		
		int num = 100;
		AddressDTO dto = mapper.get();
		Map<String, Integer> map = new HashMap<>();
		map.put("kor", 100);
		map.put("eng", 80);
		map.put("math", 90);
		List<String> names = mapper.names();
		List<AddressDTO> list = mapper.list();
		
		model.addAttribute("txt1", txt1);
		model.addAttribute("txt2", txt2);
		model.addAttribute("name", name);
		model.addAttribute("num", num);
		model.addAttribute("dto", dto);
		model.addAttribute("map", map);
		model.addAttribute("names", names);
		model.addAttribute("list", list);
		
		return "m05";
	}
	
	@GetMapping("/m06.do")
	public String m06(Model model) {
		
		//포맷 출력(printf)
		//- 숫자 or 날짜
		int num1 = 1234567;
		double num2 = 12345.6789;
		Calendar now = Calendar.getInstance();
		
		model.addAttribute("num1", num1);
		model.addAttribute("num2", num2);
		model.addAttribute("now", now);
		
		return "m06";
	}
	
	@GetMapping("/m07.do")
	public String m07(Model model) {
		
	//Link URL Expression, 링크 주소 표현식
	//- @{}
	//- 링크의 URL을 출력하는 역할
	//- *** 매개변수에 대한 처리가 용이하다. (QueryString)
		
		int seq = 10;
		String mode = "add"; //add vs reply
		
		model.addAttribute("seq", seq);
		model.addAttribute("mode", mode);
		
		return "m07";
	}
	
	@GetMapping("/m08.do")
	public String m08(Model model) {
		
		//제어문
		int num1 = 10;
		int num2 = 5;
		String mode = "add";
		List<String> names = mapper.names();
		List<AddressDTO> list = mapper.list();
		
		model.addAttribute("num1", num1);
		model.addAttribute("num2", num2);
		model.addAttribute("mode", mode);
		model.addAttribute("names", names);
		model.addAttribute("list", list);
		
		return "m08";
	}
}
