package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex08.do")
public class Ex08 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//***** 구분
		//1. 서블릿(DB) > JSP에게 전달
		//2. Ajax(DB) > 처리
		
		AjaxDAO dao = new AjaxDAO();
		CatDTO dto = dao.getCat("cat1");
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex08.jsp");
		dispatcher.forward(req, resp);

	}
}








