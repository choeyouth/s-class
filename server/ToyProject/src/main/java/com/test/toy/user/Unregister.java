package com.test.toy.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.user.repository.UserDAO;
import com.test.toy.util.OutputUtil;

@WebServlet("/user/unregister.do")
public class Unregister extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/unregister.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. DB 작업 > update
		//2. 결과 처리
		
		HttpSession session = req.getSession();
		
		//1. 
		UserDAO dao = UserDAO.getInstance();
		
		int result = dao.unregister(session.getAttribute("auth") + "");
		
		//로그인 > id > 해당 id의 회원 정보를 업데이트함 > 임시로 hong
		//int result = dao.unregister("lion");
		
		//2. 
		if (result == 1) {
			//탈퇴 성공
			resp.sendRedirect("/toy/index.do");
		} else {
			//탈퇴 실패
			OutputUtil.redirect(resp, "회원 탈퇴를 실패했습니다.");
		}
	}
}
