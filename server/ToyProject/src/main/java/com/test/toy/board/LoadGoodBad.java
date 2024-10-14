package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.test.toy.board.repository.BoardDAO;

@WebServlet("/board/loadgoodbad.do")
public class LoadGoodBad extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String bseq = req.getParameter("bseq");
		
		BoardDAO dao = BoardDAO.getInstance();
		
		//현재 게시물에 내가 누른 좋아요/싫어요
		String state = dao.getGoodBad(bseq, session.getAttribute("auth").toString());
		
		
		//좋아요/싫어요 카운트 목록
		ArrayList<HashMap<String,String>> list = dao.loadGoodBad(bseq);

		JSONArray arr = new JSONArray();
		
		if (list != null && list.size() > 0) {
			for (HashMap<String,String> map : list) {
				
				JSONObject obj = new JSONObject();
				obj.put("state", map.get("state"));
				obj.put("cnt", map.get("cnt"));
			
				arr.add(obj);
				
			}
		}
		
		JSONObject root = new JSONObject();
		root.put("arr", arr); 	  //전체 카운트
		root.put("state", state); //내 선택?
		
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		writer.print(root.toString());
		writer.close();
		
	}
}
