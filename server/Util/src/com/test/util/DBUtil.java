package com.test.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	
	private static Connection conn = null;
	
	public static Connection open() {
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "server";
		String pw = "java1234";
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			//conn.setAutoCommit(false);
			
			return conn;
			
		} catch (Exception e) {
			System.out.println("DBUtil.open");
			e.printStackTrace();
		}
		
		return null;
	
	}
	
	//메서드 오버로딩 
	public static Connection open(String serverIP, String id, String pw) {
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";

		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			//conn.setAutoCommit(false);
			
			return conn;
			
		} catch (Exception e) {
			System.out.println("DBUtil.open");
			e.printStackTrace();
		}
		
		return null;
	
	}

}
