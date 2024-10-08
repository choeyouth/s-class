package oracle.ddl;

import oracle.BasicInfo_me;

public class subGenre_ddl {
	
	public static void main(String[] args) {
		
		// SQL 실행부를 담당하는 DBHelper 객체 생성
		BasicInfo_me dbHelper = new BasicInfo_me();
	
	    
	    // 테이블 생성 SQL 쿼리
	    String createTableQuery = "CREATE TABLE tblSubGenre ("
	                            + "seq NUMBER PRIMARY KEY, "
	                            + "genre_seq NUMBER NOT NULL, "
	                            + "subGenre VARCHAR2(100) NOT NULL, "
	                            + "FOREIGN KEY (genre_seq) REFERENCES tblGenreList(seq)"
	                            + ")";
	
	    // 테이블 생성 메서드 호출
	    dbHelper.createTable(createTableQuery);
	    
	    
	    // 시퀀스 생성 SQL 쿼리
        String createSequenceQuery = "CREATE SEQUENCE subGenre_seq "
                + "START WITH 1 "
                + "INCREMENT BY 1";

		// 시퀀스 생성 메서드 호출
		dbHelper.createSequence(createSequenceQuery);
		

    
	}

}
