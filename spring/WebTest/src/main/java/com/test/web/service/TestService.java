package com.test.web.service;

import org.springframework.stereotype.Service;

//@Component
@Service //가독성을 위해 Component 보다 Service어노테이션 사용 > 기능 차이X
public class TestService {

	public void work() {
		System.out.println("주 업무를 진행합니다.");
	}
	
	public String get() {
		
		//DB or 조작
		return "스프링";
	}
}
