package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.test.toy.board.repository.BoardDAO;

@WebServlet("/board/goodbad.do")
public class GoodBad extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String state = req.getParameter("state");
		String bseq = req.getParameter("bseq");
		String id = session.getAttribute("auth").toString();
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("bseq", bseq);
		map.put("state", state);
		
		BoardDAO dao = BoardDAO.getInstance();

		//흐름~ 
		
		int result = -1;
		
		if (dao.checkGoodBad(map)) {
			result = dao.addGoodBad(map); //신규 등록
		} else {
			result = dao.editGoodBad(map); //의견 변경
		}
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		
		resp.setContentType("application/json");
		PrintWriter writer = resp.getWriter();
		writer.print(obj.toString());
		writer.close();
		
		
	}
}
