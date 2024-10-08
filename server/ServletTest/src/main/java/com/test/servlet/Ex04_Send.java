package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex04_Send extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();

		writer.println("<html>"); 
		writer.println("<head><meta charset='UTF-8'></head>");
		writer.println("<body>"); 
		writer.println("<h1>데이터 입력</h1>");
		writer.println("<form method='GET' action='/servlet/ex04receive.do'>");
		writer.println("<input type='text' name='data'>");
		writer.println("<input type='submit' value='보내기'>");
		writer.println("</form>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
	                               
	}
	
}
