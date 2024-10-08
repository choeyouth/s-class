package com.test.api.food;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.api.map.MapDAO;

@WebServlet("/food.do")
public class Food extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//<select> 추가할 목록 가져오기
		MapDAO dao = new MapDAO();
		
		ArrayList<CategoryDTO> clist = dao.clist();
		
		req.setAttribute("clist", clist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/food/food.jsp");
		dispatcher.forward(req, resp);

	}
}

