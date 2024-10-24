package oracle.tblDiscussionBoard;

import oracle.BasicInfo_me;

public class discussionBoard_dml {

    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo_me dbHelper = new BasicInfo_me();

        
        // 데이터 삽입 SQL 쿼리
        String insertQuery = "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) "
                + "VALUES (discussionBoard_seq.NEXTVAL, 1, 1, '달과 6펜스에 대해', '서머싯 몸(Somerset Maugham)의 \"달과 6펜스\"는 예술과 인생의 갈등, 인간 본성의 복잡성을 다룬 작품으로, 주인공 찰스 스트릭랜드가 자신의 가족과 안정된 삶을 버리고 예술에 몰두하는 모습을 통해 예술가의 열망과 그로 인한 희생을 탐구합니다.\n"
                + "\n"
                + "먼저, 이 소설은 예술을 추구하는 과정에서 인간관계와 도덕적 의무를 어떻게 다루어야 하는지에 대해 질문을 던집니다. 스트릭랜드는 모든 것을 희생하면서까지 자신의 예술적 충동을 따르는 인물로, 그의 선택을 어떻게 봐야 할까요? 한편으로는 예술적 자유와 창조성에 대한 열망을 존중할 수 있지만, 다른 한편으로는 가족과 사회적 책임을 저버리는 모습이 비판적으로 보일 수 있습니다. 여러분은 이 문제에 대해 어떻게 생각하나요?\n"
                + "\n"
                + "또한, 이 작품은 인간의 이기심과 집착에 대한 묘사도 흥미롭습니다. 스트릭랜드가 자신의 욕망을 충족하기 위해 다른 사람을 이용하거나 상처를 주는 모습에서 인간의 본성이 드러납니다. 예술을 위해서라면 이기적인 행동이 정당화될 수 있을까요?\n"
                + "\n"
                + "', SYSDATE)";

        
        
