package com.oracle;

public class ex07_memberInfo_dml {

    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();


        
        String[] insertQueries = {
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 1, '김철수', '서울시 중구 남대문로 1길 12-3', '010-1111-0000', 'chulsoo1@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 2, '이영희', '서울시 강남구 역삼동 테헤란로 25길 14-1', '010-2222-1111', 'younghee2@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 3, '박진수', '부산시 해운대구 해운대로 570', '010-3333-2222', 'jinsu3@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 4, '최지훈', '대구시 달서구 이곡동 1298-7', '010-4444-3333', 'jihoon4@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 5, '정유진', '인천시 남동구 구월동 123-45', '010-5555-4444', 'yujin5@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 6, '김서연', '서울시 송파구 문정동 1020-1', '010-6666-5555', 'seoyeon6@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 7, '이민호', '경기도 성남시 분당구 정자동 67-9', '010-7777-6666', 'minho7@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 8, '홍민지', '광주시 동구 지산동 347', '010-8888-7777', 'minji8@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 9, '박성호', '대전시 유성구 봉명동 609-1', '010-9999-8888', 'seongho9@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 10, '정수진', '울산시 남구 신정동 678-23', '010-0000-9999', 'sujin10@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 11, '이승기', '서울시 종로구 인사동 35', '010-1111-2233', 'seunggi11@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 12, '김지혜', '서울시 마포구 합정동 94-15', '010-2222-3344', 'jihye12@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 13, '이상훈', '서울시 강북구 수유동 77-21', '010-3333-4455', 'sanghoon13@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 14, '박가영', '경기도 고양시 일산동구 정발산로 22', '010-4444-5566', 'gayoung14@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 15, '최서영', '경기도 용인시 수지구 풍덕천동 789-12', '010-5555-6677', 'seoyoung15@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 16, '김재원', '서울시 성북구 장위동 145-3', '010-6666-7788', 'jaewon16@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 17, '이현주', '부산시 동래구 사직동 42-5', '010-7777-8899', 'hyeonju17@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 18, '홍진호', '대구시 수성구 범어동 100-1', '010-8888-9900', 'jinho18@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 19, '박은정', '서울시 동작구 사당동 19-3', '010-9999-0011', 'eunjeong19@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 20, '정민수', '서울시 구로구 구로동 188-25', '010-0000-1122', 'minsoo20@example.com')",
        	    
        	    
        	    // 21 ~ 100
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 21, '신혜원', '경기도 파주시 금촌동 74-14', '010-1111-1133', 'hyewon21@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 22, '한유진', '부산시 북구 만덕동 15-2', '010-2222-2244', 'yujin22@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 23, '최정민', '서울시 양천구 목동서로 159', '010-3333-3355', 'jeongmin23@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 24, '이진수', '경기도 부천시 소사동 232-4', '010-4444-4466', 'jinsu24@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 25, '송하늘', '광주시 서구 농성동 768-9', '010-5555-5577', 'haneul25@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 26, '정다혜', '서울시 은평구 응암동 123-34', '010-6666-6688', 'dahye26@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 27, '이태희', '경기도 안양시 동안구 비산동 46-7', '010-7777-7799', 'taehee27@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 28, '김지성', '경기도 시흥시 신천동 88-2', '010-8888-8800', 'jisung28@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 29, '박소연', '대전시 중구 은행동 187', '010-9999-9911', 'soyeon29@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 30, '이주영', '서울시 영등포구 여의도동 234', '010-0000-0022', 'juyoung30@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 31, '최영수', '서울시 강서구 가양동 456-78', '010-1111-2233', 'youngsoo31@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 32, '김나리', '경기도 광명시 철산동 123-45', '010-2222-3344', 'nari32@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 33, '이승환', '서울시 동대문구 장안동 567-89', '010-3333-4455', 'seunghwan33@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 34, '박하늘', '부산시 연제구 거제동 101-23', '010-4444-5566', 'haneul34@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 35, '정준호', '대구시 달성군 화원읍 88-5', '010-5555-6677', 'junho35@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 36, '홍성민', '경기도 수원시 권선구 세류동 25-14', '010-6666-7788', 'seongmin36@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 37, '김도현', '서울시 서대문구 충정로 55', '010-7777-8899', 'dohyun37@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 38, '이하연', '인천시 서구 청라동 103-19', '010-8888-9900', 'hayeon38@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 39, '박서준', '서울시 노원구 중계동 67-89', '010-9999-0011', 'seojun39@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 40, '정재훈', '대전시 서구 둔산동 112-33', '010-0000-1122', 'jaehoon40@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 41, '한지민', '서울시 강북구 미아동 45-9', '010-1111-2233', 'jimin41@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 42, '송민호', '경기도 용인시 기흥구 상하동 12-1', '010-2222-3344', 'minho42@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 43, '김다영', '부산시 해운대구 좌동 89-14', '010-3333-4455', 'dayoung43@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 44, '박지훈', '경기도 평택시 비전동 67-12', '010-4444-5566', 'jihoon44@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 45, '이예린', '서울시 성동구 성수동 21-3', '010-5555-6677', 'yerin45@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 46, '정우성', '경기도 안산시 상록구 이동 22-9', '010-6666-7788', 'woosung46@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 47, '황정민', '광주시 북구 일곡동 90-3', '010-7777-8899', 'jungmin47@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 48, '신소율', '부산시 금정구 장전동 128-3', '010-8888-9900', 'soyeol48@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 49, '김영진', '서울시 송파구 석촌동 18-4', '010-9999-0011', 'youngjin49@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 50, '이하늘', '서울시 종로구 종로 256-8', '010-0000-1122', 'haneul50@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 51, '최유정', '경기도 하남시 망월동 45-6', '010-1111-2233', 'yoojung51@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 52, '홍찬희', '인천시 계양구 계산동 101-22', '010-2222-3344', 'chanhee52@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 53, '장미희', '서울시 강남구 삼성동 34-12', '010-3333-4455', 'mihee53@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 54, '이상민', '경기도 성남시 중원구 상대원동 88-10', '010-4444-5566', 'sangmin54@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 55, '백예린', '부산시 수영구 광안동 34-11', '010-5555-6677', 'yerin55@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 56, '송가인', '대구시 중구 남산동 45-7', '010-6666-7788', 'gain56@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 57, '김민재', '경기도 광주시 오포읍 123-56', '010-7777-8899', 'minjae57@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 58, '이도현', '서울시 양천구 신월동 76-2', '010-8888-9900', 'dohyun58@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 59, '전지현', '인천시 남동구 논현동 34-11', '010-9999-0011', 'jihyun59@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 60, '강호동', '서울시 관악구 봉천동 12-8', '010-0000-1122', 'hodong60@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 61, '이현수', '서울시 성동구 성수동 123-12', '010-1111-2233', 'hyeonsu61@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 62, '장유진', '경기도 성남시 수정구 신흥동 56-8', '010-2222-3344', 'yujin62@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 63, '박세진', '부산시 사상구 모라동 78-3', '010-3333-4455', 'sejin63@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 64, '김상철', '대구시 중구 삼덕동 12-2', '010-4444-5566', 'sangcheol64@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 65, '이은지', '서울시 강북구 번동 45-7', '010-5555-6677', 'eunji65@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 66, '최준호', '경기도 고양시 덕양구 화정동 10-11', '010-6666-7788', 'junho66@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 67, '김하나', '인천시 남동구 간석동 123-45', '010-7777-8899', 'hana67@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 68, '홍지민', '부산시 남구 문현동 33-9', '010-8888-9900', 'jimin68@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 69, '박정현', '서울시 동대문구 청량리동 74-3', '010-9999-0011', 'jeonghyun69@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 70, '정유진', '서울시 서초구 방배동 12-6', '010-0000-1122', 'yujin70@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 71, '이시형', '경기도 오산시 오산동 45-8', '010-1111-2233', 'sihyung71@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 72, '김진아', '부산시 북구 화명동 27-4', '010-2222-3344', 'jina72@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 73, '이진우', '서울시 노원구 공릉동 84-5', '010-3333-4455', 'jinwoo73@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 74, '박수연', '대구시 중구 동인동 56-9', '010-4444-5566', 'sooyeon74@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 75, '정상훈', '경기도 파주시 문산읍 90-8', '010-5555-6677', 'sanghoon75@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 76, '김민지', '서울시 양천구 신정동 99-5', '010-6666-7788', 'minji76@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 77, '이서연', '경기도 수원시 장안구 영화동 101-10', '010-7777-8899', 'seoyeon77@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 78, '홍성호', '부산시 사하구 장림동 63-2', '010-8888-9900', 'seongho78@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 79, '박미래', '서울시 금천구 시흥동 34-9', '010-9999-0011', 'mirae79@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 80, '정동훈', '대전시 대덕구 송촌동 78-11', '010-0000-1122', 'donghoon80@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 81, '이경호', '서울시 강서구 화곡동 12-15', '010-1111-2233', 'kyungho81@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 82, '김소연', '경기도 부천시 원미동 23-9', '010-2222-3344', 'soyeon82@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 83, '이재호', '부산시 부산진구 부전동 45-7', '010-3333-4455', 'jaeho83@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 84, '박하영', '서울시 종로구 세종로 23-12', '010-4444-5566', 'hayoung84@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 85, '정은우', '경기도 성남시 수정구 태평동 12-7', '010-5555-6677', 'eunwoo85@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 86, '김서윤', '서울시 서대문구 북아현동 89-4', '010-6666-7788', 'seoyun86@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 87, '이영진', '부산시 금정구 장전동 23-5', '010-7777-8899', 'youngjin87@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 88, '홍태경', '서울시 마포구 공덕동 98-7', '010-8888-9900', 'taekyung88@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 89, '박정은', '대구시 서구 평리동 45-3', '010-9999-0011', 'jeongeun89@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 90, '정명훈', '경기도 화성시 동탄면 78-12', '010-0000-1122', 'myunghoon90@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 91, '이진석', '서울시 송파구 방이동 89-3', '010-1111-2233', 'jinsuk91@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 92, '김지혜', '경기도 남양주시 다산동 56-9', '010-2222-3344', 'jiye92@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 93, '이준호', '부산시 동래구 사직동 78-2', '010-3333-4455', 'junho93@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 94, '박예린', '서울시 강남구 역삼동 34-5', '010-4444-5566', 'yerin94@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 95, '정지훈', '경기도 고양시 일산동구 백석동 56-8', '010-5555-6677', 'jihun95@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 96, '김다희', '서울시 관악구 봉천동 45-8', '010-6666-7788', 'dahee96@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 97, '이주영', '부산시 기장군 기장읍 90-11', '010-7777-8899', 'juyoung97@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 98, '홍수빈', '서울시 중랑구 상봉동 12-3', '010-8888-9900', 'subin98@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 99, '박동현', '대전시 유성구 온천동 45-6', '010-9999-0011', 'donghyun99@example.com')",
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) VALUES (memberInfo_seq.NEXTVAL, 100, '정혜진', '경기도 안양시 만안구 안양동 34-7', '010-0000-1122', 'hyejin100@example.com')"
        	};

        
        // 배치 처리로 여러 데이터 삽입
        dbHelper.insertDataBatch(insertQueries);

        
    }
}


