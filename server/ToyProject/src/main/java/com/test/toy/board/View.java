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

@WebServlet("/board/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		//1. 데이터 가져오기(seq)
		//2. DB 작업 > select
		//3. 결과(DTO) > JSP 호출하기
		
		HttpSession session = req.getSession();
		
		//1. 데이터 가져오기(seq)
		String seq = req.getParameter("seq");
		
		//2. DB 작업 > select
		BoardDAO dao = BoardDAO.getInstance();
		
		//2.3 조회수 증가
		if (session.getAttribute("read") != null &&
			session.getAttribute("read").toString().equals("n")) {
			dao.updateReadcount(seq);
			session.setAttribute("read", "y");
		}
		
		BoardDTO dto = dao.get(seq);
		
		//2.5 DTO 조작
		String content = dto.getContent();
		content = content.replace("\r\n", "<br>");
		dto.setContent(content);
		
		
		//3. 결과(DTO) > JSP 호출하기		
		req.setAttribute("dto", dto);
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/view.jsp");
		dispatcher.forward(req, resp);

	}
}