        // 데이터 삽입 메서드 호출
        dbHelper.insertData(insertQuery);
        
        
        // 배치로 삽입할 여러 SQL 쿼리
        
        
        String[] insertQueries = {
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, '책 번호', 1, '사회적 계층과 결혼의 딜레마', '제인 오스틴의 『오만과 편견』은 사회적 계층과 결혼, 자아 발견에 대한 깊이 있는 탐구를 제공합니다. 이 소설이 현대 사회에서도 여전히 관련성이 있는 이유는 무엇일까요? 시대를 초월한 오스틴의 통찰력은 오늘날의 사회적 이슈와 어떻게 연결될 수 있을까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 418906, 2, '전체주의와 감시 사회의 경고', '조지 오웰의 『1984』는 전체주의와 감시 사회에 대한 강력한 비판을 담고 있습니다. 현대 사회에서 오웰의 경고가 여전히 유효한 이유는 무엇일까요? 기술 발전이 사회의 감시 구조에 미치는 영향에 대해 어떻게 논의할 수 있을까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 16211750, 3, '도덕적 갈등과 구속의 탐구', '도스토예프스키의 『죄와 벌』은 인간의 도덕적 갈등과 구속의 과정을 심도 깊게 탐구합니다. 이 작품이 현대의 윤리적 문제와 어떻게 연관될 수 있을까요? 도덕적 죄책감과 사회적 처벌에 대한 이해를 어떻게 새롭게 할 수 있을까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 417997, 4, '물질주의와 꿈의 허상', 'F. 스콧 피츠제럴드의 『위대한 개츠비』는 1920년대 미국 사회의 물질주의와 꿈의 허상을 탐구합니다. 이 소설이 현대 사회에서 물질주의와 꿈의 실현에 대한 시각을 어떻게 반영하고 있을까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 491611, 5, '자아 실현과 존재의 의미', '오에 겐자부로의 『인간 실격』은 인간 존재의 의미와 자아 실현에 대한 고민을 담고 있습니다. 현대 사회에서 자아 실현의 중요성과 관련하여 이 책이 제시하는 통찰은 무엇일까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 237763, 6, '예술과 개인적 희생의 갈등', '서머싯 몸의 『달과 6펜스』는 예술가의 삶과 개인적 희생을 탐구합니다. 예술과 개인적 성취 간의 갈등을 현대 사회에서 어떻게 다룰 수 있을까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 25559344, 7, '인간의 이중성과 도덕적 갈등', '로버트 루이스 스티븐슨의 『지킬 박사와 하이드 씨』는 인간의 이중성과 도덕적 갈등을 탐구합니다. 현대 사회에서 인간의 이중성을 어떻게 이해하고 적용할 수 있을까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 58631, 8, '역사와 문화를 넘어서는 환상', '가브리엘 가르시아 마르케스의 『백년 동안의 고독』은 라틴 아메리카의 역사와 문화를 환상적으로 그려냅니다. 이 작품이 현대 사회의 역사적 이해와 상상력을 어떻게 자극할 수 있을까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 20908938, 9, '사랑과 사회적 규범의 갈등', '레프 톨스토이의 『안나 카레니나』는 사랑과 사회적 규범 사이의 갈등을 탐구합니다. 현대 사회에서 사랑과 사회적 규범의 관계를 어떻게 조명할 수 있을까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 2502422, 10, '현재에 집중하는 삶의 중요성', '에크하르트 톨레의 『지금 이 순간을 살아라』는 현재의 순간에 집중하는 중요성을 다룹니다. 현대인의 삶에서 현재에 집중하는 것이 왜 중요한지 논의해 볼 필요가 있습니다.', SYSDATE)",
//            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, '책 번호', 11, '행동을 시작하는 동기와 전략', '메리 모러의 『지금 당장 시작하라』는 행동을 시작하는 데 필요한 동기와 전략을 제시합니다. 현대 사회에서 즉각적인 행동과 목표 설정의 중요성을 어떻게 다룰 수 있을까요?', SYSDATE)",
//            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, '책 번호', 12, '동기와 자율성의 힘', '에드워드 데시의 『자기 결정의 심리학』은 인간의 동기와 자율성에 대해 다룹니다. 현대 사회에서 자기 결정과 자율성이 개인의 성취와 행복에 미치는 영향은 무엇일까요? 자율성을 증진하기 위한 방법은 어떤 것들이 있을까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 308822243, 13, '청소년기의 고뇌와 사회적 소외', 'J.D. 샐린저의 『호밀밭의 파수꾼』은 청소년기의 고뇌와 사회적 소외를 탐구합니다. 현대 사회에서 청소년의 심리적 문제와 사회적 문제를 어떻게 이해하고 지원할 수 있을까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 14522431, 14, '인간의 의지와 극복', '어니스트 헤밍웨이의 『노인과 바다』는 인간의 의지와 극복의 이야기를 담고 있습니다. 현대 사회에서 인간의 의지와 극복을 어떻게 이해하고 적용할 수 있을까요? 이 소설의 메시지가 오늘날 우리에게 주는 교훈은 무엇일까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 40674, 15, '권력과 부패의 교훈', '조지 오웰의 『동물 농장』은 권력과 부패에 대한 강력한 교훈을 담고 있습니다. 현대 사회에서 권력의 부패를 방지하기 위해 어떤 노력이 필요할까요? 이 책이 제시하는 정치적 메시지는 오늘날 어떻게 적용될 수 있을까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 307361, 16, '꿈과 개인적 전환의 이야기', '파울로 코엘료의 『연금술사』는 꿈과 개인적 전환에 관한 이야기를 담고 있습니다. 현대 사회에서 개인의 꿈을 이루기 위해 어떤 전략과 태도가 필요할까요? 이 책이 제시하는 전환의 과정은 어떤 의미를 가지나요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 14522472, 17, '전쟁과 인간의 본성', '어니스트 헤밍웨이의 『무기여 잘 있거라』는 전쟁과 인간의 본성을 탐구합니다. 현대 사회에서 전쟁의 영향과 인간 본성에 대한 이해를 어떻게 확장할 수 있을까요? 이 책의 시각이 오늘날의 갈등을 이해하는 데 어떻게 도움이 될까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 336605811, 18, '인간의 집착과 운명', '허먼 멜빌의 『모비 딕』은 인간의 집착과 운명에 관한 이야기를 담고 있습니다. 현대 사회에서 인간의 집착과 운명에 대한 이해를 어떻게 심화시킬 수 있을까요? 이 소설의 메시지가 오늘날의 삶에 어떤 의미를 가지나요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 7679, 19, '사회와 인간 본성의 풍자', '조나단 스위프트의 『걸리버 여행기』는 사회와 인간 본성에 대한 풍자를 담고 있습니다. 현대 사회에서 풍자적 시각을 통해 사회 문제를 어떻게 분석할 수 있을까요? 이 책이 제시하는 풍자의 교훈은 무엇일까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 49320142, 20, '현실과 이상 사이의 갈등', '미겔 데 세르반테스의 『돈키호테』는 현실과 이상 사이의 갈등을 다룹니다. 현대 사회에서 이상을 추구하면서도 현실적인 접근을 유지하기 위해 어떤 노력이 필요할까요? 이 책이 제시하는 갈등의 해결 방법은 무엇일까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 345266070, 1, '고전의 지혜가 현대에 주는 교훈', '고명환 저자의 『고전이 답했다 마땅히 살아야 할 삶에 대하여』는 인류의 지혜와 삶의 방향성을 고전에서 찾으려는 시도를 담고 있습니다. 이 책은 다양한 고전 문헌을 통해 ‘마땅히 살아야 할 삶’에 대해 탐구하며, 고전들이 현대 사회에서 여전히 유효한 이유를 설명합니다. 고전들은 시대를 초월한 인간의 본성과 도덕, 윤리에 관한 깊은 통찰을 제공하며, 이러한 지혜가 현대인의 삶에 어떤 영향을 미칠 수 있을까요? 고전의 교훈이 우리가 현재의 삶에서 겪는 도전과 갈등에 어떻게 적용될 수 있을지 고민해 볼 필요가 있습니다. 고전이 제시하는 '마땅히 살아야 할 삶'의 가치와 현대 사회의 윤리적, 도덕적 기준 사이에는 어떤 연결고리가 있을까요?', SYSDATE)",
            "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 344998179, 2, '현대 사회의 환상과 진실', '정유정 저자의 『영원한 천국』은 현대 사회의 환상과 현실을 탐구하며, 인간이 추구하는 이상과 그것이 실제 삶에서 어떻게 실현될 수 있는지를 다루고 있습니다. 이 책은 천국이나 이상향이라는 개념이 어떻게 인간의 삶과 가치관에 영향을 미치는지를 탐구하며, 현대 사회에서 이러한 이상이 어떻게 왜곡되거나 실현되는지를 분석합니다. 현대인의 삶 속에서 천국이나 이상향에 대한 갈망이 어떻게 표현되고 있으며, 이것이 현실과 어떤 충돌을 일으키는지에 대해 논의할 필요가 있습니다. 환상적인 세계와 현실 세계의 경계는 어떻게 설정되고 있으며, 우리는 이 두 세계 사이에서 어떻게 균형을 잡아야 할까요?', SYSDATE)"
        };

        // 배치 처리로 여러 데이터 삽입
        dbHelper.insertDataBatch(insertQueries);
        
        
       
        
    }
}


