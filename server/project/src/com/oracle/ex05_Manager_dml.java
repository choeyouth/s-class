package com.oracle;

public class ex05_Manager_dml {

    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();
        
        // 관리자 dml
        String[] insertQueries = {
            "INSERT INTO tblManager (seq, id, password) VALUES (manager_seq.NEXTVAL, 'yujeong', 'chldbwjd1234~')",
            "INSERT INTO tblManager (seq, id, password) VALUES (manager_seq.NEXTVAL, 'doil', 'ghkdehdlf1234~')",
            "INSERT INTO tblManager (seq, id, password) VALUES (manager_seq.NEXTVAL, 'jieun', 'dnjswldms1234~')",
            "INSERT INTO tblManager (seq, id, password) VALUES (manager_seq.NEXTVAL, 'jaekwon', 'chlwornjs1234~')"
        };

        // 배치 처리로 여러 데이터 삽입
        dbHelper.insertDataBatch(insertQueries);
        
        
    }
}


