package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex04data.do")
public class Ex04Data extends HttpServlet {

//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//		//1.
//		String name = "홍길동";
//		
////		try {
////			Thread.sleep(10000);
////		} catch (Exception e) {
////			System.out.println("Ex04Data.doGet");
////			e.printStackTrace();
////		}
//		
//		resp.setCharacterEncoding("UTF-8");
//		
//		PrintWriter writer = resp.getWriter();
//		writer.print(name);
//		writer.close();
//		
//	}
//	
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//		//2.
//		String txt2 = req.getParameter("txt2");
//		
//		System.out.println("ajax가 보낸 데이터: " + txt2);
//		
//		
//	}
//	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//3.
		String txt3 = req.getParameter("txt3");

		int length = txt3.length();
		
		PrintWriter writer = resp.getWriter();
		writer.print(length);
		writer.close();
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
		//4. 
		req.setCharacterEncoding("UTF-8");
		String txt4 = req.getParameter("txt4");
		txt4 = "@" + txt4 + "@";
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		writer.print(txt4);
		writer.close();
	
	}
}
