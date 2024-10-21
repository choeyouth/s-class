package com.test.mybatis.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	//반환값(O), 매개변수(1행 1열)
	@GetMapping(value="/m4.do")
	public String m4(Model model) {
		
		//select count(*) from tblAddress
		
		int count = dao.m4();
		
		model.addAttribute("count", count);
		
		return "list";
	}
	
	
	//반환값(O) > 단일값(1행 N열)
	@GetMapping(value="/m5.do")
	public String m5(Model model, @RequestParam(name="seq", defaultValue="1") Integer seq) {
	
		//select * from tblAddress where seq = ? 
		AddressDTO dto = dao.m5(seq); 
		
		model.addAttribute("dto", dto);
		
		return "list";
	}

	//반환값(O) > 다중값(N행 1열)
	@GetMapping(value="/m6.do")
	public String m6(Model model) {

		//select name from tblAddress
		List<String> names = dao.m6();
		
		model.addAttribute("names", names);
		
		return "list";
	}

	//반환값(O) > 다중값(N행 N열)
	@GetMapping(value="/m7.do")
	public String m7(Model model) {
	
		//select * from tblAddress
		
		List<AddressDTO> list = dao.m7();
		
		model.addAttribute("list", list);
		
		return "list";
	}
	
	
	@GetMapping(value="/m8.do") 
	public String m8(Model model, String table) {
		
		//m8.do?table=tblAddress
		//- select count(*) from tblAddress
		
		//m8.do?table=tblUser
		//- select count(*) from tblUser
		
		//데이터가 아닌 식별자가 바뀜
		
		int count = dao.m8(table); 
		
		model.addAttribute("count", count);
		
		return "list";
	}
	
	@GetMapping(value="/m9.do") 
	public String m9(Model model, int age) {
		
		//m9.do?age=25
		//- select * from tblAddress where age > 25
		
		List<AddressDTO> list = dao.m9(age); 
		
		model.addAttribute("list", list);
		
		return "list";
	}
	
	@GetMapping(value="/m10.do") 
	public String m10(Model model, String word) {

		//m10.do?word=검색어
		//- select * from tblAddress where address like '%검색어%'
		
		List<AddressDTO> list = dao.m10(word);
		
		model.addAttribute("list", list);
		
		return "list";
	}
	
	@GetMapping(value="/m11.do") 
	public String m11(Model model, String gender) {
		
		//동적 쿼리
		//1. m11.do?gender=m
		//2. m11.do?gender=f
		//3. m11.do?
		
		//1. select * from tblAddress where gender = 'm'
		//2. select * from tblAddress where gender = 'f'
		//3. select * from tblAddress
		
		List<AddressDTO> list = dao.m11(gender); 
		
		model.addAttribute("list", list);
		
		return "list";
	}
	
	@GetMapping(value="/m13.do") 
	public String m13(Model model, String gender, String word) {
	
		//경우의 수
		//m13.do
		//m13.do?gender=f
		//m13.do?word=역삼
		//m13.do?gender=f?word=역삼
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("gender", gender);
		map.put("word", word);
		
		List<AddressDTO> list = dao.m13(map);
		model.addAttribute("list", list);
		
		return "list";
	}
	
	@GetMapping(value="/m14.do") 
	public String m14(Model model) {

		AddressDTO dto = new AddressDTO();
		dto.setName("사막 여우");
		dto.setAge(3);
		dto.setGender("f");
		dto.setAddress("이집트");
		
		//방금 insert한 레코드의 seq?
		//1. insert
		//2. select max(seq)
		int result = dao.m14(dto);
		
		model.addAttribute("result", result);
		model.addAttribute("dto", dto);
		
		return "list";
	}
	
	@GetMapping(value="/m15.do") 
	public String m15(Model model) {

		//주소 검색: 강아지 and 사자
		//- where name in ('강아지', '사자')

		List<String> search = new ArrayList<String>();
		
		search.add("강아지");
		search.add("사자");
		
		List<AddressDTO> list = dao.m15(search);
		
		model.addAttribute("list", list);
		
		return "list";
	}
}








