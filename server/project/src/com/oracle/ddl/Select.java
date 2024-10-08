package oracle.ddl;

import oracle.BasicInfo_me;

public class Select {

    public static void main(String[] args) {
        // SQL 실행부를 담당하는 DBHelper 객체 생성
    	BasicInfo_me dbHelper = new BasicInfo_me();

        // 실행할 SQL 쿼리
//        String query1 = "SELECT * FROM tblBook";
        String query1 = "SELECT * FROM tblBook";

        // 쿼리 실행
        System.out.println("=======================================");
        System.out.println("BOOKS");
        System.out.println("=======================================");
        dbHelper.executeQuery(query1);
        
    }
}
