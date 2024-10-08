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

//AddOk > EditOK
@WebServlet("/delok.do")
public class DelOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//add.do > 데이터 줄테니 > DB에 insert
	
		//1. 데이터 가져오기(seq, pw)
		//1.5 권한 확인(암호 확인)
		//2. DB delete
		//3. 결과 통보 + list.do 이동하기
		
		//1. 
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		String pw = req.getParameter("pw");
		
		//1.5
		MemoDAO dao = new MemoDAO();
		
		MemoDTO dto = new MemoDTO();
		dto.setSeq(seq);
		dto.setPw(pw);
		
		int result = 0;
		
		if (dao.check(dto) == 1) {
			//2.
			if (dao.del(dto) == 1) {
				result = 1;
			} 
		} else {
			result = 2;
		}
		

		if (result == 1) { // 수정 성공
			resp.sendRedirect("/memo/list.do"); 
		} else if (result == 2) { //암호 틀림
			PrintWriter writer = resp.getWriter();
			writer.println("<html><body>");
			writer.println("<script>");
			writer.println("alert('incorrect password');");
			writer.println("history.back();");
			writer.println("</script>");
			writer.println("</body></html>");
			writer.close();
		} else { //수정 실패 
			PrintWriter writer = resp.getWriter();
			writer.println("<html><body>");
			writer.println("<script>");
			writer.println("alert('faild');");
			writer.println("history.back();");
			writer.println("</script>");
			writer.println("</body></html>");
			writer.close();
		}
		

	}
}

