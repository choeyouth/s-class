package com.test.toy.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.user.model.UserDTO;
import com.test.toy.user.repository.UserDAO;
import com.test.toy.util.OutputUtil;

@WebServlet("/user/login.do")
public class Login extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//테스트 후 삭제 예정
		UserDAO dao = UserDAO.getInstance();
		
		ArrayList<UserDTO> list = dao.listUser();

		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/login.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//LoginOk.java
		//1. 데이터 가져오기
		//2. DB 작업 > select
		//3. 결과 처리(인증 티켓 발급)
		
		HttpSession session = req.getSession();
		
		//1. 
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		//2. 
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setPw(pw);
		
		UserDAO dao = UserDAO.getInstance();
		UserDTO result = dao.login(dto);
		
		//3. 
		if (result != null) {
			//로그인 성공 > 인증 티켓 발급
			session.setAttribute("auth", id);
			session.setAttribute("lv", result.getLv());
			session.setAttribute("name", result.getName());
			
			//접속 기록
			dao.addLog(id);
			
			resp.sendRedirect("/toy/index.do");
			
		} else {
			//로그인 실패
			OutputUtil.redirect(resp, "로그인 실패");
		}
		
	
	}
}

