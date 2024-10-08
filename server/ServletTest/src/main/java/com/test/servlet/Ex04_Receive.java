package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex04_Receive extends HttpServlet {

//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//		
		//<input type="text" name="data">
		//<input type="text" name="data2">
		//<input type="text" name="data3">
		//name > 서버와 클라이언트 사이의 가장 중요한 전달되는 객체의 식별자 역할
//		String data = req.getParameter("data");
////		System.out.println(data);
//		//DB 저장 or 가공 업무 사용 or 등등..
//		
//		
//		
//		resp.setCharacterEncoding("UTF-8");
//		PrintWriter writer = resp.getWriter();
////		writer.println(111);
//		
//		writer.println("<html>"); 
//		writer.println("<head><meta charset='UTF-8'></head>");
//		writer.println("<body>"); 
//		writer.println("<h1>결과</h1>");
//		writer.printf("보내준 데이터 [%s]를 올바르게 수신했습니다.", data);
//		
//		writer.println("</body>");
//		writer.println("</html>");
//		
//		
//		writer.close();

		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("GET 요청");
		
	}


@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("POST 요청");
	
	}
	
}

