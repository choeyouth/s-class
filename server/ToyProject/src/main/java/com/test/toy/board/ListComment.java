package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.test.toy.board.model.CommentDTO;
import com.test.toy.board.repository.BoardDAO;

@WebServlet("/board/listcomment.do")
public class ListComment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String bseq = req.getParameter("bseq");
		
		BoardDAO dao = BoardDAO.getInstance();
		
		ArrayList<CommentDTO> list = dao.listComment(bseq);

		JSONArray arr = new JSONArray();

		for (CommentDTO dto : list) {
			
			JSONObject obj = new JSONObject();
			obj.put("seq", dto.getSeq());
			obj.put("content", dto.getContent());
			obj.put("regdate", dto.getRegdate());
			obj.put("id", dto.getId());
			obj.put("bseq", dto.getBseq());
			obj.put("name", dto.getName());
			
			arr.add(obj);
			
		}
		
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		writer.print(arr.toString());
		writer.close(); 
		
	}
}
