package com.test.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.web.model.AddressDTO;

@Controller
public class Ex05Controller {

	
	@RequestMapping(value="/ex05.do")
	public String ex05() {
		
		return "ex05";
	}
	
	
//	@RequestMapping(value="/ex05ok.do", method = RequestMethod.POST)
//	public String ex05ok(String num, Model model) {
//	
////		String data = req.getParameter("data");
//		
//		System.out.println(num);
////		req.setAttribute("data", data);
//		model.addAttribute("data", num);
//		
//		return "ex05ok";
//	}

/*
	@RequestMapping(value="/ex05ok.do", method = RequestMethod.POST)
	public String ex05ok(
							Model model,
							@RequestParam("name") String name,
							@RequestParam("age") String age,
							@RequestParam("address") String address
							//HttpServletRequest req
						 ) throws UnsupportedEncodingException {
			 req.setCharacterEncoding("UTF-8")  				  */

	
	
//	@RequestMapping(value="/ex05ok.do", method = RequestMethod.POST)
//	public String ex05ok(Model model, String name, String age, String address) {

//	@RequestMapping(value="/ex05ok.do", method = RequestMethod.POST)
//	public String ex05ok(Model model, 
//						//@RequestParam("cb") String[] cb 
//						//String[] cb
//						@RequestParam("cb") ArrayList<String> list
//						//ArrayList<String> list  > 동작(X)
//			             ) {
//
//		System.out.println(list);
//		
//		return "ex05ok";
//	}

//	@RequestMapping(value="/ex05ok.do", method = RequestMethod.POST)
//	public String ex05ok(@ModelAttribute("data") String data) {
//		
//		
//		return "ex05ok";
//	}

	@RequestMapping(value="/ex05ok.do", method = RequestMethod.POST)
	public String ex05ok(@ModelAttribute("dto") AddressDTO data) {
		
		
		return "ex05ok";
	}

}















