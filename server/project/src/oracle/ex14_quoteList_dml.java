package com.oracle;

public class ex14_quoteList_dml {

    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();

        // 데이터 삽입 SQL 쿼리
        String[] insertQueries = {
            "INSERT INTO tblQuoteList VALUES (quote_seq.NEXTVAL, '책 없는 방은 영혼 없는 육체와 같다.','키케로')",
            "INSERT INTO tblQuoteList VALUES (quote_seq.NEXTVAL, '양서는 처음 읽을 때는 새 친구를 얻은 것 같고, 전에 정독한 책을 다시 읽을 때는 옛 친구를 만나는 것 같다.','골드 스미스')",
            "INSERT INTO tblQuoteList VALUES (quote_seq.NEXTVAL, '내가 세계를 알게 된 것은 책에 의해서였다.','사르트르')",
            "INSERT INTO tblQuoteList VALUES (quote_seq.NEXTVAL, '약으로 병을 고치듯이 독서로 마음을 다스린다.','카이사르')",
            "INSERT INTO tblQuoteList VALUES (quote_seq.NEXTVAL, '독서는 완성된 사람을 만들고, 담론은 재치있는 사람을 만들며, 필기는 정확한 사람을 만든다.','베이컨')",
            "INSERT INTO tblQuoteList VALUES (quote_seq.NEXTVAL, '남의 책을 읽는 것에 시간을 보내라. 남이 고생한 것에 의해서 자신을 쉽게 개선할 수 있다.','소크라테스')",
            "INSERT INTO tblQuoteList VALUES (quote_seq.NEXTVAL, '언제든 괴로운 환상을 위로하고자 한다면 너의 책으로 달려가라. 책은 언제나 변함없는 친절로 너를 대한다.','풀러')",
            "INSERT INTO tblQuoteList VALUES (quote_seq.NEXTVAL, '내가 인생을 안 것은 사람과 접촉했기 때문이 아니라 책과 접촉했었기 때문이다.','아나톨 프랑스')",
            "INSERT INTO tblQuoteList VALUES (quote_seq.NEXTVAL, '모든 양서를 읽는 것은 지난 몇 세기 동안 걸친 가장 훌륭한 사람들과 대화 하는 것과 같다.','데카르트')",
            "INSERT INTO tblQuoteList VALUES (quote_seq.NEXTVAL, '책을 사느라 들인 돈은 결코 손해가 아니다. 오히려 훗날에 만 배의 이익을 얻게 될 것이다.','왕안석')",
            "INSERT INTO tblQuoteList VALUES (quote_seq.NEXTVAL, '오늘의 나를 있게 한 것은 우리 마을의 도서관이었다. 하버드 졸업자보다도 소중한 것이 독서하는 습관이다.','빌 게이츠')",
            "INSERT INTO tblQuoteList VALUES (quote_seq.NEXTVAL, '책 속에는 과거의 모든 영혼이 가로누워 있다.','칼라일')",
            "INSERT INTO tblQuoteList VALUES (quote_seq.NEXTVAL, '책이란 넓디넓은 시간의 바다를 지나가는 배이다.','프랜시스 베이컨')",
            "INSERT INTO tblQuoteList VALUES (quote_seq.NEXTVAL, '당신에게 가장 필요한 책은 당신으로 하여금 가장 많이 생각하게 만드는 책이다.','마크 트웨인')",
            "INSERT INTO tblQuoteList VALUES (quote_seq.NEXTVAL, '보기 드문 지식인을 만났을 때는 그가 어떤 책을 읽는가를 물어보아야 한다.','에머슨')"
        };

        // 데이터 삽입 메서드 호출
        for (String insertQuery : insertQueries) {
            dbHelper.insertData(insertQuery);
        }
    }
}