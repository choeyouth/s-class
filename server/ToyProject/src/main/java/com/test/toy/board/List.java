package com.test.toy.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.model.BoardDTO;
import com.test.toy.board.repository.BoardDAO;

@WebServlet("/board/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//호출 경우의 수
		//1. 목록보기
		// - list.do
		//2. 검색 결과 보기
		// - list.do?column=subject&word=검색어
		
		HashMap<String,String> map = new HashMap<String,String>();
		
		
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		String search = "n"; //목록보기(n), 검색하기(y)
		
		if (column != null && word != null) {
			search = "y";
			map.put("column", column);
			map.put("word", word);
		} else {
			search = "n";
		}
		
		map.put("search", search);
		
		//map > dao에 넘기기
		//
		
		
		//1. DB 작업 > select
		//2. 결과셋 > JSP 호출하기

		HttpSession session = req.getSession();
		
		//조회수 증가 방지용 티켓
		session.setAttribute("read", "n");
		
		//1. DB 작업 > select
		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardDTO> list = dao.list(map);
		
		//1.5 DTO 조작
		for (BoardDTO dto : list) {
//			String regdate = dto.getRegdate();
//			regdate = regdate.substring(0, 10);
//			dto.setRegdate(regdate);
			
			//긴 제목을 자르기
			String subject = dto.getSubject();
			
			if (subject.length() > 20) {
				subject = subject.substring(0, 20) + "...";
			}
			
			dto.setSubject(subject);
		}
		
		//2. 결과셋 > JSP 호출하기
		req.setAttribute("list", list);	
		req.setAttribute("map", map);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/list.jsp");
		dispatcher.forward(req, resp);

	}
}

