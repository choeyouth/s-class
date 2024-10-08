package oracle.tblDiscussionReply;

import oracle.BasicInfo_me;

public class discussionReply_dml {

    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo_me dbHelper = new BasicInfo_me();

        
        // 데이터 삽입 SQL 쿼리
        String insertQuery = "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) "
                + "VALUES (discussionReply_seq.NEXTVAL, 1, 1, '동의합니다.', SYSDATE)";

                
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
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 11, 10, '이 책은 행동을 시작하는 데 필요한 실질적인 전략을 제공합니다. 현대 사회에서 즉각적인 행동과 목표 설정은 성공적인 삶을 살아가는 데 중요한 요소가 됩니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 12, 9, '이 책은 자기 결정과 자율성이 개인의 동기와 성취에 미치는 중요성을 잘 보여줍니다. 자율성을 증진하기 위해 스스로의 선택을 존중하고, 개인적 목표를 명확히 설정하는 것이 중요합니다. 이는 현대 사회에서 성공적인 삶을 살아가는 데 필수적인 요소가 됩니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 13, 8, '『유토피아』는 이상적인 사회에 대한 깊은 사유를 제공합니다. 현대 사회에서 이상적인 사회를 구현하기 위해서는 현실적인 접근과 이상 사이의 균형을 맞추는 것이 중요합니다. 이 책을 통해 우리는 이러한 균형을 이해하고 적용할 수 있습니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 14, 7, '『넥스트』는 기술 발전이 사회와 개인에 미치는 영향을 심도 있게 다룹니다. 현대 사회에서 기술의 발전은 여러 윤리적 문제를 동반하며, 이를 이해하고 적절히 대응하는 것이 중요합니다. 이 책을 통해 우리는 기술 발전의 장점과 위험을 균형 있게 바라볼 수 있습니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 15, 6, '『사피엔스』는 인류의 역사적 발전을 폭넓게 조망하며, 현재와 미래를 이해하는 데 중요한 시각을 제공합니다. 역사적 사건들을 분석하고 미래를 예측하는 데 유용한 통찰을 제공하며, 인류의 발전 방향을 이해하는 데 큰 도움이 됩니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 16, 5, '『리틀 프린스』는 인간 본성과 사랑에 대한 깊은 통찰을 제공합니다. 현대 사회에서 이러한 교훈을 적용하고, 인간 관계와 감정을 이해하는 데 도움이 됩니다. 이 책을 통해 우리는 감정의 진정성과 인간 본성에 대해 더욱 깊이 이해할 수 있습니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 17, 4, '『호밀밭의 파수꾼』은 청소년의 내면적 갈등과 사회적 소외를 이해하는 데 유용합니다. 현대 사회에서 청소년 문제를 효과적으로 지원하기 위해서는 이러한 심리적 갈등을 깊이 이해하고, 적절한 지원 체계를 마련하는 것이 중요합니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 18, 3, '『무기와 무지』는 기술 발전이 사회에 미치는 영향과 미래의 변화를 예측하는 데 중요한 통찰을 제공합니다. 기술의 발전이 사회적 갈등을 유발할 수 있는 다양한 측면을 이해하고, 이를 적절히 대응하는 방법을 모색할 수 있습니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 19, 2, '『죽음에 관하여』는 죽음에 대한 깊은 사유를 제공합니다. 현대 사회에서 죽음을 이해하고 받아들이는 것은 삶의 의미를 탐구하는 데 큰 도움이 됩니다. 이 책을 통해 우리는 죽음을 보다 긍정적이고 의미 있는 방식으로 이해할 수 있습니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 20, 1, '『히트맨: 코드』는 범죄와 윤리적 문제에 대한 깊은 통찰을 제공합니다. 현대 사회에서 범죄를 이해하고 윤리적 딜레마를 해결하기 위해서는 이 책에서 제시하는 통찰과 해결책을 참고하는 것이 중요합니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 21, 7, '고전이 제공하는 지혜는 시대를 초월한 가치와 통찰을 담고 있어, 현대 사회에서도 유용할 수 있습니다. 예를 들어, 고전에서 말하는 도덕적 원칙이나 인간의 본성에 대한 이해는 현대인의 삶에 많은 교훈을 줄 수 있습니다. 특히 윤리적 갈등이나 삶의 방향에 대해 고민할 때, 고전의 교훈이 현대적인 시각과 조화를 이루며 문제 해결에 도움을 줄 수 있습니다. 고전을 통해 배울 수 있는 것은 단순한 역사적 지식이 아니라, 인간 존재에 대한 깊은 이해와 지혜입니다.', SYSDATE)",
            "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, 22, 4, '정유정의 『영원한 천국』은 이상과 현실 사이의 간극을 조명하며, 현대 사회에서 우리가 추구하는 가치와 그것의 실현 가능성에 대해 성찰할 기회를 제공합니다. 특히 이상향에 대한 갈망은 많은 사람들이 경험하는 공통된 심리적 현상입니다. 이 책을 통해 우리는 환상적인 이상이 현실에서 어떻게 적용되거나 왜곡될 수 있는지를 이해하고, 보다 실질적이고 균형 잡힌 접근 방식을 모색할 수 있습니다. 환상과 현실의 경계를 명확히 하면서도, 우리의 이상을 실현하기 위한 노력을 계속하는 것이 중요할 것입니다.', SYSDATE)"
        };

        // 배치 처리로 여러 데이터 삽입
        dbHelper.insertDataBatch(insertQueries);
        
    }
}


