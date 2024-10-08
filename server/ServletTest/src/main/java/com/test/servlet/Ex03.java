package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex03 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//구구단 페이지
		//- 현재 시각 > 초 > 단 출력
		
		Calendar now = Calendar.getInstance();
		int dan = now.get(Calendar.SECOND) % 9 + 1; //1~9
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		
		//구구단 페이지 소스를 작성
		writer.println("<!DOCTYPE html>\r\n"
				+ "<html lang=\"en\">\r\n"
				+ "<head>\r\n"
				+ "    <meta charset=\"UTF-8\">\r\n"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
				+ "    <title>Document</title>\r\n"
				+ "    <style>\r\n"
				+ "        h1 {\r\n"
				+ "            border-bottom: 1px dashed gray;\r\n"
				+ "            width: 200px;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        div {\r\n"
				+ "            font-size: 1.3rem;\r\n"
				+ "            margin: 10px;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "    </style>\r\n"
				+ "</head>\r\n"
				+ "<body>\r\n");
		
		writer.printf("    <h1>구구단 %d단</h1>\r\n", dan);
		
		//for문
		for (int i=0; i<=9; i++) {
			writer.printf("    <div>%d x %d = %d</div>\r\n", dan, i, dan * i);
		}
		
		writer.println("</body>\r\n"
				+ "</html>");
		
		writer.close();
		
	}
}





















