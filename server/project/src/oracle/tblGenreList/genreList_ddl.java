package oracle.tblGenreList;

import oracle.BasicInfo_me;

public class genreList_ddl {
	
	public static void main(String[] args) {
		
		
		// SQL 실행부를 담당하는 DBHelper 객체 생성
    	BasicInfo_me dbHelper = new BasicInfo_me();

        
        // 테이블 생성 SQL 쿼리
        String createTableQuery = "CREATE TABLE tblGenreList ("
                                + "seq NUMBER PRIMARY KEY, "
                                + "genre VARCHAR2(100) NOT NULL)";
        
        // 테이블 생성 메서드 호출
        dbHelper.createTable(createTableQuery);

	}	
}
