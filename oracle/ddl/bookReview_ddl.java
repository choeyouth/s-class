package oracle.ddl;

import oracle.BasicInfo_me;

public class bookReview_ddl {
	
	
	public static void main(String[] args) {
		
		// SQL 실행부를 담당하는 DBHelper 객체 생성
		BasicInfo_me dbHelper = new BasicInfo_me();
	
	    
	    // 테이블 생성 SQL 쿼리
	    String createTableQuery = "CREATE TABLE tblBookReview ("
	                            + "seq NUMBER PRIMARY KEY, "
	                            + "book_seq NUMBER NOT NULL, "
	                            + "member_seq NUMBER NOT NULL, "
	                            + "FOREIGN KEY (book_seq) REFERENCES tblBook(seq), "
	                            + "FOREIGN KEY (member_seq) REFERENCES tblMember(seq)"
	                            + ")";
	
	    // 테이블 생성 메서드 호출
	    dbHelper.createTable(createTableQuery);
	    
	    
	    // 시퀀스 생성 SQL 쿼리
        String createSequenceQuery = "CREATE SEQUENCE bookreview_seq "
                + "START WITH 1 "
                + "INCREMENT BY 1";

		// 시퀀스 생성 메서드 호출
		dbHelper.createSequence(createSequenceQuery);
		
//        
//        
//CREATE SEQUENCE bookreview_seq;
//
//        "CREATE TABLE tblBookReview ("
//            + "seq NUMBER PRIMARY KEY, "
//            + "book_seq NUMBER, "
//            + "member_seq NUMBER)",
		

    
	}

	
	
}
