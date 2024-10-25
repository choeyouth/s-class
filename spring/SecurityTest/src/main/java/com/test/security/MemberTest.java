package com.test.security;

import static org.junit.Assert.assertNotNull;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
			"file:src/main/webapp/WEB-INF/spring/root-context.xml",
			"file:src/main/webapp/WEB-INF/spring/security-context.xml"
		})
public class MemberTest {

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Test
	public void testNotNull() {
		
		assertNotNull(dataSource);
		assertNotNull(passwordEncoder);
	}
	
	@Test
	public void testEncrypt() {

		//1. $2a$10$/kSqFwgtPUKqu0MvutViWOxGubhS946gyzMlbvkGMMziyzNtqoT9u
		//2. $2a$10$KPTrMUVBHA5JN683xU286uWh216v28QB3DIVpTRTRHAVocn9uZAFK
		// == 1111
		//암호화된 암호를 알려줌 
		
		String pw = "1111";
		System.out.println(passwordEncoder.encode(pw));

		String pw2 = "1111";
		System.out.println(passwordEncoder.encode(pw2));
	}
	
	@Test
	@Ignore
	public void insertMember() {
		
		String sql = "insert into member (memberid, memberpw, membername, enabled, email, age, gender) values (?, ?, ?, default, ?, ?, ?)";
		
		try {
			
			Connection conn = dataSource.getConnection();
			PreparedStatement pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, "dog");
			pstat.setString(2, passwordEncoder.encode("1111"));
			pstat.setString(3, "강아지");
			pstat.setString(4, "dog@gmail.com");
			pstat.setString(5, "3");
			pstat.setString(6, "m");
			pstat.executeUpdate();
			
			pstat.setString(1, "cat");
			pstat.setString(2, passwordEncoder.encode("1111"));
			pstat.setString(3, "고양이");
			pstat.setString(4, "cat@gmail.com");
			pstat.setString(5, "2");
			pstat.setString(6, "f");
			pstat.executeUpdate();
			
			pstat.setString(1, "tiger");
			pstat.setString(2, passwordEncoder.encode("1111"));
			pstat.setString(3, "호랑이");
			pstat.setString(4, "tiger@gmail.com");
			pstat.setString(5, "10");
			pstat.setString(6, "f");
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void insertAuth() {
		
		String sql = "insert into member_auth (memberid, auth) values (?, ?)";
		
		try {
			
			Connection conn = dataSource.getConnection();
			PreparedStatement stat = conn.prepareStatement(sql);
			
			stat.setString(1, "dog");
			stat.setString(2, "ROLE_MEMBER");
			stat.executeUpdate();

			stat.setString(1, "cat");
			stat.setString(2, "ROLE_MEMBER");
			stat.executeUpdate();

			stat.setString(1, "tiger");
			stat.setString(2, "ROLE_MEMBER");
			stat.executeUpdate();

			stat.setString(1, "tiger");
			stat.setString(2, "ROLE_ADMIN");
			stat.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
