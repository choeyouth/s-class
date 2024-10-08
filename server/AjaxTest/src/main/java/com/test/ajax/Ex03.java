package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex03.do")
public class Ex03 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String data = req.getParameter("data");
		
		req.setAttribute("data", data);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex03.jsp");
		dispatcher.forward(req, resp);

	}
}
