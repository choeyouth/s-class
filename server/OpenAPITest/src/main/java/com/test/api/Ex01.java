package com.test.api;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex01.do")
public class Ex01 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String word = req.getParameter("word");
		String count = req.getParameter("count");
		String start = req.getParameter("start");
		
		if (word != null) {
			
			//OpenAPI 요청 > 결과 반환
			BookDAO dao = new BookDAO();
			
			//ArrayList<BookDTO> list = dao.search(word, count, start);
			HashMap<String, Object> map = dao.search(word, count, start);
			
			//req.setAttribute("list", list);
			req.setAttribute("list", (ArrayList<BookDTO>)map.get("result"));
			req.setAttribute("word", word);
			req.setAttribute("count", count);
			req.setAttribute("start", start);
			req.setAttribute("total", map.get("total"));
			
		}

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex01.jsp");
		dispatcher.forward(req, resp);

	}
}

