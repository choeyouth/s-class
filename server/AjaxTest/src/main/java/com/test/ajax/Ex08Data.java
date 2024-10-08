package com.test.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex08data.do")
public class Ex08Data extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. 데이터 가져오기(catid, legt, top)
		//2. DB 작업 > update
		
		//1. 
		String catid = req.getParameter("catid");
		String left = req.getParameter("left");
		String top = req.getParameter("top");
		
//		System.out.println(catid);
//		System.out.println(left);
//		System.out.println(top);
		
		//2. 
		AjaxDAO dao = new AjaxDAO();
		
		CatDTO dto = new CatDTO();
		dto.setCatid(catid);
		dto.setLeft(left);
		dto.setTop(top);
		
		dao.editPosition(dto);

		
		
	}
}

