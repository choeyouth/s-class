package com.oracle;

public class dropTable {

	public static void main(String[] args) {
        // BasicInfo 클래스 인스턴스 생성
        BasicInfo_me basicInfo = new BasicInfo_me();
        
        // 삭제할 테이블 이름
        String tableName = "tblBook"; // 삭제할 테이블 이름을 지정합니다.
        
        // 테이블 삭제 메서드 호출
        basicInfo.dropTable(tableName);

	}

}
