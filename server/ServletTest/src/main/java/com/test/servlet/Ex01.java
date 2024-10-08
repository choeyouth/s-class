package com.test.servlet;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.Calendar;

public class Ex01 {

	public static void main(String[] args) {
		
		//서블릿 흉내
		//- 요청 > 페이지 생산 
		try {
			
			//http://localhost:8090/servlet/time.html
			
			String path = ".\\src\\main\\webapp\\time.html";
			
			BufferedWriter writer = new BufferedWriter(new FileWriter(path));
			
			writer.write("<html>");
			writer.write("<head>");
			writer.write("<meta charset='UTF-8'>");
			writer.write("</head>");
			writer.write("<body>");
			writer.write("<h1>현재 시각</h1>");
			writer.write("<div>");
			Calendar now = Calendar.getInstance();
			writer.write(String.format("%tF %tT", now, now));
			writer.write("</div>");
			writer.write("</body>");
			writer.write("</html>");
			
			writer.close();
			
		} catch (Exception e) {
			System.out.println("Ex01.main");
			e.printStackTrace();
		}
		
		
	}
	
}
