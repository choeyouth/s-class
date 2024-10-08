package com.test.toy.user.repository;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import com.test.toy.user.model.UserDTO;

class UserDAOTest {

	
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
	
}
