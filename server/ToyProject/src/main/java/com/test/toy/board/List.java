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
		//	- list.do
		//2. 검색 결과 보기
		//	- list.do?column=subject&word=검색어
		
		
		
		HashMap<String,String> map = new HashMap<String,String>();
		
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		String search = "n"; //목록보기(n), 검색하기(y)
		
		if ((column != null && word != null)
			&& !(column.equals("") && word.equals(""))) {
			search = "y";
			map.put("column", column);
			map.put("word", word);
		} else {
			search = "n";
		}
		
		map.put("search", search);
		
		
		//페이징
		//- list.do?page=1 > begin(1) end(10)
		//- list.do?page=2 > begin(11) end(20)
		//- list.do
		
		//페이징 처리
		String page = req.getParameter("page");
		
		int nowPage = 0;	//현재 페이지 번호(=page)
		int totalCount = 0; //총 게시물 수
		int pageSize = 10;  //한 페이지에서 출력할 게시물 수
		int totalPage = 0;  //총 페이지 수
		int begin = 0;		//페이징 시작 위치
		int end = 0;		//페이징 끝 위치
		int n = 0;			//페이지바 변수
		int loop = 0;		//페이지바 변수
		int blockSize = 10;	//페이지바 블럭내 페이지 개수
		
		if (page == null || page.equals("")) {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		//list.do?page=1 > where rnum between 1 and 10
		//list.do?page=2 > where rnum between 11 and 20
		//list.do?page=3 > where rnum between 21 and 30
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		
		BoardDAO dao = BoardDAO.getInstance();
		
		//총 게시물 수? 263
		//총 페이지 수? 263 / 10 = 26.3 > 27 
		totalCount = dao.getTotalCount(map);
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		
		//페이지바 작업
		StringBuilder sb = new StringBuilder();
		
//		for (int i=1; i<=totalPage; i++) {
//			sb.append(String.format(" <a href='/toy/board/list.do?page=%d'>%d</a> ", i, i));
//		}
		
		//list.do?page=1
		//[이전] 1 2 3 4 5 6 7 8 9 10 [다음]
		
		//list.do?page=2
		//[이전] 1 2 3 4 5 6 7 8 9 10 [다음]
		
		//list.do?page=10
		//[이전] 1 2 3 4 5 6 7 8 9 10 [다음]
		
		//list.do?page=11
		//[이전] 11 12 13 14 15 16 17 18 19 20 [다음]
		
		//list.do?page=26
		//[이전] 21 22 23 24 25 26 [다음]
		
		loop = 1; //루프 변수
		n = ((nowPage - 1) / blockSize) * blockSize + 1; //페이지 번호 변수
		
		
		
		if (column == null) column = "";
		if (word == null) word = "";
		
		
		//이전 10페이지
		if (n == 1) {
			sb.append(String.format(" <a href='#!'>[이전 %d페이지]</a> ", blockSize));
		} else {		
			sb.append(String.format(" <a href='/toy/board/list.do?page=%d&column=%s&word=%s'>[이전 %d페이지]</a> ", n - 1, column, word, blockSize));
		}
		
		while (!(loop > blockSize || n > totalPage)) {
			
			if (n == nowPage) {
				sb.append(String.format(" <a href='#!' style='color: tomato;'>%d</a> ", n));
			} else {
				sb.append(String.format(" <a href='/toy/board/list.do?page=%d&column=%s&word=%s'>%d</a> ", n, column, word, n));
			}
			
			n++;
			loop++;
			
		}
		
		//다음 10페이지
		if (n > totalPage) {
			sb.append(String.format(" <a href='#!'>[다음 %d페이지]</a> ", blockSize));
		} else {
			sb.append(String.format(" <a href='/toy/board/list.do?page=%d&column=%s&word=%s'>[다음 %d페이지]</a> ", n, column, word, blockSize));
		}
		

		
		//1. DB 작업 > select
		//2. 결과셋 > JSP 호출하기
		
		HttpSession session = req.getSession();
		
		//조회수 증가 방지용 티켓(n, y)
		session.setAttribute("read", "n");
		
		
		//1.
		ArrayList<BoardDTO> list = dao.list(map);
		
		//1.5 DTO 조작
		for (BoardDTO dto : list) {
			
//			String regdate = dto.getRegdate();
//			regdate = regdate.substring(0, 10);
//			dto.setRegdate(regdate);
			
			//긴 제목을 자르기
			String subject = dto.getSubject();
			
			if (subject.length() > 20) {
				subject = subject.substring(0, 20) + "..";
			}
			
			dto.setSubject(subject);
			
			
			//HTML 태그 이스케이프
			subject = subject.replace("<", "&lt;").replace(">", "&gt;");
			dto.setSubject(subject);
			
		}
		
		//2.
		req.setAttribute("list", list);
		req.setAttribute("map", map);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("pagebar", sb.toString());

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/list.jsp");
		dispatcher.forward(req, resp);
	}

}










