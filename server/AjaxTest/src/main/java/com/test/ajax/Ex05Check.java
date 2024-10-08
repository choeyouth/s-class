package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex05check.do")
public class Ex05Check extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		//호출 2가지 경우
		//1. 처음 요청 > 팝업
		// - ex05check.do
		//2. 다시 요청 > 아이디를 줄테니 중복 검사하라고~
		// - ex05check.do?id=test
		
		String id = req.getParameter("id");
		
		//not null ? not "" ? > 둘 다 적는 편이 안전함 > 지금은 ""  
		if (id != null && !id.equals("")) {
			
			AjaxDAO dao = new AjaxDAO();
			
			dao.check(id);
			
			int result = dao.check(id); //사용가능(0), 이미사용중(1)

			req.setAttribute("result", result);
			req.setAttribute("id", id);
			
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex05check.jsp");
		dispatcher.forward(req, resp);

	}
}
