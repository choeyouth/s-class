-- boot-mybatis > script.sql

select * from tblAddress order by seq desc;
delete tblAddress;

show user;

create user editor identified by java1234;
grant connect, resource, dba to editor;



drop table tblInfo;
drop table tblMemo;
drop table tblAddress;
drop sequence seqInfo;
drop sequence seqMemo;
drop sequence seqAddress;

create table tblAddress (
    seq number primary key,
    name varchar2(50) not null,
    age number not null,
    address varchar2(300) null,
    gender char(1) not null
);
create sequence seqAddress start with 51;


INSERT INTO tblAddress VALUES (1, '강아지', 3, '서울특별시 강남구 테헤란로 132 한독빌딩 8층', 'm');
INSERT INTO tblAddress VALUES (2, '고양이', 2, '서울특별시 서초구 서초대로 77길 45 아크로비스타 101동 3호', 'f');
INSERT INTO tblAddress VALUES (3, '병아리', 1, '서울특별시 서대문구 창천동 50-7 창천빌라 3층', 'f');
INSERT INTO tblAddress VALUES (4, '사자', 7, '서울특별시 동대문구 장안동 340-7 동광아파트 101동 201호', 'm');
INSERT INTO tblAddress VALUES (5, '호랑이', 6, '서울특별시 강남구 도산대로 123 현대백화점 7층', 'f');
INSERT INTO tblAddress VALUES (6, '비둘기', 3, '서울특별시 서대문구 북아현동 179-11 북아현아파트 105동 12호', 'f');
INSERT INTO tblAddress VALUES (7, '타조', 4, '서울특별시 동대문구 제기동 112-5 보람빌라 3층', 'm');
INSERT INTO tblAddress VALUES (8, '햄스터', 1, '서울특별시 강남구 테헤란로 212, 강남파이낸스플라자 5층', 'm');
INSERT INTO tblAddress VALUES (9, '낙타', 5, '서울특별시 강남구 역삼로 34길 11, 역삼프라자 3층', 'm');
INSERT INTO tblAddress VALUES (10, '독수리', 3, '서울특별시 은평구 응암동 97-1 응암빌라 101호', 'm');
INSERT INTO tblAddress VALUES (11, '토끼', 4, '서울특별시 은평구 갈현동 480-6 갈현아파트 104동 5호', 'm');
INSERT INTO tblAddress VALUES (12, '다람쥐', 2, '서울특별시 강서구 공항대로 456', 'f');
INSERT INTO tblAddress VALUES (13, '판다', 5, '서울특별시 강남구 학동로 331, 학동타워 7층', 'm');
INSERT INTO tblAddress VALUES (14, '기린', 7, '서울특별시 강남구 언주로 613, 언주타워 9층', 'f');
INSERT INTO tblAddress VALUES (15, '얼룩말', 3, '서울특별시 강동구 성내로 789', 'm');
INSERT INTO tblAddress VALUES (16, '물개', 1, '서울특별시 강서구 청계로 456', 'f');
INSERT INTO tblAddress VALUES (17, '코끼리', 8, '서울특별시 강남구 테헤란로 620, 포스코타워 15층', 'm');
INSERT INTO tblAddress VALUES (18, '치타', 6, '서울특별시 강동구 천호대로 789', 'f');
INSERT INTO tblAddress VALUES (19, '여우', 3, '서울특별시 서대문구 홍제동 320-3 홍제프라자 3층', 'm');
INSERT INTO tblAddress VALUES (20, '늑대', 4, '서울특별시 은평구 녹번동 279-1 녹번빌라 2층', 'f');
INSERT INTO tblAddress VALUES (21, '캥거루', 5, '서울특별시 강남구 도산대로 126, 도산빌딩 15층', 'm');
INSERT INTO tblAddress VALUES (22, '하마', 9, '서울특별시 강남구 테헤란로 98, 테헤란빌딩 20층', 'f');
INSERT INTO tblAddress VALUES (23, '악어', 7, null, 'm');
INSERT INTO tblAddress VALUES (24, '독도새우', 2, '서울특별시 강서구 공항대로 123', 'f');
INSERT INTO tblAddress VALUES (25, '붉은여우', 6, '서울특별시 강남구 논현로 23, 논현빌딩 8층', 'm');
INSERT INTO tblAddress VALUES (26, '공작새', 5, '서울특별시 강남구 역삼로 718, 역삼타워 14층', 'f');
INSERT INTO tblAddress VALUES (27, '두루미', 4, '서울특별시 서대문구 충정로3가 26-1 충정로아파트 20동 402호', 'm');
INSERT INTO tblAddress VALUES (28, '비버', 3, '서울특별시 동대문구 용두동 275-4 동해아파트 12동 602호', 'f');
INSERT INTO tblAddress VALUES (29, '오소리', 2, '서울특별시 강남구 도산대로 201', 'm');
INSERT INTO tblAddress VALUES (30, '고라니', 1, null, 'f');
INSERT INTO tblAddress VALUES (31, '말', 8, '서울특별시 강남구 삼성로 256, 삼성타워 22층', 'm');
INSERT INTO tblAddress VALUES (32, '돼지', 6, '서울특별시 동대문구 회기동 57-48 고려빌딩 5층', 'f');
INSERT INTO tblAddress VALUES (33, '닭', 3, '서울특별시 강남구 역삼로 135, 역삼타워 14층', 'm');
INSERT INTO tblAddress VALUES (34, '개구리', 4, '서울특별시 동대문구 신설동 110-10 삼성아파트 104동 15호', 'f');
INSERT INTO tblAddress VALUES (35, '원숭이', 5, '서울특별시 강남구 봉은사로 580, 봉은사빌딩 16층', 'm');
INSERT INTO tblAddress VALUES (36, '양', 9, '서울특별시 강남구 도산대로 72, 도산타워 18층', 'f');
INSERT INTO tblAddress VALUES (37, '염소', 7, '서울특별시 강남구 언주로 620, 언주타워 20층', 'm');
INSERT INTO tblAddress VALUES (38, '소', 2, '서울특별시 강남구 삼성로 512, 삼성아파트 204동 2호', 'f');
INSERT INTO tblAddress VALUES (39, '수달', 6, '서울특별시 강북구 번동 244-44 번동아파트 103동 301호', 'm');
INSERT INTO tblAddress VALUES (40, '고슴도치', 5, '서울특별시 강남구 역삼로 231, 역삼아파트 104동 5호', 'f');
INSERT INTO tblAddress VALUES (41, '사슴', 4, '서울특별시 강북구 미아동 125-3 미아빌딩 7층', 'm');
INSERT INTO tblAddress VALUES (42, '북극곰', 3, '서울특별시 강남구 봉은사로 79, 봉은사타워 17층', 'f');
INSERT INTO tblAddress VALUES (43, '바다표범', 2, '서울특별시 서대문구 북가좌동 306-1 북가좌빌딩 8층', 'm');
INSERT INTO tblAddress VALUES (44, '미어캣', 1, '서울특별시 강남구 언주로 391, 언주타워 19층', 'f');
INSERT INTO tblAddress VALUES (45, '담비', 8, '서울특별시 강남구 삼성로 399, 삼성타워 25층', 'm');
INSERT INTO tblAddress VALUES (46, '코알라', 3, '서울특별시 강북구 삼양동 305-7 삼양프라자 2층', 'm');
INSERT INTO tblAddress VALUES (47, '캥거루', 4, null, 'f');
INSERT INTO tblAddress VALUES (48, '쥐', 5, '서울특별시 강남구 봉은사로 172, 봉은사타워 11층', 'm');
INSERT INTO tblAddress VALUES (49, '부엉이', 6, '서울특별시 강남구 논현로 87, 논현빌딩 13층', 'f');
INSERT INTO tblAddress VALUES (50, '코뿔소', 7, '서울특별시 강남구 학동로 202, 학동빌딩 8층', 'm');





