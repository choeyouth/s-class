package com.oracle;

public class ex09_discussionReply_dml {

    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();

        
        // 배치로 삽입할 여러 SQL 쿼리
        Strig[] insertQueries = {
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
        }
        // 배치 처리로 여러 데이터 삽입
        dbHelper.insertDataBatch(insertQueries);
        
    }
}




INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 1, '김철수', '서울시 중구 남대문로 1길 12-3', '010-1111-0000', 'chulsoo1@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 2, '이영희', '서울시 강남구 역삼동 테헤란로 25길 14-1', '010-2222-1111', 'younghee2@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 3, '박진수', '부산시 해운대구 해운대로 570', '010-3333-2222', 'jinsu3@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 4, '최지훈', '대구시 달서구 이곡동 1298-7', '010-4444-3333', 'jihoon4@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 5, '정유진', '인천시 남동구 구월동 123-45', '010-5555-4444', 'yujin5@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 6, '김서연', '서울시 송파구 문정동 1020-1', '010-6666-5555', 'seoyeon6@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 7, '이민호', '경기도 성남시 분당구 정자동 67-9', '010-7777-6666', 'minho7@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 8, '홍민지', '광주시 동구 지산동 347', '010-8888-7777', 'minji8@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 9, '박성호', '대전시 유성구 봉명동 609-1', '010-9999-8888', 'seongho9@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 10, '정수진', '울산시 남구 신정동 678-23', '010-0000-9999', 'sujin10@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 11, '이승기', '서울시 종로구 인사동 35', '010-1111-2233', 'seunggi11@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 12, '김지혜', '서울시 마포구 합정동 94-15', '010-2222-3344', 'jihye12@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 13, '이상훈', '서울시 강북구 수유동 77-21', '010-3333-4455', 'sanghoon13@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 14, '박가영', '경기도 고양시 일산동구 정발산로 22', '010-4444-5566', 'gayoung14@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 15, '최서영', '경기도 용인시 수지구 풍덕천동 789-12', '010-5555-6677', 'seoyoung15@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 16, '김재원', '서울시 성북구 장위동 145-3', '010-6666-7788', 'jaewon16@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 17, '이현주', '부산시 동래구 사직동 42-5', '010-7777-8899', 'hyeonju17@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 18, '홍진호', '대구시 수성구 범어동 100-1', '010-8888-9900', 'jinho18@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 19, '박은정', '서울시 동작구 사당동 19-3', '010-9999-0011', 'eunjeong19@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 20, '정민수', '서울시 구로구 구로동 188-25', '010-0000-1122', 'minsoo20@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 21, '신혜원', '경기도 파주시 금촌동 74-14', '010-1111-1133', 'hyewon21@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 22, '한유진', '부산시 북구 만덕동 15-2', '010-2222-2244', 'yujin22@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 23, '최정민', '서울시 양천구 목동서로 159', '010-3333-3355', 'jeongmin23@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 24, '이진수', '경기도 부천시 소사동 232-4', '010-4444-4466', 'jinsu24@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 25, '송하늘', '광주시 서구 농성동 768-9', '010-5555-5577', 'haneul25@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 26, '정다혜', '서울시 은평구 응암동 123-34', '010-6666-6688', 'dahye26@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 27, '이태희', '경기도 안양시 동안구 비산동 46-7', '010-7777-7799', 'taehee27@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 28, '김지성', '경기도 시흥시 신천동 88-2', '010-8888-8800', 'jisung28@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 29, '박소연', '대전시 중구 은행동 187', '010-9999-9911', 'soyeon29@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 30, '이주영', '서울시 영등포구 여의도동 234', '010-0000-0022', 'juyoung30@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 31, '최영수', '서울시 강서구 가양동 456-78', '010-1111-2233', 'youngsoo31@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 32, '김나리', '경기도 광명시 철산동 123-45', '010-2222-3344', 'nari32@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 33, '이승환', '서울시 동대문구 장안동 567-89', '010-3333-4455', 'seunghwan33@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 34, '박하늘', '부산시 연제구 거제동 101-23', '010-4444-5566', 'haneul34@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 35, '정준호', '대구시 달성군 화원읍 88-5', '010-5555-6677', 'junho35@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 36, '홍성민', '경기도 수원시 권선구 세류동 25-14', '010-6666-7788', 'seongmin36@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 37, '김도현', '서울시 서대문구 충정로 55', '010-7777-8899', 'dohyun37@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 38, '이하연', '인천시 서구 청라동 103-19', '010-8888-9900', 'hayeon38@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 39, '박서준', '서울시 노원구 중계동 67-89', '010-9999-0011', 'seojun39@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 40, '정재훈', '대전시 서구 둔산동 112-33', '010-0000-1122', 'jaehoon40@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 41, '한지민', '서울시 강북구 미아동 45-9', '010-1111-2233', 'jimin41@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 42, '송민호', '경기도 용인시 기흥구 상하동 12-1', '010-2222-3344', 'minho42@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 43, '김다영', '부산시 해운대구 좌동 89-14', '010-3333-4455', 'dayoung43@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 44, '박지훈', '경기도 평택시 비전동 67-12', '010-4444-5566', 'jihoon44@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 45, '이예린', '서울시 성동구 성수동 21-3', '010-5555-6677', 'yerin45@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 46, '정우성', '경기도 안산시 상록구 이동 22-9', '010-6666-7788', 'woosung46@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 47, '황정민', '광주시 북구 일곡동 90-3', '010-7777-8899', 'jungmin47@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 48, '신소율', '부산시 금정구 장전동 128-3', '010-8888-9900', 'soyeol48@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 49, '김영진', '서울시 송파구 석촌동 18-4', '010-9999-0011', 'youngjin49@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 50, '이하늘', '서울시 종로구 종로 256-8', '010-0000-1122', 'haneul50@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 51, '최유정', '경기도 하남시 망월동 45-6', '010-1111-2233', 'yoojung51@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 52, '홍찬희', '인천시 계양구 계산동 101-22', '010-2222-3344', 'chanhee52@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 53, '장미희', '서울시 강남구 삼성동 34-12', '010-3333-4455', 'mihee53@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 54, '이상민', '경기도 성남시 중원구 상대원동 88-10', '010-4444-5566', 'sangmin54@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 55, '백예린', '부산시 수영구 광안동 34-11', '010-5555-6677', 'yerin55@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 56, '송가인', '대구시 중구 남산동 45-7', '010-6666-7788', 'gain56@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 57, '김민재', '경기도 광주시 오포읍 123-56', '010-7777-8899', 'minjae57@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 58, '이도현', '서울시 양천구 신월동 76-2', '010-8888-9900', 'dohyun58@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 59, '전지현', '인천시 남동구 논현동 34-11', '010-9999-0011', 'jihyun59@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 60, '강호동', '서울시 관악구 봉천동 12-8', '010-0000-1122', 'hodong60@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 61, '이현수', '서울시 성동구 성수동 123-12', '010-1111-2233', 'hyeonsu61@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 62, '장유진', '경기도 성남시 수정구 신흥동 56-8', '010-2222-3344', 'yujin62@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 63, '박세진', '부산시 사상구 모라동 78-3', '010-3333-4455', 'sejin63@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 64, '김상철', '대구시 중구 삼덕동 12-2', '010-4444-5566', 'sangcheol64@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 65, '이은지', '서울시 강북구 번동 45-7', '010-5555-6677', 'eunji65@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 66, '최준호', '경기도 고양시 덕양구 화정동 10-11', '010-6666-7788', 'junho66@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 67, '김하나', '인천시 남동구 간석동 123-45', '010-7777-8899', 'hana67@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 68, '홍지민', '부산시 남구 문현동 33-9', '010-8888-9900', 'jimin68@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 69, '박정현', '서울시 동대문구 청량리동 74-3', '010-9999-0011', 'jeonghyun69@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 70, '정유진', '서울시 서초구 방배동 12-6', '010-0000-1122', 'yujin70@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 71, '이시형', '경기도 오산시 오산동 45-8', '010-1111-2233', 'sihyung71@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 72, '김진아', '부산시 북구 화명동 27-4', '010-2222-3344', 'jina72@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 73, '이진우', '서울시 노원구 공릉동 84-5', '010-3333-4455', 'jinwoo73@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 74, '박수연', '대구시 중구 동인동 56-9', '010-4444-5566', 'sooyeon74@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 75, '정상훈', '경기도 파주시 문산읍 90-8', '010-5555-6677', 'sanghoon75@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 76, '김민지', '서울시 양천구 신정동 99-5', '010-6666-7788', 'minji76@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 77, '이서연', '경기도 수원시 장안구 영화동 101-10', '010-7777-8899', 'seoyeon77@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 78, '홍성호', '부산시 사하구 장림동 63-2', '010-8888-9900', 'seongho78@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 79, '박미래', '서울시 금천구 시흥동 34-9', '010-9999-0011', 'mirae79@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 80, '정동훈', '대전시 대덕구 송촌동 78-11', '010-0000-1122', 'donghoon80@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 81, '이경호', '서울시 강서구 화곡동 12-15', '010-1111-2233', 'kyungho81@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 82, '김소연', '경기도 부천시 원미동 23-9', '010-2222-3344', 'soyeon82@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 83, '이재호', '부산시 부산진구 부전동 45-7', '010-3333-4455', 'jaeho83@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 84, '박하영', '서울시 종로구 세종로 23-12', '010-4444-5566', 'hayoung84@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 85, '정은우', '경기도 성남시 수정구 태평동 12-7', '010-5555-6677', 'eunwoo85@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 86, '김서윤', '서울시 서대문구 북아현동 89-4', '010-6666-7788', 'seoyun86@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 87, '이영진', '부산시 금정구 장전동 23-5', '010-7777-8899', 'youngjin87@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 88, '홍태경', '서울시 마포구 공덕동 98-7', '010-8888-9900', 'taekyung88@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 89, '박정은', '대구시 서구 평리동 45-3', '010-9999-0011', 'jeongeun89@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 90, '정명훈', '경기도 화성시 동탄면 78-12', '010-0000-1122', 'myunghoon90@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 91, '이진석', '서울시 송파구 방이동 89-3', '010-1111-2233', 'jinsuk91@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 92, '김지혜', '경기도 남양주시 다산동 56-9', '010-2222-3344', 'jiye92@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 93, '이준호', '부산시 동래구 사직동 78-2', '010-3333-4455', 'junho93@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 94, '박예린', '서울시 강남구 역삼동 34-5', '010-4444-5566', 'yerin94@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 95, '정지훈', '경기도 고양시 일산동구 백석동 56-8', '010-5555-6677', 'jihun95@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 96, '김다희', '서울시 관악구 봉천동 45-8', '010-6666-7788', 'dahee96@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 97, '이주영', '부산시 기장군 기장읍 90-11', '010-7777-8899', 'juyoung97@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 98, '홍수빈', '서울시 중랑구 상봉동 12-3', '010-8888-9900', 'subin98@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 99, '박동현', '대전시 유성구 온천동 45-6', '010-9999-0011', 'donghyun99@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 100, '정혜진', '경기도 안양시 만안구 안양동 34-7', '010-0000-1122', 'hyejin100@example.com');
