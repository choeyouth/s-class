package oracle.ddl;

import oracle.BasicInfo_me;

public class note_ddl {
	
	
	public static void main(String[] args) {
		
		// SQL 실행부를 담당하는 DBHelper 객체 생성
		BasicInfo_me dbHelper = new BasicInfo_me();
	
	    
	    // 테이블 생성 SQL 쿼리
	    String createTableQuery = "CREATE TABLE tblNote ("
	                            + "seq NUMBER PRIMARY KEY, "
	                            + "bookReview_seq NUMBER NOT NULL, "
	                            + "content VARCHAR2(4000) NOT NULL, "
	                            + "bookdate DATE NOT NULL, "
	                            + "FOREIGN KEY (bookReview_seq) REFERENCES tblBookReview(seq)"
	                            + ")";
	
	    // 테이블 생성 메서드 호출
	    dbHelper.createTable(createTableQuery);
	    
	    
	    // 시퀀스 생성 SQL 쿼리
        String createSequenceQuery = "CREATE SEQUENCE note_seq "
                + "START WITH 1 "
                + "INCREMENT BY 1";

		// 시퀀스 생성 메서드 호출
		dbHelper.createSequence(createSequenceQuery);
		

    
	}

}