create table tblInfo (
	seq number,
	school varchar2(100) not null,
	country varchar2(100) not null,
	
	constraint info_pk primary key(seq),
	constraint info_kf foreign key(seq) references tblAddress(seq) 
);

insert into tblInfo values (1, '강남 동물학교', '대한민국');
insert into tblInfo values (2, '강남 동물학교', '대한민국');
insert into tblInfo values (3, '뉴욕 아카데미', '미국');
insert into tblInfo values (4, '동경 동물원', '일본');
insert into tblInfo values (5, '베이징 훈련소', '중국');
insert into tblInfo values (6, '베이징 훈련소', '중국');
insert into tblInfo values (7, '베를린 동물학교', '독일');
insert into tblInfo values (8, '베를린 동물학교', '독일');
insert into tblInfo values (9, '시드니 동물학교', '호주');
insert into tblInfo values (10, '모스크바 동물원', '러시아');
insert into tblInfo values (11, '상파울루 동물원', '브라질');
insert into tblInfo values (12, '베이징 훈련소', '중국');
insert into tblInfo values (13, '토론토 동물원', '캐나다');
insert into tblInfo values (14, '로마 동물학교', '이탈리아');
insert into tblInfo values (15, '부에노스아이레스 동물원', '아르헨티나');
insert into tblInfo values (16, '시드니 동물학교', '호주');
insert into tblInfo values (17, '알제리 동물원', '알제리');
insert into tblInfo values (18, '방콕 동물학교', '태국');
insert into tblInfo values (19, '강남 동물학교', '대한민국');
insert into tblInfo values (20, '아테네 동물원', '그리스');
insert into tblInfo values (21, '카라치 동물원', '파키스탄');
insert into tblInfo values (22, '강남 동물학교', '대한민국');
insert into tblInfo values (23, '마드리드 동물원', '스페인');
insert into tblInfo values (24, '시드니 동물학교', '호주');
insert into tblInfo values (25, '헤르싱키 동물원', '핀란드');
insert into tblInfo values (26, '리스본 동물원', '포르투갈');
insert into tblInfo values (27, '프라하 동물원', '체코');
insert into tblInfo values (28, '모스크바 동물원', '러시아');
insert into tblInfo values (29, '베를린 동물학교', '독일');
insert into tblInfo values (30, '와르샤바 동물원', '폴란드');
insert into tblInfo values (31, '프라하 동물원', '체코');
insert into tblInfo values (32, '마닐라 동물원', '필리핀');
insert into tblInfo values (33, '강남 동물학교', '대한민국');
insert into tblInfo values (34, '베이징 훈련소', '중국');
insert into tblInfo values (35, '프라하 동물원', '체코');
insert into tblInfo values (36, '토론토 동물원', '캐나다');
insert into tblInfo values (37, '마카오 동물원', '마카오');
insert into tblInfo values (38, '강남 동물학교', '대한민국');
insert into tblInfo values (39, '베이징 훈련소', '중국');
insert into tblInfo values (40, '동경 동물원', '일본');
insert into tblInfo values (41, '카이로 동물원', '이집트');
insert into tblInfo values (42, '베를린 동물학교', '독일');
insert into tblInfo values (43, '로마 동물학교', '이탈리아');
insert into tblInfo values (44, '프라하 동물원', '체코');
insert into tblInfo values (45, '하노이 동물원', '베트남');
insert into tblInfo values (46, '하노이 동물원', '베트남');
insert into tblInfo values (47, '베이징 훈련소', '중국');
insert into tblInfo values (48, '런던 동물원', '영국');
insert into tblInfo values (49, '베를린 동물학교', '독일');
insert into tblInfo values (50, '하노이 동물원', '베트남');



