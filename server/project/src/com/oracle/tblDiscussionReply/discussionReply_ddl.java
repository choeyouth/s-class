package oracle.tblDiscussionReply;

import oracle.BasicInfo_me;

public class discussionReply_ddl {

	public static void main(String[] args) {
		
		
		// SQL 실행부를 담당하는 DBHelper 객체 생성
    	BasicInfo_me dbHelper = new BasicInfo_me();
    	
        
    	// 문제점 오류: ORA-00904 - Invalid Identifier > COMMENT > Oracle 예약어! 
    	// 테이블 생성 SQL 쿼리
    	String createTableQuery = "CREATE TABLE tblDiscussionReply ("
    	        + "seq NUMBER PRIMARY KEY, "
    	        + "discussionBoard_seq NUMBER NOT NULL, "
    	        + "member_seq NUMBER NOT NULL, "
    	        + "reply VARCHAR2(1000) NOT NULL, "
    	        + "commitDate DATE NOT NULL, "
    	        + "FOREIGN KEY (discussionBoard_seq) REFERENCES tblDiscussionBoard(seq), "
    	        + "FOREIGN KEY (member_seq) REFERENCES tblMember(seq)"
    	        + ")";

        
        // 테이블 생성 메서드 호출
        dbHelper.createTable(createTableQuery);
        
        
	}
	
}
