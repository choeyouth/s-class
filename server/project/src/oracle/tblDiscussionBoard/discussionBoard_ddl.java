package oracle.tblDiscussionBoard;

import oracle.BasicInfo_me;

public class discussionBoard_ddl {

	public static void main(String[] args) {
		
		
		// SQL 실행부를 담당하는 DBHelper 객체 생성
    	BasicInfo_me dbHelper = new BasicInfo_me();

        
        // 테이블 생성 SQL 쿼리
        String createTableQuery = "CREATE TABLE tblDiscussionBoard ("
                + "seq NUMBER PRIMARY KEY, "
                + "book_seq NUMBER NOT NULL, "
                + "member_seq NUMBER NOT NULL, "
                + "title VARCHAR2(100) NOT NULL, "
                + "content VARCHAR2(4000) NOT NULL, "
                + "postDate DATE NOT NULL, "
                + "FOREIGN KEY (book_seq) REFERENCES tblBook(seq), "
                + "FOREIGN KEY (member_seq) REFERENCES tblMember(seq)"
                + ")";
        

        // 테이블 생성 메서드 호출
        dbHelper.createTable(createTableQuery);
        
        
	}
	
}