create table tblMemo (
	seq number primary key,
	memo varchar2(500) not null,
	regdate date default sysdate not null,
	aseq number not null references tblAddress(seq) 
);
create sequence seqMemo start with 101;


insert into tblMemo values (1, '오늘 날씨는 어때? 멍멍!', sysdate - 7, 32);
insert into tblMemo values (2, '뭐 먹을까? 야옹야옹~', sysdate - 6.8, 7);
insert into tblMemo values (3, '요즘 잘 지내?', sysdate - 6.7, 14);
insert into tblMemo values (4, '졸린데 졸리지 않아.', sysdate - 6.42, 18);
insert into tblMemo values (5, '이번 주말에 뭐할까? 골골~', sysdate - 6.123, 41);
insert into tblMemo values (6, '뭐 먹을지 고민돼. 핑핑!', sysdate - 6.0632, 1);
insert into tblMemo values (7, '다음 주에 약속있어? 캬오~', sysdate - 6, 44);
insert into tblMemo values (8, '최근에 영화나 본 거 있어? 꾸엑꾸엑~', sysdate - 5.976813, 15);
insert into tblMemo values (9, '요즘 어떤 일 있었어? 쥐짜앙!', sysdate - 5.8126753, 21);
insert into tblMemo values (10, '오늘 뭐 했어? 삐약삐약~', sysdate - 5.8056732, 45);
insert into tblMemo values (11, '무슨 책을 읽고 있어? 끼룩끼룩~', sysdate - 5.7123, 4);
insert into tblMemo values (12, '최근에 들은 노래가 있어? 앙앙!', sysdate - 5.678234, 31);
insert into tblMemo values (13, '최근에 본 영화 어때? 옹옹~', sysdate - 5.32342, 4);
insert into tblMemo values (14, '오늘 뭐 했어? 꼬끼오~', sysdate - 5.31213, 6);
insert into tblMemo values (15, '배고파. 뭐 먹을까? 냐옹~', sysdate - 5.1123213, 26);
insert into tblMemo values (16, '다음 주 일정이 어때? 뚜루뚜루~', sysdate - 5.018276, 26);
insert into tblMemo values (17, '최근에 만난 친구가 있어? 히히히~', sysdate - 5.00812763, 50);
insert into tblMemo values (18, '오늘 뭐 할까? 꽥꽥!', sysdate - 5.000123, 10);
insert into tblMemo values (19, '무슨 음식 먹을까? 야옹~', sysdate - 5, 9);
insert into tblMemo values (20, '이제 코 자자.', sysdate - 4.9999, 48);
insert into tblMemo values (21, '호랑이 바보!! 핑핑~', sysdate - 4.9917265376, 19);
insert into tblMemo values (22, '무슨 일 있었어? 깽깽~', sysdate - 4.976712357, 24);
insert into tblMemo values (23, '배고파. 뭐 먹을까? 쥐짜앙!', sysdate - 4.97123123, 11);
insert into tblMemo values (24, '오늘 뭐 했어? 훨훨~', sysdate - 4.791298, 38);
insert into tblMemo values (25, '오늘 뭐 할까? 앙앙!', sysdate - 4.77871263, 47);
insert into tblMemo values (26, '최근에 본 영화가 있어? 옹옹~', sysdate - 4.7666, 38);
insert into tblMemo values (27, '무슨 책을 읽고 있어? 꼬끼오~', sysdate - 4.74343, 26);
insert into tblMemo values (28, '오늘 뭐 했어? 꽥꽥~', sysdate - 4.734234, 38);
insert into tblMemo values (29, '무슨 일 있었어? 냥냥~', sysdate - 4.7222, 4);
insert into tblMemo values (30, '요즘 어떤 일 있었어? 짹짹~', sysdate - 4.7111, 26);
insert into tblMemo values (31, '낮잠은 10분만.', sysdate - 4.6123, 46);
insert into tblMemo values (32, '식곤중. 살이 찐다.', sysdate - 4.60123, 17);
insert into tblMemo values (33, '뭐 먹을까? 냥냥~', sysdate - 4.5987, 3);
insert into tblMemo values (34, '으르렁 편의점 가자~', sysdate - 4.43124, 25);
insert into tblMemo values (35, '뭐 먹을까? 쥐쥐~', sysdate - 4.41231, 50);
insert into tblMemo values (36, '내 발음 어때? 왈왈~', sysdate - 4.0123, 35);
insert into tblMemo values (37, '뭐 먹을까? 까까~', sysdate - 4, 37);
insert into tblMemo values (38, '뭐 먹을까? 히죽~', sysdate - 3.9898, 40);
insert into tblMemo values (39, '무슨 소식 있어? 히힛~', sysdate - 3.8787, 29);
insert into tblMemo values (40, '요즘 어떤 일 있었어? 히죽~', sysdate - 3.7665, 22);
insert into tblMemo values (41, '무슨 일 있었어? 꼬끼오~', sysdate - 3.687945, 16);
insert into tblMemo values (42, '삐뚤어질테다. 삐뚤삐뚤~', sysdate - 3.643234, 18);
insert into tblMemo values (43, '아이스크림 먹고 싶어', sysdate - 3.59898, 39);
insert into tblMemo values (44, '요즘 잘 지내? 꼬물꼬물~', sysdate - 3.5786, 45);
insert into tblMemo values (45, '책 좀 읽어라! 야옹~', sysdate - 3.56347, 12);
insert into tblMemo values (46, '열심히 코딩중 삐약삐약~', sysdate - 3.553245, 2);
insert into tblMemo values (47, '잠결에 코딩중..', sysdate - 3.54324, 48);
insert into tblMemo values (48, '졸려. 어디 갈까? 삐약삐약~', sysdate - 3.54311, 23);
insert into tblMemo values (49, '무슨 음식 먹을까? 쥐짜앙!', sysdate - 3.5321312, 16);
insert into tblMemo values (50, '무슨 일 있었어? 삐뚤삐뚤~', sysdate - 3.5214124, 37);
insert into tblMemo values (51, '이번 주말에 뭐할까? 짹짹~', sysdate - 3.51321123, 30);
insert into tblMemo values (52, '안녕. 인사하는 방법.', sysdate - 3.5099898, 44);
insert into tblMemo values (53, '버그를 잡아라!!', sysdate - 3.50007123, 45);
insert into tblMemo values (54, '졸려. 어디 갈까? 훨훨~', sysdate - 3.5, 10);
insert into tblMemo values (55, '졸려. 잠 안 와. 삐리릿~', sysdate - 3.498797, 27);
insert into tblMemo values (56, '왓?? 짹짹~', sysdate - 3.4876, 32);
insert into tblMemo values (57, '졸려. 잠 안 와. 꽥꽥~', sysdate - 3.476756, 19);
insert into tblMemo values (58, '오늘 날씨는 어때? 냥냥~', sysdate - 3.47554, 41);
insert into tblMemo values (59, '앗 비온다!! 삐약~', sysdate - 3.4653264, 46);
insert into tblMemo values (60, 'ChatGPT는 바보다.', sysdate - 3.45432, 22);
insert into tblMemo values (61, '이번 주말에 뭐할까? 삐릿삐릿~', sysdate - 3.434324, 24);
insert into tblMemo values (62, '데이터 만드는 중 훨훨~', sysdate - 3.423123, 34);
insert into tblMemo values (63, '요즘 어떤 일 있었어? 왈왈~', sysdate - 3.4123123, 50);
insert into tblMemo values (64, '오늘 날씨는 어때? 삐약삐약~', sysdate - 3.400213, 28);
insert into tblMemo values (65, '이번 주말에 뭐할까? 깽깽~', sysdate - 3.4, 21);
insert into tblMemo values (66, '뭐 먹을까? 삐약삐약~', sysdate - 3.94324, 45);
insert into tblMemo values (67, '이번 주말에 뭐할까? 까까~', sysdate - 3.732564, 6);
insert into tblMemo values (68, '오늘 뭐 했어? 왈왈~', sysdate - 3.632414, 39);
insert into tblMemo values (69, '뭐 먹을까? 삐뚤삐뚤~', sysdate - 3.52314, 29);
insert into tblMemo values (70, '졸려. 잠 안 와. 히죽~', sysdate - 3.23413, 18);
insert into tblMemo values (71, '이번 주말에 뭐할까? 꼬끼오~', sysdate - 3.1231, 3);
insert into tblMemo values (72, '나중에 뭐 할 거야? 삐약삐약~', sysdate - 3.0123, 38);
insert into tblMemo values (73, '프로그래밍은 어려워;; 힝', sysdate - 3, 9);
insert into tblMemo values (74, '모니터는 다다익선', sysdate - 2.9674, 1);
insert into tblMemo values (75, '뭐 먹을까? 깽깽~', sysdate - 2.8688, 33);
insert into tblMemo values (76, '다음 주에 할 일이 뭐야? 끼룩끼룩~', sysdate - 2.8123, 47);
insert into tblMemo values (77, '오늘 날씨는 어때? 훨훨~', sysdate - 2.800123, 35);
insert into tblMemo values (78, '삐약이 날다.', sysdate - 2.8, 16);
insert into tblMemo values (79, '멍멍~ 개소리.', sysdate - 2.791238798, 26);
insert into tblMemo values (80, '나중에 뭐 할 거야? 냐옹~', sysdate - 2.78763, 4);
insert into tblMemo values (81, '졸려. 무슨 소식 있어? 뚜루뚜루~', sysdate - 2.77782364, 23);
insert into tblMemo values (82, '오늘 뭐 할까? 히히히~', sysdate - 2.7656, 14);
insert into tblMemo values (83, '최근에 본 영화가 있어? 꽥꽥!', sysdate - 2.73123, 30);
insert into tblMemo values (84, '무슨 책을 읽고 있어? 야옹~', sysdate - 2.72313, 36);
insert into tblMemo values (85, '뭐 먹을까? 왈왈~', sysdate - 2.70123, 31);
insert into tblMemo values (86, '밖에 나가 놀자~', sysdate - 2.7, 40);
insert into tblMemo values (87, '최근에 들은 소식 있어? 캬오~', sysdate - 2.6324, 2);
insert into tblMemo values (88, '에러가 안잡혀ㅠㅠ 삐약삐약~', sysdate - 2.51234, 25);
insert into tblMemo values (89, '다음 주에 할 일이 뭐야? 히죽히죽~', sysdate - 2.4124, 22);
insert into tblMemo values (90, '오늘 뭐 할까? 멍멍!', sysdate - 2.321312, 2);
insert into tblMemo values (91, '최근에 본 영화가 있어? 왈왈~', sysdate - 2.2123, 12);
insert into tblMemo values (92, '무슨 책을 읽고 있어? 훨훨~', sysdate - 2.123123, 47);
insert into tblMemo values (93, '나중에 뭐 할 거야? 꽥꽥~', sysdate - 2.0123, 17);
insert into tblMemo values (94, '졸려. 무슨 소식 있어? 냥냥~', sysdate - 2, 26);
insert into tblMemo values (95, '오늘 뭐 할까? 캬캬~', sysdate - 1.9324, 29);
insert into tblMemo values (96, '최근에 본 영화가 있어? 훌쩍훌쩍~', sysdate - 1.7435, 18);
insert into tblMemo values (97, '무슨 책을 읽고 있어? 허허~', sysdate - 1.6234, 3);
insert into tblMemo values (98, '나중에 뭐 할 거야? 강아지 울음소리~', sysdate - 1.51239, 38);
insert into tblMemo values (99, '키보드 배송중!!', sysdate - 1.4314, 9);
insert into tblMemo values (100, '최근에 들은 소식 있어? 콩콩~', sysdate, 1);



commit;

select count(*) from tblAddress; --50
select count(*) from tblInfo; --50
select count(*) from tblMemo; --100

select * from tblAddress;
select * from tblInfo;
select * from tblMemo;


select * from tabs;









desc tblAddress;


commit;


