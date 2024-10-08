package oracle.ddl;

import oracle.BasicInfo;

public class word_ddl {
	
	public static void main(String[] args) {
		
		// SQL 실행부를 담당하는 DBHelper 객체 생성
		BasicInfo dbHelper = new BasicInfo();
	
	    
	    // 테이블 생성 SQL 쿼리
		String createTableQuery = "CREATE TABLE tblWordList ("
                + "target_code NUMBER PRIMARY KEY, "   
                + "word VARCHAR(200) NOT NULL, "       
                + "pos VARCHAR(200) NOT NULL, "       
                + "definition VARCHAR2(1000) NOT NULL"
                + ")";

	
	    // 테이블 생성 메서드 호출
	    dbHelper.createTable(createTableQuery);
	    
	    
	    // 시퀀스 생성 SQL 쿼리
        String createSequenceQuery = "CREATE SEQUENCE word_seq "
                + "START WITH 1 "
                + "INCREMENT BY 1";

		// 시퀀스 생성 메서드 호출
		dbHelper.createSequence(createSequenceQuery);
		
		
	}
	

}
