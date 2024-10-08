package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex10edit.do")
public class Ex10Edit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String gender = req.getParameter("gender");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String seq = req.getParameter("seq");
		
		AddressDTO dto = new AddressDTO();
		dto.setName(name);
		dto.setAge(age);
		dto.setGender(gender);
		dto.setTel(tel);
		dto.setAddress(address);
		dto.setSeq(seq);
		
		AjaxDAO dao = new AjaxDAO();
		
		int result = dao.editAddress(dto);
		
		resp.setContentType("application/json");
		
		/*
			{ "result": 1 } 
		*/
		PrintWriter writer = resp.getWriter();
		writer.printf("{ \"result\": %d }", result);
		writer.close();		

	}
}
