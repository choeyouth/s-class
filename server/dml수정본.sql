create table tblCategory (
    seq number primary key,             -- PK
    category varchar2(300) not null     -- 1 - 도서관, 2 - 서점
);

insert into tblCategory values (1,'도서관');
insert into tblCategory values (2,'서점');

create table tblLibrary (
    seq number primary key,         -- PK
    name varchar2(600) not null,    -- 도서관 or 서점명
    lat number not null,            -- 위도
    lng number not null,            -- 경도
    address varchar2(600) not null, -- 주소
    category number not null,        -- 카테고리 : 1 - 도서관, 2 - 서점
    
    constraint fk_category foreign key (category) references tblCategory(seq)
);


create sequence library_seq;

insert into tblLibrary values (library_seq.nextval,'광진정보도서관',37.552088, 127.110380,'서울특별시 광진구 아차산로78길 90',1);
insert into tblLibrary values (library_seq.nextval,'아차산숲속도서관',37.554061, 127.100767,'서울특별시 광진구 영화사로 139',1);
insert into tblLibrary values (library_seq.nextval,'소나무언덕1호작은도서관',37.527954, 127.118019,'서울특별시 송파구 올림픽로47길 9 3층',1);
insert into tblLibrary values (library_seq.nextval,'소나무언덕2호도서관',37.507918, 127.094346,'서울특별시 송파구 석촌호수로 155 2층',1);
insert into tblLibrary values (library_seq.nextval,'서울특별시교육청 송파도서관',37.501147, 127.134348,'서울특별시 송파구 동남로 263',1);
insert into tblLibrary values (library_seq.nextval,'별마당 도서관',37.510747, 127.060448,'서울특별시 강남구 영동대로 513 스타필드 코엑스몰 B1',1);
insert into tblLibrary values (library_seq.nextval,'도곡정보문화도서관',37.489472, 127.039027,'서울특별시 강남구 도곡로18길 57',1);
insert into tblLibrary values (library_seq.nextval,'서울도서관',37.567516, 126.977643,'서울특별시 중구 세종대로 110',1);
insert into tblLibrary values (library_seq.nextval,'성동구립도서관',37.560136, 127.034676,'서울특별시 성동구 고산자로10길 9',1);
insert into tblLibrary values (library_seq.nextval,'손기정문화도서관',37.557192, 126.964471,'서울특별시 중구 손기정로 101-3',1);

insert into tblLibrary values (library_seq.nextval,'서울특별시교육청 남산도서관',37.554539, 126.981895,'서울특별시 용산구 소월로 109',1);
insert into tblLibrary values (library_seq.nextval,'서울특별시교육청 정독도서관',37.581819, 126.983268,'서울특별시 종로구 북촌로5길 48',1);
insert into tblLibrary values (library_seq.nextval,'서울특별시교육청 종로도서관',37.577874, 126.966875,'서울특별시 종로구 사직로9길 15-14',1);
insert into tblLibrary values (library_seq.nextval,'마포중앙도서관',37.565135, 126.907910,'서울특별시 마포구 성산로 128',1);
insert into tblLibrary values (library_seq.nextval,'국회도서관',37.532467, 126.917103,'서울특별시 영등포구 의사당대로 1',1);
insert into tblLibrary values (library_seq.nextval,'용산도서관',37.552761, 126.979710,'서울특별시 용산구 두텁바위로 160',1);
insert into tblLibrary values (library_seq.nextval,'서울특별시교육청 서대문도서관',37.584948, 126.941105,'서울특별시 서대문구 모래내로 412',1);
insert into tblLibrary values (library_seq.nextval,'서대문구립이진아기념도서관',37.574132, 126.955096,'서울특별시 서대문구 독립문공원길 80',1);
insert into tblLibrary values (library_seq.nextval,'마포구립 소금나루도서관',37.550894, 126.946762,'서울특별시 마포구 숭문길 72',1);
insert into tblLibrary values (library_seq.nextval,'마포구립서강도서관',37.548920, 126.931398,'서울특별시 마포구 독막로 165',1);

