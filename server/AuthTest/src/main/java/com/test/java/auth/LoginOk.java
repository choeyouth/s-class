package com.test.java.auth;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.java.db.AuthDAO;
import com.test.java.db.UserDTO;

@WebServlet("/auth/loginok.do")
public class LoginOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. 데이터 가져오기(id, pw)
		//2. DB 작업 > select ?
		//3. 결과 > 인증 티켓 발급
		//4. 결과 통보 
		
//		req.getSession(); //세션을 돌려줌
		HttpSession session = req.getSession();
		
		//1. 
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		//2. 
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setPw(pw);
		
		AuthDAO dao = new AuthDAO();
		UserDTO result = dao.login(dto);
		//성공 시 그 사람의 모든 정보가 담겨있는 Object를 반환
		//실패 시 null 반환

		if (result != null) {
			System.out.println("로그인 성공");
			
			// 인증 티켓 발급
			session.setAttribute("auth", id); //식별 가능한 고유 번호 > id
			
			// 회원 정보
			session.setAttribute("name", result.getName());
			session.setAttribute("lv", result.getLv());
			
			resp.sendRedirect("/auth/index.do");
			
		} else {
			System.out.println("로그인 실패");
			resp.sendRedirect("/auth/auth/login.do");
		}

		
//		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/auth/loginok.jsp");
//		dispatcher.forward(req, resp);

	}
}
