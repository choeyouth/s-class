package com.test.toy.board;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
		
		
		//답변
		String mode = req.getParameter("mode");
		String thread = req.getParameter("thread");
		String depth = req.getParameter("depth");
		
		req.setAttribute("mode", mode);
		req.setAttribute("thread", thread);
		req.setAttribute("depth", depth);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/add.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//AddOk.java 역할
		
		//1. 데이터 가져오기(subject, content)
		//2. DB 작업 > insert
		//3. 결과 처리
		
		//req > MultipartRequest
		MultipartRequest multi = new MultipartRequest(
									req,
									req.getRealPath("/asset/place"),
									1024 * 1024 * 30,
									"UTF-8",
									new DefaultFileRenamePolicy()
								);
		System.out.println(req.getRealPath("/asset/place"));

		HttpSession session = req.getSession();
		
		//1. 데이터 가져오기(subject, content)
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		String id = session.getAttribute("auth").toString();
		String mode = multi.getParameter("mode");
		String attach = multi.getFilesystemName("attach");
		
		//2. DB 작업 > insert
		BoardDAO dao = BoardDAO.getInstance();
		
		//새글 쓰기 vs 답변글 쓰기
		
		int thread = -1;
		int depth = -1;
		
		if (mode.equals("new")) {
			
			//새글 쓰기
			//a. 현존하는 모든 게시물 중에서 가장 큰 thread 값을 찾아서 그 값에 +1000을 한 값을 새 글의 thread 값으로 넣는다.
			thread = dao.getMaxThread() + 1000;
			
			//b. 새 글의 depth 값은 0을 넣는다.
			depth = 0;
			
		} else {
			
			//답변 하기
			int parentThread = Integer.parseInt(multi.getParameter("thread"));
			int parentDepth = Integer.parseInt(multi.getParameter("depth"));
			int previousThread = (int)Math.floor((parentThread - 1) / 1000) * 1000;
			
			//a. 현존하는 모든 게시물의 thread 값을 대상으로, 현재 작성 중인 답변글의 부모글 thread 값보다 작고, 이전 새글의 thread 값보다 큰 thread를 모두 찾아서 -1을 한다.
			HashMap<String,Integer> map = new HashMap<String,Integer>();
			map.put("parentThread", parentThread);
			map.put("previousThread", previousThread);
			
			dao.updateThread(map);
			
			//b. 답변글의 thread 값은 부모글의 thread - 1 을 넣는다.
			thread = parentThread - 1;
			
			//c. 답변글의 depth 값을 부모글의 depth + 1 을 넣는다.
			depth = parentDepth + 1;
			
		}
		
		BoardDTO dto = new BoardDTO();
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setId(id);
		dto.setThread(thread);
		dto.setDepth(depth);
		dto.setAttach(attach);
		
		//HTML 태그 이스케이프 
//		content = content.replace("<", "&lt;").replace(">", "&gt;");
//		dto.setContent(content);
		
		int result = dao.add(dto);
		
		//3. 결과 처리
		if (result == 1) {
			resp.sendRedirect("/toy/board/list.do");
		} else {
			OutputUtil.redirect(resp, "쓰기 실패!");
		}
	
	}
}











