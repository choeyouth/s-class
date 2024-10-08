package oracle.tblGenreList;

import oracle.BasicInfo;

public class genreList_seq {


    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();

        // 시퀀스 생성 SQL 쿼리
        String createSequenceQuery = "CREATE SEQUENCE genreList_seq "
                                   + "START WITH 1 "
                                   + "INCREMENT BY 1";

        // 시퀀스 생성 메서드 호출
        dbHelper.createSequence(createSequenceQuery);
    
    }
}

