package com.test.api.map;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/map.do")
public class Ex01 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//서블릿 1개 : JSP N개
		// - map.do
		// - map.do?n=ex01
		// - map.do?n=ex02
		
		String n = req.getParameter("n");
		
		if (n == null) n = "ex01";

		if (n.equals("ex04")) {
			MapDAO dao = new MapDAO();
			ArrayList<MapDTO> list = dao.list();
			req.setAttribute("list", list);
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/map/" + n + ".jsp");
		dispatcher.forward(req, resp);

	}
}
