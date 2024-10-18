package com.test.mybatis.persistence;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaxxer.hikari.HikariDataSource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DBCPTest {
	
	@Autowired
	private DataSource dataSource;
	//JUnit > 필드주입으로만 의존 주입이 가능함
	
	@Autowired
	private HikariDataSource hikariDataSource;

	@Test
	public void testConnection() {
		assertNotNull(dataSource);
		
		try {
			
			Connection conn = dataSource.getConnection();
			
			assertEquals(false, conn.isClosed());
			
			conn.close(); 
			//DBCP로 관리되는 Connection은 close() 호출해도 실제 close()가 되지 않고, Connection Pool로 반납되어 돌아간다. 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testHikariConnection() {
		
		assertNotNull(hikariDataSource);
		
		try {
			
			Connection conn = hikariDataSource.getConnection();
			
			assertEquals(false, conn.isClosed());
			
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
