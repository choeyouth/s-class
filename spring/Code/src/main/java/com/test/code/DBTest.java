package com.test.code;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DBTest {
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Test
	public void testDB() {
		
		assertNotNull(template);
		
		String name = template.selectOne("code.test", 1);
		
		assertEquals("강아지", name);
		
	}
}