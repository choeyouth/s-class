package com.test.java;

import java.sql.Connection;

//Ex02.java

public class Ex02 {
	
	public static void main(String[] args) {
		
		Connection conn = null;
		
		try {
			
			DBUtil util = new DBUtil();
			
			conn = util.open();
			
			System.out.println(conn.isClosed()); //false
			
			util.close(); //conn.close();
			
		} catch (Exception e) {
			System.out.println("Ex02.main");
			e.printStackTrace();
		}
		
	}
	
}
