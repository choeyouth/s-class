package oracle.ddl;

import oracle.BasicInfo_me;

public class word_drop {
	
	public static void main(String[] args) {
	    // BasicInfo 클래스 인스턴스 생성
	    BasicInfo_me basicInfo = new BasicInfo_me();
	    
	    // 삭제할 테이블 이름
	    String tableName = "tblSubGenre"; // 삭제할 테이블 이름을 지정합니다.
	    
	    // 테이블 삭제 메서드 호출
	    basicInfo.dropTable(tableName);
	   
	
	}

}
