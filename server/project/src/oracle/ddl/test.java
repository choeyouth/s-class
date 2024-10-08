package oracle.ddl;

import oracle.BasicInfo_me;

public class test {
	
	
	public static void main(String[] args) {
		
		// SQL 실행부를 담당하는 DBHelper 객체 생성
		BasicInfo_me dbHelper = new BasicInfo_me();
	
	    
	    // 테이블 생성 SQL 쿼리
	    String createTableQuery = "CREATE TABLE BOOKS ("
	                            + "itemId VARCHAR2(50), "
	                            + "title VARCHAR2(255), "
	                            + "author VARCHAR2(255), "
	                            + "priceSales NUMBER, "
	                            + "pubDate VARCHAR2(20), "
	                            + "cover VARCHAR2(500), "
	                            + "description CLOB, "
	                            + "categoryName VARCHAR2(255)"
	                            + ")";

	    
	    // 테이블 생성 메서드 호출
	    dbHelper.createTable(createTableQuery);
	    
	    
	    // 시퀀스 생성 SQL 쿼리
//        String createSequenceQuery = "CREATE SEQUENCE note_seq "
//                + "START WITH 1 "
//                + "INCREMENT BY 1";
//
//		// 시퀀스 생성 메서드 호출
//		dbHelper.createSequence(createSequenceQuery);
		

    
	}

}
