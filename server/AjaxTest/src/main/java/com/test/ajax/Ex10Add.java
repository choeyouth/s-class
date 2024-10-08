package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex10add.do")
public class Ex10Add extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String gender = req.getParameter("gender");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		
		AddressDTO dto = new AddressDTO();
		dto.setName(name);
		dto.setAge(age);
		dto.setGender(gender);
		dto.setTel(tel);
		dto.setAddress(address);
		
		
		System.out.println(name);
		System.out.println(age);
		System.out.println(gender);
		System.out.println(tel);
		System.out.println(address);
		
		AjaxDAO dao = new AjaxDAO();
		
		int result = dao.addAddress(dto);
		
		resp.setContentType("application/json");
		
		/*
			{ "result": 1 } 
		*/
		PrintWriter writer = resp.getWriter();
		writer.printf("{ \"result\": %d }", result);
		writer.close();
		
		
	}
}
