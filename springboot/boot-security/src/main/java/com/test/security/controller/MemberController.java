package com.test.security.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.security.dto.MemberDTO;
import com.test.security.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberController {

	//서비스한테 업무를 위임하기 위한 생성자 의존 주입
	private final MemberService memberService;
	
	@GetMapping("/join")
	public String join() {
		
		return "join";
	}
	
	@PostMapping("/joinok")
	public String joinok(MemberDTO dto) {
		
		System.out.println("dto: " + dto);
		
		memberService.join(dto);
		
		return "redirect:/login";
	}
	
	@GetMapping("/my")
	public String my() {
		
		//로그인 회원 > 자기 인증 정보 확인
		
		return "my";
	}
	
}
