package com.oracle;

public class ex01_genreList_dml {

    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();

        
        // 배치로 삽입할 여러 SQL 쿼리
        String[] insertQueries = {
        		"INSERT INTO tblGenreLIst VALUES(1,'가정/요리/뷰티')",
        		"INSERT INTO tblGenreLIst VALUES(2,'가정/원예/인테리어')",
        		"INSERT INTO tblGenreLIst VALUES(3,'가족/관계')",
        		"INSERT INTO tblGenreLIst VALUES(4,'건강/스포츠')",
        		"INSERT INTO tblGenreLIst VALUES(5,'건강/취미/레저')",
        		"INSERT INTO tblGenreLIst VALUES(6,'건축/디자인')",
        		"INSERT INTO tblGenreLIst VALUES(7,'게임/토이')",
        		"INSERT INTO tblGenreLIst VALUES(8,'경제경영')",
        		"INSERT INTO tblGenreLIst VALUES(9,'고등학교참고서')",
        		"INSERT INTO tblGenreLIst VALUES(10,'고전')",
        		"INSERT INTO tblGenreLIst VALUES(11,'공예/취미/수집')",
        		"INSERT INTO tblGenreLIst VALUES(12,'과학')",
        		"INSERT INTO tblGenreLIst VALUES(13,'교육/자료')",
        		"INSERT INTO tblGenreLIst VALUES(14,'금강산 여행 가는 이에게')",
        		"INSERT INTO tblGenreLIst VALUES(15,'기술공학')",
        		"INSERT INTO tblGenreLIst VALUES(16,'기타 언어권 도서')",
        		"INSERT INTO tblGenreLIst VALUES(17,'달력/기타')",
        		"INSERT INTO tblGenreLIst VALUES(18,'달력/다이어리/연감')",
        		"INSERT INTO tblGenreLIst VALUES(19,'대만도서')",
        		"INSERT INTO tblGenreLIst VALUES(20,'대학교재')",
        		"INSERT INTO tblGenreLIst VALUES(21,'독일 도서')",
        		"INSERT INTO tblGenreLIst VALUES(22,'만화')",
        		"INSERT INTO tblGenreLIst VALUES(23,'문구/비도서')",
        		"INSERT INTO tblGenreLIst VALUES(24,'법률')",
        		"INSERT INTO tblGenreLIst VALUES(25,'사회과학')",
        		"INSERT INTO tblGenreLIst VALUES(26,'소설/시/희곡')",
        		"INSERT INTO tblGenreLIst VALUES(27,'수험서')",
        		"INSERT INTO tblGenreLIst VALUES(28,'수험서/자격증')",
        		"INSERT INTO tblGenreLIst VALUES(29,'스페인 도서')",
        		"INSERT INTO tblGenreLIst VALUES(30,'어린이')",
        		"INSERT INTO tblGenreLIst VALUES(31,'언어학')",
        		"INSERT INTO tblGenreLIst VALUES(32,'에세이')",
        		"INSERT INTO tblGenreLIst VALUES(33,'여행')",
        		"INSERT INTO tblGenreLIst VALUES(34,'역사')",
        		"INSERT INTO tblGenreLIst VALUES(35,'예술/대중문화')",
        		"INSERT INTO tblGenreLIst VALUES(36,'외국어')",
        		"INSERT INTO tblGenreLIst VALUES(37,'요리')",
        		"INSERT INTO tblGenreLIst VALUES(38,'유아')",
        		"INSERT INTO tblGenreLIst VALUES(39,'유머')",
        		"INSERT INTO tblGenreLIst VALUES(40,'의학')",
        		"INSERT INTO tblGenreLIst VALUES(41,'인문/사회')",
        		"INSERT INTO tblGenreLIst VALUES(42,'인문학')",
        		"INSERT INTO tblGenreLIst VALUES(43,'일본 도서')",
        		"INSERT INTO tblGenreLIst VALUES(44,'자연과학')",
        		"INSERT INTO tblGenreLIst VALUES(45,'자연과학')",
        		"INSERT INTO tblGenreLIst VALUES(46,'잡지')",
        		"INSERT INTO tblGenreLIst VALUES(47,'장르소설')",
        		"INSERT INTO tblGenreLIst VALUES(48,'전기/자서전')",
        		"INSERT INTO tblGenreLIst VALUES(49,'전집/중고전집')",
        		"INSERT INTO tblGenreLIst VALUES(50,'종교/명상/점술')",
        		"INSERT INTO tblGenreLIst VALUES(51,'종교/역학')",
        		"INSERT INTO tblGenreLIst VALUES(52,'좋은부모')",
        		"INSERT INTO tblGenreLIst VALUES(53,'중국 도서')",
        		"INSERT INTO tblGenreLIst VALUES(54,'중학교참고서')",
        		"INSERT INTO tblGenreLIst VALUES(55,'청소년')",
        		"INSERT INTO tblGenreLIst VALUES(56,'청소년_추천도서')",
        		"INSERT INTO tblGenreLIst VALUES(57,'초등학교참고서')",
        		"INSERT INTO tblGenreLIst VALUES(58,'컴퓨터')",
        		"INSERT INTO tblGenreLIst VALUES(59,'컴퓨터/모바일')",
        		"INSERT INTO tblGenreLIst VALUES(60,'한국관련도서')",
        		"INSERT INTO tblGenreLIst VALUES(61,'해외잡지')",
        		"INSERT INTO tblGenreLIst VALUES(62,'ELT/어학/사전')",
        		"INSERT INTO tblGenreLIst VALUES(63,'Gift')",
        		"INSERT INTO tblGenreLIst VALUES(64,'기타')"
        };

        // 배치 처리로 여러 데이터 삽입
        dbHelper.insertDataBatch(insertQueries);
        
        
    }
}


