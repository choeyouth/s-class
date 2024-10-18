package com.test.mybatis.persistence;

import static org.junit.Assert.assertNotNull;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MyBatisTest {
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Test 
	public void testSessionTemplate() {
		
		assertNotNull(sqlSessionFactory);
		
		//SqlSession > SqlSessionTemplate의 부모 인터페이스
		SqlSession session = sqlSessionFactory.openSession();
	
//		stat.executeXXX()의 역할
//		session.insert(null);
//		session.update(null);
//		session.delete(null);
//		session.selectOne(null);
		String time = session.selectOne("mybatis.time");
		System.out.println(time);
		
	}
	
	@Test
	public void testSessionTemplate2() {
		assertNotNull(template);
		String time = template.selectOne("mybatis.time");
		System.out.println(time);
	}
}








