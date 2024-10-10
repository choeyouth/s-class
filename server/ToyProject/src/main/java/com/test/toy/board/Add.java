package com.test.toy.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.model.BoardDTO;
import com.test.toy.board.repository.BoardDAO;
import com.test.toy.util.OutputUtil;

@WebServlet("/board/add.do")
public class Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//권한 확인
		
		//방법 1.
//		HttpSession session = req.getSession();
//		if (session.getAttribute("auth") == null) {
//			resp.sendRedirect("/toy/index.do");
//		}
		

		//방법2. > 필터
		
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/add.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//AddOk.java 역할
		
		//1. 데이터 가져오기(subject, content)
		//2. DB 작업 > insert
		//3. 결과 처리
		
		HttpSession session = req.getSession();
		
		//1. 데이터 가져오기(subject, content)
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String id = session.getAttribute("auth").toString();
		
		//2. DB 작업 > insert
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO dto = new BoardDTO();
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setId(id);
		
		int result = dao.add(dto);
		
		
		//3. 결과 처리
		if (result == 1) {
			resp.sendRedirect("/toy/board/list.do");
		} else {
			OutputUtil.redirect(resp, "쓰기 실패!");
		}
	
	}
}











