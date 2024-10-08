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

@WebServlet("/ex07data.do")
public class Ex07Data extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. 데이터 가져오기(dong)
		//2. DB 작업 > select
		//3. 결과 > JSON 반환
		
		//1. 
		req.setCharacterEncoding("UTF-8");
		String dong = req.getParameter("dong");
		
		//2. 
		AjaxDAO dao = new AjaxDAO();
		ArrayList<ZipcodeDTO> list = dao.search(dong);
		
		//3. 
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		JSONArray arr = new JSONArray();
		
		list.forEach(dto -> {
			//DTO > JSONObject
			JSONObject obj = new JSONObject();
			
			obj.put("seq", dto.getSeq());
			obj.put("zipcode", dto.getZipcode());
			obj.put("sido", dto.getSido());
			obj.put("gugun", dto.getGugun());
			obj.put("dong", dto.getDong());
			obj.put("bunji", dto.getBunji() != null ? dto.getBunji() : "");
			
			arr.add(obj);
			
		});		
		
		PrintWriter writer = resp.getWriter();
		writer.print(arr);
		writer.close();
		
	}
}
