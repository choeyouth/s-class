package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/ex06data.do")
public class Ex06Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//ex06data.do?type=1
		String type = req.getParameter("type");
		
		if (type.equals("1")) {
			m1(req, resp);
		} else if (type.equals("2")) {
			m2(req, resp);
		} else if (type.equals("3")) {
			m3(req, resp);
		} else if (type.equals("4")) {
			m4(req, resp);
		} else if (type.equals("5")) {
			m5(req, resp);
		} else if (type.equals("6")) {
			m6(req, resp);
		}

		
//		AjaxDAO dao = new AjaxDAO();
//		ArrayList<UserDTO> list = dao.listUser();
//		
//		resp.setContentType("application/json"); 
//		resp.setCharacterEncoding("UTF-8");
//		
//		PrintWriter writer = resp.getWriter();
		
//		JSONObject
//		JSONArray
//		{
//		   “question”: “제목”,
//		   “name”: “홍길동”,
//	       “age”: 20
//		}
		
//		JSONObject obj = new JSONObject();
//		obj.put("question", "제목입니다.");
//		obj.put("name", "홍길동");
//		obj.put("age", "20");
//		
//		System.out.println(obj.toString());
		
//		JSONArray arr = new JSONArray();
//		
//		for (UserDTO dto : list) {
//			
//			//UserDTO > JSONObject
//			JSONObject obj = new JSONObject();
//			obj.put("id", dto.getId());
//			obj.put("pw", dto.getPw());
//			obj.put("name", dto.getName());
//			obj.put("lv", dto.getLv());
//			
//			arr.add(obj);
//		}
//
//		System.out.println(arr.toString());
//		
//		writer.close();
		
	}

	private void m6(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		//JSON 반환 + 다중값
		/*
			
			hong,1111,홍길동,1
			dog,1111,강아지,1
			cat,1111,고양이,2
			
			[
				{
					"id": "hong",
					"pw": "1111",
					"name": "홍길동",
					"lv": "1"
				},
				{
					"id": "hong",
					"pw": "1111",
					"name": "홍길동",
					"lv": "1"
				}
			]
			
		*/
		
		AjaxDAO dao = new AjaxDAO();
		ArrayList<UserDTO> list = dao.listUser();
		
		//ArrayList<UserDTO> > (변환+문자열) > JSON 객체 배열
		resp.setContentType("application/json"); 
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
//		writer.println("[");
//		int i = 0;
		
//		for (UserDTO dto : list) {
//			writer.println("{"); 
//			writer.printf("\"id\": \"%s\",", dto.getId());
//			writer.printf("\"pw\": \"%s\",", dto.getPw());
//			writer.printf("\"name\": \"%s\",", dto.getName());
//			writer.printf("\"lv\": \"%s\"", dto.getLv());
//			writer.println("}");
//			
//			if (i < list.size() - 1) {
//				writer.println(",");
//			}
//			i ++;
//		}		
//		
//		writer.println("]");
		
		JSONArray arr = new JSONArray();
		
		for (UserDTO dto : list) {
			
			//UserDTO > JSONObject
			JSONObject obj = new JSONObject();
			obj.put("id", dto.getId());
			obj.put("pw", dto.getPw());
			obj.put("name", dto.getName());
			obj.put("lv", dto.getLv());
			
			arr.add(obj);
		}

		System.out.print(arr);
		
		writer.close();
				
	}

	private void m5(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		//JSON 반환 + 단일값 
		/*

			JSON, JavaScript Object Notation
			- 객체 표기법

			XML 방식
			const obj = {
				name: '홍길동',
				age: 20,
				hello: function() {
				
				}
			};
			- 함수 가능
			
			JSON 방식
			{
				"name": "홍길동",
				"age": 20
			}
			- 프로퍼티 이름에도 ""
			- '' 불가능, 무조건 ""
			- 숫자일 때는 X
			- 함수 불가능 
			- 오로지 프로퍼티, 변수만 넣을 수 있다. 
			
			{
				"question": "제목"
			}
			

		*/
		AjaxDAO dao = new AjaxDAO();
		String question = dao.getQuestion();
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		writer.print("{");
		writer.printf("\"question\": \"%s\"", question);
		writer.print("}");

		writer.close();
		
	}

	private void m4(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		//XML 반환 + 다중값
		/*
		 
		 	<?xml version="1.0" encoding="UTF-8"?>
		 	<users>
		 		<user>
			 		<id></id>
			 		<pw></pw>
			 		<name></name>
			 		<lv></lv>
		 		</user>
		 		<user>
			 		<id></id>
			 		<pw></pw>
			 		<name></name>
			 		<lv></lv>
		 		</user>		 		
		 	</users> 
		 
		 */
		
		AjaxDAO dao = new AjaxDAO();
		ArrayList<UserDTO> users = dao.listUser();
		
		resp.setContentType("text/xml");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"); 
		writer.println("<users>");
		
		for (UserDTO dto : users) {
			writer.println("<user>"); 
				writer.printf("<id>%s</id>", dto.getId());
				writer.printf("<pw>%s</pw>", dto.getPw());
				writer.printf("<name>%s</name>", dto.getName());
				writer.printf("<lv>%s</lv>", dto.getLv());
			writer.println("</user>"); 
		}
		
		writer.println("</users>");  
		
		writer.close();
	}

	private void m3(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		//XML 반환 + 단일값
		AjaxDAO dao = new AjaxDAO();
		String question = dao.getQuestion();	
		
		/*
		 
		 	<?xml version="1.0" encoding="UTF-8"?>
		 	<question>설문 제목</question>
		 	
		*/
		
		resp.setContentType("text/xml");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		writer.printf("<question id=\"q1\">%s</question>", question);
		
		writer.close();	
		
	}

	private void m2(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//텍스트 반환 + 다중값
		/*
		  
		  dog,1111,강아지,1
		  cat,1111,고양이,2
		 
		 */
		
		AjaxDAO dao = new AjaxDAO();
		
		ArrayList<UserDTO> list = dao.listUser();
		
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		//ArrayList > CSV
		for (UserDTO dto : list) {
			writer.printf("%s,%s,%s,%s\r\n"
						, dto.getId()
						, dto.getPw()
						, dto.getName()
						, dto.getLv());
		}
		
		writer.close();
		
	}

	//예외 미루기
	private void m1(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		//텍스트 반환 + 단일값
		AjaxDAO dao = new AjaxDAO();
		
		String question = dao.getQuestion();
		
		//서버는 클라이언트에게 데이터를 돌려줄 때 형식을 지정해야 한다.
		// - MIME > 응답 헤더에 MIME을 기입한다.
		// - 브라우저(or ajax)는 응답 헤더의 MIME을 보고 자신이 돌려받은 데이터 형식을 인식한다. 
		
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		writer.print(question);
		writer.close();
		
	}

	
}
