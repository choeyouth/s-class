package oracle.tblBook;

import oracle.BasicInfo_me;

public class book_dml {

    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo_me dbHelper = new BasicInfo_me();

        
        // 데이터 삽입 SQL 쿼리
        String insertQuery = "INSERT INTO tblBook (seq, genreList_seq, name, author, publicationDate, story, pageNum) "
                + "VALUES (book_seq.NEXTVAL, 1, '달과 6펜스', '윌리엄 서머싯 몸', TO_DATE('2000', 'YYYY'), '화가 폴 고갱의 삶의 단편들을 소설로 옮긴 강렬하고 흥미진진한 이야기. 예술에 사로잡힌 한 영혼의 악마적 개성과 예술 편력이 한 글자마다 거칠게 때로는 타히티의 태양볕처럼 열정적으로 칠해져 있다. 한 화가의 모습을 그려내는 동시에 원시에의 갈망과 현대 사회의 병폐적인 모순에 대한 반항적 요소가 고루 섞여 들어감으로써 위대한 예술의 서막을 알린다는 이 환상적인 발상은 영미문학 걸작 중의 한 작품으로 자리매김하게 만드는 데 모자람이 없는 근거이기도 하다.', 327)";

        
        
        // 데이터 삽입 메서드 호출
        dbHelper.insertData(insertQuery);
        
        
        /*
        // 배치로 삽입할 여러 SQL 쿼리
        String[] insertQueries = {
            "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'gildong2', 'ghdrlfehd1~')",
            "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'amugae', 'dkanro1~')"
        };

        // 배치 처리로 여러 데이터 삽입
        dbHelper.insertDataBatch(insertQueries);
        */
        
    }
}


