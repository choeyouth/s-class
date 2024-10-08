package oracle.ddl;

import oracle.BasicInfo_me;

public class preference_ddl {
	
	// ddl > seq > dml 
	// book > member > memberInfo > manager > discussionBoard > discussionReply 
	// ddl 파일만 > bookReview > bookMark > note > rank > quote > word > 
	
	// 장르 > 서브 장르 > preference 
	
	public static void main(String[] args) {
		
		// SQL 실행부를 담당하는 DBHelper 객체 생성
		BasicInfo_me dbHelper = new BasicInfo_me();
	
	    
	    // 테이블 생성 SQL 쿼리
	    String createTableQuery = "CREATE TABLE tblPreference ("
	                            + "seq NUMBER PRIMARY KEY, "
	                            + "member_seq NUMBER NOT NULL, "
	                            + "subGenre_seq NUMBER NOT NULL, "
	                            + "targetRead NUMBER NOT NULL, "
	                            + "FOREIGN KEY (member_seq) REFERENCES tblMember(seq), "
	                            + "FOREIGN KEY (subGenre_seq) REFERENCES tblSubGenre(seq)"
	                            + ")";
	
	    // 테이블 생성 메서드 호출
	    dbHelper.createTable(createTableQuery);
	    
	    
	    // 시퀀스 생성 SQL 쿼리
        String createSequenceQuery = "CREATE SEQUENCE preference_seq "
                + "START WITH 1 "
                + "INCREMENT BY 1";

		// 시퀀스 생성 메서드 호출
		dbHelper.createSequence(createSequenceQuery);
		

    
	}

}
