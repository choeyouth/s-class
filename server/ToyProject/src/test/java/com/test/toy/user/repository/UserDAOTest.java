package com.test.toy.user.repository;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import com.test.toy.user.model.UserDTO;

class UserDAOTest {
	
	private static UserDAO dao;
	
	//나머지 테스트를 실행하기 전에 제일 먼저 실행할 클래스 
	@BeforeAll
	static void init() {
		dao = UserDAO.getInstance();
	}
	
	
	@Disabled
	@Test
	void testRegister() {
		
		//DAO의 회원 가입 기능
		UserDAO dao = UserDAO.getInstance();
		
		UserDTO dto = new UserDTO();
		dto.setId("cow1");
		dto.setPw("1111");
		dto.setEmail("cow1@naver.com");
		dto.setName("음매소1");
		dto.setIntro("하이");
		dto.setPic("pic.png");
		
		int result = dao.register(dto);
		
		//assertXXX()
		assertEquals(1, result);

	}
	
	@Disabled
	@Test 
	void testLogin() {
		
		UserDAO dao = UserDAO.getInstance();
		
		String id = "hong";
		String pw = "1111";
		
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setPw(pw);

		UserDTO result = dao.login(dto);
		
		assertNotNull(result);
		
	}
	
	@Disabled
	@Test 
	void testLogin2() {
		
		UserDAO dao = UserDAO.getInstance();
		
		String id = "hong";
		String pw = "1111123";
		
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setPw(pw);

		UserDTO result = dao.login(dto);
		
		assertNotNull(result);
		
	}
	
	@Disabled
	@Test 
	void testLogin3() {
		
		UserDAO dao = UserDAO.getInstance();
		
		String id = "hong";
		String pw = "1111";
		
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setPw(pw);

		UserDTO result = dao.login(dto);
		
		assertEquals("홍길동", result.getName());
		
	}
	
	@Test
	void testGetUser() {
		
		String id = "hong";
		
		UserDTO dto = dao.getUser(id);
		
		assertNotNull(dto);
		assertEquals("홍길동", dto.getName());
		
	}
}
