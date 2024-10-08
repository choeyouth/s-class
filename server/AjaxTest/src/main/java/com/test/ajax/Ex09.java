package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex09.do")
public class Ex09 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//고양이 ID의 최댓값
		AjaxDAO dao = new AjaxDAO();
		
		//cat10
		int seq = dao.getMaxSeq();

		req.setAttribute("seq", seq + 1);

		
		//기존 고양이 목록 가져오기
		ArrayList<CatDTO> list = dao.listCat();	
		
		req.setAttribute("seq", seq + 1);
		req.setAttribute("list", list);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex09.jsp");
		dispatcher.forward(req, resp);

	}
}
