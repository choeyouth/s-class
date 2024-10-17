package com.test.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;



//스프링 빈이 되기 위한 자격
//- @Component
//- @Controller > 컨트롤러 역할
//- @Service > 서비스 역할
//- @Repository > DAO 역할
//@Controller
public class MemberController {

	@GetMapping("/login.do")
	public @ResponseBody String login() {
		
		
		return "ok";
	}
}
