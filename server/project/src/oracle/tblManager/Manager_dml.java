package oracle.tblManager;

import oracle.BasicInfo_me;

public class Manager_dml {

    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo_me dbHelper = new BasicInfo_me();

        
        // 데이터 삽입 SQL 쿼리
        /*
        String insertQuery = "INSERT INTO tblManager (seq, id, password) "
                		   + "VALUES (manager_seq.NEXTVAL, 'yujeng', 'chldbwjd1234~')";
        
        // 데이터 삽입 메서드 호출
        dbHelper.insertData(insertQuery);
        */
        
        
        // 배치로 삽입할 여러 SQL 쿼리
        String[] insertQueries = {
            "INSERT INTO tblManager (seq, id, password) VALUES (manager_seq.NEXTVAL, 'yujeng', 'chldbwjd1234~')",
            "INSERT INTO tblManager (seq, id, password) VALUES (manager_seq.NEXTVAL, 'doil', 'ghkdehdlf1234~')",
            "INSERT INTO tblManager (seq, id, password) VALUES (manager_seq.NEXTVAL, 'jieun', 'dnjswldms1234~')",
            "INSERT INTO tblManager (seq, id, password) VALUES (manager_seq.NEXTVAL, 'jaekwon', 'chlwornjs1234~')"
        };

        // 배치 처리로 여러 데이터 삽입
        dbHelper.insertDataBatch(insertQueries);
        
        
        
    }
}


