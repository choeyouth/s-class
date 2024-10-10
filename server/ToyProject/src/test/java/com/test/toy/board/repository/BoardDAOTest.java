package com.test.toy.board.repository;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.Calendar;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.test.toy.board.model.BoardDTO;

public class BoardDAOTest {

	private static BoardDAO dao;
	
	@BeforeAll
	static void init() {
		dao = BoardDAO.getInstance();
	}
	
	
	//@Disabled
	@DisplayName("게시판 글을 작성합니다.")
	@Test
	void testAdd1() {
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO dto = new BoardDTO();
		dto.setId("hong");
		dto.setSubject("게시판입니다.");
		dto.setContent("내용입니다.");
		
		int result = dao.add(dto);
		
		assertEquals(1, result);
		
	}
	
	@Disabled
	@DisplayName("제목을 빼고 글을 작성합니다.")
	@Test
	void testAdd2() {
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO dto = new BoardDTO();
		dto.setId("hong");
		dto.setSubject(null);
		dto.setContent("내용입니다.");
		
		int result = dao.add(dto);
		
		assertEquals(1, result);
		
	}
	
	@Disabled
	@DisplayName("로그인을 안했는데 글을 작성합니다.")
	@Test
	void testAdd3() {
		
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO dto = new BoardDTO();
		dto.setId(null);
		dto.setSubject("게시판입니다.");
		dto.setContent("내용입니다.");
		
		int result = dao.add(dto);
		
		assertEquals(1, result);
		
	}
	
	
	@Disabled
	@DisplayName("목록을 가져옵니다.")
	@Test
	void testList() {
		
//		ArrayList<BoardDTO> list = dao.list();
//		System.out.println(list.get(0));
//		assertEquals(1, list.size());
		
	}
	
	
	@DisplayName("(날짜를 가공해서) 목록을 가져옵니다.")
	@Test
	void testList2() {
		
//		ArrayList<BoardDTO> list = dao.list();
//		assertEquals(8, list.size());
//		
//		System.out.println(list.get(0).getRegtime());
//		System.out.println(list.get(7).getRegtime());
		
	}
	

	@Disabled
	@DisplayName("글 1개를 상세 보기 합니다.")
	@Test
	void testGet() {
		String seq = "1";
		BoardDTO dto = dao.get(seq);
		assertNotNull(dto);
		assertEquals("게시판입니다.", dto.getSubject());
		assertEquals("1", dto.getSeq());
	}
	
	
	@DisplayName("1번 글의 조회수를 증가시킵니다.")
	@Test
	void testUpdateReadcount() {
		String seq = "10";
		
		int count = dao.get(seq).getReadcount(); //0
		 
		dao.updateReadcount(seq); //0 > 1
		assertEquals(count + 1, dao.get(seq).getReadcount());
		
	}
	
	
	@Disabled
	@DisplayName("제목/내용을 수정합니다.")
	@Test
	void testEdit() {
		
		Calendar now = Calendar.getInstance();
		
		BoardDTO dto = new BoardDTO();
		dto.setSeq("1");
		dto.setSubject("제목입니다. " + String.format("%tT", now));
		dto.setContent("내용입니다. " + String.format("%tT", now));
		
		int result = dao.edit(dto);
		
		assertEquals(1, result);
		
	}
	
	
	@DisplayName("게시물을 삭제합니다.")
	@Test
	void testDel()  {
		
		String seq = "4";
		int result = dao.del(seq);
		assertEquals(1, result);
		
	}
	

}
