package com.test.mybatis;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class DatasourceTest {

	@Autowired
	private DataSource dataSource;
	
	@Test
	public void testDatasource() throws SQLException {
		
		assertNotNull(dataSource);
		
		Connection conn = dataSource.getConnection();
		
		System.out.println(conn.isClosed());
		
	}
	
}




