package com.oracle;

public class ex09_discussionReply_dml {

    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();

        
        // 배치로 삽입할 여러 SQL 쿼리
        String[] insertQueries = {
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 1, 20, '이 소설은 현대 사회의 계층 구조와 결혼의 중요성을 조명하는 데 유용합니다. 오스틴의 통찰력은 여전히 많은 사람들에게 공감을 얻고 있으며, 이를 통해 사회적 편견과 개인적 자아 발견의 과정을 이해할 수 있습니다.', SYSDATE)",  
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 2, 19, '『1984』는 오늘날의 디지털 감시 사회와 매우 유사한 경고를 제공합니다. 기술의 발전이 사회적 감시를 강화하고 있는 현재, 오웰의 메시지는 더욱 중요하게 다가옵니다.', SYSDATE)",  
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 3, 18, '도스토예프스키의 작품은 현대의 도덕적 문제와 심리적 갈등을 이해하는 데 큰 도움이 됩니다. 인간의 내면적 갈등과 사회적 처벌에 대한 통찰은 여전히 유효하며, 많은 독자들에게 깊은 교훈을 제공합니다.', SYSDATE)",  
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 4, 17, '『위대한 개츠비』는 현대 사회의 물질주의와 꿈에 대한 이상을 이해하는 데 유용합니다. 피츠제럴드의 작품은 현재의 사회적 가치와 인간의 꿈이 어떻게 충돌할 수 있는지를 잘 보여줍니다.', SYSDATE)",  
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 5, 16, '『인간 실격』은 자아 실현과 인간 존재의 의미를 탐구하는 데 매우 유용합니다. 현대 사회에서 개인의 정체성과 자아 실현을 이해하는 데 깊은 통찰을 제공합니다.', SYSDATE)",  
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 6, 15, '이 작품은 예술과 개인적 희생의 관계를 탐구하는 데 큰 도움이 됩니다. 현대 사회에서도 예술과 개인의 성취에 대한 이해를 깊게 할 수 있는 기회를 제공합니다.', SYSDATE)",  
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 7, 14, '이 소설은 인간의 이중성과 도덕적 갈등을 이해하는 데 유용합니다. 현대 사회에서도 이러한 이중성에 대한 통찰은 중요한 의미를 가집니다.', SYSDATE)",  
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 8, 13, '『백년 동안의 고독』은 역사와 문화의 이해를 넓히는 데 큰 도움이 됩니다. 마르케스의 환상적 서사는 현대 사회의 상상력과 역사적 이해에 중요한 자극을 줍니다.', SYSDATE)",  
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 9, 12, '이 작품은 사랑과 사회적 규범 간의 갈등을 이해하는 데 유용합니다. 현대 사회에서도 이러한 갈등을 깊이 이해할 수 있는 통찰을 제공합니다.', SYSDATE)",  
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 10, 11, '이 책은 현재에 집중하는 것의 중요성을 강조하며, 현대인의 삶에 큰 영향을 미칠 수 있습니다. 현재 순간을 살아가는 것은 스트레스와 불안을 줄이는 데 도움이 됩니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 11, 10, '청소년기의 고뇌와 사회적 소외는 현대 사회에서도 여전히 중요한 주제입니다. 청소년들이 겪는 심리적 문제를 이해하고, 그들이 사회적 소외감을 느끼지 않도록 지원 체계를 강화하는 것이 필요합니다. 이 책은 우리에게 청소년들이 직면한 내면의 혼란과 사회적 압력을 깊이 있게 조망할 기회를 제공합니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 12, 9, '헤밍웨이의 『노인과 바다』는 인간의 의지와 극복을 통해 무엇이든 이겨낼 수 있다는 강한 메시지를 전달합니다. 현대 사회에서도 좌절과 어려움 속에서 의지를 잃지 않고 도전을 계속하는 태도가 중요합니다. 이 책은 끊임없이 노력하는 인간의 강인함을 상기시키며, 오늘날 우리에게 인내와 결단력의 가치를 가르쳐 줍니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 13, 8, '『동물 농장』은 권력의 부패가 얼마나 빠르고 무서운 속도로 발생할 수 있는지를 경고하는 작품입니다. 현대 사회에서는 권력의 부패를 막기 위한 투명성과 책임성, 시민의 감시가 필수적입니다. 이 책이 주는 교훈은 오늘날 정치적 시스템의 개선과 부패 방지를 위한 노력을 촉구합니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 14, 7, '『연금술사』는 꿈을 추구하는 과정에서의 자기 발견과 전환을 이야기합니다. 현대 사회에서도 자신의 꿈을 이루기 위해서는 끊임없는 자기 성찰과 도전이 필요합니다. 이 책은 개인이 꿈을 추구하며 겪는 성장의 과정을 통해 우리 모두가 겪는 내적 여정을 상징합니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 15, 20, '전쟁은 인간의 본성을 적나라하게 드러내는 극한의 상황입니다. 『무기여 잘 있거라』는 전쟁의 참혹함과 인간의 복잡한 감정을 깊이 있게 다룹니다. 현대 사회에서도 전쟁과 갈등을 이해하고 평화적인 해결책을 모색하는 데 이 책의 통찰이 큰 도움이 될 것입니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 16, 3, '인간의 집착은 때로는 삶을 파괴로 이끌기도 합니다. 『모비 딕』은 이러한 집착과 운명에 대한 경고를 담고 있으며, 현대 사회에서도 우리는 지나친 집착이 불러오는 결과를 깊이 숙고해야 합니다. 이 책은 인간이 스스로 설정한 목표와 그에 따르는 희생에 대해 생각하게 만듭니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 17, 2, '『걸리버 여행기』는 사회와 인간 본성을 신랄하게 풍자하며, 현대 사회의 문제를 바라보는 새로운 시각을 제공합니다. 풍자를 통해 사회의 부조리와 모순을 비판하고, 그것을 해결하기 위한 통찰을 제시하는 이 책은 오늘날의 사회적 갈등을 분석하는 데 여전히 유효한 도구가 됩니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 18, 1, '『돈키호테』는 이상과 현실 사이의 갈등을 다루며, 이상을 추구하면서도 현실을 직시해야 하는 우리의 모습을 그립니다. 현대 사회에서도 우리는 이상과 현실 사이에서 균형을 유지하는 노력이 필요하며, 이 책은 그러한 갈등 속에서 어떻게 삶을 지혜롭게 살아가야 할지에 대해 생각하게 만듭니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 19, 7, '고전이 제공하는 지혜는 시대를 초월한 가치와 통찰을 담고 있어, 현대 사회에서도 유용할 수 있습니다. 예를 들어, 고전에서 말하는 도덕적 원칙이나 인간의 본성에 대한 이해는 현대인의 삶에 많은 교훈을 줄 수 있습니다. 특히 윤리적 갈등이나 삶의 방향에 대해 고민할 때, 고전의 교훈이 현대적인 시각과 조화를 이루며 문제 해결에 도움을 줄 수 있습니다. 고전을 통해 배울 수 있는 것은 단순한 역사적 지식이 아니라, 인간 존재에 대한 깊은 이해와 지혜입니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 20, 4, '정유정의 『영원한 천국』은 이상과 현실 사이의 간극을 조명하며, 현대 사회에서 우리가 추구하는 가치와 그것의 실현 가능성에 대해 성찰할 기회를 제공합니다. 특히 이상향에 대한 갈망은 많은 사람들이 경험하는 공통된 심리적 현상입니다. 이 책을 통해 우리는 환상적인 이상이 현실에서 어떻게 적용되거나 왜곡될 수 있는지를 이해하고, 보다 실질적이고 균형 잡힌 접근 방식을 모색할 수 있습니다. 환상과 현실의 경계를 명확히 하면서도, 우리의 이상을 실현하기 위한 노력을 계속하는 것이 중요할 것입니다.', SYSDATE)"
        };

        // 배치 처리로 여러 데이터 삽입
        dbHelper.insertDataBatch(insertQueries);
        
    }
}


