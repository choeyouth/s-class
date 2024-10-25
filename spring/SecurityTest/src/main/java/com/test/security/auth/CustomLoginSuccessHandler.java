package com.test.security.auth;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		System.out.println("로그인을 성공했습니다.");
		
		//성공 직후 하고 싶은 일을 구현
		//- 인증 후 권한 확인?
		// 1. 회원 > member.do로 이동
		// 2. 관리자 > admin.do로 이동
		
		List<String> roleList = new ArrayList<String>();
		
		authentication.getAuthorities().forEach(authority -> {
			roleList.add(authority.getAuthority());
		});
		
		System.out.println(roleList);
		
		if (roleList.contains("ROLE_ADMIN")) {
			response.sendRedirect("/security/admin.do");
			return;
		}
		
		if (roleList.contains("ROLE_MEMBER")) {
			response.sendRedirect("/security/member.do");
			return;
		}
		
		response.sendRedirect("/security/index.do");
		
	}
}
