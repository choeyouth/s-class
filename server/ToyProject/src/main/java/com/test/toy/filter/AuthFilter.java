package com.test.toy.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.util.OutputUtil;

public class AuthFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		//System.out.println("권한 체크 필터");
		HttpServletRequest request = (HttpServletRequest)req;	
		HttpServletResponse response = (HttpServletResponse)resp;	
		HttpSession session = request.getSession();
		
		System.out.println("현재 접속자: " + (session.getAttribute("auth") == null ? "익명 사용자" : session.getAttribute("auth")));
		
		System.out.println(request.getRequestURI());
		
		//익명 사용자 배제
		if (session.getAttribute("auth") == null) {
			
			//- 글쓰기, 수정하기, 삭제하기, 자기정보(Info)
			if (request.getRequestURI().endsWith("/board/add.do")
			 || request.getRequestURI().endsWith("/board/edit.do")
			 || request.getRequestURI().endsWith("/board/del.do")
			 || request.getRequestURI().endsWith("/user/info.do")) {
				
				OutputUtil.redirect(response, "익명 사용자는 접근이 불가능합니다.", "/toy/index.do");
				
			}
		}
		
		chain.doFilter(req, resp);
		
	}
}

