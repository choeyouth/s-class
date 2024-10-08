package com.test.memo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.memo.model.MemoDTO;
import com.test.memo.repository.MemoDAO;

@WebServlet("/addok.do")
public class AddOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//add.do > 데이터 줄테니 > DB에 insert
	
		//1. 데이터 가져오기(memo, name, pw)
		//2. DB insert
		//3. 결과 통보 + list.do 이동하기
		
		//1. 
		req.setCharacterEncoding("UTF-8");
		
		String memo = req.getParameter("memo");
		String name = req.getParameter("name");
		String pw = req.getParameter("pw");
		
		System.out.println(memo);
		System.out.println(name);
		System.out.println(pw);
		
		//2. DB 작업 > 분리 > DAO(Data Access Object)
		MemoDTO dto = new MemoDTO();
		dto.setMemo(memo);
		dto.setName(name);
		dto.setPw(pw);
		
		//일을 맡길 직원 부르기 > instance
		MemoDAO dao = new MemoDAO(); //DB 접속
		
		//메모 쓰기 
		int result = dao.add(dto); //result > 1(성공), 0(실패)

		if (result == 1) {
			resp.sendRedirect("/memo/list.do"); 
		} else {
			PrintWriter writer = resp.getWriter();
			writer.println("<html><body>");
			writer.println("<script>");
			writer.println("alert('faild');");
			writer.println("history.back();");
			writer.println("</script>");
			writer.println("</body></html>");
			writer.close();
		}
		
		
		//피드백 > 화면 관련 > addok.jsp
//		req.setAttribute("result", result);
//		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/addok.jsp");
//		dispatcher.forward(req, resp);
		
	}
}

