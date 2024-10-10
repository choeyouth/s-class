package com.oracle;

public class ex15_famousLine_dml {

    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();

        // 데이터 삽입 SQL 쿼리
        String[] insertQueries = {
        	    INSERT INTO tblBookMark (seq, regDate, book_seq, member_seq, famousline) VALUES (bookMark_seq.NEXTVAL, SYSDATE, 9788974255954, 1, '세상에서 가장 설득하기 힘든 것은 나 자신이다.세상에 지지 말자. 안될 거라고 말하는 세상에 쉽게 설득 당하지 말자');
        	    INSERT INTO tblBookMark (seq, regDate, book_seq, member_seq, famousline) VALUES (bookMark_seq.NEXTVAL, SYSDATE, 9788937462788, 1, '인간은 패배하도록 만들어진 것은 아니다. 인간은 파괴될 지언정 패배할 수는 없다');
        	    INSERT INTO tblBookMark (seq, regDate, book_seq, member_seq, famousline) VALUES (bookMark_seq.NEXTVAL, SYSDATE, 9788932917245, 1, '네 장미꽃을 그렇게 소중하게 만든 것은 그 꽃을 위해 네가 소비한 시간이란다. 가장 중요한 것은 눈에 보이지 않는 법이다.');
        	    INSERT INTO tblBookMark (seq, regDate, book_seq, member_seq, famousline) VALUES (bookMark_seq.NEXTVAL, SYSDATE, 9788954429900, 1, '삶의 후회를 남기지 말고, 사랑하는데 이유를 달지 마세요.');
        	    INSERT INTO tblBookMark (seq, regDate, book_seq, member_seq, famousline) VALUES (bookMark_seq.NEXTVAL, SYSDATE, 9788993734966, 1, '우리는 인생의 날들을 늘릴수는 없지만, 그 날들에 생기를 불어 넣을 수는 있다.');
        	    INSERT INTO tblBookMark (seq, regDate, book_seq, member_seq, famousline) VALUES (bookMark_seq.NEXTVAL, SYSDATE, 9788937437564, 1, '인간은 가장 깊은 절망의 순간에서조차 아름다운의 법칙에 따라 자신의 삶을 작곡한다.');
        	    INSERT INTO tblBookMark (seq, regDate, book_seq, member_seq, famousline) VALUES (bookMark_seq.NEXTVAL, SYSDATE, 9788934976417, 1, '천재는 노력하는 사람을 이기지 못하고, 노력하는 사람은 즐기는 사람을 이기지 못한다. 그러나 즐기는 사람은 돈 받고 일하는 사람에게는 이길 수 없다.');
        	    INSERT INTO tblBookMark (seq, regDate, book_seq, member_seq, famousline) VALUES (bookMark_seq.NEXTVAL, SYSDATE, 9788932917207, 1, '수백 년 동안 졌다고 해서 시작하기도 전에 이기려는 노력도 하지 말아야 할 까닭은 없으니까');
        	    INSERT INTO tblBookMark (seq, regDate, book_seq, member_seq, famousline) VALUES (bookMark_seq.NEXTVAL, SYSDATE, 9788954620437, 1, '우리가 중요시 여기는 것은 D를 강조한 네가지입니다. DANCE(춤), DRAMTICS(연극), DEBATING(토론), DATING(이성교제)');
        	    INSERT INTO tblBookMark (seq, regDate, book_seq, member_seq, famousline) VALUES (bookMark_seq.NEXTVAL, SYSDATE, 9791197377150, 1, '인생에 지나가는 사람들에게 상처받지 말자. 그들은 어자피 인생에서 지나가는 사람들일 뿐이다.');
        };


        // 데이터 삽입 메서드 호출
        for (String insertQuery : insertQueries) {
            dbHelper.insertData(insertQuery);
        }
    }
}



INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9788937460883, DEFAULT, 1, '사회적 계층과 결혼의 딜레마', '제인 오스틴의 『오만과 편견』은 사회적 계층과 결혼, 자아 발견에 대한 깊이 있는 탐구를 제공합니다. 이 소설이 현대 사회에서도 여전히 관련성이 있는 이유는 무엇일까요? 시대를 초월한 오스틴의 통찰력은 오늘날의 사회적 이슈와 어떻게 연결될 수 있을까요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9788937460777, DEFAULT, 2, '전체주의와 감시 사회의 경고', '조지 오웰의 『1984』는 전체주의와 감시 사회에 대한 강력한 비판을 담고 있습니다. 현대 사회에서 오웰의 경고가 여전히 유효한 이유는 무엇일까요? 기술 발전이 사회의 감시 구조에 미치는 영향에 대해 어떻게 논의할 수 있을까요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9788937462849, DEFAULT, 3, '도덕적 갈등과 구속의 탐구', '도스토예프스키의 『죄와 벌』은 인간의 도덕적 갈등과 구속의 과정을 심도 깊게 탐구합니다. 이 작품이 현대의 윤리적 문제와 어떻게 연관될 수 있을까요? 도덕적 죄책감과 사회적 처벌에 대한 이해를 어떻게 새롭게 할 수 있을까요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9788937460753, DEFAULT, 4, '물질주의와 꿈의 허상', 'F. 스콧 피츠제럴드의 『위대한 개츠비』는 1920년대 미국 사회의 물질주의와 꿈의 허상을 탐구합니다. 이 소설이 현대 사회에서 물질주의와 꿈의 실현에 대한 시각을 어떻게 반영하고 있을까요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9788937461033, DEFAULT, 5, '자아 실현과 존재의 의미', '오에 겐자부로의 『인간 실격』은 인간 존재의 의미와 자아 실현에 대한 고민을 담고 있습니다. 현대 사회에서 자아 실현의 중요성과 관련하여 이 책이 제시하는 통찰은 무엇일까요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9788937460388, DEFAULT, 6, '예술과 개인적 희생의 갈등', '서머싯 몸의 『달과 6펜스』는 예술가의 삶과 개인적 희생을 탐구합니다. 예술과 개인적 성취 간의 갈등을 현대 사회에서 어떻게 다룰 수 있을까요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9788949141060, DEFAULT, 7, '인간의 이중성과 도덕적 갈등', '로버트 루이스 스티븐슨의 『지킬 박사와 하이드 씨』는 인간의 이중성과 도덕적 갈등을 탐구합니다. 현대 사회에서 인간의 이중성을 어떻게 이해하고 적용할 수 있을까요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9788970126937, DEFAULT, 8, '역사와 문화를 넘어서는 환상', '가브리엘 가르시아 마르케스의 『백년 동안의 고독』은 라틴 아메리카의 역사와 문화를 환상적으로 그려냅니다. 이 작품이 현대 사회의 역사적 이해와 상상력을 어떻게 자극할 수 있을까요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9788937486074, DEFAULT, 9, '사랑과 사회적 규범의 갈등', '레프 톨스토이의 『안나 카레니나』는 사랑과 사회적 규범 사이의 갈등을 탐구합니다. 현대 사회에서 사랑과 사회적 규범의 관계를 어떻게 조명할 수 있을까요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9788987203959, DEFAULT, 10, '현재에 집중하는 삶의 중요성', '에크하르트 톨레의 『지금 이 순간을 살아라』는 현재의 순간에 집중하는 중요성을 다룹니다. 현대인의 삶에서 현재에 집중하는 것이 왜 중요한지 논의해 볼 필요가 있습니다.', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9788937460470, DEFAULT, 11, '청소년기의 고뇌와 사회적 소외', 'J.D. 샐린저의 『호밀밭의 파수꾼』은 청소년기의 고뇌와 사회적 소외를 탐구합니다. 현대 사회에서 청소년의 심리적 문제와 사회적 문제를 어떻게 이해하고 지원할 수 있을까요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9788937462788, DEFAULT, 12, '인간의 의지와 극복', '어니스트 헤밍웨이의 『노인과 바다』는 인간의 의지와 극복의 이야기를 담고 있습니다. 현대 사회에서 인간의 의지와 극복을 어떻게 이해하고 적용할 수 있을까요? 이 소설의 메시지가 오늘날 우리에게 주는 교훈은 무엇일까요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9791190669221, DEFAULT, 13, '권력과 부패의 교훈', '조지 오웰의 『동물 농장』은 권력과 부패에 대한 강력한 교훈을 담고 있습니다. 현대 사회에서 권력의 부패를 방지하기 위해 어떤 노력이 필요할까요? 이 책이 제시하는 정치적 메시지는 오늘날 어떻게 적용될 수 있을까요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9788982814471, DEFAULT, 14, '꿈과 개인적 전환의 이야기', '파울로 코엘료의 『연금술사』는 꿈과 개인적 전환에 관한 이야기를 담고 있습니다. 현대 사회에서 개인의 꿈을 이루기 위해 어떤 전략과 태도가 필요할까요? 이 책이 제시하는 전환의 과정은 어떤 의미를 가지나요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9788937462795, DEFAULT, 15, '전쟁과 인간의 본성', '어니스트 헤밍웨이의 『무기여 잘 있거라』는 전쟁과 인간의 본성을 탐구합니다. 현대 사회에서 전쟁의 영향과 인간 본성에 대한 이해를 어떻게 확장할 수 있을까요? 이 책의 시각이 오늘날의 갈등을 이해하는 데 어떻게 도움이 될까요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9791160263404, DEFAULT, 16, '인간의 집착과 운명', '허먼 멜빌의 『모비 딕』은 인간의 집착과 운명에 관한 이야기를 담고 있습니다. 현대 사회에서 인간의 집착과 운명에 대한 이해를 어떻게 심화시킬 수 있을까요? 이 소설의 메시지가 오늘날의 삶에 어떤 의미를 가지나요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9788983920775, DEFAULT, 17, '사회와 인간 본성의 풍자', '조나단 스위프트의 『걸리버 여행기』는 사회와 인간 본성에 대한 풍자를 담고 있습니다. 현대 사회에서 풍자적 시각을 통해 사회 문제를 어떻게 분석할 수 있을까요? 이 책이 제시하는 풍자의 교훈은 무엇일까요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9791161571768, DEFAULT, 18, '현실과 이상 사이의 갈등', '미겔 데 세르반테스의 『돈키호테』는 현실과 이상 사이의 갈등을 다룹니다. 현대 사회에서 이상을 추구하면서도 현실적인 접근을 유지하기 위해 어떤 노력이 필요할까요? 이 책이 제시하는 갈등의 해결 방법은 무엇일까요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9791193939130, DEFAULT, 19, '고전의 지혜가 현대에 주는 교훈', '고명환 저자의 『고전이 답했다 마땅히 살아야 할 삶에 대하여』는 인류의 지혜와 삶의 방향성을 고전에서 찾으려는 시도를 담고 있습니다. 이 책은 다양한 고전 문헌을 통해 ‘마땅히 살아야 할 삶’에 대해 탐구하며, 고전들이 현대 사회에서 여전히 유효한 이유를 설명합니다. 고전들은 시대를 초월한 인간의 본성과 도덕, 윤리에 관한 깊은 통찰을 제공하며, 이러한 지혜가 현대인의 삶에 어떤 영향을 미칠 수 있을까요? 고전의 교훈이 우리가 현재의 삶에서 겪는 도전과 갈등에 어떻게 적용될 수 있을지 고민해 볼 필요가 있습니다. 고전이 제시하는 ''마땅히 살아야 할 삶''의 가치와 현대 사회의 윤리적, 도덕적 기준 사이에는 어떤 연결고리가 있을까요?', SYSDATE);
INSERT INTO tblDiscussionBoard (seq, book_seq, readcount, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, 9791167374561, DEFAULT, 20, '현대 사회의 환상과 진실', '정유정 저자의 『영원한 천국』은 현대 사회의 환상과 현실을 탐구하며, 인간이 추구하는 이상과 그것이 실제 삶에서 어떻게 실현될 수 있는지를 다루고 있습니다. 이 책은 천국이나 이상향이라는 개념이 어떻게 인간의 삶과 가치관에 영향을 미치는지를 탐구하며, 현대 사회에서 이러한 이상이 어떻게 왜곡되거나 실현되는지를 분석합니다. 현대인의 삶 속에서 천국이나 이상향에 대한 갈망이 어떻게 표현되고 있으며, 이것이 현실과 어떤 충돌을 일으키는지에 대해 논의할 필요가 있습니다. 환상적인 세계와 현실 세계의 경계는 어떻게 설정되고 있으며, 우리는 이 두 세계 사이에서 어떻게 균형을 잡아야 할까요?', SYSDATE);



INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 1, 20, '이 소설은 현대 사회의 계층 구조와 결혼의 중요성을 조명하는 데 유용합니다. 오스틴의 통찰력은 여전히 많은 사람들에게 공감을 얻고 있으며, 이를 통해 사회적 편견과 개인적 자아 발견의 과정을 이해할 수 있습니다.', SYSDATE);  
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 2, 19, '『1984』는 오늘날의 디지털 감시 사회와 매우 유사한 경고를 제공합니다. 기술의 발전이 사회적 감시를 강화하고 있는 현재, 오웰의 메시지는 더욱 중요하게 다가옵니다.', SYSDATE);  
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 3, 18, '도스토예프스키의 작품은 현대의 도덕적 문제와 심리적 갈등을 이해하는 데 큰 도움이 됩니다. 인간의 내면적 갈등과 사회적 처벌에 대한 통찰은 여전히 유효하며, 많은 독자들에게 깊은 교훈을 제공합니다.', SYSDATE);  
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 4, 17, '『위대한 개츠비』는 현대 사회의 물질주의와 꿈에 대한 이상을 이해하는 데 유용합니다. 피츠제럴드의 작품은 현재의 사회적 가치와 인간의 꿈이 어떻게 충돌할 수 있는지를 잘 보여줍니다.', SYSDATE);  
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 5, 16, '『인간 실격』은 자아 실현과 인간 존재의 의미를 탐구하는 데 매우 유용합니다. 현대 사회에서 개인의 정체성과 자아 실현을 이해하는 데 깊은 통찰을 제공합니다.', SYSDATE);  
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 6, 15, '이 작품은 예술과 개인적 희생의 관계를 탐구하는 데 큰 도움이 됩니다. 현대 사회에서도 예술과 개인의 성취에 대한 이해를 깊게 할 수 있는 기회를 제공합니다.', SYSDATE);  
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 7, 14, '이 소설은 인간의 이중성과 도덕적 갈등을 이해하는 데 유용합니다. 현대 사회에서도 이러한 이중성에 대한 통찰은 중요한 의미를 가집니다.', SYSDATE);  
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 8, 13, '『백년 동안의 고독』은 역사와 문화의 이해를 넓히는 데 큰 도움이 됩니다. 마르케스의 환상적 서사는 현대 사회의 상상력과 역사적 이해에 중요한 자극을 줍니다.', SYSDATE);  
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 9, 12, '이 작품은 사랑과 사회적 규범 간의 갈등을 이해하는 데 유용합니다. 현대 사회에서도 이러한 갈등을 깊이 이해할 수 있는 통찰을 제공합니다.', SYSDATE);  
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 10, 11, '이 책은 현재에 집중하는 것의 중요성을 강조하며, 현대인의 삶에 큰 영향을 미칠 수 있습니다. 현재 순간을 살아가는 것은 스트레스와 불안을 줄이는 데 도움이 됩니다.', SYSDATE);
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 11, 10, '청소년기의 고뇌와 사회적 소외는 현대 사회에서도 여전히 중요한 주제입니다. 청소년들이 겪는 심리적 문제를 이해하고, 그들이 사회적 소외감을 느끼지 않도록 지원 체계를 강화하는 것이 필요합니다. 이 책은 우리에게 청소년들이 직면한 내면의 혼란과 사회적 압력을 깊이 있게 조망할 기회를 제공합니다.', SYSDATE);
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 12, 9, '헤밍웨이의 『노인과 바다』는 인간의 의지와 극복을 통해 무엇이든 이겨낼 수 있다는 강한 메시지를 전달합니다. 현대 사회에서도 좌절과 어려움 속에서 의지를 잃지 않고 도전을 계속하는 태도가 중요합니다. 이 책은 끊임없이 노력하는 인간의 강인함을 상기시키며, 오늘날 우리에게 인내와 결단력의 가치를 가르쳐 줍니다.', SYSDATE);
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 13, 8, '『동물 농장』은 권력의 부패가 얼마나 빠르고 무서운 속도로 발생할 수 있는지를 경고하는 작품입니다. 현대 사회에서는 권력의 부패를 막기 위한 투명성과 책임성, 시민의 감시가 필수적입니다. 이 책이 주는 교훈은 오늘날 정치적 시스템의 개선과 부패 방지를 위한 노력을 촉구합니다.', SYSDATE);
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 14, 7, '『연금술사』는 꿈을 추구하는 과정에서의 자기 발견과 전환을 이야기합니다. 현대 사회에서도 자신의 꿈을 이루기 위해서는 끊임없는 자기 성찰과 도전이 필요합니다. 이 책은 개인이 꿈을 추구하며 겪는 성장의 과정을 통해 우리 모두가 겪는 내적 여정을 상징합니다.', SYSDATE);
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 15, 20, '전쟁은 인간의 본성을 적나라하게 드러내는 극한의 상황입니다. 『무기여 잘 있거라』는 전쟁의 참혹함과 인간의 복잡한 감정을 깊이 있게 다룹니다. 현대 사회에서도 전쟁과 갈등을 이해하고 평화적인 해결책을 모색하는 데 이 책의 통찰이 큰 도움이 될 것입니다.', SYSDATE);
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 16, 3, '인간의 집착은 때로는 삶을 파괴로 이끌기도 합니다. 『모비 딕』은 이러한 집착과 운명에 대한 경고를 담고 있으며, 현대 사회에서도 우리는 지나친 집착이 불러오는 결과를 깊이 숙고해야 합니다. 이 책은 인간이 스스로 설정한 목표와 그에 따르는 희생에 대해 생각하게 만듭니다.', SYSDATE);
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 17, 2, '『걸리버 여행기』는 사회와 인간 본성을 신랄하게 풍자하며, 현대 사회의 문제를 바라보는 새로운 시각을 제공합니다. 풍자를 통해 사회의 부조리와 모순을 비판하고, 그것을 해결하기 위한 통찰을 제시하는 이 책은 오늘날의 사회적 갈등을 분석하는 데 여전히 유효한 도구가 됩니다.', SYSDATE);
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 18, 1, '『돈키호테』는 이상과 현실 사이의 갈등을 다루며, 이상을 추구하면서도 현실을 직시해야 하는 우리의 모습을 그립니다. 현대 사회에서도 우리는 이상과 현실 사이에서 균형을 유지하는 노력이 필요하며, 이 책은 그러한 갈등 속에서 어떻게 삶을 지혜롭게 살아가야 할지에 대해 생각하게 만듭니다.', SYSDATE);
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 19, 7, '고전이 제공하는 지혜는 시대를 초월한 가치와 통찰을 담고 있어, 현대 사회에서도 유용할 수 있습니다. 예를 들어, 고전에서 말하는 도덕적 원칙이나 인간의 본성에 대한 이해는 현대인의 삶에 많은 교훈을 줄 수 있습니다. 특히 윤리적 갈등이나 삶의 방향에 대해 고민할 때, 고전의 교훈이 현대적인 시각과 조화를 이루며 문제 해결에 도움을 줄 수 있습니다. 고전을 통해 배울 수 있는 것은 단순한 역사적 지식이 아니라, 인간 존재에 대한 깊은 이해와 지혜입니다.', SYSDATE);
INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 20, 4, '정유정의 『영원한 천국』은 이상과 현실 사이의 간극을 조명하며, 현대 사회에서 우리가 추구하는 가치와 그것의 실현 가능성에 대해 성찰할 기회를 제공합니다. 특히 이상향에 대한 갈망은 많은 사람들이 경험하는 공통된 심리적 현상입니다. 이 책을 통해 우리는 환상적인 이상이 현실에서 어떻게 적용되거나 왜곡될 수 있는지를 이해하고, 보다 실질적이고 균형 잡힌 접근 방식을 모색할 수 있습니다. 환상과 현실의 경계를 명확히 하면서도, 우리의 이상을 실현하기 위한 노력을 계속하는 것이 중요할 것입니다.', SYSDATE);

