package com.oracle;

public class ex16_preference_dml {

    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();
        
        
        // 배치로 삽입할 여러 SQL 쿼리
        String[] insertQueries = {
            "INSERT INTO tblPreference (seq, member_seq, subGenre_seq,targetRead) VALUES (1, 1, 2, 4)",
            "INSERT INTO tblPreference (seq, member_seq, subGenre_seq,targetRead) VALUES (2, 2, 576, 5)"
        };

        // 배치 처리로 여러 데이터 삽입
        dbHelper.insertDataBatch(insertQueries);

        
    }
}