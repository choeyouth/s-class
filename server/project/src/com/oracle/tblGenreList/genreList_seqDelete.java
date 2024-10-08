package oracle.tblGenreList;

import oracle.BasicInfo_me;

public class genreList_seqDelete {


    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo_me dbHelper = new BasicInfo_me();

        // 시퀀스 삭제
        dbHelper.dropSequence("genreList_seq");
        
    }
}
