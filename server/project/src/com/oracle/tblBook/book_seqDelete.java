package oracle.tblBook;

import oracle.BasicInfo_me;

public class book_seqDelete {


    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo_me dbHelper = new BasicInfo_me();

        // 시퀀스 삭제
        dbHelper.dropSequence("book_seq");
        
    }
}