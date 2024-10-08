package oracle.tblMemberInfo;

import oracle.BasicInfo_me;

public class memberInfo_ddl {

	public static void main(String[] args) {
		
		
		// SQL 실행부를 담당하는 DBHelper 객체 생성
    	BasicInfo_me dbHelper = new BasicInfo_me();

        
        // 테이블 생성 SQL 쿼리
        String createTableQuery = "CREATE TABLE tblMemberInfo ("
                + "seq NUMBER PRIMARY KEY, "
                + "member_seq NUMBER NOT NULL, "
                + "name VARCHAR2(20) NOT NULL, "
                + "address VARCHAR2(2000) NOT NULL, "
                + "tel VARCHAR2(20) NOT NULL, "
                + "email VARCHAR2(200) NOT NULL, "
                + "FOREIGN KEY (member_seq) REFERENCES tblMember(seq)"
                + ")";

        // 테이블 생성 메서드 호출
        dbHelper.createTable(createTableQuery);
        
        
	}
	
}