insert into tblLibrary values (library_seq.nextval,'연세대학교 중앙도서관',37.565182, 126.937492,'서울특별시 서대문구 연세로 50',1);
insert into tblLibrary values (library_seq.nextval,'이화여자대학교 중앙도서관',37.563821, 126.947706,'서울특별시 서대문구 이화여대길 52 이화여자대학교 중앙도서관',1);
insert into tblLibrary values (library_seq.nextval,'서울특별시교육청 마포평생학습관',37.555453, 126.924446,'서울특별시 마포구 홍익로2길 16',1);
insert into tblLibrary values (library_seq.nextval,'구산동도서관마을',37.610699, 126.913492,'서울특별시 은평구 연서로13길 29-23',1);
insert into tblLibrary values (library_seq.nextval,'등빛도서관',37.565896, 126.842553,'서울특별시 강서구 강서로62길 48',1);
insert into tblLibrary values (library_seq.nextval,'가양도서관',37.562358, 126.864697,'서울특별시 강서구 양천로61길 101',1);
insert into tblLibrary values (library_seq.nextval,'우장산숲속도서관',37.551199, 126.841866,'서울특별시 강서구 우현로 34',1);
insert into tblLibrary values (library_seq.nextval,'내를건너서숲으로 도서관',37.593648, 126.907441,'서울특별시 은평구 증산로17길 50',1);
insert into tblLibrary values (library_seq.nextval,'인천광역시교육청계양도서관',37.552089, 126.726779,'인천광역시 계양구 계양산로134번길 18',1);
insert into tblLibrary values (library_seq.nextval,'고척도서관',37.510432, 126.852091,'서울특별시 구로구 고척로45길 31',1);

insert into tblLibrary values (library_seq.nextval,'광명시립철산도서관',37.482104, 126.871661,'경기도 광명시 철산로 56',1);
insert into tblLibrary values (library_seq.nextval,'풍무도서관',37.610042, 126.729525,'경기도 김포시 풍무로146번길 101',1);
insert into tblLibrary values (library_seq.nextval,'부천시립상동도서관',37.495725, 126.746348,'경기도 부천시 상이로 12',1);
insert into tblLibrary values (library_seq.nextval,'부천시립역곡도서관',37.494090, 126.802996,'경기도 부천시 지봉로51번길 54',1);
insert into tblLibrary values (library_seq.nextval,'양천중앙도서관',37.521053, 126.833552,'서울특별시 양천구 신정로7길 81',1);
insert into tblLibrary values (library_seq.nextval,'김영삼도서관',37.510896, 126.948496,'서울특별시 동작구 매봉로 1',1);
insert into tblLibrary values (library_seq.nextval,'강동구립 해공도서관',37.547653, 127.127024,'서울특별시 강동구 올림픽로 702',1);
insert into tblLibrary values (library_seq.nextval,'강동구립 천호도서관',37.546292, 127.132517,'서울특별시 강동구 성안로31마길 1',1);
insert into tblLibrary values (library_seq.nextval,'강동구립 성내도서관',37.537308, 127.135264,'서울특별시 강동구 성안로 106-1',1);
insert into tblLibrary values (library_seq.nextval,'국립중앙박물관 도서관',37.527033, 126.981986,'서울특별시 용산구 서빙고로 137',1);

insert into tblLibrary values (library_seq.nextval,'강남도서관',37.515557, 127.047335,'서울특별시 강남구 선릉로116길 45',1);
insert into tblLibrary values (library_seq.nextval,'대치도서관',37.498418, 127.063965,'서울특별시 강남구 삼성로 212 은마 복지상가 대치도서관 2층 215호',1);
insert into tblLibrary values (library_seq.nextval,'논현도서관',37.518714, 127.036723,'37.519037, 127.036213',1);
insert into tblLibrary values (library_seq.nextval,'도봉문화정보도서관',37.646871, 127.044548,'서울특별시 도봉구 덕릉로 315',1);
insert into tblLibrary values (library_seq.nextval,'노원중앙도서관',37.662642, 127.064323,'서울특별시 노원구 노원로34길 43',1);
insert into tblLibrary values (library_seq.nextval,'별빛도서관',37.653386, 127.119465,'경기도 남양주시 별내중앙로 102',1);
insert into tblLibrary values (library_seq.nextval,'성북길빛도서관',37.613718, 127.027226,'서울특별시 성북구 숭인로8길 52',1);
insert into tblLibrary values (library_seq.nextval,'도봉도서관',37.657385, 127.014234,'서울특별시 도봉구 삼양로 556',1);
insert into tblLibrary values (library_seq.nextval,'강북구립도서관',37.627024, 127.036987,'서울특별시 강북구 오현로 145',1);
insert into tblLibrary values (library_seq.nextval,'오동 숲속도서관',37.610850, 127.040528,'서울특별시 성북구 화랑로13가길 110-10',1);

insert into tblLibrary values (library_seq.nextval,'교보문고 수유 바로드림센터',37.644231, 127.025816,'서울특별시 강북구 도봉로 348 교보문고 지하 1층',2);
insert into tblLibrary values (library_seq.nextval,'교보문고 은평점',37.642062, 126.915881,'서울특별시 은평구 통일로 1050',2);
insert into tblLibrary values (library_seq.nextval,'교보문고 청량리바로드림센터',37.584607, 127.046676,'서울특별시 동대문구 왕산로 214',2);
insert into tblLibrary values (library_seq.nextval,'교보문고 동대문점',37.573640, 127.008805,'서울특별시 중구 장충단로13길 20',2);
insert into tblLibrary values (library_seq.nextval,'교보문고 광화문점',37.573359, 126.977732,'서울특별시 종로구 종로 1',2);

