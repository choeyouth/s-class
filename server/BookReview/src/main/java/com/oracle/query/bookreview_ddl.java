package com.oracle.query;

import com.oracle.BasicInfo;

public class bookreview_ddl {
	
	public static void main(String[] args) {
	
		// SQL 실행부를 담당하는 DBHelper 객체 생성
		BasicInfo dbHelper = new BasicInfo();
	
	    
	    // 테이블 생성 SQL 쿼리
		String createTableQuery = "CREATE TABLE tblBookReview ( seq NUMBER(10) PRIMARY KEY, book_seq NUMBER(14) NOT NULL, commend VARCHAR2(1000) NOT NULL, member_seq NUMBER NOT NULL, review_date DATE DEFAULT sysdate NOT NULL, CONSTRAINT fk_book_seq FOREIGN KEY (book_seq) REFERENCES tblBook(seq), CONSTRAINT fk_member_seq FOREIGN KEY (member_seq) REFERENCES tblMember(seq) )";
	
	    // 테이블 생성 메서드 호출
	    dbHelper.createTable(createTableQuery);
	    
	    
	    // 시퀀스 생성 SQL 쿼리
        String createSequenceQuery = "CREATE SEQUENCE bookreview_seq "
                + "START WITH 1 "
                + "INCREMENT BY 1";

		// 시퀀스 생성 메서드 호출
		dbHelper.createSequence(createSequenceQuery);
		

    
	}

}
