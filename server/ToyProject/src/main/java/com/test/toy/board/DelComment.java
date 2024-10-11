package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.test.toy.board.model.CommentDTO;
import com.test.toy.board.repository.BoardDAO;

@WebServlet("/board/delcomment.do")
public class DelComment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String cseq = req.getParameter("cseq");
		
		BoardDAO dao = BoardDAO.getInstance();
		
		CommentDTO dto = new CommentDTO();
		
		int result = dao.delComment(cseq);
		
		resp.setContentType("applycation/json");
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);

		PrintWriter writer = resp.getWriter();
		writer.print(obj.toString());
		writer.close();
	
	}
}
