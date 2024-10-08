package oracle.tblGenreList;

import oracle.BasicInfo_me;

public class genreList_delete {

    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo_me dbHelper = new BasicInfo_me();

        // 데이터 삭제 SQL 쿼리 (예: '대한민국'이라는 이름을 가진 데이터를 삭제)
        // String deleteQuery = "DELETE FROM tblCountry WHERE NAME = '대한민국'";
        String deleteQuery = "DELETE FROM tblGenreList WHERE seq = 64";

        // 데이터 삭제 메서드 호출
        dbHelper.deleteData(deleteQuery);
    }
}
