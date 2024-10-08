package oracle.tblBook;

import oracle.BasicInfo_me;

public class book_seq {


    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo_me dbHelper = new BasicInfo_me();

        // 시퀀스 생성 SQL 쿼리
        String createSequenceQuery = "CREATE SEQUENCE book_seq "
                                   + "START WITH 1 "
                                   + "INCREMENT BY 1";

        // 시퀀스 생성 메서드 호출
        dbHelper.createSequence(createSequenceQuery);
    
    }
}

