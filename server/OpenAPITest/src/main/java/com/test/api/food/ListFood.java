package com.test.api.food;

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

import com.test.api.map.MapDAO;

@WebServlet("/listfood.do")
public class ListFood extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MapDAO dao = new MapDAO();
		
		ArrayList<FoodDTO> list = dao.listFood();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		//ArrayList<FoodDTO> > JSONArray<JSONObject>
		
		JSONArray arr = new JSONArray();
		
		for (FoodDTO dto : list) {
			
			JSONObject obj = new JSONObject();
			
			obj.put("seq", dto.getSeq());
			obj.put("name", dto.getName());
			obj.put("lat", dto.getLat());
			obj.put("lng", dto.getLng());
			obj.put("address", dto.getAddress());
			obj.put("star", dto.getStar());
			obj.put("menu", dto.getMenu());
			
			JSONObject cobj = new JSONObject();
			cobj.put("seq", dto.getCategoryDTO().getSeq());
			cobj.put("name", dto.getCategoryDTO().getName());
			cobj.put("img", dto.getCategoryDTO().getImg());
			
			obj.put("category", cobj);

			arr.add(obj);
			
		}
		
		PrintWriter writer = resp.getWriter();
		writer.print(arr.toString());
		writer.close();
		
	}
}
