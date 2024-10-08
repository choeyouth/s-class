package oracle.tblBook;

import oracle.BasicInfo_me;

public class book_ddl {
	
	public static void main(String[] args) {
		
		
		// SQL 실행부를 담당하는 DBHelper 객체 생성
    	BasicInfo_me dbHelper = new BasicInfo_me();

        
        // 테이블 생성 SQL 쿼리
        String createTableQuery = "CREATE TABLE tblBook ("
                                + "seq NUMBER PRIMARY KEY, "
                                + "subGenre_seq NUMBER NOT NULL, "
                                + "name VARCHAR2(200) NOT NULL, "
                                + "author VARCHAR2(1000) NOT NULL, "
                                + "publicationDate DATE NOT NULL, "
                                + "story VARCHAR2(4000) NULL, "
                                + "cover VARCHAR2(500) NOT NULL, "
                                + "FOREIGN KEY (subGenre_seq) REFERENCES tblSubGenre(seq)"
                                + ")";

        // 테이블 생성 메서드 호출
        dbHelper.createTable(createTableQuery);

	}	
}
