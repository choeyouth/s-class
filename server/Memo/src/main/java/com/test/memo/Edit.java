package com.test.memo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.memo.model.MemoDTO;
import com.test.memo.repository.MemoDAO;

@WebServlet("/edit.do")
public class Edit extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//수정을 위한 화면
		//- edit.do?seq=16
		//1. 데이터 가져오기(seq)
		//2. DB 작업 > Select where seq = 16
		//3. 결과 반환 > JSP 전달 + 호출하기
		
		//1.
		String seq = req.getParameter("seq");
		
		//2. 
		MemoDAO dao = new MemoDAO();
		MemoDTO dto = dao.get(seq);
		
		//3.
		req.setAttribute("dto", dto);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/edit.jsp");
		dispatcher.forward(req, resp);
		
	}
}

