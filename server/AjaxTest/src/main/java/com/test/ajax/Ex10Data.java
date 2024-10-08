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

@WebServlet("/ex10data.do")
public class Ex10Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		AjaxDAO dao = new AjaxDAO();
		ArrayList<AddressDTO> list = dao.listAddress();
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		JSONObject root = new JSONObject();
		//select 성공 > 1, 실패 > 0
		root.put("result", list != null ? 1 : 0);
		
		JSONArray arr = new JSONArray();
		
		list.forEach(dto -> {
			JSONObject obj = new JSONObject();
			obj.put("seq", dto.getSeq());
			obj.put("name", dto.getName());
			obj.put("age", dto.getAge());
			obj.put("gender", dto.getGender());
			obj.put("tel", dto.getTel());
			obj.put("address", dto.getAddress());
			obj.put("regdate", dto.getRegdate());
			arr.add(obj);
		});
		
		root.put("arr", arr);
		
		PrintWriter writer = resp.getWriter();
		writer.print(root);
		writer.close();
		
		
		
	}
}
