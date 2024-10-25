package com.test.security;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.test.security.mapper.SecurityMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DBTest {
	
	@Autowired
	private SecurityMapper mapper;
	
	@Test
	public void testDB() {
		
		assertNotNull(mapper);
		
		System.out.println("1 >>> " + mapper.time1()); //어노테이션 방식 
		System.out.println("2 >>> " + mapper.time2()); //XML 방식
 		
	}
}