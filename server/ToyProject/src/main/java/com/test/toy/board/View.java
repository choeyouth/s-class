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
		String word = req.getParameter("word");
		String column = req.getParameter("column");
		String page = req.getParameter("page");
		
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
		//개행문자 처리
		String content = dto.getContent();
		content = content.replace("\r\n", "<br>");
		
		//검색어 강조
		//"한승원 작가는 11일 방송된"
		// > "<span style='color:tomato; background-color:gold; >한승원</span> 작가는 11일 방송된"
		
		if (column.equals("content")) { 
			content = content.replace(word, "<span style='color:tomato;background-color:gold;'>" + word + "</span>");
		}
		
		dto.setContent(content);
		
		
		//3. 결과(DTO) > JSP 호출하기		
		req.setAttribute("dto", dto);
		req.setAttribute("column", column);
		req.setAttribute("word", word);
		req.setAttribute("page", page);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/view.jsp");
		dispatcher.forward(req, resp);

	}
}