insert into tblLibrary values (library_seq.nextval,'교보문고 이화여대점',37.563774, 126.945683,'서울특별시 서대문구 이화여대길 52',2);
insert into tblLibrary values (library_seq.nextval,'교보문고 합정점',37.552888, 126.912209,'서울특별시 마포구 월드컵로3길 14',2);
insert into tblLibrary values (library_seq.nextval,'교보문고 건대스타시티점',37.541864, 127.072198,'서울특별시 광진구 능동로 92',2);
insert into tblLibrary values (library_seq.nextval,'교보문고 천호점',37.543089, 127.125241,'서울특별시 강동구 올림픽로 664',2);
insert into tblLibrary values (library_seq.nextval,'교보문고 잠실점',37.516815, 127.100007,'서울특별시 송파구 올림픽로 269 롯데캐슬골드 B1F',2);

insert into tblLibrary values (library_seq.nextval,'교보문고 강남점',37.504832, 127.023446,'서울특별시 서초구 강남대로 465 지하2층 교보타워 지하 1층',2);
insert into tblLibrary values (library_seq.nextval,'교보문고 가든파이브바로드림센터',37.480043, 127.125413,'서울특별시 송파구 충민로 66',2);
insert into tblLibrary values (library_seq.nextval,'교보문고 서울대점',37.463685, 126.951906,'서울특별시 관악구 관악로 1',2);
insert into tblLibrary values (library_seq.nextval,'교보문고 영등포점',37.520857, 126.903419,'서울특별시 영등포구 영중로 15 타임스퀘어 멀티플렉스 2층',2);
insert into tblLibrary values (library_seq.nextval,'교보문고 신도림디큐브시티점',37.511053, 126.888657,'서울특별시 구로구 경인로 662 현대백화점 지하 1층',2);
insert into tblLibrary values (library_seq.nextval,'교보문고 목동점',37.530523, 126.875954,'서울특별시 양천구 목동서로 159-1',2);
insert into tblLibrary values (library_seq.nextval,'종로서적 종로본점',37.573203, 126.984591,'서울특별시 종로구 종로타워빌딩 지하 종로서적 2층',2);
insert into tblLibrary values (library_seq.nextval,'종로서적 강남점',37.505986, 127.056143,'서울특별시 강남구 대치동 892',2);
insert into tblLibrary values (library_seq.nextval,'영풍문고 스타필드 고양',37.657053, 126.896035,'경기도 고양시 덕양구 고양대로 1955 스타 필드 3 층',2);
insert into tblLibrary values (library_seq.nextval,'영풍문고 미아롯데점',37.621166, 127.029931,'서울특별시 강북구 도봉로 62',2);

insert into tblLibrary values (library_seq.nextval,'영풍문고 구리 롯데아울렛점',37.616075, 127.138613,'경기도 구리시 동구릉로136번길 47 롯데아울렛 1층',2);
insert into tblLibrary values (library_seq.nextval,'영풍문고 왕십리역점',37.567548, 127.037360,'서울특별시 성동구 왕십리광장로 17 비트플렉스 3층',2);
insert into tblLibrary values (library_seq.nextval,'영풍문고 종각종로본점',37.574344, 126.981425,'서울특별시 종로구 청계천로 41',2);
insert into tblLibrary values (library_seq.nextval,'영풍문고 홍대점',37.563341, 126.924282,'서울특별시 마포구 양화로 161',2);
insert into tblLibrary values (library_seq.nextval,'영풍문고 용산아이파크몰점',37.536938, 126.966511,'서울특별시 용산구 한강로3가 한강대로23길 55 리빙파크 3층',2);
insert into tblLibrary values (library_seq.nextval,'영풍문고 스타필드코엑스몰점',37.514338, 127.058521,'서울특별시 강남구 삼성동 159',2);
insert into tblLibrary values (library_seq.nextval,'영풍문고 스타필드하남점',37.547827, 127.225720,'경기도 하남시 미사대로 750',2);
insert into tblLibrary values (library_seq.nextval,'영풍문고 스타필드시티위례점',37.485194, 127.147785,'경기도 하남시 위례대로 200',2);
insert into tblLibrary values (library_seq.nextval,'영풍문고 강남역점',37.502083, 127.025562,'서울특별시 강남구 강남대로 408',2);
insert into tblLibrary values (library_seq.nextval,'영풍문고 사당역점',37.482470, 126.982304,'서울특별시 서초구 방배천로 11 파스텔시티 지하 2층',2);

