package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서블릿 클래스 구현
//1. 서블릿 클래스 선언 > 순수 자바 클래스(X), 서블릿 API 사용(O)
//a. javax.servlet.Servlet 인터페이스를 구현한다. > 복잡함, 고비용, 직접
//b. javax.servlet.http.HttpServlet 클래스를 상속 받는다. >  단순함, 저비용
public class Ex02 extends HttpServlet {

//2. doGet/doPost 메소드 선언
//a. 매개 변수 작성 
//    1. avax.servlet.http.HttpServletRequest
//    2. javax.servlet.http.HttpServletResponse
//b. 예외 미루기
//    1. java.io.IOException
//    2. javax.servlet.ServletException
				//예약어
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		
//		3. 동적 HTML 페이지 작성
//	    - doGet/doPost 내부에서 HTML 문서를 작성하기 위한 자바 코드를 작성한다. (개발자)
//	    - HttpServletResponse 객체의 getWriter() 메소드 호출 > PrintWriter 객체 반환
//	    - PrintWriter 객체 == 페이지를 제작하는 도구
//	    - printXXX(”태그 작성 or CSS or JavaScript”); > 동적으로 페이지 생성
//	    - 페이지 완성 > 브라우저에게 반환
		
		
		//BufferedWriter
		
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer =  resp.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>현재 시각</h1>");
		writer.println("<div>");
		Calendar now = Calendar.getInstance();
		writer.println(String.format("%tF %tT", now, now));
		writer.println("</div>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
		//요청
		//- http://localhost:8090/servlet/servlet/com.test.servlet.Ex02
		
		//- http://localhost:8090/servlet/ex02.do
		
		
		
		
		
		
		
		
	}
}
































