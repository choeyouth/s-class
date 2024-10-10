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

@WebServlet("/board/del.do")
public class Del extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. 데이터 가져오기(seq)
		//2. seq + JSP 호출하기
		
		//1. 데이터 가져오기(seq)
		String seq = req.getParameter("seq");
		
		//2. seq + JSP 호출하기
		req.setAttribute("seq", seq);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/del.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//DelOk.java 역할
		
		//1. 데이터 가져오기(subject, content)
		//2. DB 작업 > insert
		//3. 결과 처리
		
		HttpSession session = req.getSession();
		
		//1. 데이터 가져오기(subject, content)
		String seq = req.getParameter("seq");	
		
		//2. DB 작업 > insert
		BoardDAO dao = BoardDAO.getInstance();
		
		int result = dao.del(seq);
		
		//3. 결과 처리
		if (result == 1) {
			resp.sendRedirect("/toy/board/list.do?");
		} else {
			OutputUtil.redirect(resp, "수정하기 실패!");
		}
		
	
	}
}