insert into tblLibrary values (library_seq.nextval,'영풍문고 신림점',37.491213, 126.929558,'서울특별시 관악구 신림로 330',2);
insert into tblLibrary values (library_seq.nextval,'영풍문고 가산마리오점',37.485257, 126.880479,'서울특별시 금천구 벚꽃로 266 6층',2);
insert into tblLibrary values (library_seq.nextval,'서울책보고',37.521987, 127.103739,'서울특별시 송파구 오금로 1',1);
insert into tblLibrary values (library_seq.nextval,'아크앤북 롯데월드몰점',37.516110, 127.102235,'서울특별시 송파구 올림픽로 300 4층',2);
insert into tblLibrary values (library_seq.nextval,'아크앤북 이태원점',37.533920, 126.990775,'서울특별시 용산구 장문로 23',2);
insert into tblLibrary values (library_seq.nextval,'아크앤북 신촌점',37.571624, 126.937234,'서울특별시 서대문구 연세로 13',2);
insert into tblLibrary values (library_seq.nextval,'아크앤북 - TP 타워 여의도점',37.531884, 126.917321,'서울특별시 영등포구 의사당대로 96',2);
insert into tblLibrary values (library_seq.nextval,'YES24 강서NC점 신간서점',37.571113, 126.833670,'서울특별시 강서구 등촌제3동 발산역.NC백화점',2);
insert into tblLibrary values (library_seq.nextval,'고래서점',37.547919, 126.972557,'서울특별시 용산구 한강대로 307',2);
insert into tblLibrary values (library_seq.nextval,'공손서점',37.546087, 127.102472,'서울특별시 광진구 광장동 아차산로70길 17-17',2);

drop table tblQuoteList;

create table tblQuoteList (
    seq number primary key,
    quote varchar2(4000) not null,
    author varchar2(1000) not null,
    authorPic varchar2(400) null
);

-- 사진명 추가 필요*****************************************
INSERT INTO tblQueteList VALUES (quote_seq.nextval, '책 없는 방은 영혼 없는 육체와 같다.', '키케로','');
INSERT INTO tblQueteList VALUES (quote_seq.nextval, '양서는 처음 읽을 때는 새 친구를 얻은 것 같고, 전에 정독한 책을 다시 읽을 때는 옛 친구를 만나는 것 같다.', '골드 스미스');
INSERT INTO tblQueteList VALUES (quote_seq.nextval, '내가 세계를 알게 된 것은 책에 의해서였다.', '사르트르');
INSERT INTO tblQueteList VALUES (quote_seq.nextval, '약으로 병을 고치듯이 독서로 마음을 다스린다.', '카이사르');
INSERT INTO tblQueteList VALUES (quote_seq.nextval, '독서는 완성된 사람을 만들고, 담론은 재치있는 사람을 만들며, 필기는 정확한 사람을 만든다.', '베이컨');
INSERT INTO tblQueteList VALUES (quote_seq.nextval, '남의 책을 읽는 것에 시간을 보내라. 남이 고생한 것에 의해서 자신을 쉽게 개선할 수 있다.', '소크라테스');
INSERT INTO tblQueteList VALUES (quote_seq.nextval, '언제든 괴로운 환상을 위로하고자 한다면 너의 책으로 달려가라. 책은 언제나 변함없는 친절로 너를 대한다.', '풀러');
INSERT INTO tblQueteList VALUES (quote_seq.nextval, '내가 인생을 안 것은 사람과 접촉했기 때문이 아니라 책과 접촉했었기 때문이다.', '아나톨 프랑스');
INSERT INTO tblQueteList VALUES (quote_seq.nextval, '모든 양서를 읽는 것은 지난 몇 세기 동안 걸친 가장 훌륭한 사람들과 대화하는 것과 같다.', '데카르트');
INSERT INTO tblQueteList VALUES (quote_seq.nextval, '책을 사느라 들인 돈은 결코 손해가 아니다. 오히려 훗날에 만 배의 이익을 얻게 될 것이다.', '왕안석');
INSERT INTO tblQueteList VALUES (quote_seq.nextval, '오늘의 나를 있게 한 것은 우리 마을의 도서관이었다. 하버드 졸업자보다도 소중한 것이 독서하는 습관이다.', '빌 게이츠');
INSERT INTO tblQueteList VALUES (quote_seq.nextval, '책 속에는 과거의 모든 영혼이 가로누워 있다.', '칼라일');
INSERT INTO tblQueteList VALUES (quote_seq.nextval, '책이란 넓디넓은 시간의 바다를 지나가는 배이다.', '프랜시스 베이컨');
INSERT INTO tblQueteList VALUES (quote_seq.nextval, '당신에게 가장 필요한 책은 당신으로 하여금 가장 많이 생각하게 만드는 책이다.', '마크 트웨인');
INSERT INTO tblQueteList VALUES (quote_seq.nextval, '보기 드문 지식인을 만났을 때는 그가 어떤 책을 읽는가를 물어보아야 한다.', '에머슨');
