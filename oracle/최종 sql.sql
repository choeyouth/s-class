------------------------------------------------------ drop
-- 배우리스트
drop TABLE Actor_List;

-- 배우
drop TABLE Actor;

-- 감독리스트
drop TABLE Director_List;

-- 감독
drop TABLE Director;

-- 댓글
drop table Comments;

-- 네티즌
drop table Netizen;

-- 상품정보안내
drop table Product_Guide;

-- 상품정보
drop table Product_Info;

-- 화면정보
drop table Display;

-- 안내(이용,환불,DRM)
drop table Guide;

-- 이용방법
drop table Usage_Method;

-- 구매/대여
drop table Purchase_Rental;

-- 순위
drop table Ranking;

-- 영화
drop table Movie;



------------------------------------------------------ create

-- 영화
CREATE TABLE Movie (
	movie_id	NUMBER	NOT NULL PRIMARY KEY,
	title	VARCHAR2(100)	NOT NULL,
	rating	NUMBER	NOT NULL,
	release_year	NUMBER	NOT NULL,
	running_time	NUMBER	NOT NULL,
	age_rating	VARCHAR2(50)	NOT NULL,
	heart	NUMBER	NULL,
	subtitles_available	VARCHAR2(50)	NULL,
	dubbed_available	VARCHAR2(50)	NULL,
	description	clob	NOT NULL
);


-- 순위
CREATE TABLE Ranking (
	ranking_id NUMBER PRIMARY KEY,
	movie_id NUMBER	NOT NULL REFERENCES Movie(movie_id),
	current_rank NUMBER	NOT NULL,
	change_rank	NUMBER NULL
);


-- 구매/대여
CREATE TABLE Purchase_Rental (
    purchaserental_id NUMBER PRIMARY KEY,
    purchaserental_choose VARCHAR2(30) NOT NULL,
    usage_period VARCHAR2(30) NULL
);


-- 이용방법
CREATE TABLE Usage_Method (
    usagemethod_id NUMBER PRIMARY KEY,
    movie_id NUMBER NOT NULL REFERENCES Movie(movie_id),
    purchaserental_id NUMBER NOT NULL REFERENCES Purchase_Rental(purchaserental_id),
    usage_price NUMBER NOT NULL
);


-- 안내(이용,환불,DRM)
CREATE TABLE Guide (
	guide_id	NUMBER	NOT NULL PRIMARY KEY,
	guide_title	VARCHAR2(30)	NOT NULL,
	guide_content	VARCHAR2(2000)	NOT NULL
);


-- 화면정보
CREATE TABLE Display (
	display_id	NUMBER	NOT NULL PRIMARY KEY,
	video_quality	VARCHAR2(50)	NOT NULL,
    subtitles_display	VARCHAR2(50)	NOT NULL,
	foreign_subtitles	VARCHAR2(50)
);


-- 상품정보
CREATE TABLE Product_Info (
	productInfo_id	NUMBER	NOT NULL PRIMARY KEY,
	capacity	NUMBER	NOT NULL,
    display_id NUMBER	NOT NULL references Display(display_id),
    movie_id NUMBER	NOT NULL references Movie(movie_id)
);


-- 상품정보안내
CREATE TABLE Product_Guide (
    productguide_id	NUMBER	NOT NULL PRIMARY KEY,
    productInfo_id NUMBER NOT NULL REFERENCES Product_Info(productInfo_id),
    guide_id NUMBER NOT NULL REFERENCES Guide(guide_id)
);


-- 네티즌
CREATE TABLE Netizen (
	netizen_id	NUMBER	NOT NULL PRIMARY KEY,
	id	VARCHAR2(20)	NOT NULL UNIQUE
);


-- 댓글
CREATE TABLE Comments (
	comment_id	NUMBER	NOT NULL PRIMARY KEY,
	comment_date	DATE	NOT NULL,
	comment_content	VARCHAR2(1500)	NOT NULL,
	likes_count	NUMBER	NULL,
	dislikes_count	NUMBER	NULL,
    netizen_id NUMBER	NOT NULL references Netizen(netizen_id),
    usagemethod_id NUMBER	NOT NULL references Usage_Method(usagemethod_id)
);


-- 감독
CREATE TABLE Director (
    director_id NUMBER PRIMARY KEY NOT NULL,
    director_name VARCHAR2(50) NOT NULL
);


-- 감독목록
CREATE TABLE Director_List (
    movie_id NUMBER NOT NULL,
    director_id NUMBER NOT NULL,
    PRIMARY KEY (movie_id, director_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (director_id) REFERENCES Director(director_id)
);


-- 배우
CREATE TABLE Actor (
    actor_id NUMBER PRIMARY KEY NOT NULL,
    actor_name VARCHAR2(50) NOT NULL
);


-- 배우목록
CREATE TABLE Actor_List (
    movie_id NUMBER NOT NULL,
    actor_id NUMBER NOT NULL,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actor(actor_id)
);


------------------------------------------------------ insert

-- 영화
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	1	, '하이재킹'	,	8.78	,	2024	,	100	, '12세 관람가'	,	3 	, 'FALSE'	, 'FALSE'	, '1971년 겨울 속초공항 여객기 조종사 태인(하정우)과 규식(성동일)은 김포행 비행에 나선다. 승무원 옥순(채수빈)의 안내에 따라 탑승 중인 승객들의 분주함도 잠시, 이륙한지 얼마 되지 않아 사제폭탄이 터지며 기내는 아수라장이 된다. "지금부터 이 비행기 이북 간다" 여객기를 통째로 납치하려는 용대(여진구)는 조종실을 장악하고 무작정 북으로 기수를 돌리라 협박한다. 폭발 충격으로 규식은 한 쪽 시력을 잃고 혼란스러운 기내에서 절체절명의 상황에 처한 태인. 이들은 여객기를 무사히 착륙시키기 위한 사투를 시작하는데... 대한민국 상공 여객기 납치 사건 이 비행에 모두가 목숨을 걸었다! <하이재킹>'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	2	, '범죄도시4'	,	7.44	,	2024	,	109	, '15세 관람가'	,	45 	, 'FALSE'	, 'FALSE'	, '신종 마약 사건 3년 뒤, 괴물형사 ‘마석도’(마동석)와 서울 광수대는 배달앱을 이용한 마약 판매 사건을 수사하던 중 수배 중인 앱 개발자가 필리핀에서 사망한 사건이 대규모 온라인 불법 도박 조직과 연관되어 있음을 알아낸다. 필리핀에 거점을 두고 납치, 감금, 폭행, 살인 등으로 대한민국 온라인 불법 도박 시장을 장악한 특수부대 용병 출신의 빌런 ‘백창기’(김무열)와 한국에서 더 큰 판을 짜고 있는 IT업계 천재 CEO ‘장동철’(이동휘). ‘마석도’는 더 커진 판을 잡기 위해 ‘장이수’(박지환)에게 뜻밖의 협력을 제안하고 광역수사대는 물론, 사이버수사대까지 합류해 범죄를 소탕하기 시작하는데… 나쁜 놈 잡는데 국경도 영역도 제한 없다! 업그레이드 소탕 작전! 거침없이 싹 쓸어버린다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	3	, '육사오(6/45)'	,	8.56	,	2022	,	113	, '12세 관람가'	,	129 	, 'FALSE'	, 'FALSE'	, '고경표, 이이경, 음문석, 박세완, 이순원, 곽동연, 김민호, 류승수, 윤병희, 이준혁'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	4	, '퍼펙트 블루'	,	8.75	,	2004	,	81	, '청소년 관람불가'	,	145 	, 'TRUE'	, 'FALSE'	, '인기절정의 아이돌 그룹 "챰"의 야외 콘서트장. 아이돌 그룹의 숙명인지 챰도 슬슬 해산해야 할 것 같다는 말들이 팬들 사이에서 은밀히 돌고있다. 콘서트가 클라이막스를 향할 때, 리더격인 미마가 갑자기 독립선언을 한다. 미마는 팬들 사이에선 미마린 이라 불리우는 가장 인기있는 아이돌 스타다. 미마는 화려한 여배우에 대한 꿈을 품는다. 챰을 탈퇴한 미마의 첫 일은 TV드라마 "더블 바인드"에 출연하는 것. 아이돌 가수였긴해도 연기경험은 적은 그녀에게 주어진 대사는 단 한마디. 미마를 잘 팔려고 노력하는 사무소 대표인 타도코로는 회사의 방침에 반대하는 담당 매니저 루미와 갈등을 겪는다. 마침 촬영 견학을 온 각본가 시부야를 본 타도코로는 미마는 이제 아이돌이 아니라며 어떤 것이든 시켜달라고 부탁한다. 그 때 한통의 팬레터가 전해진다. 미마대신 타도코로가 편지를 뜯자 갑자기 폭발음이 터진다. 불미스런 사건은 이렇게 시작된다. 타도코로의 노력으로 점점 출연씬이 많아지는 미마. 하지만 그녀가 넘어야 할 산은 많다. 드라마에서 강간 씬을 연기하고, 거기에 맞춰 누드 사진도 공개한다. 여배우로서 지명도는 점점 높아가지만, 주변의 급격한 변화에 방황하는 미마. 그런 와중에 미마의 일과 관련된 사람들이 하나둘 살해되기 시작한다. 각본가 시부야, 카메라맨 무라노. 그리고 팬으로부터 배신자라는 메시지가 속속 도착한다… 살인사건과 대담한 노출연기로 인기드라마가 된 "더블 바인드"에서 광기로 살인을 저지르고 다니는 소녀 역을 연기하는 미마는 현실과 허구의 세계가 교차되며 혼란을 겪는다. 그런 어느날 그녀 앞에 또 하나의 미마가 나타난다. 그것은 잊고 있었던 또 하나의 자신, 아이돌 가수 시절의 미마였다. 미마는 미쳐버린 것일까? 아니면 꿈일까? 연속살인 범인은 자신인 것일까? 미마는 점점 정체성을 잃게 되는데... 과연 그녀가 본 또 하나의 미마는 누구일까?'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	5	, '널 기다리며'	,	7.58	,	2016	,	108	, '청소년 관람불가'	,	6 	, 'FALSE'	, 'FALSE'	, '당신이 우리 아빠 죽였지? 15년 전, 내 눈 앞에서 아빠를 죽인 범인이 드디어 세상 밖으로 나왔다. 15년을 기다린 이유는 단 하나! 아빠를 죽인 범인을 쫓는 소녀 ‘희주’ 앞에 유사 패턴의 연쇄살인사건이 발생하고 15년을 기다린 희주의 계획은 전혀 예측하지 못한 새로운 국면을 맞이하게 되는데… 15년의 기다림, 7일간의 추적 그 놈을 잡기 위한 강렬한 추적이 시작된다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	6	, '하이재킹'	,	8.78	,	2024	,	100	, '12세 관람가'	,	12 	, 'FALSE'	, 'FALSE'	, '1971년 겨울 속초공항 여객기 조종사 태인(하정우)과 규식(성동일)은 김포행 비행에 나선다. 승무원 옥순(채수빈)의 안내에 따라 탑승 중인 승객들의 분주함도 잠시, 이륙한지 얼마 되지 않아 사제폭탄이 터지며 기내는 아수라장이 된다. "지금부터 이 비행기 이북 간다" 여객기를 통째로 납치하려는 용대(여진구)는 조종실을 장악하고 무작정 북으로 기수를 돌리라 협박한다. 폭발 충격으로 규식은 한 쪽 시력을 잃고 혼란스러운 기내에서 절체절명의 상황에 처한 태인. 이들은 여객기를 무사히 착륙시키기 위한 사투를 시작하는데... 대한민국 상공 여객기 납치 사건 이 비행에 모두가 목숨을 걸었다! <하이재킹>'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	7	, '인사이드 아웃(패키지상품 : 더빙판 + 부가영상 추가증정)'	,	9.09	,	2015	,	94	, '전체 관람가'	,	1159 	, 'TRUE'	, 'FALSE'	, '모든 사람의 머릿속에 존재하는 감정 컨트롤 본부 그곳에서 불철주야 열심히 일하는 기쁨, 슬픔, 버럭, 까칠, 소심 다섯 감정들. 이사 후 새로운 환경에 적응해야 하는 ‘라일리’를 위해 그 어느 때 보다 바쁘게 감정의 신호를 보내지만 우연한 실수로 ‘기쁨’과 ‘슬픔’이 본부를 이탈하게 되자 "라일리’의 마음 속에 큰 변화가 찾아온다. "라일리"가 예전의 모습을 되찾기 위해서는 ‘기쁨’과 ‘슬픔’이 본부로 돌아가야만 한다! 그러나 엄청난 기억들이 저장되어 있는 머릿속 세계에서 본부까지 가는 길은 험난하기만 한데… 과연, ‘라일리’는 다시 행복해질 수 있을까? 지금 당신의 머릿속에서 벌어지는 놀라운 일! 하루에도 몇번씩 변하는 감정의 비밀이 밝혀진다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	8	, '너의 이름은.'	,	8.82	,	2017	,	106	, '12세 관람가'	,	5774 	, 'TRUE'	, 'FALSE'	, '꿈 속에서 몸이 뒤바뀐 도시 소년 ‘타키’와 시골 소녀 ‘미츠하’, 만난 적 없는 두 사람이 만들어가는 기적과 사랑에 관한 이야기 <너의 이름은.> 잊고 싶지 않은 사람 잊으면 안 되는 사람 너의 이름은?'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	9	, '범죄도시4'	,	7.44	,	2024	,	109	, '15세 관람가'	,	90 	, 'FALSE'	, 'FALSE'	, '신종 마약 사건 3년 뒤, 괴물형사 ‘마석도’(마동석)와 서울 광수대는 배달앱을 이용한 마약 판매 사건을 수사하던 중 수배 중인 앱 개발자가 필리핀에서 사망한 사건이 대규모 온라인 불법 도박 조직과 연관되어 있음을 알아낸다. 필리핀에 거점을 두고 납치, 감금, 폭행, 살인 등으로 대한민국 온라인 불법 도박 시장을 장악한 특수부대 용병 출신의 빌런 ‘백창기’(김무열)와 한국에서 더 큰 판을 짜고 있는 IT업계 천재 CEO ‘장동철’(이동휘). ‘마석도’는 더 커진 판을 잡기 위해 ‘장이수’(박지환)에게 뜻밖의 협력을 제안하고 광역수사대는 물론, 사이버수사대까지 합류해 범죄를 소탕하기 시작하는데… 나쁜 놈 잡는데 국경도 영역도 제한 없다! 업그레이드 소탕 작전! 거침없이 싹 쓸어버린다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	10	, '나쁜 녀석들: 라이드 오어 다이'	,	8	,	2024	,	116	, '청소년 관람불가'	,	11 	, 'FALSE'	, 'FALSE'	, '마이애미 강력반 최고의 콤비 ‘마이크’(윌 스미스)와 ‘마커스’(마틴 로렌스). 가족 같은 ‘하워드’(조 판토리아노) 반장이 사망 전 마약 카르텔 조직의 비리에 연루되었다는 뉴스 속보를 접하게 된다. 하지만 아무도 믿지 말라는 ‘하워드’ 반장의 비밀 메시지를 받은 ‘마이크’와 ‘마커스’ 형사는 사건의 진실을 밝히기 위해 위험한 수사를 시작한다. 서서히 드러나는 거대한 음모와 마주하게 된 나쁜 녀석들. 그러나 이들 역시 함정에 빠져 사건의 용의자로 지목되며 동료 경찰들은 물론 마약 카르텔 조직에게도 쫓기는 신세가 되고 마는데… 용의자가 된 나쁜 녀석들의 화끈한 수사가 시작된다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	11	, '괴물'	,	9.03	,	2023	,	126	, '12세 관람가'	,	175 	, 'FALSE'	, 'FALSE'	, '“우리 동네에는 괴물이 산다” 싱글맘 사오리(안도 사쿠라)는 아들 미나토(쿠로카와 소야)의 행동에서 이상 기운을 감지한다. 용기를 내 찾아간 학교에서 상담을 진행한 날 이후 선생님과 학생들의 분위기가 심상치 않게 흐르기 시작하고. “괴물은 누구인가?” 한편 사오리는 친구들로부터 따돌림을 당하고 있는 미나토의 친구 요리(히이라기 히나타)의 존재를 알게 되고 자신이 아는 아들의 모습과 사람들이 아는 아들의 모습이 다르다는 사실을 어렴풋이 깨닫는데… 태풍이 몰아치던 어느 날, 아무도 몰랐던 진실이 드러난다.'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	12	, '기쿠지로의 여름'	,	8.88	,	2002	,	122	, '전체 관람가'	,	520 	, 'FALSE'	, 'FALSE'	, '모두가 기다리던 여름방학. 하지만 마사오는 전혀 즐겁지 않다. 할머니는 매일 일을 나가시느라 바쁘고 친구들은 가족들과 함께 바다나 시골로 놀러 가버려 외톨이가 되었기 때문. 어느 날 먼 곳에 돈을 벌러 가셨다는 엄마의 주소를 발견한 마사오. 그림 일기장과 방학숙제를 배낭에 넣고 엄마를 찾아 여행길에 오른다. 52세 철없는 어른과 9세 걱정많은 소년. 그들이 마침내 찾은 것은?!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	13	, '콰이어트 플레이스: 첫째 날'	,	5.07	,	2024	,	99	, '15세 관람가'	,	12 	, 'FALSE'	, 'FALSE'	, '쉿, 살고 싶다면 절대 소리내지 말 것! 평균 소음 90 데시벨을 자랑하는 미국 최대도시 뉴욕, 고양이 ‘프로도’와 함께 간만에 외출을 나온 ‘사미라’는 공연을 보고 돌아가던 중 하늘에서 떨어져 내리는 섬광을 목격하고 곧 사람들을 닥치는 대로 공격하는 정체불명 괴생명체의 출현에 충격에 휩싸인다. 아수라장이 된 뉴욕 도심에 ‘절대 소리 내지 말라’는 안내방송이 울려퍼지는 가운데 맨해튼의 모든 다리가 폭격으로 끊어지고, 사람들은 온갖 위협이 도사리는 도시에 고립되고 만다. 살아남기 위해 홀로 사투를 벌이던 "사미라"는 우연히 또 다른 생존자 ‘에릭’을 만나고 두 사람은 괴생명체를 피해 지하철역부터 시가지, 할렘까지 숨죽인 여정을 이어 나가는데…'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	14	, '그녀가 죽었다'	,	8.28	,	2024	,	102	, '15세 관람가'	,	33 	, 'FALSE'	, 'FALSE'	, '“나쁜 짓은 절대 안 해요. 그냥 보기만 하는 거예요.” 고객이 맡긴 열쇠로 그 집에 들어가 남의 삶을 훔쳐보는 취미를 지닌 공인중개사 ‘구정태’. 편의점 소시지를 먹으며 비건 샐러드 사진을 포스팅하는 SNS 인플루언서 ‘한소라’에게 흥미를 느끼고 관찰하기 시작한다. “관찰 152일째, 그녀가… 죽었습니다.” 급기야 ‘한소라’의 집까지 드나들던 ‘구정태’는 어느 날, 그녀가 소파에 죽은 채 늘어져 있는 모습을 발견하게 된다. 그 후 그가 ‘한소라’ 집에 들어간 것을 알고 있는 누군가가 협박을 시작하고, 사건을 맡은 강력반 형사 ‘오영주’의 수사망이 그를 향해 좁혀온다. 스스로 범인을 찾아야 하는 ‘구정태’는 ‘한소라’의 SNS를 통해 주변 인물들을 뒤지며 진범을 찾아 나서는데…'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	15	, '마녀(魔女) Part2. The Other One'	,	6.59	,	2022	,	137	, '15세 관람가'	,	228 	, 'FALSE'	, 'FALSE'	, '’자윤’이 사라진 뒤, 정체불명의 집단의 무차별 습격으로 마녀 프로젝트가 진행되고 있는 ‘아크’가 초토화된다. 그곳에서 홀로 살아남은 ‘소녀’는 생애 처음 세상 밖으로 발을 내딛고 우연히 만난 ‘경희’의 도움으로 농장에서 지내며 따뜻한 일상에 적응해간다. 한편, ‘소녀’가 망실되자 행방을 쫓는 책임자 ‘장’과 마녀 프로젝트의 창시자 ‘백총괄’의 지령을 받고 제거에 나선 본사 요원 ‘조현’, ‘경희’의 농장 소유권을 노리는 조직의 보스 ‘용두’와 상해에서 온 의문의 4인방까지 각기 다른 목적을 지닌 세력이 하나 둘 모여들기 시작하면서 ‘소녀’ 안에 숨겨진 본성이 깨어나는데… 모든 것의 시작, 더욱 거대하고 강력해진 마녀가 온다.'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	16	, '귀공자'	,	8.57	,	2023	,	118	, '청소년 관람불가'	,	118 	, 'FALSE'	, 'FALSE'	, '“난 단 한번도 타겟을 놓쳐 본 적이 없거든” 필리핀에서 불법 경기장을 전전하며 병든 어머니와 살아가는 복싱 선수 ‘마르코’. 어머니의 수술비 마련을 위해 평생 본 적 없는 아버지를 만나러 한국으로 향하던 그의 앞에 정체불명의 남자 ‘귀공자’가 나타나 그를 추격하기 시작한다. ‘마르코’ 주위를 쑥대밭으로 만들며 숨통을 조여오는 ‘귀공자’를 필두로, ‘마르코’를 집요하게 추격하는 재벌 2세 ‘한이사’, 필리핀에 이어 한국에서 우연히 ‘마르코’와 재회한 미스터리한 인물 ‘윤주’까지. 각기 다른 목적을 가진 이들은 단 하나의 타겟을 쫓아 모여들고, 그 무엇도 예측할 수 없는 혼란과 광기 속 ‘마르코’는 충격적인 진실을 마주하게 되는데… 단 하나의 타겟, 광기의 추격이 시작된다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	17	, '소울메이트'	,	8.6	,	2023	,	124	, '12세 관람가'	,	439 	, 'FALSE'	, 'FALSE'	, '1998년, 처음 만났다. 2004년, 첫사랑이 생겼다. 2010년, 각자 어른이 되어간다. 2014년, 흔적을 따라간다. 지금, 그리움을 그린다. 2023년 3월 15일, 당신의 소울메이트가 찾아옵니다.'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	18	, '엘리멘탈(패키지: 자막판+더빙판+부가영상+코멘터리)'	,	9.34	,	2023	,	101	, '전체 관람가'	,	1281 	, 'FALSE'	, 'FALSE'	, '불, 물, 공기, 흙 4개의 원소들이 살고 있는 ‘엘리멘트 시티’ 재치 있고 불처럼 열정 넘치는 ‘앰버"는 어느 날 우연히 유쾌하고 감성적이며 물 흐르듯 사는 "웨이드"를 만나 특별한 우정을 쌓으며, 지금껏 믿어온 모든 것들이 흔들리는 새로운 경험을 하게 되는데... 웰컴 투 ‘엘리멘트 시티’!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	19	, '스즈메의 문단속: 다녀왔어'	,	7.85	,	2024	,	122	, '12세 관람가'	,	66 	, 'TRUE'	, 'FALSE'	, '큐슈의 작은 마을에서 살고 있는 소녀 ‘스즈메’는 어느 날, 여행을 하며 ‘문’을 찾고 있는 한 청년을 만난다. 그의 뒤를 쫓아간 소녀는 산속 폐허에서 덩그러니 남겨진 낡은 문을 발견한다. 무언가에 이끌린 듯 ‘스즈메’는 문으로 손을 뻗는데… 2024년, ‘문단속을 위한 여행’이 다시 시작된다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	20	, '밀수'	,	7.76	,	2023	,	129	, '15세 관람가'	,	116 	, 'FALSE'	, 'FALSE'	, '열길 물속은 알아도 한길 사람 속은 모른다! 평화롭던 바닷가 마을 군천에 화학 공장이 들어서면서 하루아침에 일자리를 잃은 해녀들. 먹고 살기 위한 방법을 찾던 승부사 "춘자"(김혜수)는 바다 속에 던진 물건을 건져 올리기만 하면 큰돈을 벌 수 있다는 밀수의 세계를 알게 되고 해녀들의 리더 "진숙"(염정아)에게 솔깃한 제안을 한다. 위험한 일임을 알면서도 생계를 위해 과감히 결단을 내린 해녀 "진숙"은 전국구 밀수왕 "권 상사"를 만나게 되면서 확 커진 밀수판에 본격적으로 빠지게 된다. 그러던 어느 날, 일확천금을 얻을 수 있는 일생일대의 기회가 찾아오고 사람들은 서로를 속고 속이며 거대한 밀수판 속으로 휩쓸려 들어가기 시작하는데... 물길을 아는 자가 돈길의 주인이 된다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	21	, '날씨의 아이'	,	8	,	2019	,	112	, '15세 관람가'	,	1777 	, 'TRUE'	, 'FALSE'	, '비가 그치지 않던 어느 여름날, 가출 소년 ‘호다카’는 수상한 잡지사에 취직하게 되고 비밀스러운 소녀 ‘히나’를 우연히 만난다. “지금부터 하늘이 맑아질 거야” 그녀의 기도에 거짓말 같이 빗줄기는 멈추고, 사람들의 얼굴에 환한 빛이 내려온다. “신기해, 날씨 하나에 사람들의 감정이 이렇게나 움직이다니” 하지만, 맑음 뒤 흐림이 찾아오듯 두 사람은 엄청난 세계의 비밀을 마주하게 되는데… 흐리기만 했던 세상이 빛나기 시작했고, 그 끝에는 네가 있었다.'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	22	, '카메라를 멈추면 안 돼!'	,	8.58	,	2018	,	96	, '15세 관람가'	,	352 	, 'FALSE'	, 'FALSE'	, '음산한 기운의 창고 안, 좀비 영화를 찍는 촬영 현장. 원하는 결과물이 나오지 않자 격해진 감독과 배우들은 쉬는 시간을 갖는다. 그 순간, 어디선가 등장한 ‘진짜’ 좀비 떼들이 사람들을 하나둘씩 죽이기 시작하고 현장은 아수라장이 되는데! 이 모든 사건의 전말이 궁금한 당신, 카메라를 멈추면 안 돼!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	23	, '듄: 파트 2'	,	9.03	,	2024	,	165	, '12세 관람가'	,	53 	, 'FALSE'	, 'FALSE'	, '황제의 모략으로 멸문한 가문의 유일한 후계자 폴.(티모시 샬라메) 어머니 레이디 제시카(레베카 퍼거슨)와 간신히 목숨만 부지한 채 사막으로 도망친다. 그곳에서 만난 반란군들과 숨어 지내다 그들과 함께 황제의 모든 것을 파괴할 전투를 준비한다. 한편 반란군들의 기세가 높아질수록 불안해진 황제와 귀족 가문은 잔혹한 암살자 페이드 로타(오스틴 버틀러)를 보내 반란군을 몰살하려 하는데… 운명의 반격이 시작된다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	24	, '30일'	,	8.4	,	2023	,	119	, '12세 관람가'	,	107 	, 'FALSE'	, 'FALSE'	, '“완벽한 저에게 신은 저 여자를 던지셨죠” 지성과 외모 그리고 찌질함까지 타고난, "정열"(강하늘). “모기 같은 존재죠. 존재의 이유를 모르겠는?” 능력과 커리어 그리고 똘기까지 타고난, "나라"(정소민). 영화처럼 만나 영화같은 사랑을 했지만 서로의 찌질함과 똘기를 견디다 못해 마침내 완벽한 남남이 되기로 한다. 그러나! 완벽한 이별을 딱 D-30 앞둔 이들에게 찾아온 것은... 동반기억상실?'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	25	, '퓨리오사: 매드맥스 사가'	,	9.19	,	2024	,	148	, '15세 관람가'	,	36 	, 'FALSE'	, 'FALSE'	, '문명 붕괴 45년 후, 황폐해진 세상 속 누구에게도 알려지지 않은 풍요가 가득한 ‘녹색의 땅’에서 자란 ‘퓨리오사’(안야 테일러-조이)는 바이커 군단의 폭군 ‘디멘투스’(크리스 헴스워스)의 손에 모든 것을 잃고 만다. 가족도 행복도 모두 빼앗기고 세상에 홀로 내던져진 ‘퓨리오사’는 반드시 고향으로 돌아가겠다는 어머니와의 약속을 지키기 위해 인생 전부를 건 복수를 시작하는데... ‘매드맥스’ 시리즈의 전설적인 사령관 ‘퓨리오사’의 대서사시 마침내 분노가 깨어난다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	26	, '슈퍼배드'	,	8.99	,	2010	,	94	, '전체 관람가'	,	98 	, 'TRUE'	, 'FALSE'	, '각 나라를 대표하는 명소들을 한 번에 훔쳐버린 기상천외한 주인공 ‘그루’. 그는 세계 최고의 악당이 되기 위하여 다른 사람이 절대 훔칠 수 없는 것을 하나 훔치기로 마음 먹는다. 그것은 바로 ‘달’!!! ‘달’을 훔치기 위한 최신식 장비를 구하기 위해 어쩔 수 없이 고아원의 세 소녀들을 맡게 된 ‘그루’는 세 소녀들과 함께 살게 되면서 세상에서 가장 어려운 일은 악당이 되는 것이 아니라 바로 이 소녀들을 키우는 일임을 알게 된다. 소녀들에 의해 점차 사랑을 배우고 변화되어 가는 ‘그루’. 과연 그는 달을 훔칠 수 있을 것인가? 소녀들과 그루는 어떻게 될 것인가'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	27	, '명탐정코난: 흑철의 어영'	,	9.27	,	2023	,	110	, '12세 관람가'	,	243 	, 'FALSE'	, 'TRUE'	, '인터폴의 최첨단 정보 해양 시설인 ‘퍼시픽 부이’. 일본과 유럽의 CCTV 정보를 확인할 수 있을 뿐 아니라, 장기 수배범이나 유괴당한 피해자를 전 세계에서 찾아낼 수 있는 ‘전연령 인식’이라는 획기적인 AI 기술을 개발 중이다. 그러던 중 독일에서 검은 조직에 의해 유로폴 직원이 살해되는 사건이 발생하고 뒤를 이어 ‘전연령 인식’의 핵심 기술자가 납치된다. 나이와 상관없이 안면 인식이 가능한 기술이 검은 조직의 손에 들어가면 독약 APTX4869(아포톡신 4869) 개발 후 사망한 것으로 알려진 코드명 ‘셰리’이자 하이바라 아이도 위험하게 되는데! 코난, FBI, CIA, 공안 경찰이 합세, 하이바라 아이와 함께 전 세계를 위험에 빠지게 할 절체절명의 오션 배틀 로열이 시작된다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	28	, '인간중독'	,	6.74	,	2014	,	132	, '청소년 관람불가'	,	0 	, 'FALSE'	, 'FALSE'	, '모두의 신임을 받으며 승승장구 중인 교육대장 ‘김진평(송승헌)’과 남편을 장군으로 만들려는 야망을 가진 ‘진평’의 아내 ‘이숙진(조여정)’. 어느 날, ‘김진평’의 부하로 충성을 맹세하는 ‘경우진(온주완)’과 그의 아내 ‘종가흔(임지연)’이 이사를 온다. ‘진평’은 ‘우진’의 아내 ‘가흔’에게 첫 만남부터 강렬한 떨림을 느끼는데… 누구에게도 말할 수 없는 비밀을 간직한 여인 ‘가흔’과 그녀에게 걷잡을 수 없이 빠져드는 ‘진평’. 만나지 말았어야 할 두 사람, 최상류층 군관사 안, 누구도 알아서는 안 될 치명적 스캔들이 시작된다! "당신을 안 보면 숨을 쉴 수가 없어“ "왜 이렇게 가슴이 뛰죠?"'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	29	, '명탐정 코난 VS 괴도 키드'	,	6.56	,	2024	,	80	, '12세 관람가'	,	88 	, 'FALSE'	, 'TRUE'	, '“괴도 1412호, 이름하여 괴도 KID” 암호가 섞인 예고장이 보내진 그곳에는 월하의 마술사, 괴도 키드가 나타난다. 세상을 떠들썩하게 만들며 인기를 얻고 있는 그의 정체는 에코다 고등학교 2학년 쿠로바 카이토. 수수께끼의 조직에 살해당한 세계적인 마술사였던 아버지 쿠로바 도이치의 뒤를 이어 사건의 진상을 파헤치기 위해 2대 ‘괴도 키드’가 되어 도이치가 쫓던 ‘빅 주얼’과 조직의 정체를 향해 다가간다. 이번에 그가 노리는 ‘빅 주얼’은 ‘대해의 기적’이자 ‘블루 원더’라고 불리는 전설의 아쿠아마린. 소노코의 친척이자 키드 체포에 열을 올리고 있는 스즈키 지로키치가 그에게 먼저 도전장을 내밀고, 언제나 그랬듯 괴도 키드는 모두의 예상을 뒤엎고 신출귀몰한 방법으로 나타나는데… 이를 막기 위해 불가능을 모르는 명탐정, 코난의 명추리가 펼쳐진다! 사상 최대의 라이벌 탄생! 화려한 괴도와 그를 쫓는 명탐정 모든 것의 시작은 여기서부터! 월하의 마술사 괴도 키드의 탄생과 영원한 최대의 라이벌, 코난-쿠도 신이치와의 첫 대결이 시작된다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	30	, '스즈메의 문단속'	,	8.13	,	2023	,	122	, '12세 관람가'	,	255 	, 'TRUE'	, 'FALSE'	, '큐슈의 작은 마을에서 살고 있는 소녀 ‘스즈메’는 어느 날, 여행을 하며 ‘문’을 찾고 있는 한 청년을 만난다. 그의 뒤를 쫓아간 소녀는 산속 폐허에서 덩그러니 남겨진 낡은 문을 발견한다. 무언가에 이끌린 듯 ‘스즈메’는 문으로 손을 뻗는데… 2023년, ‘문단속을 위한 여행’이 시작된다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	31	, '파묘'	,	7.84	,	2024	,	134	, '15세 관람가'	,	150 	, 'FALSE'	, 'FALSE'	, '미국 LA, 거액의 의뢰를 받은 무당 ‘화림’(김고은)과 ‘봉길’(이도현)은 기이한 병이 대물림되는 집안의 장손을 만난다. 조상의 묫자리가 화근임을 알아챈 ‘화림’은 이장을 권하고, 돈 냄새를 맡은 최고의 풍수사 ‘상덕’(최민식)과 장의사 ‘영근’(유해진)이 합류한다. “전부 잘 알 거야… 묘 하나 잘못 건들면 어떻게 되는지” 절대 사람이 묻힐 수 없는 악지에 자리한 기이한 묘. ‘상덕’은 불길한 기운을 느끼고 제안을 거절하지만, ‘화림’의 설득으로 결국 파묘가 시작되고… 나와서는 안될 것이 나왔다.'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	32	, '올빼미'	,	9.28	,	2022	,	118	, '15세 관람가'	,	215 	, 'FALSE'	, 'FALSE'	, '맹인이지만 뛰어난 침술 실력을 지닌 ‘경수’는 어의 ‘이형익’에게 그 재주를 인정받아 궁으로 들어간다. 그 무렵, 청에 인질로 끌려갔던 ‘소현세자’가 8년 만에 귀국하고, ‘인조’는 아들을 향한 반가움도 잠시 정체 모를 불안감에 휩싸인다. 그러던 어느 밤, 어둠 속에서는 희미하게 볼 수 있는 ‘경수’가 ‘소현세자’의 죽음을 목격하게 되고 진실을 알리려는 찰나 더 큰 비밀과 음모가 드러나며 목숨마저 위태로운 상황에 빠진다. 아들의 죽음 후 ‘인조’의 불안감은 광기로 변하여 폭주하기 시작하고 세자의 죽음을 목격한 ‘경수’로 인해 관련된 인물들의 민낯이 서서히 드러나게 되는데...'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	33	, '정직한 후보2'	,	6.05	,	2022	,	106	, '12세 관람가'	,	71 	, 'FALSE'	, 'FALSE'	, '서울시장 선거에서 떨어지며 쫄딱 망한 백수가 된 ‘주상숙’은 우연히 바다에 빠진 한 청년을 구한 일이 뉴스를 타며 고향에서 화려한 복귀의 기회를 잡는다. 하지만 정직하면 할수록 바닥으로 곤두박질치는 지지율 앞에 다시 뻥쟁이로 돌아간 그 순간, ‘주상숙’에게 운명처럼 찾아온 ‘진실의 주둥이’! 이번엔 ‘주상숙’의 비서실장 ‘박희철’까지 주둥이가 쌍으로 털리게 되는데... 재미도 2배! 웃음도 2배! 주둥이 대폭발 코미디가 돌아왔다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	34	, '반도'	,	5.62	,	2020	,	115	, '15세 관람가'	,	204 	, 'FALSE'	, 'FALSE'	, '[전대미문의 재난 그 후 4년 폐허의 땅으로 다시 들어간다!] 4년 전, 나라 전체를 휩쓸어버린 전대미문의 재난에서 가까스로 탈출했던 ‘정석’(강동원). 바깥세상으로부터 철저히 고립된 반도에 다시 들어가야 하는 피할 수 없는 제안을 받는다. 제한 시간 내에 지정된 트럭을 확보해 반도를 빠져 나와야 하는 미션을 수행하던 중 인간성을 상실한 631부대와 4년 전보다 더욱 거세진 대규모 좀비 무리가 정석 일행을 습격한다. 절체절명의 순간, 폐허가 된 땅에서 살아남은 ‘민정’(이정현) 가족의 도움으로 위기를 가까스로 모면하고 이들과 함께 반도를 탈출할 수 있는 마지막 기회를 잡기로 한다. 되돌아온 자, 살아남은 자 그리고 미쳐버린 자 필사의 사투가 시작된다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	35	, '기생충'	,	8.49	,	2019	,	132	, '15세 관람가'	,	292 	, 'FALSE'	, 'FALSE'	, '전원백수로 살 길 막막하지만 사이는 좋은 기택(송강호) 가족. 장남 기우(최우식)에게 명문대생 친구가 연결시켜 준 고액 과외 자리는 모처럼 싹튼 고정수입의 희망이다. 온 가족의 도움과 기대 속에 박사장(이선균) 집으로 향하는 기우. 글로벌 IT기업 CEO인 박사장의 저택에 도착하자 젊고 아름다운 사모님 연교(조여정)가 기우를 맞이한다. 그러나 이렇게 시작된 두 가족의 만남 뒤로, 걷잡을 수 없는 사건이 기다리고 있었으니…'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	36	, '슈퍼배드 3'	,	8.69	,	2017	,	89	, '전체 관람가'	,	104 	, 'TRUE'	, 'FALSE'	, '최고의 악당만을 보스로 섬기는 ‘미니언’ 가족을 위해 악당 은퇴를 선언한 ‘그루’ 그루의 배신에 실망한 미니언들은 스스로 악당이 되기 위해 그루를 떠난다. 한편, 같은 얼굴 다른 스펙의 쌍둥이 동생 ‘드루’의 등장으로 인해 그루는 자신이 역사상 가장 위대한 악당 가문의 후예임을 알게 되고, 거부할 수 없는 슈퍼배드의 운명을 따르게 되는데… 돌아온 그루와 미니언들은 다시 함께할 수 있을까?'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	37	, '덫: 치명적인 유혹'	,	8.04	,	2015	,	107	, '청소년 관람불가'	,	200 	, 'FALSE'	, 'FALSE'	, '시나리오 집필을 위해 허름한 산골 민박을 찾은 작가 "정민", 앳된 얼굴에 관능적인 매력을 가진 소녀 "유미"를 만나고 그녀에게서 눈을 떼지 못한다. 추운 겨울밤, 창고 안 소녀의 나신을 훔쳐보던 정민은 타오르는 욕망을 애써 누른 채 서울로 돌아온다. 하지만, 자신을 유혹하는 듯한 유미의 눈빛을 잊지 못하고 다시 돌아간 그는 한밤중 방으로 찾아온 그녀와 뜨거운 정사를 나누지만, 도무지 현실인지 꿈인지 알 수 없는 혼란스러운 상황과 누구도 믿을 수 없는 패닉에서 벗어나지 못하는데… 9월 17일, 벗어날 수 없는 치명적인 유혹이 찾아온다'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	38	, '슈퍼배드 2'	,	8.81	,	2013	,	98	, '전체 관람가'	,	68 	, 'FALSE'	, 'TRUE'	, '슈퍼 악당에서 딸바보 슈퍼 대디로 180도 변신한 ‘그루’는 수다스럽고 사랑스러운 세 딸, ‘마고’, ‘에디스’, ‘아그네스’와 함께 행복한 삶을 살고 있다.  하지만 세상을 지배하려는 최강 악당 군단이 나타나자, 이들을 상대할 유일한 슈퍼 악당, ‘그루’가 비밀 요원으로 ‘악당 소탕 작전’에 투입된다. 매력적인 파트너 ‘루시’와 함께 스펙타클한 임무를 수행하던 중, 미니언 군단까지 공격을 받아 ‘보라 미니언’으로 변하고 마는데..!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	39	, '슈퍼배드'	,	8.99	,	2010	,	94	, '전체 관람가'	,	31 	, 'FALSE'	, 'TRUE'	, '각 나라를 대표하는 명소들을 한 번에 훔쳐버린 기상천외한 주인공 ‘그루’. 그는 세계 최고의 악당이 되기 위하여 다른 사람이 절대 훔칠 수 없는 것을 하나 훔치기로 마음 먹는다. 그것은 바로 ‘달’!!! ‘달’을 훔치기 위한 최신식 장비를 구하기 위해 어쩔 수 없이 고아원의 세 소녀들을 맡게 된 ‘그루’는 세 소녀들과 함께 살게 되면서 세상에서 가장 어려운 일은 악당이 되는 것이 아니라 바로 이 소녀들을 키우는 일임을 알게 된다. 소녀들에 의해 점차 사랑을 배우고 변화되어 가는 ‘그루’. 과연 그는 달을 훔칠 수 있을 것인가? 소녀들과 그루는 어떻게 될 것인가'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	40	, '나쁜 녀석들: 라이드 오어 다이'	,	8	,	2024	,	116	, '청소년 관람불가'	,	4 	, 'FALSE'	, 'FALSE'	, '마이애미 강력반 최고의 콤비 ‘마이크’(윌 스미스)와 ‘마커스’(마틴 로렌스). 가족 같은 ‘하워드’(조 판토리아노) 반장이 사망 전 마약 카르텔 조직의 비리에 연루되었다는 뉴스 속보를 접하게 된다. 하지만 아무도 믿지 말라는 ‘하워드’ 반장의 비밀 메시지를 받은 ‘마이크’와 ‘마커스’ 형사는 사건의 진실을 밝히기 위해 위험한 수사를 시작한다. 서서히 드러나는 거대한 음모와 마주하게 된 나쁜 녀석들. 그러나 이들 역시 함정에 빠져 사건의 용의자로 지목되며 동료 경찰들은 물론 마약 카르텔 조직에게도 쫓기는 신세가 되고 마는데… 용의자가 된 나쁜 녀석들의 화끈한 수사가 시작된다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	41	, '가여운 것들'	,	7.6	,	2024	,	141	, '청소년 관람불가'	,	34 	, 'FALSE'	, 'FALSE'	, '천재적이지만 특이한 과학자 갓윈 백스터(윌렘 대포)에 의해 새롭게 되살아난 벨라 백스터(엠마 스톤). 갓윈의 보호를 받으며 성장하던 벨라는 날이 갈수록 세상에 대한 호기심과 새로운 경험에 대한 갈망이 넘쳐난다. 아름다운 벨라에게 반한 짓궂고 불손한 바람둥이 변호사 덩컨 웨더번(마크 러팔로)이 더 넓은 세계를 탐험하자는 제안을 하자, 벨라는 새로운 경험에 대한 갈망으로 대륙을 횡단하는 여행을 떠나고 처음 보는 광경과 새롭게 만난 사람들을 통해 놀라운 변화를 겪게 되는데…. 세상에 대한 경이로움과 아름다움, 놀라운 반전과 유머로 가득한 벨라의 여정이 이제 시작된다.'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	42	, '괴물'	,	9.03	,	2023	,	126	, '12세 관람가'	,	385 	, 'FALSE'	, 'FALSE'	, '“우리 동네에는 괴물이 산다” 싱글맘 사오리(안도 사쿠라)는 아들 미나토(쿠로카와 소야)의 행동에서 이상 기운을 감지한다. 용기를 내 찾아간 학교에서 상담을 진행한 날 이후 선생님과 학생들의 분위기가 심상치 않게 흐르기 시작하고. “괴물은 누구인가?” 한편 사오리는 친구들로부터 따돌림을 당하고 있는 미나토의 친구 요리(히이라기 히나타)의 존재를 알게 되고 자신이 아는 아들의 모습과 사람들이 아는 아들의 모습이 다르다는 사실을 어렴풋이 깨닫는데… 태풍이 몰아치던 어느 날, 아무도 몰랐던 진실이 드러난다.'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	43	, '에브리씽 에브리웨어 올 앳 원스'	,	8.19	,	2022	,	139	, '15세 관람가'	,	689 	, 'FALSE'	, 'FALSE'	, '미국에 이민 와 힘겹게 세탁소를 운영하던 에블린은 세무당국의 조사에 시달리던 어느 날 남편의 이혼 요구와 삐딱하게 구는 딸로 인해 대혼란에 빠진다. 그 순간 에블린은 멀티버스 안에서 수천, 수만의 자신이 세상을 살아가고 있다는 사실을 알게 되고, 그 모든 능력을 빌려와 위기의 세상과 가족을 구해야 하는 운명에 처한다.'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	44	, '미니언즈2'	,	7.66	,	2022	,	87	, '전체 관람가'	,	61 	, 'TRUE'	, 'FALSE'	, '세계 최고의 슈퍼 악당을 꿈꾸는 미니보스 ‘그루’와 그를 따라다니는 미니언들. 어느 날 그루는 최고의 악당 조직 ‘빌런6’의 마법 스톤을 훔치는데 성공하지만 뉴페이스 미니언 ‘오토’의 실수로 스톤을 잃어버리고 빌런6에게 납치까지 당한다. 미니보스를 구하기 위해 잃어버린 스톤을 되찾아야 하는 ‘오토’, 그리고 쿵푸를 마스터해야 하는 ‘케빈’, ‘스튜어트’, ‘밥’! 올여름 극장가를 점령할 MCU(미니언즈 시네마틱 유니버스)가 돌아온다!'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	45	, '콰이어트 플레이스 2'	,	8.12	,	2021	,	97	, '15세 관람가'	,	193 	, 'FALSE'	, 'FALSE'	, '실체를 알 수 없는 괴생명체의 공격으로 일상의 모든 것이 사라진 세상, 아이들 대신 죽음을 선택한 아빠의 희생 이후 살아남은 가족들은 위험에 노출된다. 갓 태어난 막내를 포함한 아이들과 함께 소리 없는 사투를 이어가던 엄마 ‘에블린’은 살아남기 위해 새로운 은신처를 찾아 집 밖을 나서지만, 텅 빈 고요함으로 가득한 바깥은 더 큰 위험이 도사리고 있는데...'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	46	, '미드소마(감독판)'	,	6.09	,	2019	,	170	, '청소년 관람불가'	,	414 	, 'FALSE'	, 'FALSE'	, '90년에 한 번, 9일 동안 열리는 미드소마에 초대된 6명의 친구들 선택된 자만이 즐길 수 있는 충격과 공포의 축제가 다시 시작된다'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	47	, '크게 될 놈'	,	8.78	,	2019	,	108	, '15세 관람가'	,	66 	, 'FALSE'	, 'FALSE'	, '전라도 어느 섬마을, 기강과 기순 남매의 엄니 ‘순옥’(김해숙) 깡다구 하나는 알아주는 순옥의 사고뭉치 아들 ‘기강’(손호준) “엄니, 두고 보소. 내가 어떤 놈이 돼서 돌아오는지” 집을 나간 기강은 무모한 성공만을 꿈꾸다, 결국 범죄자로 전락해 사형을 선고 받게 된다. 정부는 엄정한 법집행을 이유로 사형집행을 발표하고, 언제 죽을지 모른다는 불안과 공포로 자포자기한 기강에게 평생 까막눈으로 살아온 엄니의 생애 첫 편지가 도착하는데…… “세상이 아무리 욕해도… 나는 너를 사랑한다. 난 니 엄니께”'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	48	, '마녀'	,	8.22	,	2018	,	125	, '15세 관람가'	,	711 	, 'FALSE'	, 'FALSE'	, '10년 전 의문의 사고가 일어난 시설에서 홀로 탈출한 후 모든 기억을 잃은 ‘자윤’. 나이도, 이름도 모르는 자신을 거두고 키워준 노부부의 보살핌으로 씩씩하고 밝은 여고생으로 자라났다. 어려운 집안사정을 돕기 위해 상금이 걸린 오디션 프로그램에 출연한 자윤, 방송이 나간 직후부터 의문의 인물들이 그녀 앞에 나타난다. 자윤의 주변을 맴돌며 날카롭게 지켜보는 남자 ‘귀공자’, 그리고 과거 사고가 일어난 시점부터 사라진 아이를 찾던 ‘닥터 백’과 ‘미스터 최’까지 자신은 전혀 기억하지 못하는 그들의 등장으로, 자윤은 혼란에 휩싸이게 되는데...! 그들이 나타난 후 모든 것이 바뀌었다'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	49	, '데드풀'	,	8.21	,	2016	,	108	, '청소년 관람불가'	,	193 	, 'FALSE'	, 'FALSE'	, '전직 특수부대 출신의 용병 ‘웨이드 윌슨(라이언 레놀즈)’은 암 치료를 위한 비밀 실험에 참여 후, 강력한 힐링팩터를 지닌 슈퍼히어로 ‘데드풀’로 거듭난다. 탁월한 무술실력과 거침없는 유머감각을 지녔지만 흉측하게 일그러진 얼굴을 갖게 된 데드풀은 자신의 삶을 완전히 망가뜨린 놈들을 찾아 뒤쫓기 시작하는데…'	);
insert	into	Movie	(	movie_id	,	title	,	rating	,	release_year	,	running_time	,	age_rating	,	heart	,	subtitles_available	,	dubbed_available	,	description	)	values	(	50	, '비포 미드나잇'	,	8.21	,	2013	,	108	, '청소년 관람불가'	,	526 	, 'FALSE'	, 'FALSE'	, '우연히 시작된 사랑 18년 전, 비엔나행 기차에서 우연히 만나고 9년 전, 파리에서 재회한 ‘제시’와 ‘셀린느’. 그리고 지금, 두 사람의 애틋한 사랑은 다시 시작된다. 우리의 사랑이 다시 시작된다! 그리스의 아름다운 해변 마을 카르다밀리, 매일 지겹게 다투고 화해하고, 지난 날의 두근거림은 사라졌지만 그들은 둘만의 사랑을 계속 이어간다. 우리가 사랑한 ‘비포 시리즈’의 마지막 이야기'	);


-- 순위
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (1, 1, 1, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (2, 2, 2, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (3, 3, 3, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (4, 4, 4, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (5, 5, 5, 4);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (6, 6, 6, 1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (7, 7, 7, -2);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (8, 8, 8, -2);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (9, 9, 9, -1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (10, 10, 10, 5);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (11, 11, 11, -1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (12, 12, 12, -1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (13, 13, 13, -1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (14, 14, 14, -1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (15, 15, 15, -1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (16, 16, 16, 2);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (17, 17, 17, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (18, 18, 18, -2);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (19, 19, 19, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (20, 20, 20, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (21, 21, 21, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (22, 22, 22, 4);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (23, 23, 23, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (24, 24, 24, -2);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (25, 25, 25, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (26, 26, 26, -2);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (27, 27, 27, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (28, 28, 28, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (29, 29, 29, 1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (30, 30, 30, -1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (31, 31, 31, 2);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (32, 32, 32, -1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (33, 33, 33, 2);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (34, 34, 34, -2);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (35, 35, 35, 5);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (36, 36, 36, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (37, 37, 37, 2);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (38, 38, 38, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (39, 39, 39, -5);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (40, 40, 40, 4);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (41, 41, 41, 1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (42, 42, 42, -5);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (43, 43, 43, 2);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (44, 44, 44, -3);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (45, 45, 45, -2);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (46, 46, 46, 2);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (47, 47, 47, -1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (48, 48, 48, 6);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (49, 49, 49, -2);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (50, 50, 50, 13);


-- 구매/대여
-- 대여, 7일
insert into Purchase_Rental (purchaserental_id, purchaserental_choose, usage_period) values (1, '대여', '7일');

-- 대여, 2일
insert into Purchase_Rental (purchaserental_id, purchaserental_choose, usage_period) values (2, '대여', '2일');

-- 구매, 제한 없음
insert into Purchase_Rental (purchaserental_id, purchaserental_choose, usage_period) values (3, '구매', '제한 없음');

-- 구매, 5년
insert into Purchase_Rental (purchaserental_id, purchaserental_choose, usage_period) values (4, '구매', '5년');


-- 이용방법
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (1, 1, 1, 11000);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (2, 2, 1, 11000);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (3, 3, 1, 1540);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (4, 4, 1, 1000);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (5, 5, 1, 1540);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (6, 6, 3, 14900);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (7, 7, 4, 7150);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (8, 8, 3, 1200);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (9, 9, 3, 16390);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (10, 10, 2, 10000);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (11, 11, 1, 2500);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (12, 12, 3, 1200);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (13, 13, 2, 11000);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (14, 14, 1, 7700);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (15, 15, 1, 1540);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (16, 16, 1, 1540);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (17, 17, 1, 1540);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (18, 18, 4, 7150);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (19, 19, 1, 2750);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (20, 20, 1, 2500);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (21, 21, 3, 1400);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (22, 22, 3, 1200);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (23, 23, 2, 5500);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (24, 24, 1, 2750);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (25, 25, 3, 10900);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (26, 26, 2, 1200);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (27, 27, 1, 2750);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (28, 28, 1, 1540);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (29, 29, 1, 5500);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (30, 30, 1, 2750);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (31, 31, 1, 5000);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (32, 32, 1, 1540);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (33, 33, 1, 1540);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (34, 34, 1, 1000);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (35, 35, 1, 1540);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (36, 36, 2, 1200);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (37, 37, 3, 1000);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (38, 38, 2, 1200);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (39, 39, 2, 1200);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (40, 40, 4, 14900);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (41, 41, 2, 5500);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (42, 42, 3, 6500);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (43, 43, 1, 1650);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (44, 44, 2, 1200);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (45, 45, 2, 1500);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (46, 46, 3, 1400);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (47, 47, 3, 1000);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (48, 48, 2, 1300);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (49, 49, 4, 5500);
INSERT INTO Usage_Method (usagemethod_id, movie_id, purchaserental_id, usage_price) VALUES (50, 50, 3, 1200);


-- 안내(이용,환불,DRM)
insert	into	Guide	(	guide_id	,	guide_title	,	guide_content )	values	(	1	,	'DRM'	,	'(저작권 보호장치 적용)'  	)	;
insert	into	Guide	(	guide_id	,	guide_title	,	guide_content )	values	(	2	,	'이용'	,	'해외에서 스트리밍/다운로드 불가, PC 및 TV에서 다운로드 불가, 외부화면 연결 불가'	)	;
insert	into	Guide	(	guide_id	,	guide_title	,	guide_content )	values	(	3	,	'이용안내'	,	'결제 후 7일 이내 이용을 시작하지 않을경우, 자동으로 이용기간이 시작됩니다. 소장 상품은 구매한 계정에서 이용 계약이 유지되는 동안 이용 가능합니다. 일부 작품은 다운로드 기간 제한이 있으므로 이용기간을 확인해 주세요.'	)	;
insert	into	Guide	(	guide_id	,	guide_title	,	guide_content )	values	(	4	,	'환불안내'	,	'사용하지 않은 구매,대여 상품은 7일 이내 MY > 구입내역에서 구매취소를 눌러 직접 환불하실 수 있습니다.')	;
insert	into	Guide	(	guide_id	,	guide_title	,	guide_content )	values	(	5	,	'이용기기'	,	'PC, 모바일, TV 총 5대')	;


-- 화면정보
insert	into	Display	(	display_id	,	video_quality	,	subtitles_display	,	foreign_subtitles	)	values	(	1	,	'최대1080(FHD)'	,	'노출설정가능'	,	null	)	;
insert	into	Display	(	display_id	,	video_quality	,	subtitles_display	,	foreign_subtitles	)	values	(	2	,	'최대1080(FHD)'	,	'노출설정가능'	,	'영자막지원'	)	;
insert	into	Display	(	display_id	,	video_quality	,	subtitles_display	,	foreign_subtitles	)	values	(	3	,	'최대1080(FHD)'	,	'노출설정불가능'	,	null	)	;
insert	into	Display	(	display_id	,	video_quality	,	subtitles_display	,	foreign_subtitles	)	values	(	4	,	'최대480(고화질)'	,	'노출설정불가능'	,	null	)	;
insert	into	Display	(	display_id	,	video_quality	,	subtitles_display	,	foreign_subtitles	)	values	(	5	,	'최대720(HD)'	,	'노출설정불가능'	,	null	)	;


-- 상품정보
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	1	,	3840	,	1	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	2	,	4177.92	,	2	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	3	,	4403.2	,	3	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	4	,	700	,	4	,	4	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	5	,	4147.2	,	5	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	6	,	3840	,	6	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	7	,	3686.4	,	7	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	8	,	4167.68	,	8	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	9	,	4177.92	,	9	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	10	,	4382.72	,	10	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	11	,	4812.8	,	11	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	12	,	4751.36	,	12	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	13	,	3635.2	,	13	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	14	,	3921.92	,	14	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	15	,	5345.28	,	15	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	16	,	4587.52	,	16	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	17	,	4833.28	,	17	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	18	,	3942.4	,	18	,	1	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	19	,	4659.2	,	19	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	20	,	5027.84	,	20	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	21	,	4392.96	,	21	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	22	,	3747.84	,	22	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	23	,	6225.92	,	23	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	24	,	4648.96	,	24	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	25	,	5478.4	,	25	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	26	,	3696.64	,	26	,	1	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	27	,	4280.32	,	27	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	28	,	5140.48	,	28	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	29	,	3133.44	,	29	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	30	,	4741.12	,	30	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	31	,	5181.44	,	31	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	32	,	4597.76	,	32	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	33	,	4157.44	,	33	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	34	,	4505.6	,	34	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	35	,	5140.48	,	35	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	36	,	3491.84	,	36	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	37	,	2508.8	,	37	,	5	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	38	,	3819.52	,	38	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	39	,	3686.4	,	39	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	40	,	4382.72	,	40	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	41	,	5396.48	,	41	,	1	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	42	,	4802.56	,	42	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	43	,	5416.96	,	43	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	44	,	3399.68	,	44	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	45	,	3758.08	,	45	,	2	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	46	,	6656	,	46	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	47	,	4218.88	,	47	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	48	,	4894.72	,	48	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	49	,	4218.88	,	49	,	3	)	;
insert	into	product_info	(	productInfo_id	,	capacity	,	movie_id	,	display_id	)	values	(	50	,	4229.12	,	50	,	3	)	;


-- 상품정보안내
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	1	,	1	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	2	,	2	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	3	,	3	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	4	,	4	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	5	,	5	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	6	,	6	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	7	,	7	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	8	,	8	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	9	,	9	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	10	,	10	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	11	,	11	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	12	,	12	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	13	,	13	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	14	,	14	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	15	,	15	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	16	,	16	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	17	,	17	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	18	,	18	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	19	,	19	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	20	,	20	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	21	,	21	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	22	,	22	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	23	,	23	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	24	,	24	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	25	,	25	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	26	,	26	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	27	,	27	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	28	,	28	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	29	,	29	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	30	,	30	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	31	,	31	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	32	,	32	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	33	,	33	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	34	,	34	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	35	,	35	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	36	,	36	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	37	,	37	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	38	,	38	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	39	,	39	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	40	,	40	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	41	,	41	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	42	,	42	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	43	,	43	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	44	,	44	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	45	,	45	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	46	,	46	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	47	,	47	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	48	,	48	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	49	,	49	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	50	,	50	,	1	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	51	,	1	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	52	,	2	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	53	,	3	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	54	,	4	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	55	,	5	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	56	,	6	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	57	,	7	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	58	,	8	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	59	,	9	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	60	,	10	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	61	,	11	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	62	,	12	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	63	,	13	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	64	,	14	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	65	,	15	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	66	,	16	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	67	,	17	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	68	,	18	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	69	,	19	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	70	,	20	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	71	,	21	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	72	,	22	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	73	,	23	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	74	,	24	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	75	,	25	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	76	,	26	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	77	,	27	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	78	,	28	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	79	,	29	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	80	,	30	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	81	,	31	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	82	,	32	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	83	,	33	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	84	,	34	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	85	,	35	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	86	,	36	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	87	,	37	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	88	,	38	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	89	,	39	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	90	,	40	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	91	,	41	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	92	,	42	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	93	,	43	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	94	,	44	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	95	,	45	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	96	,	46	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	97	,	47	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	98	,	48	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	99	,	49	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	100	,	50	,	2	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	101	,	1	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	102	,	2	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	103	,	3	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	104	,	4	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	105	,	5	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	106	,	6	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	107	,	7	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	108	,	8	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	109	,	9	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	110	,	10	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	111	,	11	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	112	,	12	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	113	,	13	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	114	,	14	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	115	,	15	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	116	,	16	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	117	,	17	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	118	,	18	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	119	,	19	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	120	,	20	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	121	,	21	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	122	,	22	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	123	,	23	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	124	,	24	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	125	,	25	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	126	,	26	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	127	,	27	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	128	,	28	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	129	,	29	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	130	,	30	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	131	,	31	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	132	,	32	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	133	,	33	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	134	,	34	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	135	,	35	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	136	,	36	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	137	,	37	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	138	,	38	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	139	,	39	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	140	,	40	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	141	,	41	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	142	,	42	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	143	,	43	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	144	,	44	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	145	,	45	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	146	,	46	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	147	,	47	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	148	,	48	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	149	,	49	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	150	,	50	,	3	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	151	,	1	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	152	,	2	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	153	,	3	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	154	,	4	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	155	,	5	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	156	,	6	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	157	,	7	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	158	,	8	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	159	,	9	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	160	,	10	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	161	,	11	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	162	,	12	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	163	,	13	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	164	,	14	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	165	,	15	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	166	,	16	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	167	,	17	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	168	,	18	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	169	,	19	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	170	,	20	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	171	,	21	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	172	,	22	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	173	,	23	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	174	,	24	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	175	,	25	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	176	,	26	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	177	,	27	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	178	,	28	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	179	,	29	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	180	,	30	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	181	,	31	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	182	,	32	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	183	,	33	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	184	,	34	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	185	,	35	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	186	,	36	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	187	,	37	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	188	,	38	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	189	,	39	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	190	,	40	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	191	,	41	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	192	,	42	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	193	,	43	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	194	,	44	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	195	,	45	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	196	,	46	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	197	,	47	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	198	,	48	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	199	,	49	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	200	,	50	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	201	,	1	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	202	,	2	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	203	,	3	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	204	,	4	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	205	,	5	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	206	,	6	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	207	,	7	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	208	,	8	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	209	,	9	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	210	,	10	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	211	,	11	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	212	,	12	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	213	,	13	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	214	,	14	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	215	,	15	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	216	,	16	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	217	,	17	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	218	,	18	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	219	,	19	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	220	,	20	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	221	,	21	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	222	,	22	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	223	,	23	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	224	,	24	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	225	,	25	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	226	,	26	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	227	,	27	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	228	,	28	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	229	,	29	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	230	,	30	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	231	,	31	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	232	,	32	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	233	,	33	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	234	,	34	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	235	,	35	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	236	,	36	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	237	,	37	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	238	,	38	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	239	,	39	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	240	,	40	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	241	,	41	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	242	,	42	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	243	,	43	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	244	,	44	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	245	,	45	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	246	,	46	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	247	,	47	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	248	,	48	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	249	,	49	,	4	);
insert	into	Product_Guide	(	productguide_id	,	productInfo_id	,	guide_id	)	values	(	250	,	50	,	4	);


-- 네티즌
insert into Netizen (netizen_id, id) values (1, 'bla_****');
insert into Netizen (netizen_id, id) values (2, 'cjst****');
insert into Netizen (netizen_id, id) values (3, 'daeh****');
insert into Netizen (netizen_id, id) values (4, 'engh****');
insert into Netizen (netizen_id, id) values (5, 'gksd****');
insert into Netizen (netizen_id, id) values (6, 'hhj0****');
insert into Netizen (netizen_id, id) values (7, 'houn****');
insert into Netizen (netizen_id, id) values (8, 'jeon****');
insert into Netizen (netizen_id, id) values (9, 'jjm9****');
insert into Netizen (netizen_id, id) values (10, 'ledb****');
insert into Netizen (netizen_id, id) values (11, 'linh****');
insert into Netizen (netizen_id, id) values (12, 'linn****');
insert into Netizen (netizen_id, id) values (13, 'pao2****');
insert into Netizen (netizen_id, id) values (14, 'pcxk****');
insert into Netizen (netizen_id, id) values (15, 'rkaw****');
insert into Netizen (netizen_id, id) values (16, 'tdid****');
insert into Netizen (netizen_id, id) values (17, '3658****');
insert into Netizen (netizen_id, id) values (18, 'cloe****');
insert into Netizen (netizen_id, id) values (19, 'dlqh****');
insert into Netizen (netizen_id, id) values (20, 'jyn4****');
insert into Netizen (netizen_id, id) values (21, 'sell****');
insert into Netizen (netizen_id, id) values (22, 'soul****');
insert into Netizen (netizen_id, id) values (23, 'ttls****');
insert into Netizen (netizen_id, id) values (24, 'welo****');
insert into Netizen (netizen_id, id) values (25, 'youm****');
insert into Netizen (netizen_id, id) values (26, 'idpw****');
insert into Netizen (netizen_id, id) values (27, 'k999****');
insert into Netizen (netizen_id, id) values (28, 'kjy9****');
insert into Netizen (netizen_id, id) values (29, 'love****');
insert into Netizen (netizen_id, id) values (30, 'yyab****');
insert into Netizen (netizen_id, id) values (31, 'junx****');
insert into Netizen (netizen_id, id) values (32, 'luke****');
insert into Netizen (netizen_id, id) values (33, 'thdh****');
insert into Netizen (netizen_id, id) values (34, 'gnsl****');
insert into Netizen (netizen_id, id) values (35, 'aseu****');
insert into Netizen (netizen_id, id) values (36, 'kang****');
insert into Netizen (netizen_id, id) values (37, 'bang****');
insert into Netizen (netizen_id, id) values (38, 'khy7****');
insert into Netizen (netizen_id, id) values (39, 'yys2****');
insert into Netizen (netizen_id, id) values (40, 'dapn****');
insert into Netizen (netizen_id, id) values (41, 'sara****');
insert into Netizen (netizen_id, id) values (42, 'lulu****');
insert into Netizen (netizen_id, id) values (43, 'alfm****');
insert into Netizen (netizen_id, id) values (44, 'hyun****');
insert into Netizen (netizen_id, id) values (45, 'inth****');
insert into Netizen (netizen_id, id) values (46, 'soll****');
insert into Netizen (netizen_id, id) values (47, 'dkzk****');
insert into Netizen (netizen_id, id) values (48, 'burn****');
insert into Netizen (netizen_id, id) values (49, 'ha06****');
insert into Netizen (netizen_id, id) values (50, 'zicy****');
insert into Netizen (netizen_id, id) values (51, 'life****');
insert into Netizen (netizen_id, id) values (52, 'cejo****');
insert into Netizen (netizen_id, id) values (53, 'bo_b****');
insert into Netizen (netizen_id, id) values (54, 'jwjw****');
insert into Netizen (netizen_id, id) values (55, 'fred****');
insert into Netizen (netizen_id, id) values (56, '832h****');
insert into Netizen (netizen_id, id) values (57, 'wngh****');
insert into Netizen (netizen_id, id) values (58, 'wnah****');
insert into Netizen (netizen_id, id) values (59, 'land****');
insert into Netizen (netizen_id, id) values (60, 'ieca****');
insert into Netizen (netizen_id, id) values (61, 'lang****');
insert into Netizen (netizen_id, id) values (62, 'bill****');
insert into Netizen (netizen_id, id) values (63, 'tjdr****');
insert into Netizen (netizen_id, id) values (64, '1771****');
insert into Netizen (netizen_id, id) values (65, '97si****');
insert into Netizen (netizen_id, id) values (66, 'edtd****');
insert into Netizen (netizen_id, id) values (67, 'soo1****');
insert into Netizen (netizen_id, id) values (68, 'anna****');
insert into Netizen (netizen_id, id) values (69, 'wjdt****');
insert into Netizen (netizen_id, id) values (70, 'jooh****');
insert into Netizen (netizen_id, id) values (71, 'als4****');
insert into Netizen (netizen_id, id) values (72, 'play****');
insert into Netizen (netizen_id, id) values (73, 'rlat****');
insert into Netizen (netizen_id, id) values (74, 'numb****');
insert into Netizen (netizen_id, id) values (75, 'reac****');
insert into Netizen (netizen_id, id) values (76, 'busa****');
insert into Netizen (netizen_id, id) values (77, 'tldh****');
insert into Netizen (netizen_id, id) values (78, 'dktn****');
insert into Netizen (netizen_id, id) values (79, '11o1****');
insert into Netizen (netizen_id, id) values (80, 'duzz****');
insert into Netizen (netizen_id, id) values (81, 'ican****');
insert into Netizen (netizen_id, id) values (82, 'monk****');
insert into Netizen (netizen_id, id) values (83, 'tjd3****');
insert into Netizen (netizen_id, id) values (84, 'tlag****');
insert into Netizen (netizen_id, id) values (85, 'm20m****');
insert into Netizen (netizen_id, id) values (86, 'niar****');
insert into Netizen (netizen_id, id) values (87, 'rain****');
insert into Netizen (netizen_id, id) values (88, 'boyo****');
insert into Netizen (netizen_id, id) values (89, 'fkdl****');
insert into Netizen (netizen_id, id) values (90, 'besl****');
insert into Netizen (netizen_id, id) values (91, 'sma1****');
insert into Netizen (netizen_id, id) values (92, 'wkws****');
insert into Netizen (netizen_id, id) values (93, 'akal****');
insert into Netizen (netizen_id, id) values (94, 'a708****');
insert into Netizen (netizen_id, id) values (95, 'isem****');
insert into Netizen (netizen_id, id) values (96, 'ohs8****');
insert into Netizen (netizen_id, id) values (97, 'pkrl****');
insert into Netizen (netizen_id, id) values (98, 'zxcv****');
insert into Netizen (netizen_id, id) values (99, 'kwan****');
insert into Netizen (netizen_id, id) values (100, 'tkfk****');
insert into Netizen (netizen_id, id) values (101, 'rhj7****');
insert into Netizen (netizen_id, id) values (102, 'dlrk****');
insert into Netizen (netizen_id, id) values (103, 'laog****');
insert into Netizen (netizen_id, id) values (104, 'rhym****');
insert into Netizen (netizen_id, id) values (105, 'toba****');
insert into Netizen (netizen_id, id) values (106, 'alsk****');
insert into Netizen (netizen_id, id) values (107, 'my00****');
insert into Netizen (netizen_id, id) values (108, 'lewi****');
insert into Netizen (netizen_id, id) values (109, 'whit****');
insert into Netizen (netizen_id, id) values (110, 'yusu****');
insert into Netizen (netizen_id, id) values (111, 'yun2****');
insert into Netizen (netizen_id, id) values (112, 'bida****');
insert into Netizen (netizen_id, id) values (113, 'mind****');
insert into Netizen (netizen_id, id) values (114, 'clic****');
insert into Netizen (netizen_id, id) values (115, 'ifly****');
insert into Netizen (netizen_id, id) values (116, 'simp****');
insert into Netizen (netizen_id, id) values (117, 'ranh****');
insert into Netizen (netizen_id, id) values (118, 'pink****');
insert into Netizen (netizen_id, id) values (119, 'ligh****');
insert into Netizen (netizen_id, id) values (120, 'kkkj****');
insert into Netizen (netizen_id, id) values (121, 'tkrh****');
insert into Netizen (netizen_id, id) values (122, 'sato****');
insert into Netizen (netizen_id, id) values (123, 'suju****');
insert into Netizen (netizen_id, id) values (124, 'dnjs****');
insert into Netizen (netizen_id, id) values (125, 'dbsq****');
insert into Netizen (netizen_id, id) values (126, '0787****');
insert into Netizen (netizen_id, id) values (127, 'nch3****');
insert into Netizen (netizen_id, id) values (128, 'park****');
insert into Netizen (netizen_id, id) values (129, 'tjdg****');
insert into Netizen (netizen_id, id) values (130, '11ge****');
insert into Netizen (netizen_id, id) values (131, 'pb******');
insert into Netizen (netizen_id, id) values (132, 'snug****');
insert into Netizen (netizen_id, id) values (133, 'yeli****');
insert into Netizen (netizen_id, id) values (134, 'yail****');
insert into Netizen (netizen_id, id) values (135, 'jhle****');
insert into Netizen (netizen_id, id) values (136, 'kaik****');
insert into Netizen (netizen_id, id) values (137, 'doye****');
insert into Netizen (netizen_id, id) values (138, '50qn****');
insert into Netizen (netizen_id, id) values (139, '1004****');
insert into Netizen (netizen_id, id) values (140, 'glae****');
insert into Netizen (netizen_id, id) values (141, 'news****');
insert into Netizen (netizen_id, id) values (142, 'obm4****');
insert into Netizen (netizen_id, id) values (143, 'luck****');
insert into Netizen (netizen_id, id) values (144, 'nvns****');
insert into Netizen (netizen_id, id) values (145, 'ehdt****');
insert into Netizen (netizen_id, id) values (146, 'alfn****');
insert into Netizen (netizen_id, id) values (147, 'jksb****');
insert into Netizen (netizen_id, id) values (148, 'chld****');
insert into Netizen (netizen_id, id) values (149, 'ledi****');
insert into Netizen (netizen_id, id) values (150, 'qusr****');
insert into Netizen (netizen_id, id) values (151, 'dudg****');
insert into Netizen (netizen_id, id) values (152, 'alsr****');
insert into Netizen (netizen_id, id) values (153, 'keij****');
insert into Netizen (netizen_id, id) values (154, 'rhsc****');
insert into Netizen (netizen_id, id) values (155, 'yewo****');
insert into Netizen (netizen_id, id) values (156, 'aiba****');
insert into Netizen (netizen_id, id) values (157, 'mcit****');
insert into Netizen (netizen_id, id) values (158, 'fire****');
insert into Netizen (netizen_id, id) values (159, 'vcd7****');
insert into Netizen (netizen_id, id) values (160, 'khi0****');
insert into Netizen (netizen_id, id) values (161, 'pilt****');
insert into Netizen (netizen_id, id) values (162, 'cstr****');
insert into Netizen (netizen_id, id) values (163, 'ds01****');
insert into Netizen (netizen_id, id) values (164, 'shae****');
insert into Netizen (netizen_id, id) values (165, 'topt****');
insert into Netizen (netizen_id, id) values (166, 'rahr****');
insert into Netizen (netizen_id, id) values (167, 'jhnk****');
insert into Netizen (netizen_id, id) values (168, 'khh9****');
insert into Netizen (netizen_id, id) values (169, 'qheo****');
insert into Netizen (netizen_id, id) values (170, 'h101****');
insert into Netizen (netizen_id, id) values (171, 'ps_w****');
insert into Netizen (netizen_id, id) values (172, 'pir9****');
insert into Netizen (netizen_id, id) values (173, 'hurv****');
insert into Netizen (netizen_id, id) values (174, 'pizz****');
insert into Netizen (netizen_id, id) values (175, 'dlwl****');
insert into Netizen (netizen_id, id) values (176, 'haey****');
insert into Netizen (netizen_id, id) values (177, 'juhe****');
insert into Netizen (netizen_id, id) values (178, 'ghyu****');
insert into Netizen (netizen_id, id) values (179, 'chlg****');
insert into Netizen (netizen_id, id) values (180, 'lees****');
insert into Netizen (netizen_id, id) values (181, 'tim2****');
insert into Netizen (netizen_id, id) values (182, 'lovc****');
insert into Netizen (netizen_id, id) values (183, 'cvcv****');
insert into Netizen (netizen_id, id) values (184, 'torr****');
insert into Netizen (netizen_id, id) values (185, 'cors****');
insert into Netizen (netizen_id, id) values (186, 'skaw****');
insert into Netizen (netizen_id, id) values (187, 'yang****');
insert into Netizen (netizen_id, id) values (188, 'pedu****');
insert into Netizen (netizen_id, id) values (189, 'kime****');
insert into Netizen (netizen_id, id) values (190, 'andr****');
insert into Netizen (netizen_id, id) values (191, 'mins****');
insert into Netizen (netizen_id, id) values (192, 'sund****');
insert into Netizen (netizen_id, id) values (193, 'ahio****');
insert into Netizen (netizen_id, id) values (194, 'vlfr****');
insert into Netizen (netizen_id, id) values (195, 'tjdw****');
insert into Netizen (netizen_id, id) values (196, 'a574****');
insert into Netizen (netizen_id, id) values (197, 'usta****');
insert into Netizen (netizen_id, id) values (198, 'cjad****');
insert into Netizen (netizen_id, id) values (199, 'nabi****');
insert into Netizen (netizen_id, id) values (200, 'ener****');
insert into Netizen (netizen_id, id) values (201, 'twin****');
insert into Netizen (netizen_id, id) values (202, 'matr****');
insert into Netizen (netizen_id, id) values (203, 'db20****');
insert into Netizen (netizen_id, id) values (204, 'saka****');
insert into Netizen (netizen_id, id) values (205, 'wwmo****');
insert into Netizen (netizen_id, id) values (206, 'blac****');
insert into Netizen (netizen_id, id) values (207, 'gogo****');
insert into Netizen (netizen_id, id) values (208, 'shan****');
insert into Netizen (netizen_id, id) values (209, 'j0bo****');
insert into Netizen (netizen_id, id) values (210, 'uniq****');
insert into Netizen (netizen_id, id) values (211, '2000****');
insert into Netizen (netizen_id, id) values (212, 'tenm****');
insert into Netizen (netizen_id, id) values (213, 'thin****');
insert into Netizen (netizen_id, id) values (214, 'yunb****');
insert into Netizen (netizen_id, id) values (215, 'outw****');
insert into Netizen (netizen_id, id) values (216, 'kem2****');
insert into Netizen (netizen_id, id) values (217, 'kuro****');
insert into Netizen (netizen_id, id) values (218, 'gong****');
insert into Netizen (netizen_id, id) values (219, 'just****');
insert into Netizen (netizen_id, id) values (220, 'dwam****');
insert into Netizen (netizen_id, id) values (221, 'i_pe****');
insert into Netizen (netizen_id, id) values (222, '0078****');
insert into Netizen (netizen_id, id) values (223, 'cndu****');
insert into Netizen (netizen_id, id) values (224, 'ente****');
insert into Netizen (netizen_id, id) values (225, 'ju2l****');
insert into Netizen (netizen_id, id) values (226, 'xhdt****');
insert into Netizen (netizen_id, id) values (227, 'alto****');
insert into Netizen (netizen_id, id) values (228, 'poli****');
insert into Netizen (netizen_id, id) values (229, 'qusj****');
insert into Netizen (netizen_id, id) values (230, 'viol****');
insert into Netizen (netizen_id, id) values (231, 'luna****');
insert into Netizen (netizen_id, id) values (232, 'prim****');
insert into Netizen (netizen_id, id) values (233, 'sdtf****');
insert into Netizen (netizen_id, id) values (234, 'wood****');
insert into Netizen (netizen_id, id) values (235, 'kiss****');
insert into Netizen (netizen_id, id) values (236, 'flow****');
insert into Netizen (netizen_id, id) values (237, 'rlae****');
insert into Netizen (netizen_id, id) values (238, 'rkwj****');
insert into Netizen (netizen_id, id) values (239, 'yhan****');
insert into Netizen (netizen_id, id) values (240, 'jehy****');
insert into Netizen (netizen_id, id) values (241, 'gyul****');
insert into Netizen (netizen_id, id) values (242, 'eyey****');
insert into Netizen (netizen_id, id) values (243, 'pass****');
insert into Netizen (netizen_id, id) values (244, 'jel9****');
insert into Netizen (netizen_id, id) values (245, 'pns7****');
insert into Netizen (netizen_id, id) values (246, 'tomo****');
insert into Netizen (netizen_id, id) values (247, 'theb****');
insert into Netizen (netizen_id, id) values (248, 'yeon****');
insert into Netizen (netizen_id, id) values (249, 'scy3****');
insert into Netizen (netizen_id, id) values (250, 'mmer****');
insert into Netizen (netizen_id, id) values (251, 'siom****');
insert into Netizen (netizen_id, id) values (252, 'nine****');
insert into Netizen (netizen_id, id) values (253, 'z011****');
insert into Netizen (netizen_id, id) values (254, 'hr70****');
insert into Netizen (netizen_id, id) values (255, 'lv******');
insert into Netizen (netizen_id, id) values (256, 'mino****');
insert into Netizen (netizen_id, id) values (257, 'suer****');
insert into Netizen (netizen_id, id) values (258, 'apri****');
insert into Netizen (netizen_id, id) values (259, 'upos****');
insert into Netizen (netizen_id, id) values (260, 'shs7****');
insert into Netizen (netizen_id, id) values (261, 'yae8****');
insert into Netizen (netizen_id, id) values (262, 'quee****');
insert into Netizen (netizen_id, id) values (263, 'abdw****');
insert into Netizen (netizen_id, id) values (264, 'lky6****');
insert into Netizen (netizen_id, id) values (265, 'rkar****');
insert into Netizen (netizen_id, id) values (266, 'gumb****');
insert into Netizen (netizen_id, id) values (267, '5112****');
insert into Netizen (netizen_id, id) values (268, 'getr****');
insert into Netizen (netizen_id, id) values (269, 'ssib****');
insert into Netizen (netizen_id, id) values (270, 'myuu****');
insert into Netizen (netizen_id, id) values (271, 'choh****');
insert into Netizen (netizen_id, id) values (272, 'para****');
insert into Netizen (netizen_id, id) values (273, 'gywl****');
insert into Netizen (netizen_id, id) values (274, 'kmak****');
insert into Netizen (netizen_id, id) values (275, 'bsh7****');
insert into Netizen (netizen_id, id) values (276, 'swan****');
insert into Netizen (netizen_id, id) values (277, 'gree****');
insert into Netizen (netizen_id, id) values (278, 'quda****');
insert into Netizen (netizen_id, id) values (279, 'tjrk****');
insert into Netizen (netizen_id, id) values (280, 'eung****');
insert into Netizen (netizen_id, id) values (281, 'r_ra****');
insert into Netizen (netizen_id, id) values (282, 'youi****');
insert into Netizen (netizen_id, id) values (283, 'cys1****');
insert into Netizen (netizen_id, id) values (284, 'ko01****');
insert into Netizen (netizen_id, id) values (285, 'chae****');
insert into Netizen (netizen_id, id) values (286, 'saha****');
insert into Netizen (netizen_id, id) values (287, 'uej3****');
insert into Netizen (netizen_id, id) values (288, 'orol****');
insert into Netizen (netizen_id, id) values (289, 'godq****');
insert into Netizen (netizen_id, id) values (290, 'qhr1****');
insert into Netizen (netizen_id, id) values (291, 'hayu****');
insert into Netizen (netizen_id, id) values (292, 'dipo****');
insert into Netizen (netizen_id, id) values (293, 'tlsw****');
insert into Netizen (netizen_id, id) values (294, 'seee****');
insert into Netizen (netizen_id, id) values (295, 'rlag****');
insert into Netizen (netizen_id, id) values (296, 'qhtj****');
insert into Netizen (netizen_id, id) values (297, 'dlth****');
insert into Netizen (netizen_id, id) values (298, 'tryt****');
insert into Netizen (netizen_id, id) values (299, 'minn****');
insert into Netizen (netizen_id, id) values (300, 'cy7j****');
insert into Netizen (netizen_id, id) values (301, 'osy7****');
insert into Netizen (netizen_id, id) values (302, 'kh85****');
insert into Netizen (netizen_id, id) values (303, 'swam****');
insert into Netizen (netizen_id, id) values (304, 'eilh****');
insert into Netizen (netizen_id, id) values (305, 'muge****');
insert into Netizen (netizen_id, id) values (306, 'geni****');
insert into Netizen (netizen_id, id) values (307, 'fgty****');
insert into Netizen (netizen_id, id) values (308, 'aza2****');
insert into Netizen (netizen_id, id) values (309, 'fkwl****');
insert into Netizen (netizen_id, id) values (310, 'c12a****');
insert into Netizen (netizen_id, id) values (311, 'judy****');
insert into Netizen (netizen_id, id) values (312, 'grea****');
insert into Netizen (netizen_id, id) values (313, 'dltl****');
insert into Netizen (netizen_id, id) values (314, 'kbg0****');
insert into Netizen (netizen_id, id) values (315, 'jhgp****');
insert into Netizen (netizen_id, id) values (316, 'skk0****');
insert into Netizen (netizen_id, id) values (317, 'hape****');
insert into Netizen (netizen_id, id) values (318, 'tmvk****');
insert into Netizen (netizen_id, id) values (319, 'naqt****');
insert into Netizen (netizen_id, id) values (320, 'rhim****');
insert into Netizen (netizen_id, id) values (321, 'amor****');
insert into Netizen (netizen_id, id) values (322, 'nana****');
insert into Netizen (netizen_id, id) values (323, 'furi****');
insert into Netizen (netizen_id, id) values (324, 'qqk1****');
insert into Netizen (netizen_id, id) values (325, 'jinu****');
insert into Netizen (netizen_id, id) values (326, 'cool****');
insert into Netizen (netizen_id, id) values (327, 'chzh****');
insert into Netizen (netizen_id, id) values (328, 'gytj****');
insert into Netizen (netizen_id, id) values (329, 'janu****');
insert into Netizen (netizen_id, id) values (330, 'wr04****');
insert into Netizen (netizen_id, id) values (331, 'mtma****');
insert into Netizen (netizen_id, id) values (332, 'fink****');
insert into Netizen (netizen_id, id) values (333, 'nojj****');
insert into Netizen (netizen_id, id) values (334, 'dhdh****');
insert into Netizen (netizen_id, id) values (335, 'pg34****');
insert into Netizen (netizen_id, id) values (336, 'seol****');
insert into Netizen (netizen_id, id) values (337, 'neon****');
insert into Netizen (netizen_id, id) values (338, 'suji****');
insert into Netizen (netizen_id, id) values (339, '5518****');
insert into Netizen (netizen_id, id) values (340, 'swb1****');
insert into Netizen (netizen_id, id) values (341, 'chw9****');
insert into Netizen (netizen_id, id) values (342, 'yena****');


-- 댓글
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (1, to_date('2024-07-01 20:56', 'yyyy-mm-dd hh24:mi'), '시원시원하넹 ㅋㅋ'	, 1, 3,	1, 2);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (2, to_date('2024-07-07 4:55', 'yyyy-mm-dd hh24:mi'), 'ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ개꿀잼 ㅠ	 '	, 	0	, 	2	,	2	,	2	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (3, to_date('2024-07-23 0:01', 'yyyy-mm-dd hh24:mi'), '아...이걸 11000원 주고 대여해서 봐 말어???? 댓글보면 봤다간 눈돌아갈거 같은데 아 고민 고민 아~ 아 포인트로 볼껀데 너무 재미없을거 같아서 고민된다 내 피같은 포인트 ㅋㅋ	 '	, 	1	, 	1	,	3	,	2	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (4, to_date('2024-07-01 5:24', 'yyyy-mm-dd hh24:mi'), '범죄도시4 재밋겠다'	, 	1, 	0	,	4	,	2	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (5, to_date('2024-07-01 5:00', 'yyyy-mm-dd hh24:mi'), '와우 기모찌맨	 '	, 	0, 	0	,	5	,	2	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (6, to_date('2024-07-03 10:53', 'yyyy-mm-dd hh24:mi	 '), '	왜케 노잼이냐 1이나2가 개꿈잼이었는데	 '	, 	8	, 	2	,	6	,	2	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (7, to_date('2024-07-02 0:16', 'yyyy-mm-dd hh24:mi'), '액션이 한결 업그레이드됐네	 '	, 	1	, 	2	,	7	,	2	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (8, to_date('2024-07-07 0:11', 'yyyy-mm-dd hh24:mi'), '재밋당 ㅋㅋ'	, 	0, 	3	,	8	,	2	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (9, to_date('2024-07-04 4:11', 'yyyy-mm-dd hh24:mi'), '제 나이 30대 후반...새로운 꿈이 생겼습니다. 그 꿈은 바로 영화배우...이 영화를 보고 저도 할 수 있겠다는 자신감이 생겼습니다.	 '	, 	10	, 	3	,	9	,	2	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (10, to_date('2024-07-13 12:47', 'yyyy-mm-dd hh24:mi'), '한 2년 정도 더 제대로 준비해서 5편을 끝으로 유종의 미를 제대로 거두고 끝내자. 더이상 하면 추해 질듯 싶다.	 '	, 	0	, 	0	,	10	,	2	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (11, to_date('2024-07-18 14:47', 'yyyy-mm-dd hh24:mi'), '범죄의도시 1 . 2 빼고는 이걸 왜 보나 싶네요	 '	, 	2	, 	0	,	11	,	2	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (12, to_date('2024-07-06 21:45', 'yyyy-mm-dd hh24:mi'), 'ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ	 '	, 	0	, 	0	,	12	,	2	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (13, to_date('2024-07-13 17:18', 'yyyy-mm-dd hh24:mi'), '킬링타임용으로는 굿!!	 '	, 	0	, 	0	,	13	,	2	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (14, to_date('2024-07-01 9:20', 'yyyy-mm-dd hh24:mi'), '이거 말고 악인전 ㅊㅊ	 '	, 	0	, 	0	,	14	,	2	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (15, to_date('2024-07-14 4:12', 'yyyy-mm-dd hh24:mi'), '이 영화를 보면서억대 제작비로 독립 영화를 찍었다고 생각 하였음 이런 편집이면 내가 더 잘 함 진짜 무조건 진짜.. 장이수 아니였으면 중간에 영화 껏음	 '	, 	1	, 	1	,	15	,	2	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (16, to_date('2024-07-10 5:10', 'yyyy-mm-dd hh24:mi'), '최악의 영화 중 하나다..	 '	, 	7	, 	3	,	16	,	2	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (17, to_date('2024-07-14 17:05	 ', 'yyyy-mm-dd hh24:mi'), '코믹하고 재밋었음'	, 	1	, 	0	,	17	,	3	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (18, to_date('2022-10-06 14:10	 ', 'yyyy-mm-dd hh24:mi'), '영화관에서 재밌게 봐서 다시보고 싶은 마음에 네이트온에서 대여해서 보는데 음향상태가 너무 엉망입니다. 환불하고 싶을정도에요. 담당자분께서 꼭 확인해보셨으면 합니다.'	, 	8	, 	3	,	18	,	3	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (19, to_date('2024-07-30 00:00',   'yyyy-mm-dd hh24:mi'), '오디오를 웅얼웅얼하도록 편집하는 한국영화 특성상 자막이 무조건 필요하나,해당 영상은 자막이 없음. 시청각장애인용으로 구매해야함.'	, 	1	, 	0	,	19	,	3	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (20, to_date('2022-10-19 1:05', 'yyyy-mm-dd hh24:mi'), '소리가 진짜 너무 작아요'	, 	0	, 	0	,	20	,	3	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (21, to_date('2022-12-04 18:23', 'yyyy-mm-dd hh24:mi'), '나도 로또 1등 걸려보면 좋겠다'	, 	2	, 	0	,	21	,	3	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (22, to_date('2022-11-20 23:35', 'yyyy-mm-dd hh24:mi'), '이쁘다....'	, 	1	, 	0	,	22	,	3	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (23, to_date('2023-08-31 21:23', 'yyyy-mm-dd hh24:mi'), '이거 자막 안됨...?? 불편'	, 	0	, 	1	,	23	,	3	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (24, to_date('2024-05-21 4:59', 'yyyy-mm-dd hh24:mi'), '연출, 스토리가 좋았다. 딱딱하지 않고 웃음 포인트가 있다.'	, 	1	, 	0	,	24	,	3	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (25, to_date('2022-10-14 20:02', 'yyyy-mm-dd hh24:mi'), '소리가 너무 작아요'	, 	1	, 	0	,	25	,	3	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (26, to_date('2024-01-25 1:28', 'yyyy-mm-dd hh24:mi'), '원래 화면이 이렇게 흔들리나요.?	 '	, 	1	, 	0	,	26	,	4	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (27, to_date('2023-09-06 20:36', 'yyyy-mm-dd hh24:mi'), '480p는 뭔가요. FHD도 엄청 낮은 화질인 UHD 시대에 참.'	, 	6	, 	1	,	27	,	4	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (28, to_date('2024-04-25 1:56', 'yyyy-mm-dd hh24:mi'), '처음엔 480화질이라서 돈날렸다 생각했는데 보다보니 저화질도 저화질인대로 옛날느낌나서 몰입 잘됐음'	, 	0	, 	0	,	28	,	4	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (29, to_date('2024-04-17 0:47', 'yyyy-mm-dd hh24:mi'), '그래도 재밌었어 감독의 팬이 되어버림'	, 	0	, 	0	,	29	,	4	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (30, to_date('2024-04-16 21:33', 'yyyy-mm-dd hh24:mi'), '480이라니 나는 속은건가'	, 	0	, 	0	,	29	,	4	);
insert into	Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (31, to_date('2024-07-19 2:33', 'yyyy-mm-dd hh24:mi'), '진짜 재밌다'	, 	0	, 	0	,	30	,	4	);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (32, to_date('2024-08-01 00:47', 'yyyy-mm-dd hh24:mi'), '북중러같은 소리하네 ㅋㅋㅋㅋㅋㅋ ', 0, 1,31,6);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (33, to_date('2024-07-29 00:00', 'yyyy-mm-dd hh24:mi'), '저걸보면 한국은 북중러와 동맹을 맺어야 국가가 안전하다 ', 0, 8,32,6);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (34, to_date('2015-10-17 15:52', 'yyyy-mm-dd hh24:mi'), 'BEST정말 돈 아깝습니다. 컴퓨터 모니터나 폰/태블릿등 작은 화면으로 보실 분들만 구매하세요.* 지금까지 네이버 영화에서 영화 여러개 다운받아 봤었는데 이번 "인사이드 아웃"을 구매해보고 질려서 다시는 네이버 영화에서 영화를 구매하지 않을 생각입니다. 1. 컴퓨터로 보려해도 반쪽짜리 HD (720p)임. 2. 폰이나 태블릿에서 네이버 VOD로 보려면 HD도 아닌 고화질 (480p)임. 3. 480p따위로도 거실 TV 큰 화면으로 보고싶어 폰과 TV을 MHL등으로 연결하고 네이버 VOD에서 재생 시도하면 "외부 장치 연결 지원 안됨"이라며 재생 안됨. 4. 이런 줄 알았으면 10900원씩이나 주고 구매하지 않았을 것임. 이미 다운 받았기 때문에 환불도 안됨. ', 123, 11,33,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (35, to_date('2015-10-27 10:46', 'yyyy-mm-dd hh24:mi'), 'BEST지금까지 굿다운로더를 지향하며 꼬박꼬박 올바른 경로로 다운을 받아본사람입니다.물론 비싼돈주고... 그럼 굿다운로더들을위해서 혜택같은것도 줘야하는거 아닌가요?? 뭐 툭하면~ DRM걸어놓고~정말 짜증나네요!!!! 이래서 굿다운로더가 되겠습니까!!!! 그러니 다들 불법다운받는거지... 그들을 뭐라할 필요가 전혀 없는거같네요....ㅠㅠ ', 73, 12,34,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (36, to_date('2015-10-14 20:10', 'yyyy-mm-dd hh24:mi'), 'BEST가격에 놀라고 가격에 놀라고 또 가격에 놀랐어요♡ ', 59, 5,35,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (37, to_date('2024-07-31 00:00', 'yyyy-mm-dd hh24:mi'), 'HDCP미지원으로 재생이 안된다고 떠서 타블렛 모니터 연결을 끊으니까 재생되네요ㅡㅡ; ', 0, 0,36,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (38, to_date('2024-07-28 00:00', 'yyyy-mm-dd hh24:mi'), '진짜.. 가족들과 영화볼 준비 다해두고 티비로 미러링하니 안되서 얼마나.. 허탈하던지요. 보지도 못했습니다. 환불요청합니다. ', 0, 0,37,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (39, to_date('2024-07-24 17:11', 'yyyy-mm-dd hh24:mi'), '사용하시는 모니터의 HDCP미지원으로 인해 동영상재생이 불가능합니다. 해결 방법이 없을까요??? ', 0, 0,38,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (40, to_date('2024-07-23 10:41', 'yyyy-mm-dd hh24:mi'), '저도 환불 요청해요... 재생이 안 돼요ㅠㅠㅠ ', 0, 0,39,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (41, to_date('2024-07-23 08:31', 'yyyy-mm-dd hh24:mi'), '"사용하시는 모니터의 HDCP미지원으로 인해 동영상재생이 불가능합니다" 라고 뜹니다. 환불 요청합니다. ', 0, 0,40,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (42, to_date('2024-07-22 13:48', 'yyyy-mm-dd hh24:mi'), '재생이 안됩니다. 환불 요청합니다. ', 0, 1,41,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (43, to_date('2024-07-20 20:12', 'yyyy-mm-dd hh24:mi'), '더빙판이라고 해놓고 왜 더빙이 없죠??ㅠㅠ ', 0, 1,42,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (44, to_date('2024-07-19 09:52', 'yyyy-mm-dd hh24:mi'), '"사용하시는 모니터의 HDCP미지원으로 인해 동영상재생이 불가능합니다" 라고 뜹니다. 환불 요청합니다. ', 0, 1,43,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (45, to_date('2024-07-18 16:08', 'yyyy-mm-dd hh24:mi'), '"사용하시는 모니터의 HDCP미지원으로 인해 동영상재생이 불가능합니다" 라고 뜹니다. 환불 요청합니다. ', 0, 1,44,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (46, to_date('2024-07-16 10:17', 'yyyy-mm-dd hh24:mi'), '재생이 안 됩니다. 환불해주세요. ', 0, 1,45,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (47, to_date('2024-07-15 15:39', 'yyyy-mm-dd hh24:mi'), '사용하는 모니터의 HDCP 미지원으로 동영상 재생이 불가능함. 계속 다운로드 표시중. 환불요청 바랍니다. ', 0, 0,46,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (48, to_date('2024-07-12 19:29', 'yyyy-mm-dd hh24:mi'), '재생이 안 됩니다. 환불요청 드려요 ', 0, 0,47,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (49, to_date('2024-07-09 10:01', 'yyyy-mm-dd hh24:mi'), '더빙이 아닙니다. 환불요구합니다. ', 0, 0,48,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (50, to_date('2024-07-08 08:23', 'yyyy-mm-dd hh24:mi'), '무료 영화 재생되는지 확인하고 영화를 결제했는데 "사용하시는 모니터의 HDCP미지원으로 인해 동영상재생이 불가능합니다" 라고 뜹니다. ㅠㅠ뭐 이런경우가... ', 0, 0,49,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (51, to_date('2024-07-05 20:51', 'yyyy-mm-dd hh24:mi'), '환불 요청합니다. 말도 안됩니다. 이럴수 재생 안될수 있다고 명시를 했어야죠 ', 0, 0,50,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (52, to_date('2024-07-04 17:10', 'yyyy-mm-dd hh24:mi'), '네이버 플러스로 볼 수 있나요? ', 0, 0,29,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (53, to_date('2024-06-30 02:40', 'yyyy-mm-dd hh24:mi'), '좋네요 좋아 ', 0, 0,51,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (54, to_date('2024-06-29 14:23', 'yyyy-mm-dd hh24:mi'), '영상을 못 보고 감상평을 남기네요. 설명을 제대로 안 보고 구매한 제 탓이 있어서 그냥 돈 날렸다셈 치고 맙니다만, 앞으로 시리즈온으로 영상 구매는 안 할 것 같네요. PC든 스마트폰이든 TV에 연결해서 볼 수가 없는데, 스마트폰으로는 만 볼 수 있다고 하면 OTT 스트리밍으로나 보지 시리즈온으로 구매해서 볼 이유가 있을런지요... ', 0, 0,52,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (55, to_date('2024-06-26 12:19', 'yyyy-mm-dd hh24:mi'), 'HDCP제한이 많이 엄격합니다. 재생 시도했다고 환불 버튼도 사라지니... 다른 플랫폼 이용을 추천드립니다. 문의 걸어놨는데 과연 환불해줄지 지켜보겠습니다. ', 1, 0,53,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (56, to_date('2024-06-25 10:59', 'yyyy-mm-dd hh24:mi'), '"사용하시는 모니터의 HDCP미지원으로 인해 동영상재생이 불가능합니다" 라고 뜹니다. 환불 요청합니다. ', 0, 0,54,7);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (57, to_date('2017-12-22 12:07', 'yyyy-mm-dd hh24:mi'), 'BEST아니 다운로드 버튼 어딨음;;; ', 154, 4,55,8);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (58, to_date('2018-01-13 12:39', 'yyyy-mm-dd hh24:mi'), 'BEST다른 영화도 지난번 100원 이벤트때 다운받아서 봤는데 왜 컴퓨터에서는 구매이력만 남아있고 보지도 못하고 다운로드도 안되나요? ', 90, 1,56,8);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (59, to_date('2017-07-27 23:54', 'yyyy-mm-dd hh24:mi'), 'BEST기다렸다. 멍청한 더빙판 때문에 늦게 나왔다고 생각하니 다시 한 번 화가나네. ', 50, 9,57,8);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (60, to_date('2024-08-01 12:17', 'yyyy-mm-dd hh24:mi'), '진짜 재밌어요 ', 0, 0,58,8);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (61, to_date('2024-08-01 12:17', 'yyyy-mm-dd hh24:mi'), '너무재밌어요 ', 0, 0,58,8);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (62, to_date('2024-07-22 17:14', 'yyyy-mm-dd hh24:mi'), '고객센터 문의해봤는데 PC 다운로드 안된다함 이제 모바일로 해야된대요 ', 1, 0,59,8);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (63, to_date('2024-07-20 22:06', 'yyyy-mm-dd hh24:mi'), '진짜 재밌어요 ', 0, 0,60,8);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (64, to_date('2024-06-14 13:05', 'yyyy-mm-dd hh24:mi'), '????이거 USB에 다운로드 안됨? 왜 구매했는데 다운로드 버튼 안뜨냐;;;; ', 0, 0,61,8);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (65, to_date('2024-07-13 03:57', 'yyyy-mm-dd hh24:mi'), '내가 1편은 진짜 열번 넘게 보고 2편은 서너번 봤고 3번은 극장서 한번 디플로 한번 봤는데 4편은 극장서 보다 뛰쳐 나올뻔... ', 1, 3,62,9);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (66, to_date('2024-07-08 23:30', 'yyyy-mm-dd hh24:mi'), '처음에 볼때 4가 제일 별로였는데 2번째 보니까 3보다는 낫다 그럭저럭 볼만함 ', 0, 5,63,9);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (67, to_date('2024-07-08 17:38', 'yyyy-mm-dd hh24:mi'), '관객이 범죄도시에 원하는 것은 분명하고, 이번에도 이에 배신하지 않고, 무난하게 충실하다. 그러니까 앞으로... 장이수는 빼지마라. ', 2, 0,64,9);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (68, to_date('2024-07-05 11:54', 'yyyy-mm-dd hh24:mi'), '장이수가 하드케리 했다. 생각지도 못 했던 천다혜 반가웠음^^ 다만 나이프 액션은 아직까지 원빈 "아저씨"를 넘어서지를 못 하네 ㅠ.ㅠ ', 3, 1,65,9);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (69, to_date('2024-07-05 01:31', 'yyyy-mm-dd hh24:mi'), '점점 떨어저가는 액션 연기력이 아쉽넹. 연기력일지 카메라 무빙일지 모르겟는데 일반인인 내가 아쉬우면 다아쉽겟징... ', 1, 8,66,9);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (70, to_date('2024-07-26 00:00', 'yyyy-mm-dd hh24:mi'), '윌 스미스를 아직도 써줌? ', 0, 3,67,10);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (71, to_date('2024-06-27 01:07', 'yyyy-mm-dd hh24:mi'), '세 번째 봐도 좋다 ', 1, 1,68,11);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (72, to_date('2024-06-17 14:27', 'yyyy-mm-dd hh24:mi'), '소장하고 싶은 영화. ', 0, 0,69,11);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (73, to_date('2024-05-25 17:21', 'yyyy-mm-dd hh24:mi'), '오래 간만에 영화다운 영화를 봤네요!! 모든 인생들을 측은지심의 눈으로 바라보며 살고 싶게 만드는 영화~~ ', 0, 0,70,11);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (74, to_date('2024-05-19 16:24', 'yyyy-mm-dd hh24:mi'), '교수님의 권유로 보았습니다. 감동했습니다. ', 0, 0,71,11);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (75, to_date('2024-05-02 08:53', 'yyyy-mm-dd hh24:mi'), '장도연님 추천으로 보러 왔어요~ ', 0, 0,72,11);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (76, to_date('2024-04-09 03:28', 'yyyy-mm-dd hh24:mi'), '진짜 잘 만든 영화인듯 ', 1, 0,73,11);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (77, to_date('2021-04-24 17:26', 'yyyy-mm-dd hh24:mi'), 'BEST정말 세상 살아가기 더럽고 짜증나서 나무 그늘 밑에서 쉬어가고 싶을 때 보기 좋은 영화 ', 28, 0,74,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (78, to_date('2024-07-28 00:00', 'yyyy-mm-dd hh24:mi'), '음악만 고퀄이네 이게 뭐여 ', 1, 0,75,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (79, to_date('2024-07-14 18:47', 'yyyy-mm-dd hh24:mi'), '마음이 순수해지네요ㅎ 고마워요 ', 0, 0,76,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (80, to_date('2024-07-07 13:18', 'yyyy-mm-dd hh24:mi'), '스포 작작해라 ', 0, 0,77,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (81, to_date('2024-05-15 19:27', 'yyyy-mm-dd hh24:mi'), '팔아줘서 고맙습니다 네이버 시리즈온 ', 2, 0,78,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (82, to_date('2024-04-19 22:48', 'yyyy-mm-dd hh24:mi'), '감독 딴에는 나름 재밌는 개그코드라고 생각했던 것들이.. 재밌지도 않고 윤리적으로도 불편함이 있었습니다. 실제 인생과 가깝게 표현한 영화를 좋아하는 편인데, 아이가 항상 시무룩해 있는 다거나.. 연출 등등 몰입이 떨어지는 요소가 많았습니다. ', 0, 3,79,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (83, to_date('2023-08-08 23:57', 'yyyy-mm-dd hh24:mi'), 'ost가 영화에 비해 너무 고퀄이다 ㅋㅋ ', 1, 5,80,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (84, to_date('2023-07-29 18:32', 'yyyy-mm-dd hh24:mi'), '유일하게 네이버에서라도 볼수있어서 좋네요~~ 넷플 왓챠 티빙웨이브엔 없어여ㅠㅠ ', 6, 0,81,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (85, to_date('2023-07-17 21:12', 'yyyy-mm-dd hh24:mi'), '영화 설명이 스포임 ㅠㅠ;;; 이거 원래 마지막장면 엄청 소름돋는 건데 ', 5, 0,82,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (86, to_date('2023-05-05 17:06', 'yyyy-mm-dd hh24:mi'), '제가 생각했을 때는 천사가 착한아저씨, 뚱보아저씨, 문어아저씨, 기쿠지로아저씨였던 것 같네요 여름방학 냄새가 많이 나는 영화였습니다 ㅠㅠ ', 4, 1,83,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (87, to_date('2023-02-21 00:46', 'yyyy-mm-dd hh24:mi'), '가끔 나오는 연출에서 무엇을 의도 하는지 모르는 부분이 많았지만, 사실 그런 부분 보다 강물에 흐르듯 마음 편안하게 보는 작품이라 생각한다.희대의 명곡 summer가 영화에 감칠맛을 더 해주고 20세기 마지막 작품의 감성을 느낄 수 있다. 21세기에는 이런 작품이 시장에서 잘 안먹히는 추세라.. 안타깝다 ', 2, 0,84,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (88, to_date('2022-09-01 16:06', 'yyyy-mm-dd hh24:mi'), '아 뭐야. 이건 영화 무제한에 포함 안되는거네 ', 0, 0,85,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (89, to_date('2022-08-21 13:19', 'yyyy-mm-dd hh24:mi'), '일본 만화영화에서 곧잘 나오던 정적연출이 실은 좀 된 일본영화에서 비롯된 감성인 줄은 몰랐다... 조금 많이 당황스럽지만 나쁘진 않았고 OST가 상당히 빼어나다. ', 0, 0,86,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (90, to_date('2021-08-08 19:44', 'yyyy-mm-dd hh24:mi'), '그냥 그랬다. 중반부까진 괜찮은데 후반부는 이해가 어렵더라. 감정선은 이해가 되는데 풀어내는 방식이 너무 일본스러워서 납득이 어려웠다. 대머리 아저씨도 지나치게 씬스틸러였고. 다 벗고 나올 때는 식겁했음...;; ', 2, 5,87,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (91, to_date('2020-09-20 20:43', 'yyyy-mm-dd hh24:mi'), '개명작 제일 좋아하는 영화 ', 2, 1,88,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (92, to_date('2019-03-22 22:10', 'yyyy-mm-dd hh24:mi'), '자막 싱크가 안 맞음 ', 0, 3,89,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (93, to_date('2018-05-10 17:01', 'yyyy-mm-dd hh24:mi'), '음악이 참 좋았던 영화 ', 1, 1,90,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (94, to_date('2018-03-07 20:22', 'yyyy-mm-dd hh24:mi'), '재밌네용 ! 즐감해써요오 ❤ ', 1, 1,91,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (95, to_date('2018-03-05 20:49', 'yyyy-mm-dd hh24:mi'), '썸머. ', 1, 2,92,12);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (96, to_date('2024-07-29 00:00', 'yyyy-mm-dd hh24:mi'), '아니 감상평 보고 불안해서 아직도 못보는중 그렇게 최악이에요 이영화?? 누가 진실된 감상평좀 부탁드림 ', 0, 0,3,13);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (97, to_date('2024-07-28 00:00', 'yyyy-mm-dd hh24:mi'), '이전 시리즈의 내용이 한 가족의 생존기+외계인에 대한 대응 방법 발견이라는 서사적 구조와 완결성을 갖췄다는 점을 고려하면, 굳이 이 이야기가 새로운 영화로 만들어져야 했는지 의문이 남습니다. 주인공이 처한 상황에 감정적으로 몰입한다면 나름의 감동과 여운은 얻지 않을까 싶네요. ', 0, 0,93,13);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (98, to_date('2024-07-26 00:00', 'yyyy-mm-dd hh24:mi'), '생각보다 실망스러움... ', 0, 0,94,13);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (99, to_date('2024-07-08 19:16', 'yyyy-mm-dd hh24:mi'), '재밌습니다 그녀가 죽었다 재밌네요 영화 ', 1, 1,4,14);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (100, to_date('2024-07-08 07:44', 'yyyy-mm-dd hh24:mi'), '그녀가 죽었다 재밌나요 알려주세요 ', 0, 0,4,14);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (101, to_date('2022-07-16 00:12', 'yyyy-mm-dd hh24:mi'), 'BEST평이 별로 였는데, 정말 괜찮네 ', 50, 3,95,15);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (102, to_date('2022-07-16 00:25', 'yyyy-mm-dd hh24:mi'), 'BEST액션이 전작이랑은 궤를달리하네 ... 잼게 잘봣다는! 마녀3 ㄱㄱㄱ ', 25, 2,96,15);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (103, to_date('2024-06-02 01:45', 'yyyy-mm-dd hh24:mi'), '평점 때문에 안보려 했는데 너무 재밌게 잘봤어요 3편 너무 기대 되네요 ', 0, 0,97,15);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (104, to_date('2024-04-13 06:57', 'yyyy-mm-dd hh24:mi'), '솔직히 많이 별로네요....... 맥락을 툭툭 끊어먹는 전개.. 중요한 대화를 나누는것도 아닌데 주저리주저리...몰입도 죄다 잡아먹고 내용은 1시간도 안되는걸 2시간으로 늘려논 느낌이랄까....... 이러니까 수면제 마냥 보다가 2번이나 잠들지... ', 0, 1,98,15);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (105, to_date('2023-08-13 22:43', 'yyyy-mm-dd hh24:mi'), '블록버스터 시리즈물 재미있습니다. part 3 기대 되요! ', 0, 0,99,15);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (106, to_date('2023-07-19 00:38', 'yyyy-mm-dd hh24:mi'), '첨엔 1이랑 연결이 없는거같다해서 아쉬웠는데 3으로 가는 초석이었군여! 3 기대하고 있겠습니다! 재밌어요! ', 1, 0,100,15);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (107, to_date('2023-03-04 02:03', 'yyyy-mm-dd hh24:mi'), '솔직히 초반 신파극 어설프긴하지만 엄청 재미있기만한데.... 액션도중 캐릭터 매력도 확느껴졌고 .....개인적인 생각으로는 많이 재미있습니다.... ', 0, 0,101,15);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (108, to_date('2023-02-04 23:57', 'yyyy-mm-dd hh24:mi'), '마녀 1이랑 완전 느낌이 다른데!? 중국무협물+트와일라잇 보는줄 알았네 ㅋㅋ 아싸리 하늘도 날아다니지 그래 왜 1편 정도로 하지 과유불급이네 왜 평이 안좋았는지 알겠네 ', 1, 0,80,15);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (109, to_date('2023-01-29 00:39', 'yyyy-mm-dd hh24:mi'), '재밌어요!!!!!!!!! 얼른 3편 내주세요!!!!!!!!!!!!!! ', 1, 0,102,15);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (110, to_date('2022-12-31 23:41', 'yyyy-mm-dd hh24:mi'), '마녀1과 비교해서 소녀의 능력을 너무 중국 무협지풍으로 풀어낸 것이 한국 관객에게 거부감을 준 것이 아닐까 싶다. 순수한 소녀의 얼굴과 감성이 폭발적인 반전 액션과 대비를 이루는 게 <마녀>의 매력이었는데… 인간의 미래와 과학의 오남용은 3편에서 풀어낼 것 같고. 3편은 부디 수작이 되기를 기대해 본다. ', 1, 0,103,15);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (111, to_date('2022-12-29 18:44', 'yyyy-mm-dd hh24:mi'), '박은빈님 마녀3에서 볼 수 있으면 좋겟다 ㅠ_ㅠ ', 0, 0,104,15);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (112, to_date('2022-12-15 08:43', 'yyyy-mm-dd hh24:mi'), '영화라기보단 사펑 액션 웹툰 수준. ', 1, 1,105,15);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (113, to_date('2024-07-18 02:22', 'yyyy-mm-dd hh24:mi'), '김선호 배우님 분명히 말은 세게 하는데 왜 귀엽죠? 내용도 재밌고 김선호 얼굴도 재밌고 ㅎ 김선호 배우님의 연기력이 더욱 돋보이는 작품인 것 같아요 체고!~ ', 0, 0,106,16);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (114, to_date('2024-06-21 22:16', 'yyyy-mm-dd hh24:mi'), '재밌습니다. 2탄 기대합니다 ', 0, 0,107,16);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (115, to_date('2024-06-05 03:11', 'yyyy-mm-dd hh24:mi'), '난해하게 꼬아 놓은 하드코어. 반전 없었음 어쩔뻔 ', 0, 0,24,16);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (116, to_date('2024-02-24 13:53', 'yyyy-mm-dd hh24:mi'), '재미, 전개, 모두 괜찮고, 정말 깔끔하게 잘 빠진 영화. ', 0, 0,108,16);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (117, to_date('2024-02-18 23:06', 'yyyy-mm-dd hh24:mi'), '재밌어요 ㅎㅎ ', 0, 0,109,16);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (118, to_date('2024-02-11 14:50', 'yyyy-mm-dd hh24:mi'), '스토리나 액션씬이 단순소박해서 배우들의 열연과 시너지 효과를 내지 못한 점이 아쉽지만 지금처럼 티켓값의 가성비가 떨어진 시대가 아니었다면 영화관에서도 무난히 흥행했을 작품이라고 생각합니다. 뻔하지만 오히려 그래서 매력적인 캐릭터들을 보는 것만으로도 충분한 값어치는 하는 영화. 엔딩이 깔끔한 킬링타임 액션영화를 찾으시는 분들께 추천드립니다. ', 1, 0,110,16);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (119, to_date('2024-02-10 00:22', 'yyyy-mm-dd hh24:mi'), '왜 흥행 안된지 이해 안됨 졸 잼~~``` ', 1, 0,111,16);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (120, to_date('2024-01-02 11:53', 'yyyy-mm-dd hh24:mi'), '야 너 임마 마취제대로한거야 이부분이 제일 명장면이다 . ', 0, 0,112,16);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (121, to_date('2023-12-02 18:28', 'yyyy-mm-dd hh24:mi'), '마르코 역 강태주 배우가 기대되네요. 내용은… 돈 정말 많은 집, 콩가루 막장… 가족관? 청소년은 어른 되면 보세요. ', 0, 0,103,16);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (122, to_date('2023-11-03 22:23', 'yyyy-mm-dd hh24:mi'), '정말 잼나게 봤습니다. ~ 김선호님 최고이십니다. !!!!!!! ', 2, 0,113,16);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (123, to_date('2024-04-22 13:05', 'yyyy-mm-dd hh24:mi'), 'BEST선재땜에 여기까지왔는데… 기대이상으로 먹먹해지면서 여운이 남는 영화네요 ', 13, 2,114,17);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (124, to_date('2024-07-24 00:55', 'yyyy-mm-dd hh24:mi'), '우석씨와 다미씨 보러왔다가 눈물콧물빼고 갑니다.. ', 0, 0,115,17);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (125, to_date('2024-07-23 01:04', 'yyyy-mm-dd hh24:mi'), '왜 소중한 것들은 자꾸만 떠나가는 걸까.. ', 0, 0,68,17);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (126, to_date('2024-07-09 16:37', 'yyyy-mm-dd hh24:mi'), '우석이 떄문에 왔는데 되게 잔잔하게 긴 여운을 남긴 감동적인 영화네요. 연기들도 모두 훌륭한 정말 슬프지만 아름다운 영화예요. ', 0, 0,116,17);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (127, to_date('2024-06-15 15:02', 'yyyy-mm-dd hh24:mi'), '변우석님 필모 따라왔다가 보게 되었는데너무 감동적인 영화네요. 보는 내내 펑펑 울었다는… 영상미와 BGM도 넘 좋네요. ', 1, 0,117,17);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (128, to_date('2024-06-12 12:38', 'yyyy-mm-dd hh24:mi'), '나 말고 이 세상에 너 사랑했던 사람 아무도 없다고 ', 1, 0,118,17);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (129, to_date('2024-06-11 02:17', 'yyyy-mm-dd hh24:mi'), '선재때문에 여기까지 왔는데...영화가 너무 좋으네요..다시 개봉해주셔서 감사해요... 여주인공 두분 감정선따라 몰입하며 봤는데 다시 보고 싶은 영화예요, 영상미도 너무 아름답다.. ', 1, 0,119,17);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (130, to_date('2024-06-07 01:55', 'yyyy-mm-dd hh24:mi'), '진짜 너무 슬프다 ', 0, 0,120,17);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (131, to_date('2024-06-06 23:33', 'yyyy-mm-dd hh24:mi'), 'ㅠㅠㅠㅠㅠ ', 0, 0,121,17);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (132, to_date('2024-06-04 10:34', 'yyyy-mm-dd hh24:mi'), '너무 슬프잖아....나도 소울메이트라고 생각했던 내 단짝하고 남자때문에...사이가 틀어졌는데.. 나이들고 지금 생각하면 그 친구가 사무치게 그리워짐... 남자가뭐라고.. ', 2, 2,122,17);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (133, to_date('2023-08-15 23:32', 'yyyy-mm-dd hh24:mi'), 'BEST네이버에서 8720원이래서 들어왔는데 왜 10900원이죠; ', 161, 6,123,18);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (134, to_date('2023-08-12 13:18', 'yyyy-mm-dd hh24:mi'), 'BEST이럴꺼면 바로보기라고 하지 알라니까?, ', 64, 12,124,18);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (135, to_date('2023-08-11 10:29', 'yyyy-mm-dd hh24:mi'), 'BEST배척과 차별의 핑계가 되었던 "다름"을 오히려 사랑하고, 하나가 되니... 따뜻하다. 픽사가 표현하는 "이민자" 가족의 이야기. ', 48, 5,64,18);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (136, to_date('2024-07-19 08:57', 'yyyy-mm-dd hh24:mi'), '모니터 문제로 재생이 안되는데 환불은 어떻게 하나요 ', 0, 0,125,18);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (137, to_date('2024-07-17 09:25', 'yyyy-mm-dd hh24:mi'), '방금 구매했는데 재생이 안됩니다. 환불 부탁드립니다. ', 0, 0,126,18);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (138, to_date('2024-07-04 09:48', 'yyyy-mm-dd hh24:mi'), '재생이 안되네요. 환불부탁드립니다. ', 1, 0,127,18);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (139, to_date('2024-07-02 10:57', 'yyyy-mm-dd hh24:mi'), '다운로드는 안되는건가요?ㅠㅠ 다운로드 버튼이 없네요 ', 1, 0,128,18);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (140, to_date('2024-06-25 10:20', 'yyyy-mm-dd hh24:mi'), '진짜 최악이네요. 재생이 된적은없는데 클릭으로 환불도 안되고, 물론 환불하려는 이유가 재생이 안되었기 때문인데.. 사전에 HDCP 지원에대해 좀더 자세히 설명이 있었으면 결제를 안했겠죠. 재생안했는데 환불도 안되고, 듀얼모니터나, 티비에 연결해서 보는건 절대 안되네요 그럼 너무 작게 제한적으로 봐야하잖아요..다신 이용안합니다. ', 1, 0,129,18);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (141, to_date('2024-03-29 09:03', 'yyyy-mm-dd hh24:mi'), '재생이 안 됩니다. 환불 부탁드립니다. ', 1, 0,130,18);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (142, to_date('2024-03-01 20:06', 'yyyy-mm-dd hh24:mi'), '재생이 안됩니다 환불 부탁드립니다 ', 1, 0,131,18);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (143, to_date('2024-02-27 21:53', 'yyyy-mm-dd hh24:mi'), '자막이 없는데 환불 안되나요? ㅠㅠ 영어자막이요~ 진짜 이것 때믄에 샀는데… ', 0, 0,132,18);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (144, to_date('2024-02-16 16:32', 'yyyy-mm-dd hh24:mi'), '노래 39분 18임 ', 0, 1,133,18);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (145, to_date('2024-02-15 15:59', 'yyyy-mm-dd hh24:mi'), '영어 자막은 왜 없나요? 영어자막 해 주세요 ', 0, 0,134,18);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (146, to_date('2024-04-21 12:59', 'yyyy-mm-dd hh24:mi'), '2편이 안나왔는데 2편인줄 알았다는게 뭔소린지 모르겟네요. 미래에서 오셨나요? ', 3, 2,135,19);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (147, to_date('2024-02-29 23:04', 'yyyy-mm-dd hh24:mi'), '아들램 보여주려고 결제는데, 아들 왈 똑같다고 속았다네요.스즈메의 문단속 2편인줄 알았더니, 검색해보니 약간 수정 장면 포함, 마지막 대사 추가로 1편(?)이랑 99% 똑같네요.. 이거 환불 안되나요? ', 4, 36,136,19);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (148, to_date('2024-04-26 11:41', 'yyyy-mm-dd hh24:mi'), '비현실적인 만화 같은 영화고, 김혜수가 이 영화랑 연기 톤이 제일 잘 맞다. 오히려 각본을 잘 이해했다고 보이는데, 왜 오바 한다고 하지? 이 영화 보면서 현실주의 독립영화 풍 연기를 바라는 게 더 이상하다. ', 0, 0,137,20);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (149, to_date('2024-01-28 11:04', 'yyyy-mm-dd hh24:mi'), '밝은분위기에서 스릴러로 갑자기 전환되는 장면부터 몰입감이 엄청납니다. 해녀전투씬은 잘못보던 액션시퀀스라 그런지 너무 재밌었고요!! 단점은 김혜수 조인성 염정아 세인문이 너무 익숙하기 때문에 발음,표정,동작들이 영화와 안어울리는것처럼 어색하게 느껴졌습니다 특히 대사할때 발음이 참 몰입을 깨네요 ', 1, 0,138,20);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (150, to_date('2024-01-06 21:27', 'yyyy-mm-dd hh24:mi'), '김혜수 목소리 과장한 연기 굉장히 어색하고 이상함.. 재미도 없음.. 중간에 보다가 끔 ', 2, 0,139,20);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (151, to_date('2023-12-13 20:35', 'yyyy-mm-dd hh24:mi'), '네이버 멤버십 안되네요~ 저도 낚였네요! 이글 보시는분들은 미리 확인하세요 ㅠㅠ 한달을 기다렸더니 유료네요... 무료 볼거 없어요!!! ', 1, 1,118,20);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (152, to_date('2023-11-25 18:20', 'yyyy-mm-dd hh24:mi'), '멤버십으로 안돼...? 뭐야.......................낚임................. ', 4, 1,140,20);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (153, to_date('2023-11-11 23:34', 'yyyy-mm-dd hh24:mi'), '재밌을것같습니다. ', 1, 2,141,20);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (154, to_date('2023-10-30 00:20', 'yyyy-mm-dd hh24:mi'), '영화는 제가 좋아하는 배우들이라 너무 재밌게 봤습니다. 한가지 인상 깊은건 다른 영화와 다르게 뜬금없이 여자가 남자 때려 눕히는게 아니라 바다를 잘 아는 해녀들이 바다 속 전투에서 지혜를 발휘해서 잘 싸워 이겼네요!! 전 정말 재밌게 봤습니다! ', 2, 3,142,20);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (155, to_date('2023-09-29 18:02', 'yyyy-mm-dd hh24:mi'), '재미 있음....여자들의 우정을 다룬 영화라 신선함. 영화쪽은 늘 조폭 이야기만....질도 안좋은 분들의 이야기만 죄다 연기하는데...이 이야기는 신선했음...다들 연기를 잘하는 베터랑이라 그런가? 시간 가는 줄 모르고 봄. ㅎ ', 8, 5,143,20);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (156, to_date('2020-06-01 18:53', 'yyyy-mm-dd hh24:mi'), 'BEST2020년 6월 1일 오후 6시 30분 경 사운드가 개선된 파일로 교체하였습니다. 시간이 지체된 점 양해 부탁 드립니다. 기존 구매자분들도 이용 기간 안에 교체된 파일로 재다운로드 가능하오니 이용 부탁 드립니다. ', 81, 7,144,21);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (157, to_date('2020-08-29 00:08', 'yyyy-mm-dd hh24:mi'), 'BEST개인적으로 너의 이름은보다 재미있게 봤다 날씨의 아이에서도 레드윔프스를 선택한건 신의 한수였네.. ', 76, 12,145,21);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (158, to_date('2022-05-17 21:01', 'yyyy-mm-dd hh24:mi'), 'BEST감독이 말하고자 했던 내용 : 집단을 위해서 소수의 희생을 당연시 여기는 일본의 전체주의사상을 비판한 영화 "날씨가 이상하게 된 건 어른 탓이다. 하지만 청소년들이 다 덮어쓰고 있고 유흥업소를 다니는 것, 가출한 청소년이 돌아다니는 것, 그 힘듦을 알고도 모르는 척 애써 외면하는 건 어른들 탓이다. 아무도 가출한 청소년에게 이유를 묻지 않았다." 라고 하네요. 영화에서도 도쿄는 원래부터 물에 잠겨있었고 원래대로 돌아가는 것 뿐이라는 대사가 있죠. 그래서 호다카가 이기적인게 아니라 본인들이 만들어놓은 세계를 아이들보고 책임지라고 하는 어른들이 이기적인겁니다. ', 31, 2,146,21);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (159, to_date('2024-07-16 12:02', 'yyyy-mm-dd hh24:mi'), '이게 당시에 인기를 끌지 못했던 이유는 장마철이 아니라 가을에 개봉했기 때문도 있을거임 ', 0, 0,147,21);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (160, to_date('2024-07-07 22:19', 'yyyy-mm-dd hh24:mi'), '장마철마다 꼭 보는 영화 ', 2, 0,148,21);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (161, to_date('2024-05-20 21:01', 'yyyy-mm-dd hh24:mi'), '이 작품을 모바일로만 봤다면, 언젠가 극장에서 재개봉하는 날 꼭 대형 스크린으로 보는 것을 추천드립니다.관객이 얼마 없는 광주의 모 극장에서 날씨의 아이를 스크린으로 보는데, 클라이맥스에서 웅장하게 울리는 grand escape 와 그 씬은 정말 잊을 수가 없네요. ', 2, 0,149,21);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (162, to_date('2024-05-10 21:42', 'yyyy-mm-dd hh24:mi'), '여운이 너무 많이 남네요 주기적으로 보러옴 ', 0, 0,150,21);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (163, to_date('2024-03-17 22:45', 'yyyy-mm-dd hh24:mi'), '신카이마코토 감독의 작품 중 단연 최고라고 할 수 있음....너무 좋아.. ', 3, 0,151,21);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (164, to_date('2023-11-07 23:45', 'yyyy-mm-dd hh24:mi'), '너의 이름은 - 너를 위해 세상을 구할게날씨의 아이 - 너를 위해 세상을 버릴게 스즈메의 문단속 - 너와 함께 세상을 구할게 유튜브에 있있던 댓글이 참 인상적이라 옮겨봐요 ', 9, 2,152,21);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (165, to_date('2023-09-08 23:17', 'yyyy-mm-dd hh24:mi'), '솔직히 영상미는 너무 너무 좋은데, 스토리랑 전반적인 개연성이나 흐름은 너의 이름은에 너무 못 미치네요. 기대가 컸던 만큼 아쉬운 마음. ', 2, 4,153,21);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (166, to_date('2023-07-09 22:25', 'yyyy-mm-dd hh24:mi'), '먼 소리인지 모르시는 분들은 일보 자연재해를 이해하시면 됩니다 ', 0, 0,14,21);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (167, to_date('2023-06-25 19:36', 'yyyy-mm-dd hh24:mi'), '비오는날 재밌게 잘봤어요~~ ', 0, 0,154,21);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (168, to_date('2023-06-10 17:21', 'yyyy-mm-dd hh24:mi'), '진짜 슬펐어요ㅠㅠ그래도 결국 해피엔딩으로 끝나 다행이에요 잘 봤습니다 ', 1, 0,155,21);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (169, to_date('2019-01-10 20:33', 'yyyy-mm-dd hh24:mi'), 'BEST진짜ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ아 그냥 생각없이 보시면 최고 ', 43, 6,156,22);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (170, to_date('2024-04-02 22:59', 'yyyy-mm-dd hh24:mi'), '영화를 제작해 본 사람이라면 공감할 수밖에 없는 영화다 ㅋㅋ ', 0, 0,157,22);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (171, to_date('2024-01-10 00:45', 'yyyy-mm-dd hh24:mi'), '영화속 영화속 영화라니-게다가 본 장르는 가족코미디다. 좋아하지 않을 수 없다. ', 1, 0,158,22);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (172, to_date('2023-08-06 07:57', 'yyyy-mm-dd hh24:mi'), '그냥 재미있으니 끝까지 보시오 ', 0, 0,159,22);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (173, to_date('2023-07-30 22:17', 'yyyy-mm-dd hh24:mi'), '매불쇼 추천 영화. 삐끕 감성의 매불쇼와 잘 어울리는 걸작임. 신랄라라라라라랄 ', 0, 0,160,22);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (174, to_date('2023-01-23 14:45', 'yyyy-mm-dd hh24:mi'), 'B급 영화에 충실하고. 초반 2, 30분만 참고 계속 보라는게 이해됩니다 그 때 부턴 쭉 보게 되네요 ㅋㅋ ', 1, 0,161,22);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (175, to_date('2022-09-30 21:46', 'yyyy-mm-dd hh24:mi'), '추리물의 기본은 불가해한 사건이 발생하는 1장(3인칭)과 그 진상에 개연성있게 접근하는 탐정의 2장(1인칭)으로 구성됩니다. 탐정물의 정석을 따르면서 탐정물이 아닌것을 보여주는 대본 구성에 놀랐습니다. 시점이 바뀌어 나가면서 사건이 풀릴때 느끼는 특유의 카타르시스, 초자연적현상이 인간미로 변환되는 과정이 좋았습니다. 30분이 정말 쓰레기같은데, 그걸 욕하면서 버티면서 보게됩니다. 그 후에 그걸 웃고 즐기면서 마치 탐정물을 보는것같이 풀어주는 즐거움이 너무나 좋았습니다. 탐정물의 재미와 함께 탐정물에는 없는 특유의 따뜻함도 마음에 들었습니다. 좋은영화 정말 감사합니다. ', 1, 0,162,22);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (176, to_date('2022-02-23 18:33', 'yyyy-mm-dd hh24:mi'), '평가가 좋아서 봤는데, 취향때문에 안맞았네요. 후반 신선하긴한데 아쉬운 느낌. 간간하게 재미는 있네요 퐁! ', 0, 0,163,22);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (177, to_date('2022-02-19 23:05', 'yyyy-mm-dd hh24:mi'), '초반 30분이 아쉽다는 의견도 있지만 나는 처음부터 끝까지 짱 재밌더라ㅋㅋㅋㅋ ', 0, 0,164,22);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (178, to_date('2022-02-13 01:40', 'yyyy-mm-dd hh24:mi'), '재밌다 ㅋㅋㅋㅋㅋㅋ ', 1, 0,165,22);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (179, to_date('2021-12-19 22:45', 'yyyy-mm-dd hh24:mi'), '초반 30분은 보기 힘들었는데 끝까지 보면 왜 힘든지 왜 재밌는지 알수 있는 영화 ㅋㅋㅋ 신선했음 ', 3, 0,80,22);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (180, to_date('2024-07-14 14:51', 'yyyy-mm-dd hh24:mi'), '좋은 영화 감상 GOOD ', 0, 0,166,23);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (181, to_date('2024-06-16 13:21', 'yyyy-mm-dd hh24:mi'), '티모시 샬라메의 반전 연기에 깜놀. ', 0, 0,167,23);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (182, to_date('2024-05-13 10:09', 'yyyy-mm-dd hh24:mi'), '왜 아직도 영화관에 가서 영화를 봐야하는지 보여주는 영화 ', 0, 0,168,23);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (183, to_date('2024-05-05 01:50', 'yyyy-mm-dd hh24:mi'), '금방 풀려서 재밌게 봤습니다 중간에 자막 끊긴건 아쉽네요 리산 알 가입! ', 1, 0,169,23);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (184, to_date('2024-02-15 20:46', 'yyyy-mm-dd hh24:mi'), '오랫만에 정말 재미있게 봤어요~ㅋㅋ 진심임 5,500원 아깝지 않았음~ 왠지 애인이 있었다면 더 좋았을 것 같은 영화~^^ ', 0, 0,170,24);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (185, to_date('2024-02-03 12:48', 'yyyy-mm-dd hh24:mi'), '5500원 주고 봐야되? ', 0, 0,3,24);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (186, to_date('2024-01-23 12:14', 'yyyy-mm-dd hh24:mi'), '예고편이 워낙 자극적으로 웃겨서 본편은 그냥 그랬음. ', 0, 0,171,24);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (187, to_date('2023-12-28 02:06', 'yyyy-mm-dd hh24:mi'), '클리쉐를 깨는 연출이 인상적인 영화! 사랑하는 사람과 웃으며 보기 좋네요 :)) ', 2, 0,172,24);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (188, to_date('2023-12-27 21:53', 'yyyy-mm-dd hh24:mi'), '보고 또 보고.. ', 2, 0,173,24);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (189, to_date('2023-12-27 16:24', 'yyyy-mm-dd hh24:mi'), '평점보고 봤는데...아........ ', 0, 1,174,24);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (190, to_date('2022-08-10 17:23', 'yyyy-mm-dd hh24:mi'), '그루!!!! ', 0, 0,175,26);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (191, to_date('2018-07-15 03:15', 'yyyy-mm-dd hh24:mi'), '미니언즈가 재밌어서 시리즈별로 다 보게되었는데 영화 자체가 너무 귀엽고 주인공 그루 캐릭터가 어리버리한데 되게 사랑스럽네요:) ', 0, 0,176,26);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (192, to_date('2018-02-28 23:35', 'yyyy-mm-dd hh24:mi'), '아니... 자막 레알 없음... 이거 뭐에요 ', 0, 0,177,26);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (193, to_date('2017-11-26 15:31', 'yyyy-mm-dd hh24:mi'), '자막없다는거 진짜임 패드로 보려했는데 놀랬다 여러분 폰으로 보면 자막있어요 네이버가 앱개발을 안한거에여; ', 0, 0,178,26);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (194, to_date('2017-09-10 12:30', 'yyyy-mm-dd hh24:mi'), '저ㅜ자막없눈데 ㅎ한불돔 ', 0, 0,179,26);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (195, to_date('2017-08-30 22:57', 'yyyy-mm-dd hh24:mi'), '관리자도 정말 속터지겠다... "자막없다" 댓글있는 영화중에 정말 자막없던건 한 편도 없었음자막있어요 잘나옵니다 ', 6, 0,180,26);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (196, to_date('2017-08-26 22:22', 'yyyy-mm-dd hh24:mi'), '자막 없음 ', 0, 0,181,26);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (197, to_date('2017-08-26 11:28', 'yyyy-mm-dd hh24:mi'), '더빙아니고 자막이라해서 대여했는데자막없으면 불량이지 무조건 환불해주세요. ', 0, 0,182,26);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (198, to_date('2017-08-22 21:41', 'yyyy-mm-dd hh24:mi'), '자막 없어요 ', 0, 0,183,26);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (199, to_date('2017-07-28 21:35', 'yyyy-mm-dd hh24:mi'), '자막 잘 나오는데요? ', 3, 0,184,26);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (200, to_date('2024-02-18 02:08', 'yyyy-mm-dd hh24:mi'), '많이 실망스러운 작품입니다. 화염의 해바라기 이후에 좋은작품이 나오질 않습니다 ', 1, 11,185,27);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (201, to_date('2024-01-30 22:48', 'yyyy-mm-dd hh24:mi'), '넘 재밌다 ', 2, 1,186,27);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (202, to_date('2024-01-25 16:35', 'yyyy-mm-dd hh24:mi'), '진짜 너무 잼있는 극장판 이였다 ㅎㅎ코난과 장미의 케미 너무 좋았다~ ', 3, 1,187,27);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (203, to_date('2024-01-18 15:10', 'yyyy-mm-dd hh24:mi'), '솔직히 미션 임파서블이 코난을 보고 따라서 영화를 만드는 것 같다. ', 2, 0,188,27);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (204, to_date('2024-01-06 19:09', 'yyyy-mm-dd hh24:mi'), '코난❤장미 ', 4, 1,189,27);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (205, to_date('2024-01-06 00:41', 'yyyy-mm-dd hh24:mi'), '흑철의 어영 재밌어영 ', 5, 0,139,27);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (206, to_date('2023-12-31 01:53', 'yyyy-mm-dd hh24:mi'), '명작 ㅎㅎㅎㅎ ', 1, 0,190,27);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (207, to_date('2023-12-22 11:17', 'yyyy-mm-dd hh24:mi'), '아ㅏㅏㅏ 너무 행복하다 ㅎㅎㅎㅎ ', 5, 0,191,27);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (208, to_date('2023-12-10 22:38', 'yyyy-mm-dd hh24:mi'), '정말 난 너무 만족해 너무 재밌어 ', 6, 0,192,27);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (209, to_date('2023-12-07 19:55', 'yyyy-mm-dd hh24:mi'), '와,,,코난 역대급 최고 명작이다,,,,애니가 왠만한 영화보다 훨씬,,,,대단하다,,, ', 5, 0,193,27);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (210, to_date('2024-07-31 20:19', 'yyyy-mm-dd hh24:mi'), '이딴게 극장판? 애니에 나온 키드 모음집인데 ㅋㅋㅋ ', 0, 0,194,29);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (211, to_date('2024-07-05 05:01', 'yyyy-mm-dd hh24:mi'), '병.먹.금 ', 0, 0,195,29);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (212, to_date('2024-06-29 13:34', 'yyyy-mm-dd hh24:mi'), '실망스럽습니다 ..... 괴도키드를 너무 우려먹는것같아서 보기도 안좋습니다 또 일본놈들 이름으로 나오는것은 너무나도 듣기 거북합니다. 그냥 빨리 작품자체를 끝내는게 가장 바람직할것 같습니다 ', 2, 8,185,29);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (213, to_date('2024-07-18 10:21', 'yyyy-mm-dd hh24:mi'), '와............ 진짜 너무 재밌어요.... 안 봤으면 후회했을 영화!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 레전드!!!!!!!!!!!!!!!! ', 0, 0,196,30);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (214, to_date('2024-02-15 15:47', 'yyyy-mm-dd hh24:mi'), '신카이 마코토는 천재다. ㅠㅠ 보면서 얼마나 울었는지.. ', 0, 0,197,30);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (215, to_date('2024-02-12 01:51', 'yyyy-mm-dd hh24:mi'), '아하...작화가 좋네.. ', 1, 0,8,30);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (216, to_date('2024-01-09 17:31', 'yyyy-mm-dd hh24:mi'), '굳입니다 ㅋㅋ ', 1, 0,76,30);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (217, to_date('2024-01-08 14:23', 'yyyy-mm-dd hh24:mi'), '드디어 봅니다ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ ', 1, 0,191,30);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (218, to_date('2023-12-22 15:00', 'yyyy-mm-dd hh24:mi'), '돈 하나도 안아깝네요~ 넘 공감이 되는 내용이었어요^^ ', 2, 1,198,30);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (219, to_date('2023-12-10 19:48', 'yyyy-mm-dd hh24:mi'), '돈 아깝네...시간 버렸다...성격 이상한 여자애네...감정 이입 전혀 안됨 ', 1, 14,199,30);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (220, to_date('2023-12-10 00:46', 'yyyy-mm-dd hh24:mi'), '재밌네요.. 너의 이름은 날씨의 아이를 잇는 역작이네요... 연출도 매끄럽고, 그림도 여전히 예쁘고, 내용도 찡하고... 훌륭합니다~~~ 극장에서 봤어야 했나 ㅎㅎㅎ ', 2, 0,200,30);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (221, to_date('2023-12-08 21:44', 'yyyy-mm-dd hh24:mi'), '근데 아직 내 지갑 사정이... ㅎㅎ 혹시 가격좀 낮춰주실수...ㅎㅎㅎㅎ ', 1, 0,201,30);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (222, to_date('2023-12-08 21:43', 'yyyy-mm-dd hh24:mi'), 'ㅎㅎㅎ 가격이 내려갔다~~ ', 1, 0,201,30);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (223, to_date('2024-08-01 02:20', 'yyyy-mm-dd hh24:mi'), '화면이 넘 어두워요~ 구분이 안되는 장면이 많네요... ', 0, 0,202,31);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (224, to_date('2024-07-15 13:57', 'yyyy-mm-dd hh24:mi'), 'saka****//오바하넼ㅋㅋㅋㅋ ', 0, 1,203,31);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (225, to_date('2024-07-06 17:02', 'yyyy-mm-dd hh24:mi'), '재밌다 파묘 응원할게요 화이팅 ', 0, 0,4,31);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (226, to_date('2024-06-30 23:33', 'yyyy-mm-dd hh24:mi'), '무서운거 잘 못보는데 몇 장면만 실눈뜨면 볼만했어요 ㅋㅋ 다른영화는 안그런데 중간에 왜인지 확대하면 영상이 꽤나 자주 툭둑투둑 끊기는 느낌이 있었는데 해결법 있는지 모르겠지만 찾기 귀찮아서 F11눌러서 웹 바 가리고 ctrl + 버튼 눌러서 화면 확대해서 걍 봤습니다 ㅎㅎ유튭에서구매해서 봐도 화면 끊긴다는 얘기가 많았는데 시리즈는 그런 리뷰 없어서 괜찮겠지 했는데 여기도 그렇네요 ㅠㅠ 참고로 노트북으로 봤습니다 ', 0, 0,204,31);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (227, to_date('2024-06-22 17:45', 'yyyy-mm-dd hh24:mi'), '아 무섭지도 않고 그냥 그렇네요.. 영화관에서 봤음 돈 아까울뻔.. 티비로 렌트해서 가족이 함께 보길 잘함.... ', 1, 1,205,31);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (228, to_date('2024-06-21 22:26', 'yyyy-mm-dd hh24:mi'), '재미있어요! 김고은 연기 최고네요 ', 0, 0,206,31);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (229, to_date('2024-06-11 10:07', 'yyyy-mm-dd hh24:mi'), '전체적으로 잘만든 수작이라고 생각합니다. 말많은(?) 후반부도 분명 감독의 "찜찜하고 모호한 결말"이 주를 이루던 기존작들과는 결이 다르지만, 깔끔한 결말을 선호하는 대중성을 감안했다고 하면 나쁘지 않다고 보구요. ', 0, 0,207,31);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (230, to_date('2024-06-07 22:48', 'yyyy-mm-dd hh24:mi'), '돈이 아깝다는 생각이 들게 만드는 영화 쩝... ', 0, 3,208,31);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (231, to_date('2024-06-04 08:44', 'yyyy-mm-dd hh24:mi'), '여러분들의 감상평이 감상 후 너무나 공감이 됩니다.^^초반의 긴장감과 흥미 문제의 사무라이 이후^^: 그래도 볼만했습니다. ', 0, 0,209,31);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (232, to_date('2024-05-26 11:23', 'yyyy-mm-dd hh24:mi'), '오 간만에 재밌었음 ', 2, 0,210,31);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (233, to_date('2024-04-24 01:31', 'yyyy-mm-dd hh24:mi'), '제작비가 조금 부족했나? ', 0, 0,211,32);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (234, to_date('2023-12-31 11:58', 'yyyy-mm-dd hh24:mi'), '역사 왜곡의 극치다.. 퉤~~ ', 0, 0,212,32);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (235, to_date('2023-12-26 23:33', 'yyyy-mm-dd hh24:mi'), '강추합니다.^^ ', 0, 0,213,32);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (236, to_date('2023-12-20 03:05', 'yyyy-mm-dd hh24:mi'), '연출도 연기도 최고. 베테랑 배우들이라 다 연기 잘하는 줄 알고 있었는데 류준열은 응팔에서 일상연기 하던 이미지만 갖고있다가 이 영화에서 연기하는 거 보고 진짜 놀램.. ', 0, 0,214,32);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (237, to_date('2023-12-18 00:38', 'yyyy-mm-dd hh24:mi'), '우와 진짜 명작....몰입감 스토리 연기력 정말 최고입니다.^^ ', 0, 0,209,32);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (238, to_date('2023-11-30 23:27', 'yyyy-mm-dd hh24:mi'), '잘만들었네. 류준열 연기도 좋고. 스토리가 완벽한건 아니지만 흥미롭고, 연출이 쫀쫀한듯. ', 0, 0,215,32);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (239, to_date('2023-11-18 20:07', 'yyyy-mm-dd hh24:mi'), '유,류 배우님 캐미 짱감독님 짱 참 흥미진진 잼있네요 ', 0, 0,216,32);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (240, to_date('2023-10-16 16:46', 'yyyy-mm-dd hh24:mi'), '진짜 오랜만에 흥미진진한 사극영화를 봐서 너무 너무 좋았어요나온지 몇 년 된 사극영화만 돌려봤었는데ㅠㅠ진짜 재밌었어요 이런 재밌고 긴장감있는 사극 영화가 많이 나오면 좋겠어요 또 기존 실록에 있는 내용을 다수 포함시키니 더 몰입이 잘 됐어요 ', 0, 0,217,32);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (241, to_date('2023-09-28 13:49', 'yyyy-mm-dd hh24:mi'), '극장에서 봤는데 다시보고 싶어서 구매했어요~~다시봐도 재미있는 영화~~ ', 0, 0,218,32);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (242, to_date('2023-08-19 23:27', 'yyyy-mm-dd hh24:mi'), '들어도 못 들은 척, 봐도 못 본 척해야 살 수 있는 그 시대... ', 0, 0,219,32);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (243, to_date('2024-06-24 15:08', 'yyyy-mm-dd hh24:mi'), '너무 웃겨요.. 재밌어요 ㅋㅋㅋㅋㅋ ', 0, 0,220,33);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (244, to_date('2023-10-16 12:59', 'yyyy-mm-dd hh24:mi'), '재밌어요 3탄도 만들어주세요! :) ', 0, 0,217,33);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (245, to_date('2023-06-11 17:16', 'yyyy-mm-dd hh24:mi'), 'ㅋㅋㅋㅋ 스토리는 1편이 더 신선하고 재밌었지만, 라미란, 김무열, 라미란님 남편, 박진주님 연기 넘 재밌게 봤습니다~~ ', 1, 0,221,33);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (246, to_date('2022-11-13 15:38', 'yyyy-mm-dd hh24:mi'), '코믹, 감동, 교훈 보는 내내 많이 웃었네요.^^ ', 2, 0,222,33);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (247, to_date('2022-10-29 16:30', 'yyyy-mm-dd hh24:mi'), '역시 연기를 잘해요 재밌어요 ', 3, 1,223,33);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (248, to_date('2020-09-14 19:40', 'yyyy-mm-dd hh24:mi'), 'BEST청각장애인 이고 귀가 안들려서요언제 한글자막이 나올까요? ', 102, 3,224,34);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (249, to_date('2020-08-30 21:38', 'yyyy-mm-dd hh24:mi'), 'BEST그래도 마지막은 진짜 너무 했다..억지 감동...그게 이 영화를 완전히 망쳐버렸다ㅓ. ', 43, 2,158,34);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (250, to_date('2020-08-28 21:43', 'yyyy-mm-dd hh24:mi'), 'BEST식상한 줄거리에 늘어지는 전개, 그리고 신파극이 합쳐진 워킹데드 아류작. 결론은 돈이 아까웠음 ', 15, 3,225,34);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (251, to_date('2022-01-30 22:13', 'yyyy-mm-dd hh24:mi'), '생각보다 괜찮았음 아역배우 연기가 조금 오버 ', 0, 0,226,34);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (252, to_date('2021-02-18 03:44', 'yyyy-mm-dd hh24:mi'), '엉성해요... ㅎ ', 1, 0,227,34);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (253, to_date('2021-02-16 04:25', 'yyyy-mm-dd hh24:mi'), '좀비같은 인간들이 버글되는 대한민국. 그곳을 벗어 나고자 하는 인간들은 말한다. 헬조선 탈출이라고. ', 1, 0,24,34);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (254, to_date('2021-02-14 19:05', 'yyyy-mm-dd hh24:mi'), '마지막 주인공 헬기에 걸어가며 타는 모습 보고 간지 폭팔!! 역대급 신파~ 영화보고 놀라웠고~ 평론가 평점 보고 또 한번 놀랐다! ', 0, 0,228,34);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (255, to_date('2021-02-13 22:05', 'yyyy-mm-dd hh24:mi'), '1편 스토리는 연상호가 쓴 게 아니야. 그러니까 당연히 부산행하고 퀄리티 차이가 나는 거지. ', 1, 0,229,34);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (256, to_date('2021-02-13 01:51', 'yyyy-mm-dd hh24:mi'), '1편 감독이랑 동일 감독의 작품이라는게 믿겨지지가 않네 ', 1, 0,230,34);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (257, to_date('2021-02-12 04:51', 'yyyy-mm-dd hh24:mi'), '대체 영상이 왜 이렇게 끊기는 거죠.....? 화딱지나네.. ', 1, 0,231,34);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (258, to_date('2021-02-12 03:01', 'yyyy-mm-dd hh24:mi'), '무료일때 킬링타임용 외엔 비추.개연성이라고는 개나 줘버린 영화. 초장부터 허술해서 허탈한 웃음짓게 하더니 마지막까지 실망시키네요; ', 1, 0,232,34);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (259, to_date('2021-02-12 02:28', 'yyyy-mm-dd hh24:mi'), '신파 좀 적당히 넣어 짜증이 난다 시작부터 신파냐 ㅋ ', 2, 0,227,34);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (260, to_date('2021-02-11 23:28', 'yyyy-mm-dd hh24:mi'), 'ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ ', 1, 0,233,34);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (261, to_date('2021-12-13 16:33', 'yyyy-mm-dd hh24:mi'), '아무리 싸다지만 왜 자꾸 소리가 끊기죠? 나만 그런것도 아닌거같은데 걍 유튭 갑니다 ㅋㅋ ', 1, 0,234,35);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (262, to_date('2021-05-31 18:37', 'yyyy-mm-dd hh24:mi'), '상징적 거품만 잔뜩 낀 연출, 옷은 명품인데, 입고 있는 사람이 좀 그렇다고나 할까.. ㅋ 가난한 인간들이나 손가락 빨면서 위로 차릴 영화. ㅋㅋㅋ ', 1, 19,235,35);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (263, to_date('2021-01-03 14:37', 'yyyy-mm-dd hh24:mi'), '네이버 ㄳㄲ들아 돈 내고 보는데 계속 버벅거리네 장난치나? 여기서 사지 말고 유튜브에서 사세요. ', 5, 1,236,35);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (264, to_date('2020-12-09 10:05', 'yyyy-mm-dd hh24:mi'), '댓글창보니까 우리나라가 반지성주의에 먹혔다는게 잘드러나네 무식한 게 부끄럽다는 것을 좀 알아라 ', 15, 2,237,35);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (265, to_date('2020-11-15 08:08', 'yyyy-mm-dd hh24:mi'), '참 취향이 독특하다.이 영화가 상받기 전에 봤었지만. 이 영화 처음 보고 뭐 이런 영화가 있지? 했는데 해외에서 난리나더만 ㅋㅋ 뭘 말하려는지 뭘 얘기하려는지 그냥 제목 그대로 기생충처럼 기생하면서 사니까 ㅇㄴ 기생충이구나 했다. 그냥 뭐 뻔한 스토리에 뻔한 대사들 참신하다고 느껴본 적은 전혀 없었다. 소장가치 제로 영화 ㅇㄴ 조여정씨 정사씬이 있어서 그들이 좋아하는 거였나?. 흐음 그 외 있잖아 뭐 N번당이라고 ', 5, 37,238,35);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (266, to_date('2020-11-13 09:59', 'yyyy-mm-dd hh24:mi'), '칸 영화제 황금종려상, 골든 글로브 외국어 영화상, 영국 아카데미 외국어 영화상, 각본상 수상작, 비영어 영화 최초 미국배우조합 시상식(SAG Awards) 앙상블상, 제92회 미국 아카데미 시상식 아시아 최초의 동시 수상작 작품상, 비영어권 감독 최초의 감독상, 아시아 영화 최초 각본상, 국제 영화상 수상, 한국 최초 세자르 영화제 외국어영화상 수상의 위업을 달성한 영화계 역사상 개쩌는 최고의 작품 이 영화를 보고 감동을 못 느끼면 영알못 인증 ', 8, 3,239,35);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (267, to_date('2020-10-04 12:57', 'yyyy-mm-dd hh24:mi'), '유투브에서 사세요 ', 3, 4,240,35);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (268, to_date('2020-10-04 12:56', 'yyyy-mm-dd hh24:mi'), '네이버 영화 절대사지마삼 다 ㅄ같음 ', 3, 2,240,35);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (269, to_date('2020-07-09 09:37', 'yyyy-mm-dd hh24:mi'), '기대가 큰 만큼 기대 이하개인적으로 살인의 추억에 더 큰 점수를 준다. 다양한 연출 구도 메시지가 담긴 영화 ', 7, 12,241,35);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (270, to_date('2023-10-30 16:31', 'yyyy-mm-dd hh24:mi'), '자막없애서 보고싶은데 어떻게 하나요? ', 0, 0,242,36);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (271, to_date('2023-09-16 21:33', 'yyyy-mm-dd hh24:mi'), '미니언즈들 노래 부르는 거 겁나 귀여움 ㅋㅋㅋ그리고 그루랑 드루랑 환상(이라고 쓰고 환장이라고 읽습니다)의 콤비인 듯 ㅋㅋ ', 0, 0,243,36);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (272, to_date('2022-08-29 03:58', 'yyyy-mm-dd hh24:mi'), '슈퍼배드 12랑 다르게 3은 자막크기 조절이나 설정이 안되네요.. 자막을 영상에 붙인건가요? 자막크기가 너무 커서 불편합니다;; ', 0, 0,244,36);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (273, to_date('2022-07-28 15:12', 'yyyy-mm-dd hh24:mi'), '미리보기가 재생이 되어서 구매함 근데 재생이 안되네요 ㅜㅜ ', 0, 0,245,36);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (274, to_date('2021-02-23 09:40', 'yyyy-mm-dd hh24:mi'), '너무 재밌어요짱! ', 1, 0,246,36);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (275, to_date('2018-07-15 03:17', 'yyyy-mm-dd hh24:mi'), '미니언즈도 귀엽지만 그루 캐릭터가 정말 사랑스러워서 보는내내 유쾌하게 봤네요 영화 꼭 보세요:) ', 1, 0,176,36);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (276, to_date('2018-01-21 13:19', 'yyyy-mm-dd hh24:mi'), '자막 대여했는데 왜 더빙이 재생되는지 모르겠네요 ㅡㅡ ', 1, 0,247,36);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (277, to_date('2017-10-21 23:52', 'yyyy-mm-dd hh24:mi'), '짱 ', 1, 0,248,36);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (278, to_date('2017-09-27 20:34', 'yyyy-mm-dd hh24:mi'), '짱 재밋는데 ', 1, 0,249,36);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (279, to_date('2017-09-04 11:38', 'yyyy-mm-dd hh24:mi'), '빠~~나나 ', 3, 0,250,36);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (280, to_date('2023-12-29 21:21', 'yyyy-mm-dd hh24:mi'), '뭘 말하는거임? 가려서 먹으란 건가 ㅋ ', 0, 0,251,37);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (281, to_date('2022-09-16 03:01', 'yyyy-mm-dd hh24:mi'), 'd^0^b GOOD ~ ! ', 0, 0,12,37);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (282, to_date('2021-08-06 08:19', 'yyyy-mm-dd hh24:mi'), 'B급 영화의 최고봉.예술을 하려고 한다. 인정 ', 1, 0,252,37);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (283, to_date('2021-07-06 21:34', 'yyyy-mm-dd hh24:mi'), '여주가 고등학생 정도인가? 암튼 어린 나이고, 남주는 30대? 결과는 했다. 그리고 댓가는 가혹했다. 남주의 시간을 되돌려 다시 그 첫만남으로 돌아간다면, 그래도 해! 라고 소리칠꺼다. 했으면 성공한 인생이야! 해!!! ', 2, 1,253,37);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (284, to_date('2021-04-16 11:11', 'yyyy-mm-dd hh24:mi'), '그냥 비주류 영화본다는 느낌으로 보셈 뭐 그이상을 바라진말고 조수정 배우 보려고 봤는데 ㄹㅇ 쪼끔나오심ㅠ ', 1, 0,254,37);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (285, to_date('2021-03-27 12:26', 'yyyy-mm-dd hh24:mi'), '미리보기 초반부터... ', 0, 0,148,37);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (286, to_date('2021-03-26 12:00', 'yyyy-mm-dd hh24:mi'), '19로 이 영화 보지 마세요~ 감독 보고 영화 보지 마세요... 이 영화 정말 잘 만든 걸작입니다. 여주인공 대사에 남자 표정보고 빵빵 터집니다.ㅎㅎㅎ ', 1, 2,255,37);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (287, to_date('2021-03-21 23:39', 'yyyy-mm-dd hh24:mi'), '난 분명 좋좋소 검색했었다. ', 0, 0,256,37);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (288, to_date('2021-03-15 20:57', 'yyyy-mm-dd hh24:mi'), '이거 생각보다 명작인데;; ', 6, 1,257,37);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (289, to_date('2021-03-03 04:10', 'yyyy-mm-dd hh24:mi'), 'hd가 뭐냐 인간적으로 ', 5, 0,258,37);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (290, to_date('2023-09-08 21:07', 'yyyy-mm-dd hh24:mi'), '아바타 스타 슈 ', 0, 0,259,38);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (291, to_date('2023-09-08 21:07', 'yyyy-mm-dd hh24:mi'), '과자 나 라 옹스 시리 즈 도 해주 세 요 ', 0, 0,259,38);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (292, to_date('2023-08-30 23:31', 'yyyy-mm-dd hh24:mi'), '저 자막 구매하려했는데 잘못 구매했어요 ㅠㅠ 환불 어떻게 하나요? ', 1, 0,243,38);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (293, to_date('2020-01-03 22:20', 'yyyy-mm-dd hh24:mi'), '시파 DRM 을 처음부터 표기를 하던가 이 시파 네이버 쉐리들아 환불해줘DRM받을 필요도 없으니까 환발 해라 이 시파 네이년쉐리들아 ', 1, 4,260,38);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (294, to_date('2019-03-10 13:16', 'yyyy-mm-dd hh24:mi'), '처음에 시작할 때 내용이 짤려있어요 이게 무슨 경우죠? ', 1, 0,261,38);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (295, to_date('2017-08-13 16:16', 'yyyy-mm-dd hh24:mi'), '자막으로 구매햇어야 했는데 더빙으로 잘못했어요 ㅠㅠㅊ서 가능한가요 ? ㅠ ', 1, 0,262,38);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (296, to_date('2017-07-23 16:29', 'yyyy-mm-dd hh24:mi'), '네이버 다시는 안쓴다 ', 2, 0,263,38);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (297, to_date('2015-07-31 03:41', 'yyyy-mm-dd hh24:mi'), '자막 슈퍼배드1꺼이고 2편받았는데 자막안맞음 환불해줘요 ', 4, 1,264,38);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (298, to_date('2014-12-30 00:18', 'yyyy-mm-dd hh24:mi'), '더빙인데 싱크하나도안맞고 뚝뚝끊겨서 볼수가 없네요ㅡㅡ환불안되나요?진심 처음부터끊기고 몇번을켯다꺼도이러고 돈내고 네이버라는 검증?된곳에서 다운받는건데 짜증나게봐야합니까? 제대로된 영화판매하세여ㅡㅡ돈 아까움 ', 12, 0,265,38);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (299, to_date('2023-09-08 21:05', 'yyyy-mm-dd hh24:mi'), 'Garfield and friends 복구해주세요 ', 0, 0,259,39);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (300, to_date('2017-02-04 20:40', 'yyyy-mm-dd hh24:mi'), '결재 다 끝났는데 재생을 위한 라이선스 획득에 실패하였습니다 네트웍을 확인하세요 라고 안내가 뜨네요 ㅠㅠ 우리측 네트웍은 이상없는데... 환불해 주세요~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ', 1, 0,266,39);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (301, to_date('2016-08-14 13:44', 'yyyy-mm-dd hh24:mi'), '소리가 안 나와요 ', 1, 0,267,39);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (302, to_date('2024-06-25 02:45', 'yyyy-mm-dd hh24:mi'), '2024년의 최고의 영화였다. ', 0, 0,268,41);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (303, to_date('2024-05-04 18:56', 'yyyy-mm-dd hh24:mi'), '해피엔딩이 될 수 있는 세상이 되길 바라 ', 4, 0,269,42);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (304, to_date('2024-04-27 23:17', 'yyyy-mm-dd hh24:mi'), '이거 일정사이에 시간이 붕떠서, 아무생각 없이 본 영화였는데 진짜 감탄했어요. ', 0, 0,82,42);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (305, to_date('2024-03-31 01:46', 'yyyy-mm-dd hh24:mi'), '쇼타끼리의 우정과 애정을 다룬 영화 정말 감동이군요 ', 1, 22,270,42);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (306, to_date('2024-03-24 00:18', 'yyyy-mm-dd hh24:mi'), '2023년 나에겐 매버릭과 더불어 최고의 영화였다 ', 1, 0,271,42);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (307, to_date('2024-03-22 19:03', 'yyyy-mm-dd hh24:mi'), '마지막 장면은 내가 힘들때마다 튀어나와서 나를 숨쉬게 한다. ', 5, 0,272,42);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (308, to_date('2024-03-20 17:36', 'yyyy-mm-dd hh24:mi'), '평생 내 마음 속에 간직하고 싶다.. ', 5, 0,118,42);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (309, to_date('2024-03-15 09:29', 'yyyy-mm-dd hh24:mi'), '진짜 인생영화ㅠㅠ 이런 명작 못 본사람 없게 해주세요ㅠㅠ 처음 영화를 보고 마지막 부분 뭐지?? 아니지?? 이러면서 끝나고 두번째 볼땐 하염없이 눈물만 흐르고ㅠㅠ 세번째부터는 울면서 웃고있는나를 발견하는 영화다ㅠㅠ 감독님이 마지막부분 축복하는 의미로 그렇게 찍었다고했는데.. 여러번 보다보면 어느 순간 그 의미를 알거 같아 또 눈물이 흐르더라.. 이 영화는 진찌 최소 두번은 보새요ㅠㅠ ', 7, 3,273,42);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (310, to_date('2024-03-12 09:03', 'yyyy-mm-dd hh24:mi'), '두 번 봐야 진정으로 영화를 본 것이다 ', 5, 0,118,42);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (311, to_date('2024-03-09 16:13', 'yyyy-mm-dd hh24:mi'), '히로카즈 영화중에서 치고중 하나네요. 라쇼몽생각도 나구요. 히로카즈 감독은 일본이라는 공간에서, 일본배우들과 작업할 때 가장 빼어난 작품을 만들어는 것 같습니다. 뭔가 일본스러운 묘미가 느껴지는. ', 1, 1,274,42);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (312, to_date('2024-03-08 19:53', 'yyyy-mm-dd hh24:mi'), '그냥 보세요 나무위키 이런거 보지말고 각본이 진짜 쩝니다.. ', 3, 0,275,42);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (313, to_date('2023-04-24 23:48', 'yyyy-mm-dd hh24:mi'), 'BEST살면서 후회도 많이 하고, 그때 그랬더라면...하는 생각에 빠져보기도 합니다. 그러나 그때의 나의 어리석음과 실수는 저쪽 유니버스의 나에게로 맡겨버리고... 모든 것이 될수있고, 어디에나 갈 수 있었음에도 지금 이 자리에 있도록 만들어준 무수한 나의 선택들은 나의 몫으로 . 그저 사랑하고 이해하고, 서로 다른 우주를 지닌 내 곁의 사람들과 부딪혀가며 살아갑니다. 또 다시 시작하고. 새로운 선택들을 하며 나의 우주, 나의 자리를 만들어갑니다. ', 35, 0,276,43);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (314, to_date('2023-12-17 23:28', 'yyyy-mm-dd hh24:mi'), '멀티버스 적응하느라 정신 못 차리고 온갖 희한한 짓에 감당하기 힘들어질 무렵 영화가 한 번 끝난다. 그리고 돌이 되는데 그때부터 이 영화가 점점 마음에 들기 시작한다. 내 이상형은 이제부터 "세상을 밝게 보는 다정한 사람"이며, 이 영화에 장르의 구분이 '없다'라고 생각했는데 '진정한 사랑'이었다. 감동적이라 울다가 병맛코미디 짜증나서 웃다가 여러모로 다채로워져서 이제 인생영화가 바뀌기 직전이다. 오랜만에 제대로 울다가 웃다가 난리나는 영화였다. ', 3, 0,277,43);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (315, to_date('2023-06-10 20:35', 'yyyy-mm-dd hh24:mi'), '요란하게 쿵푸하면서 날뛸 땐 양놈들의 오리엔탈리즘 언제 멸망하나 생각했지만 (얘들아 여기 널린 게 복싱 체육관이다) 감각적인 미장센으로 그 **움을 커버했음. 벡델 테스트는 껌으로 통과할 것 같아서 편하게 볼 수 있었고, 멀티버스라는 난잡한 개념을 관통하는 주체가 사랑이라는 걸 수미상관 맞춰서 아름답게, 고리타분하지 않게 잘 그려낸 듯. 영화상에서 등장한 모녀가 아시안이라 그런지 모녀 관계의 뒤틀린 애증이 내 발작버튼을 누르는 바람에 눈물 ** 흘림. 확실히 오락 영화가 아니고 예술 영화 쪽인데(미장센이 ㄹㅇ 빡셈) 예술 영화 특유의 찝찝함이 없어서 몰입감도 있고 재미도 있었음. 어디까지나 평론가들의 지적 허영 뽕채우기용 노잼영화들보다 재밌다는 거긴 한데... 여튼 구매 아깝지 않다 ', 3, 4,278,43);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (316, to_date('2023-06-10 20:32', 'yyyy-mm-dd hh24:mi'), '정말 부모한테 하는 꼬라지가 가만 앉아 참기 힘드네 응. 어른한테 눈 부라리는 거부터 말하는 싹퉁바가지에 할아버지께서 늙은 몸에 멀리서 오셨는데 용기내서 하려는 소리가 '하나뿐인 손녀가 사실 게이예요'??? 애라 썩을. 말도 사람 가려가면서 해야지. 한 평생 옛날 가치관으로 살아오신 분한테 갑자기 그렇게 말하면 기분 좋겠나? 집 불탄 사람 앞에서 불놀이 하는 격일세. 쓰고 보니 참 용기가 필요한 일이긴 하네. 맞아 죽을 용기. 꼭~~ 저런 OOO이 자기는 부모 입장 헤아리지 않는 거 생각 못하고 부모가 지 입장을 몰라준대요. 부모가 헤아려주는 게 100이면 지새끼는 1이라도 될까말까. 아주 지딴엔 비운의 공주지 암. 아이폰 새로 나올 때마다 갈아주고 거지처럼 안 보이려면 달에 300씩은 줘야하는 게 지당하신 부모의 도린데 그것도 못해주니 응. 내 자식이 저랬다면은 핏줄이고 뭐고 당장에 호적 파버리고 힘들어도 열심히 사는 애들한테 기부하련다. ', 1, 27,37,43);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (317, to_date('2023-06-10 05:54', 'yyyy-mm-dd hh24:mi'), '영화 보는 내내 계쏙 울었어요 인생영화예요 이제 사랑해요 ', 3, 2,279,43);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (318, to_date('2023-04-29 16:55', 'yyyy-mm-dd hh24:mi'), '삶에 회의감이 들고 내 삶이 힘들다고 생각했을 때 더욱더 내 주변을 둘러보고 긍정적인 생각과 긍정적인 마음가짐을 가져야겠다는 생각을 하게 되었습니다 진짜 너무 좋은 영화였습니다 모든 연출과 상황들이 그 이유가 있어서 더욱더 좋았던 것 같습니다 ', 2, 2,83,43);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (319, to_date('2023-04-08 16:20', 'yyyy-mm-dd hh24:mi'), '친구가 인생영화라고 해서 봤어요근데 중간에 뭔 내용인지.. 갑자기 싸우고 쿵푸하고... 머리아파서 꺼버리고싶었는데 그냥 계속 봤습니다 친구의 인생영화라고 해서요 근데 끝까지 다 보길 잘했구나 생각이드는 영화였습니다 삶에 대해 많은 생각을 할 수 있게 만들어주는 영화네요 영화 추천해준 친구에게 감사함을 표합니다 ', 4, 1,280,43);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (320, to_date('2023-03-30 20:23', 'yyyy-mm-dd hh24:mi'), '독특한 연출은 호불호가 갈릴 것 같습니다.저는 개인적으로 괜찮은 것 같아요:) 스토리는 중반부부터 좀 루즈해집니다. 이해가 안되는건 아닌데, 특이한 연출 때문인지 보다보면 스토리가 뭐였지? 싶습니다. 그래도 마무리도 깔끔하고, 전반적으로 괜찮았습니다. ', 0, 2,281,43);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (321, to_date('2023-03-29 23:59', 'yyyy-mm-dd hh24:mi'), '허무맹랑함 속에 숨겨진 철학 왜 다들 인생영화로 이 영화를 말했는지 이제야 이해가 된다 ', 1, 2,282,43);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (322, to_date('2023-03-28 23:08', 'yyyy-mm-dd hh24:mi'), '머리로 이해하지 못한 부분들은 가슴으로 느꼈다. ', 1, 2,283,43);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (323, to_date('2024-05-29 22:46', 'yyyy-mm-dd hh24:mi'), '자막 없이 보는 방법 있나요? ', 0, 0,284,44);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (324, to_date('2022-12-30 13:23', 'yyyy-mm-dd hh24:mi'), '너무귀여워 미니언들 ', 0, 0,285,44);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (325, to_date('2022-08-19 05:27', 'yyyy-mm-dd hh24:mi'), '역시 밥은 실망시키지않아요!! ', 3, 0,286,44);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (326, to_date('2024-07-07 23:04', 'yyyy-mm-dd hh24:mi'), '난 끊김없이 잘봄. 1보다 조금 약한데 나쁘지않음 ', 1, 0,287,45);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (327, to_date('2024-06-26 23:38', 'yyyy-mm-dd hh24:mi'), '엄청 끊기네요 네이버에서 사지마세용 ', 1, 0,288,45);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (328, to_date('2024-05-17 21:08', 'yyyy-mm-dd hh24:mi'), '화면 깨짐? 깜박임? 현상 그대로입니다. 몇 분 보다가 확인차 처음부터 다시 돌려봐도 동일 증상 반복됩니다. 시스템 문제 점검 해봐도 해당되는 오류들 없음에도 동일 증상이 발생합니다. 몇 분 보다가 집중이 안되서 환불 요청했습니다. 환불은 받았으나 저를 거짓말쟁이로 몰아가네요?? 메일에 다음 문구는 뭘까요? [예외적으로 1회에 한하여 환불을 완료하였습니다.] [더불어, 해당 콘텐츠 재생 시 오류가 재현되지 않고 있습니다. 추후 이용 내역이 확인되는 콘텐츠는 환불을 도움드릴 수 없으니, 이용에 문제가 있을 경우 오류 화면 첨부 및 문제사항을 기재하여 문의를 접수해 주시길 바랍니다.] 제품에 하자가 있어 사용을 못했다면 환불은 당연한거 아닐까요? 문제보고를 했으면 정확히 문제를 검수해야하는거 아닌가요? 아래 댓글들 동일한 증상 코멘트 하고 있는데 이 분들 모두 다 거짓말쟁인가요? 1년전 댓들이라 오류 해결된 줄 알았는데 그대로 입니다. 아직도 문제 있어요. 구입 전 참고 하세요. ', 1, 0,289,45);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (329, to_date('2022-07-11 14:46', 'yyyy-mm-dd hh24:mi'), '화면 완전 깨져요 웨이브에서도 결제했는데 똑같이 화면 깨지는 거 보면 영화 자체의 문제인듯 ㅠㅠ ', 3, 0,290,45);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (330, to_date('2022-06-16 23:18', 'yyyy-mm-dd hh24:mi'), '개연성들이 부족함 하지만 볼만은합니다 ', 0, 0,83,45);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (331, to_date('2022-05-29 21:56', 'yyyy-mm-dd hh24:mi'), '뭐임 화면 자꾸 깨져요 빡치네 ', 4, 0,291,45);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (332, to_date('2022-03-29 16:32', 'yyyy-mm-dd hh24:mi'), '좀비물이나 다른 아포칼립스물에서의 나오는 애들에 비하면 이 가족의 남매는 정말 훌륭한 천사지. 그래서 소리가 꽤 제한된 영화지만 답답함이 전혀 없음. ', 0, 0,292,45);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (333, to_date('2022-03-28 15:14', 'yyyy-mm-dd hh24:mi'), '영화관에서 소리 빵빵하게 봐야 이 영화 제대로 감상 가능. 그래도 이어폰으로 봐도 재밌다 ', 0, 0,293,45);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (334, to_date('2022-02-14 21:37', 'yyyy-mm-dd hh24:mi'), '짜증나게 끝나넹 ', 0, 0,294,45);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (335, to_date('2022-01-16 14:44', 'yyyy-mm-dd hh24:mi'), '발암요소 가득... ', 0, 1,295,45);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (336, to_date('2020-09-05 06:21', 'yyyy-mm-dd hh24:mi'), 'BEST댓글 낚시 적당히좀 하세요 ㅋㅋㅋㅋㅋㅋ진짜 모르고 봤다가 트리거 눌리는 사람 있으면 어쩔려고그래요 생각좀 하고 사세요들 ', 94, 10,296,46);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (337, to_date('2020-09-05 13:13', 'yyyy-mm-dd hh24:mi'), 'BEST절대 힐링 영화 아닙니다. 공포/고어 장르이며힐링 영화라고 속아서 보시는 분들 있으시다면 재고해주세요. ', 81, 4,297,46);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (338, to_date('2020-09-05 17:34', 'yyyy-mm-dd hh24:mi'), 'BEST.이거 힐링물이라고 말하는 사람 아마 전부가 그거에 속아서 무서워하는 사람들 보고싶어서 그런 거 같은데 진짜 무식하고 멍청해보인다. 농담도 정도가 있지 이건 재미요소가 아니라 트리거요소가 다분한 영화라 사람들 놀리면 안되는 영화임.. ', 78, 8,298,46);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (339, to_date('2024-07-03 20:57', 'yyyy-mm-dd hh24:mi'), '갑툭튀는 싫어 하는데 이건 그런게 없어서 진짜 잘 봄 다만 후반부 관계 하는 장면은 내 인생 역대급 으로 토하고 싶어지는 더러운 장면 감독은 그걸 노린거 같음 처음에 일반 보고 추가 내용 보려고 감독판 보는데 개인적 으로는 명작임 ', 0, 0,299,46);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (340, to_date('2024-06-25 20:59', 'yyyy-mm-dd hh24:mi'), '레드벨벳 신곡 뮤비보고 생각나서 다시 왔어요. :) 쉽지는 않은 영화인데 잘 만든 것 같아요. ', 1, 0,300,46);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (341, to_date('2024-03-09 14:14', 'yyyy-mm-dd hh24:mi'), '이 세상에 없던, 굳이 없어도 됐던 힐링 호러무비 ', 0, 0,301,46);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (342, to_date('2024-02-17 04:08', 'yyyy-mm-dd hh24:mi'), '펠레 이 자식 이름부터가 반대로 말하고 있는데 ', 0, 0,302,46);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (343, to_date('2024-01-26 15:09', 'yyyy-mm-dd hh24:mi'), '2:06:39 에버랜드 직원교육 ', 0, 0,301,46);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (344, to_date('2023-06-23 00:53', 'yyyy-mm-dd hh24:mi'), '해외인데.. 보고 싶어요 제발..하.. 아... 아아... 아... ', 0, 0,303,46);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (345, to_date('2022-08-22 01:32', 'yyyy-mm-dd hh24:mi'), 'wow!!!! 두번째 보는데 이해하려면 생각 말고 그냥 한번더!!!! ', 0, 0,304,46);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (346, to_date('2022-03-16 06:00', 'yyyy-mm-dd hh24:mi'), '공포영화는 아니고 약간 혐오영화느낌? 하나도 안무서운데 걍 불쾌함. 잘 만든지는 모르겠음/ 일단 감독판 너무 김 보다 하품나올정도로 ', 2, 0,305,46);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (347, to_date('2022-01-14 19:10', 'yyyy-mm-dd hh24:mi'), '영화가 토나옴.ㅋ ', 0, 0,306,46);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (348, to_date('2021-09-12 16:55', 'yyyy-mm-dd hh24:mi'), '이미 포스터에 공포영화 적혀있는데 낚이고 보는 사람들이 있기나 하겠나 ', 2, 1,307,46);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (349, to_date('2018-08-05 14:08', 'yyyy-mm-dd hh24:mi'), 'BEST이딴식으로하면서 유투브가 영상 시장 점한다고 기사냈냐 ㅋㅋㅋㅋㅋㅋㅋㅋ ', 30, 3,308,48);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (350, to_date('2019-01-27 17:41', 'yyyy-mm-dd hh24:mi'), 'BEST먼치킨 시원시원하다 2편 언제나옴? ', 21, 2,180,48);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (351, to_date('2024-01-06 00:22', 'yyyy-mm-dd hh24:mi'), '난 잘 되는디...? ', 0, 0,309,48);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (352, to_date('2023-08-01 20:38', 'yyyy-mm-dd hh24:mi'), '장난하냐? 플레이가 안되잖아 새로고침만10번했는데 돈 물어내 ', 0, 0,310,48);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (353, to_date('2022-07-03 19:07', 'yyyy-mm-dd hh24:mi'), '휴 후기 너무 안좋아서 그냥 유투브로 대여했어요~ 심지어 유투브가 100원이나 더 싸네요 ^^ ', 0, 1,311,48);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (354, to_date('2022-07-02 08:48', 'yyyy-mm-dd hh24:mi'), '네이버 이 따위로 하니까 주가 바닥치지 구글덕에 덕봤지 대주주 좀 팔았냐? ', 0, 1,312,48);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (355, to_date('2022-07-01 15:20', 'yyyy-mm-dd hh24:mi'), '버퍼링 때문에 감상을 못함 ', 0, 1,313,48);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (356, to_date('2022-06-26 18:54', 'yyyy-mm-dd hh24:mi'), '하도 네이버 평이 안 좋아서 유튜브로 구매했음 ㄳㄳ ㅋㅋ ', 0, 1,314,48);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (357, to_date('2022-06-25 21:09', 'yyyy-mm-dd hh24:mi'), '소리가 너무너무 작음ㅡㅡ ', 0, 2,315,48);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (358, to_date('2022-06-24 10:08', 'yyyy-mm-dd hh24:mi'), '답답해 미치겟어요 ~.. ', 1, 0,316,48);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (359, to_date('2022-06-22 07:39', 'yyyy-mm-dd hh24:mi'), '아니 시바 영상을 볼수가없는데 대여비는 왜쳐받냐 양심좀있어라 진짜 ', 2, 1,317,48);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (360, to_date('2022-06-20 14:52', 'yyyy-mm-dd hh24:mi'), '버퍼링 진짜 심하네 무료로 해줘도 못보겠다 아ㅡㅡ ', 1, 2,318,48);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (361, to_date('2016-04-02 16:05', 'yyyy-mm-dd hh24:mi'), 'BEST아무 생각없이 예전 처럼 천 단위겠거니 생각하고 가격 자체를 안보고 쭉 결제했다. 가격도 안보고 결제한 내가 바보는 맞는데 이딴 화질로 이딴 가격 건 네이버도 미친게 아닌가 싶음 근데 최고 화질도 아직 720p더라? 30초 봤다고 환불도 안됨. 캠버전하고 화질이 같아. 자막도 자체 자막이고. 블루레이 발매 이전에 바짝 벌고 빠지자고 메인에 광고까지 걸어놨나? 세상이 발전하고 있다고 네이버의 의식수준도 발전하고 있을 거라고 여겼던 멍청한 나 자신과 그딴 거 없이 묵묵히 후질근한 짓거릴 아직 하고있는 이 행태에 복합적 분노가 치밀어 오르는구만 ', 29, 1,319,49);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (362, to_date('2016-04-05 14:00', 'yyyy-mm-dd hh24:mi'), 'BEST결제하러 들어왔는데 댓글이 살림ㅜㅜ ㄳㄳ ', 22, 0,320,49);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (363, to_date('2016-04-27 11:22', 'yyyy-mm-dd hh24:mi'), 'BEST화질이 문제가 아니고 자막이 황석희씨 자막인가요?? ', 16, 0,321,49);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (364, to_date('2022-08-13 22:48', 'yyyy-mm-dd hh24:mi'), '아니 왜 대여가 없음;; 스트리밍처럼 그냥 보고 싶다구요.. 이걸 내가 소장해서 뭐하겠어요. ', 1, 0,322,49);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (365, to_date('2022-04-12 14:28', 'yyyy-mm-dd hh24:mi'), '오픈닝보다가 빵 터진 작품은 얘가 처음이에요. 🤣ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ ~~ ', 0, 0,323,49);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (366, to_date('2020-08-19 20:35', 'yyyy-mm-dd hh24:mi'), '컴퓨터 포맷하면 다운로드 받을 수도 없는 영상에 스트리밍도 5년제한 구매가 무슨 의미가 있는거임..... ', 2, 0,324,49);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (367, to_date('2020-03-12 00:18', 'yyyy-mm-dd hh24:mi'), '화면의 좌우를 복원하십시오. ', 0, 0,325,49);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (368, to_date('2019-04-30 12:00', 'yyyy-mm-dd hh24:mi'), '화면비율... What the #@$%!?...REALLY?...잘린 상,하 화면 살렸다는 리뷰에 속음ㅠ ', 1, 0,326,49);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (369, to_date('2019-01-19 00:57', 'yyyy-mm-dd hh24:mi'), '개인 PC에 다운받고 옮긴적 없는데 재생 안돼요 네이버 짜증남 ', 0, 0,327,49);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (370, to_date('2018-07-03 19:36', 'yyyy-mm-dd hh24:mi'), '왜 플레이가 안돼죠? ', 0, 0,328,49);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (371, to_date('2018-06-30 18:54', 'yyyy-mm-dd hh24:mi'), '1500원이면 과자 한 봉지 값! 데드풀 못 봤는데 구매합니당~ ', 0, 1,329,49);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (372, to_date('2018-06-07 14:07', 'yyyy-mm-dd hh24:mi'), '덧글 상태 왜이래.... 다운 받아야 하나? ', 1, 0,330,49);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (373, to_date('2013-07-05 19:31', 'yyyy-mm-dd hh24:mi'), 'BESTBeforeSunrise 》 BeforeSunset 》BeforeMidnight 순서대로 보시는게 조아요. 경이로운 영화입니다. ', 42, 2,331,50);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (374, to_date('2013-07-04 16:12', 'yyyy-mm-dd hh24:mi'), 'BEST악 벌써 들어왔네요! 비포 시리즈 중에 가장 리얼리티 있음! ', 25, 1,332,50);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (375, to_date('2017-04-05 21:00', 'yyyy-mm-dd hh24:mi'), 'BEST가슴설레는 로맨틱함은 1편이면 충분하고3편에서는 어느새 피로한 찌질해보이는 결혼생활의 현재진행형이네요 한결같은관계는 없으니..어쩌면 자연스럽네요 멀리서보면 이마저도 아름다울듯합니다 ', 19, 0,333,50);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (376, to_date('2022-12-29 19:31', 'yyyy-mm-dd hh24:mi'), '지겹고 재미없다. 앞부분 차안에서 잡담하는 부분 특히 ', 0, 2,334,50);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (377, to_date('2022-12-29 17:41', 'yyyy-mm-dd hh24:mi'), '실제 부부가 아무리 사이가 좋다고 해도 저렇게 길게 서로 말을 나눠가면서 과연 길게 이야기 할 수있을까? 이거 환타지 SF 시리즈 아닐런지 연애 할 때는 그럴수 있다고 하지만 아이까지 있는 부부가! ', 1, 0,335,50);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (378, to_date('2022-12-25 21:25', 'yyyy-mm-dd hh24:mi'), '그렇죠? 순서대로 보는 게 조겠죠? 순서대로 안 보고 이것만 보게 되었는데 인상? 깊은 아니면 감동적?인 것 같다 ', 0, 0,148,50);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (379, to_date('2022-09-25 15:01', 'yyyy-mm-dd hh24:mi'), '저는 오히려 현실적인 사랑을 보여주는 이 영화가 더 인상깊었어요. 사실 웹툰, 드라마처럼 밝고 마법같은 사랑은 현실엔 없잖아요. 다툼이 있어도 서로가 어떻게 이해하고 응어리를 푸는지의 그 과정을 보니 역설적으로 현실적인 사랑이 더 멋있어 보이는 건 왜일까요! 좋은 영화 감사합니다 :) ', 2, 0,336,50);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (380, to_date('2022-02-15 16:24', 'yyyy-mm-dd hh24:mi'), '두 배우가 20년에 걸쳐 만든 명작이네요 ', 4, 0,337,50);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (381, to_date('2021-10-17 17:32', 'yyyy-mm-dd hh24:mi'), '개봉할 때 타이밍을 놓치고 지금에서야 봅니다. 지나치게 현실적이어서 보지 말걸 그랬다는 분도 계시지만요. 오히려 리얼한 현실 속에서 제시와 셀린느가 살아가는 그들만의 방식을 찾는 게 좋았습니다. 판타지나 동화 속 사랑이 아니라면, 결국은 이렇게 타협점을 찾아가며 살아가야 하지 않을까요. 좋은 마무리였습니다. ', 4, 0,338,50);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (382, to_date('2021-05-02 13:09', 'yyyy-mm-dd hh24:mi'), '1편만 볼 걸.. 하 대여값 아까워서 억지로 다 봤네 ', 3, 7,339,50);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (383, to_date('2021-04-29 23:12', 'yyyy-mm-dd hh24:mi'), '청불인데 왜 묵음처리했는지... ', 0, 1,340,50);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (384, to_date('2021-03-21 14:23', 'yyyy-mm-dd hh24:mi'), '순차적으로 보다가 비포미드나잇만 안 풀려서 계속 기다렸습니다. 디알엠 프리라 이제 소장겸 구매하고 갑니다 ', 4, 0,341,50);
insert into Comments (comment_id, comment_date, comment_content, likes_count, dislikes_count, netizen_id, usagemethod_id) values (385, to_date('2019-07-01 15:33', 'yyyy-mm-dd hh24:mi'), '시리즈라 앞에 것도 봐야할가 봅니다. 탄탄한 줄거리에 믿음이 가는 영화! ', 4, 0,342,50);
            

-- 감독
INSERT INTO director (director_id, director_name) VALUES (1, '김성한');
INSERT INTO director (director_id, director_name) VALUES (2, '허명행');
INSERT INTO director (director_id, director_name) VALUES (3, '박규태');
INSERT INTO director (director_id, director_name) VALUES (4, '곤 사토시');
INSERT INTO director (director_id, director_name) VALUES (5, '모홍진');
--INSERT INTO director (director_id, director_name) VALUES (6, '김성한');
INSERT INTO director (director_id, director_name) VALUES (7, '피트 닥터');
INSERT INTO director (director_id, director_name) VALUES (8, '신카이 마코토');
--INSERT INTO director (director_id, director_name) VALUES (9, '허명행');
INSERT INTO director (director_id, director_name) VALUES (10, '아딜 엘 아르비');
INSERT INTO director (director_id, director_name) VALUES (11, '고레에다 히로카즈');
INSERT INTO director (director_id, director_name) VALUES (12, '기타노 다케시');
INSERT INTO director (director_id, director_name) VALUES (13, '마이클 사노스키');
INSERT INTO director (director_id, director_name) VALUES (14, '김세휘');
INSERT INTO director (director_id, director_name) VALUES (15, '박훈정');
--INSERT INTO director (director_id, director_name) VALUES (16, '박훈정');
INSERT INTO director (director_id, director_name) VALUES (17, '민용근');
INSERT INTO director (director_id, director_name) VALUES (18, '피터 손');
--INSERT INTO director (director_id, director_name) VALUES (19, '신카이 마코토');
INSERT INTO director (director_id, director_name) VALUES (20, '류승완');
--INSERT INTO director (director_id, director_name) VALUES (21, '신카이 마코토');
INSERT INTO director (director_id, director_name) VALUES (22, '우에다 신이치로');
INSERT INTO director (director_id, director_name) VALUES (23, '드니 빌뇌브');
INSERT INTO director (director_id, director_name) VALUES (24, '남대중');
INSERT INTO director (director_id, director_name) VALUES (25, '조지 밀러');
INSERT INTO director (director_id, director_name) VALUES (26, '피에르 꼬팽');
INSERT INTO director (director_id, director_name) VALUES (27, '타치카와 유즈루');
INSERT INTO director (director_id, director_name) VALUES (28, '김대우');
INSERT INTO director (director_id, director_name) VALUES (29, '이시하라 슌스케');
--INSERT INTO director (director_id, director_name) VALUES (30, '신카이 마코토');
INSERT INTO director (director_id, director_name) VALUES (31, '장재현');
INSERT INTO director (director_id, director_name) VALUES (32, '안태진');
INSERT INTO director (director_id, director_name) VALUES (33, '장유정');
INSERT INTO director (director_id, director_name) VALUES (34, '연상호');
INSERT INTO director (director_id, director_name) VALUES (35, '봉준호');
INSERT INTO director (director_id, director_name) VALUES (36, '카일 발다');
INSERT INTO director (director_id, director_name) VALUES (37, '봉만대');
--INSERT INTO director (director_id, director_name) VALUES (38, '피에르 꼬팽');
--INSERT INTO director (director_id, director_name) VALUES (39, '피에르 꼬팽');
--INSERT INTO director (director_id, director_name) VALUES (40, '아딜 엘 아르비');
INSERT INTO director (director_id, director_name) VALUES (41, '지오르고스 란디모스');
--INSERT INTO director (director_id, director_name) VALUES (42, '고레에다 히로카즈');
INSERT INTO director (director_id, director_name) VALUES (43, '다니엘 콴');
--INSERT INTO director (director_id, director_name) VALUES (44, '카일 발다');
INSERT INTO director (director_id, director_name) VALUES (45, '존 크래신스키');
INSERT INTO director (director_id, director_name) VALUES (46, '아리 에스터');
INSERT INTO director (director_id, director_name) VALUES (47, '강지은');
--INSERT INTO director (director_id, director_name) VALUES (48, '박훈정');
INSERT INTO director (director_id, director_name) VALUES (49, '팀 밀러');
INSERT INTO director (director_id, director_name) VALUES (50, '리처드 링클레이터');


-- 감독목록
INSERT INTO Director_List (movie_id, director_id) VALUES (1, 1); 
INSERT INTO Director_List (movie_id, director_id) VALUES (2, 2); 
INSERT INTO Director_List (movie_id, director_id) VALUES (3, 3); 
INSERT INTO Director_List (movie_id, director_id) VALUES (4, 4); 
INSERT INTO Director_List (movie_id, director_id) VALUES (5, 5); 
INSERT INTO Director_List (movie_id, director_id) VALUES (6, 1); 
INSERT INTO Director_List (movie_id, director_id) VALUES (7, 7); 
INSERT INTO Director_List (movie_id, director_id) VALUES (8, 8); 
INSERT INTO Director_List (movie_id, director_id) VALUES (9, 2); 
INSERT INTO Director_List (movie_id, director_id) VALUES (10, 10); 
INSERT INTO Director_List (movie_id, director_id) VALUES (11, 11); 
INSERT INTO Director_List (movie_id, director_id) VALUES (12, 12); 
INSERT INTO Director_List (movie_id, director_id) VALUES (13, 13); 
INSERT INTO Director_List (movie_id, director_id) VALUES (14, 14); 
INSERT INTO Director_List (movie_id, director_id) VALUES (15, 15); 
INSERT INTO Director_List (movie_id, director_id) VALUES (16, 15); 
INSERT INTO Director_List (movie_id, director_id) VALUES (17, 17); 
INSERT INTO Director_List (movie_id, director_id) VALUES (18, 18); 
INSERT INTO Director_List (movie_id, director_id) VALUES (19, 8); 
INSERT INTO Director_List (movie_id, director_id) VALUES (20, 20); 
INSERT INTO Director_List (movie_id, director_id) VALUES (21, 8); 
INSERT INTO Director_List (movie_id, director_id) VALUES (22, 22); 
INSERT INTO Director_List (movie_id, director_id) VALUES (23, 23); 
INSERT INTO Director_List (movie_id, director_id) VALUES (24, 24); 
INSERT INTO Director_List (movie_id, director_id) VALUES (25, 25); 
INSERT INTO Director_List (movie_id, director_id) VALUES (26, 26); 
INSERT INTO Director_List (movie_id, director_id) VALUES (27, 27); 
INSERT INTO Director_List (movie_id, director_id) VALUES (28, 28); 
INSERT INTO Director_List (movie_id, director_id) VALUES (29, 29); 
INSERT INTO Director_List (movie_id, director_id) VALUES (30, 8); 
INSERT INTO Director_List (movie_id, director_id) VALUES (31, 31); 
INSERT INTO Director_List (movie_id, director_id) VALUES (32, 32); 
INSERT INTO Director_List (movie_id, director_id) VALUES (33, 33); 
INSERT INTO Director_List (movie_id, director_id) VALUES (34, 34); 
INSERT INTO Director_List (movie_id, director_id) VALUES (35, 35); 
INSERT INTO Director_List (movie_id, director_id) VALUES (36, 36); 
INSERT INTO Director_List (movie_id, director_id) VALUES (37, 37); 
INSERT INTO Director_List (movie_id, director_id) VALUES (38, 26); 
INSERT INTO Director_List (movie_id, director_id) VALUES (39, 26); 
INSERT INTO Director_List (movie_id, director_id) VALUES (40, 10); 
INSERT INTO Director_List (movie_id, director_id) VALUES (41, 41); 
INSERT INTO Director_List (movie_id, director_id) VALUES (42, 11); 
INSERT INTO Director_List (movie_id, director_id) VALUES (43, 43); 
INSERT INTO Director_List (movie_id, director_id) VALUES (44, 36); 
INSERT INTO Director_List (movie_id, director_id) VALUES (45, 45); 
INSERT INTO Director_List (movie_id, director_id) VALUES (46, 46); 
INSERT INTO Director_List (movie_id, director_id) VALUES (47, 47); 
INSERT INTO Director_List (movie_id, director_id) VALUES (48, 15); 
INSERT INTO Director_List (movie_id, director_id) VALUES (49, 49); 
INSERT INTO Director_List (movie_id, director_id) VALUES (50, 50);


-- 배우
INSERT INTO Actor (actor_id, actor_name) VALUES (1, '하정우');
INSERT INTO Actor (actor_id, actor_name) VALUES (2, '여진구');
INSERT INTO Actor (actor_id, actor_name) VALUES (3, '성동일');
INSERT INTO Actor (actor_id, actor_name) VALUES (4, '채수빈');
INSERT INTO Actor (actor_id, actor_name) VALUES (5, '한송호');
INSERT INTO Actor (actor_id, actor_name) VALUES (6, '마동석');
INSERT INTO Actor (actor_id, actor_name) VALUES (7, '김무열');
INSERT INTO Actor (actor_id, actor_name) VALUES (8, '박지환');
INSERT INTO Actor (actor_id, actor_name) VALUES (9, '이동휘');
INSERT INTO Actor (actor_id, actor_name) VALUES (10, '이범수');
INSERT INTO Actor (actor_id, actor_name) VALUES (11, '김민재');
INSERT INTO Actor (actor_id, actor_name) VALUES (12, '이지훈');
INSERT INTO Actor (actor_id, actor_name) VALUES (13, '김도건');
INSERT INTO Actor (actor_id, actor_name) VALUES (14, '김지훈');
INSERT INTO Actor (actor_id, actor_name) VALUES (15, '현봉식');
INSERT INTO Actor (actor_id, actor_name) VALUES (16, '고경표');
INSERT INTO Actor (actor_id, actor_name) VALUES (17, '이이경');
INSERT INTO Actor (actor_id, actor_name) VALUES (18, '음문석');
INSERT INTO Actor (actor_id, actor_name) VALUES (19, '박세완');
INSERT INTO Actor (actor_id, actor_name) VALUES (20, '이순원');
INSERT INTO Actor (actor_id, actor_name) VALUES (21, '곽동연');
INSERT INTO Actor (actor_id, actor_name) VALUES (22, '김민호');
INSERT INTO Actor (actor_id, actor_name) VALUES (23, '류승수');
INSERT INTO Actor (actor_id, actor_name) VALUES (24, '윤병희');
INSERT INTO Actor (actor_id, actor_name) VALUES (25, '이준혁');
INSERT INTO Actor (actor_id, actor_name) VALUES (26, '이와오 준코');
INSERT INTO Actor (actor_id, actor_name) VALUES (27, '마츠모토 리카');
INSERT INTO Actor (actor_id, actor_name) VALUES (28, '츠지 신파치');
INSERT INTO Actor (actor_id, actor_name) VALUES (29, '오쿠라 마사아키');
INSERT INTO Actor (actor_id, actor_name) VALUES (30, '스티븐 블럼');
INSERT INTO Actor (actor_id, actor_name) VALUES (31, '존 라터 리');
INSERT INTO Actor (actor_id, actor_name) VALUES (32, '스티브 벌렌');
INSERT INTO Actor (actor_id, actor_name) VALUES (33, '다로 밤비');
INSERT INTO Actor (actor_id, actor_name) VALUES (34, '웬디 리');
INSERT INTO Actor (actor_id, actor_name) VALUES (35, '루비 마로우');
INSERT INTO Actor (actor_id, actor_name) VALUES (36, '심은경');
INSERT INTO Actor (actor_id, actor_name) VALUES (37, '윤제문');
INSERT INTO Actor (actor_id, actor_name) VALUES (38, '김성오');
INSERT INTO Actor (actor_id, actor_name) VALUES (39, '오태경');
INSERT INTO Actor (actor_id, actor_name) VALUES (40, '정해균');
INSERT INTO Actor (actor_id, actor_name) VALUES (41, '안재홍');
INSERT INTO Actor (actor_id, actor_name) VALUES (42, '김원해');
INSERT INTO Actor (actor_id, actor_name) VALUES (43, '정찬훈');
INSERT INTO Actor (actor_id, actor_name) VALUES (44, '한서진');
INSERT INTO Actor (actor_id, actor_name) VALUES (45, '이갑선');
INSERT INTO Actor (actor_id, actor_name) VALUES (46, '에이미 포엘러');
INSERT INTO Actor (actor_id, actor_name) VALUES (47, '필리스 스미스');
INSERT INTO Actor (actor_id, actor_name) VALUES (48, '민디 캘링');
INSERT INTO Actor (actor_id, actor_name) VALUES (49, '빌 헤이더');
INSERT INTO Actor (actor_id, actor_name) VALUES (50, '루이스 블랙');

INSERT INTO Actor (actor_id, actor_name) VALUES (51, '케이틀린 디아스');
INSERT INTO Actor (actor_id, actor_name) VALUES (52, '카일 맥라클란');
INSERT INTO Actor (actor_id, actor_name) VALUES (53, '다이안 레인');
INSERT INTO Actor (actor_id, actor_name) VALUES (54, '리처드 카인드');
INSERT INTO Actor (actor_id, actor_name) VALUES (55, '라레인 뉴먼');
INSERT INTO Actor (actor_id, actor_name) VALUES (56, '김가령');
INSERT INTO Actor (actor_id, actor_name) VALUES (57, '이경태');
INSERT INTO Actor (actor_id, actor_name) VALUES (58, '카미키 류노스케');
INSERT INTO Actor (actor_id, actor_name) VALUES (59, '카미시라이시 모네');
INSERT INTO Actor (actor_id, actor_name) VALUES (60, '나가사와 마사미');
INSERT INTO Actor (actor_id, actor_name) VALUES (61, '나리타 료');
INSERT INTO Actor (actor_id, actor_name) VALUES (62, '유우키 아오이');
INSERT INTO Actor (actor_id, actor_name) VALUES (63, '이치하라 에츠코');
INSERT INTO Actor (actor_id, actor_name) VALUES (64, '시마자키 노부나가');
INSERT INTO Actor (actor_id, actor_name) VALUES (65, '이시카와 카이토');
INSERT INTO Actor (actor_id, actor_name) VALUES (66, '타니 카논');
INSERT INTO Actor (actor_id, actor_name) VALUES (67, '테라소마 마사키');
INSERT INTO Actor (actor_id, actor_name) VALUES (68, '윌 스미스');
INSERT INTO Actor (actor_id, actor_name) VALUES (69, '마틴 로렌스');
INSERT INTO Actor (actor_id, actor_name) VALUES (70, '바네사 허진스');
INSERT INTO Actor (actor_id, actor_name) VALUES (71, '알렉산더 루드윅');
INSERT INTO Actor (actor_id, actor_name) VALUES (72, '파올라 누녜즈');
INSERT INTO Actor (actor_id, actor_name) VALUES (73, '에릭 데인');
INSERT INTO Actor (actor_id, actor_name) VALUES (74, '이안 그루퍼드');
INSERT INTO Actor (actor_id, actor_name) VALUES (75, '제이콥 시피오');
INSERT INTO Actor (actor_id, actor_name) VALUES (76, '안도 사쿠라');
INSERT INTO Actor (actor_id, actor_name) VALUES (77, '에이타');
INSERT INTO Actor (actor_id, actor_name) VALUES (78, '쿠로카와 소야');
INSERT INTO Actor (actor_id, actor_name) VALUES (79, '히이라기 히나타');
INSERT INTO Actor (actor_id, actor_name) VALUES (80, '타카하타 미츠키');
INSERT INTO Actor (actor_id, actor_name) VALUES (81, '카쿠타 아키히로');
INSERT INTO Actor (actor_id, actor_name) VALUES (82, '나카무라 시도');
INSERT INTO Actor (actor_id, actor_name) VALUES (83, '다나카 유코');
INSERT INTO Actor (actor_id, actor_name) VALUES (84, '기타노 다케시');
INSERT INTO Actor (actor_id, actor_name) VALUES (85, '세키구치 유스케');
INSERT INTO Actor (actor_id, actor_name) VALUES (86, '키시모토 가요코');
INSERT INTO Actor (actor_id, actor_name) VALUES (87, '다이케 요코');
INSERT INTO Actor (actor_id, actor_name) VALUES (88, '요시유키 카즈코');
INSERT INTO Actor (actor_id, actor_name) VALUES (89, '비트 키요시');
INSERT INTO Actor (actor_id, actor_name) VALUES (90, '그레이트 기다유');
INSERT INTO Actor (actor_id, actor_name) VALUES (91, '이데 랏쿄');
INSERT INTO Actor (actor_id, actor_name) VALUES (92, '마무라 네즈미');
INSERT INTO Actor (actor_id, actor_name) VALUES (93, '호소카와 후미에');
INSERT INTO Actor (actor_id, actor_name) VALUES (94, '루피타 뇽');
INSERT INTO Actor (actor_id, actor_name) VALUES (95, '조셉 퀸');
INSERT INTO Actor (actor_id, actor_name) VALUES (96, '디몬 하운수');
INSERT INTO Actor (actor_id, actor_name) VALUES (97, '알렉스 울프');
INSERT INTO Actor (actor_id, actor_name) VALUES (98, '변요한');
INSERT INTO Actor (actor_id, actor_name) VALUES (99, '신혜선');
INSERT INTO Actor (actor_id, actor_name) VALUES (100, '이엘');

INSERT INTO Actor (actor_id, actor_name) VALUES (101, '박예니');
INSERT INTO Actor (actor_id, actor_name) VALUES (102, '지현준');
INSERT INTO Actor (actor_id, actor_name) VALUES (103, '장성범');
INSERT INTO Actor (actor_id, actor_name) VALUES (104, '심달기');
INSERT INTO Actor (actor_id, actor_name) VALUES (105, '신시아');
INSERT INTO Actor (actor_id, actor_name) VALUES (106, '박은빈');
INSERT INTO Actor (actor_id, actor_name) VALUES (107, '서은수');
INSERT INTO Actor (actor_id, actor_name) VALUES (108, '진구');
INSERT INTO Actor (actor_id, actor_name) VALUES (109, '성유빈');
INSERT INTO Actor (actor_id, actor_name) VALUES (110, '조민수');
INSERT INTO Actor (actor_id, actor_name) VALUES (111, '차순배');
INSERT INTO Actor (actor_id, actor_name) VALUES (112, '저스틴 하비');
INSERT INTO Actor (actor_id, actor_name) VALUES (113, '변서윤');
INSERT INTO Actor (actor_id, actor_name) VALUES (114, '채원빈');
INSERT INTO Actor (actor_id, actor_name) VALUES (115, '김선호');
INSERT INTO Actor (actor_id, actor_name) VALUES (116, '강태주');
INSERT INTO Actor (actor_id, actor_name) VALUES (117, '김강우');
INSERT INTO Actor (actor_id, actor_name) VALUES (118, '고아라');
INSERT INTO Actor (actor_id, actor_name) VALUES (119, '김다미');
INSERT INTO Actor (actor_id, actor_name) VALUES (120, '전소니');
INSERT INTO Actor (actor_id, actor_name) VALUES (121, '변우석');
INSERT INTO Actor (actor_id, actor_name) VALUES (122, '장혜진');
INSERT INTO Actor (actor_id, actor_name) VALUES (123, '박충선');
INSERT INTO Actor (actor_id, actor_name) VALUES (124, '남윤수');
INSERT INTO Actor (actor_id, actor_name) VALUES (125, '김수형');
INSERT INTO Actor (actor_id, actor_name) VALUES (126, '류지안');
INSERT INTO Actor (actor_id, actor_name) VALUES (127, '레아 루이스');
INSERT INTO Actor (actor_id, actor_name) VALUES (128, '마무두 아티');
INSERT INTO Actor (actor_id, actor_name) VALUES (129, '김혜수');
INSERT INTO Actor (actor_id, actor_name) VALUES (130, '염정아');
INSERT INTO Actor (actor_id, actor_name) VALUES (131, '조인성');
INSERT INTO Actor (actor_id, actor_name) VALUES (132, '박정민');
INSERT INTO Actor (actor_id, actor_name) VALUES (133, '김종수');
INSERT INTO Actor (actor_id, actor_name) VALUES (134, '고민시');
INSERT INTO Actor (actor_id, actor_name) VALUES (135, '김재화');
INSERT INTO Actor (actor_id, actor_name) VALUES (136, '박준면');
INSERT INTO Actor (actor_id, actor_name) VALUES (137, '박경혜');
INSERT INTO Actor (actor_id, actor_name) VALUES (138, '주보비');
INSERT INTO Actor (actor_id, actor_name) VALUES (139, '심규혁');
INSERT INTO Actor (actor_id, actor_name) VALUES (140, '김유림');
INSERT INTO Actor (actor_id, actor_name) VALUES (141, '최한');
INSERT INTO Actor (actor_id, actor_name) VALUES (142, '강은애');
INSERT INTO Actor (actor_id, actor_name) VALUES (143, '이장원');
INSERT INTO Actor (actor_id, actor_name) VALUES (144, '손정아');
INSERT INTO Actor (actor_id, actor_name) VALUES (145, '다이고 코타로');
INSERT INTO Actor (actor_id, actor_name) VALUES (146, '모리 나나');
INSERT INTO Actor (actor_id, actor_name) VALUES (147, '오구리 슌');
INSERT INTO Actor (actor_id, actor_name) VALUES (148, '혼다 츠바사');
INSERT INTO Actor (actor_id, actor_name) VALUES (149, '하마츠 타카유키');
INSERT INTO Actor (actor_id, actor_name) VALUES (150, '아키야마 유즈키');

INSERT INTO Actor (actor_id, actor_name) VALUES (151, '나가야 카즈아키');
INSERT INTO Actor (actor_id, actor_name) VALUES (152, '슈하마 하루미');
INSERT INTO Actor (actor_id, actor_name) VALUES (153, '마오');
INSERT INTO Actor (actor_id, actor_name) VALUES (154, '티모시 샬라메');
INSERT INTO Actor (actor_id, actor_name) VALUES (155, '젠데이아 콜먼');
INSERT INTO Actor (actor_id, actor_name) VALUES (156, '레베카 퍼거슨');
INSERT INTO Actor (actor_id, actor_name) VALUES (157, '조슈 브롤린');
INSERT INTO Actor (actor_id, actor_name) VALUES (158, '오스틴 버틀러');
INSERT INTO Actor (actor_id, actor_name) VALUES (159, '플로렌스 퓨');
INSERT INTO Actor (actor_id, actor_name) VALUES (160, '데이브 바티스타');
INSERT INTO Actor (actor_id, actor_name) VALUES (161, '크리스토퍼 월켄');
INSERT INTO Actor (actor_id, actor_name) VALUES (162, '스티븐 헨더슨');
INSERT INTO Actor (actor_id, actor_name) VALUES (163, '레아 세이두');
INSERT INTO Actor (actor_id, actor_name) VALUES (164, '강하늘');
INSERT INTO Actor (actor_id, actor_name) VALUES (165, '정소민');
INSERT INTO Actor (actor_id, actor_name) VALUES (166, '조민수');
INSERT INTO Actor (actor_id, actor_name) VALUES (167, '김선영');
INSERT INTO Actor (actor_id, actor_name) VALUES (168, '황세인');
INSERT INTO Actor (actor_id, actor_name) VALUES (169, '윤경호');
INSERT INTO Actor (actor_id, actor_name) VALUES (170, '이상진');
INSERT INTO Actor (actor_id, actor_name) VALUES (171, '원우');
INSERT INTO Actor (actor_id, actor_name) VALUES (172, '송해나');
INSERT INTO Actor (actor_id, actor_name) VALUES (173, '엄지윤');
INSERT INTO Actor (actor_id, actor_name) VALUES (174, '안야 테일러 조이');
INSERT INTO Actor (actor_id, actor_name) VALUES (175, '크리스 헴스워스');
INSERT INTO Actor (actor_id, actor_name) VALUES (176, '톰 버크');
INSERT INTO Actor (actor_id, actor_name) VALUES (177, '스티브 카렐');
INSERT INTO Actor (actor_id, actor_name) VALUES (178, '태연');
INSERT INTO Actor (actor_id, actor_name) VALUES (179, '서현');
INSERT INTO Actor (actor_id, actor_name) VALUES (180, '미란다 코스그로브');
INSERT INTO Actor (actor_id, actor_name) VALUES (181, '다나 가이어');
INSERT INTO Actor (actor_id, actor_name) VALUES (182, '제이슨 세걸');
INSERT INTO Actor (actor_id, actor_name) VALUES (183, '러셀 브랜드');
INSERT INTO Actor (actor_id, actor_name) VALUES (184, '줄리 앤드류스');
INSERT INTO Actor (actor_id, actor_name) VALUES (185, '윌 아넷');
INSERT INTO Actor (actor_id, actor_name) VALUES (186, '크리스틴 위그');
INSERT INTO Actor (actor_id, actor_name) VALUES (187, '송승헌');
INSERT INTO Actor (actor_id, actor_name) VALUES (188, '임지연');
INSERT INTO Actor (actor_id, actor_name) VALUES (189, '조여정');
INSERT INTO Actor (actor_id, actor_name) VALUES (190, '온주완');
INSERT INTO Actor (actor_id, actor_name) VALUES (191, '유해진');
INSERT INTO Actor (actor_id, actor_name) VALUES (192, '박혁권');
INSERT INTO Actor (actor_id, actor_name) VALUES (193, '전혜진');
INSERT INTO Actor (actor_id, actor_name) VALUES (194, '배성우');
INSERT INTO Actor (actor_id, actor_name) VALUES (195, '엄태구');
INSERT INTO Actor (actor_id, actor_name) VALUES (196, '예수정');
INSERT INTO Actor (actor_id, actor_name) VALUES (197, '하라 나노카');
INSERT INTO Actor (actor_id, actor_name) VALUES (198, '마츠무라 호쿠토');
INSERT INTO Actor (actor_id, actor_name) VALUES (199, '후카츠 에리');
INSERT INTO Actor (actor_id, actor_name) VALUES (200, '마츠모토 코시로');

INSERT INTO Actor (actor_id, actor_name) VALUES (201, '소메타니 쇼타');
INSERT INTO Actor (actor_id, actor_name) VALUES (202, '이토 사이리');
INSERT INTO Actor (actor_id, actor_name) VALUES (203, '하나세 코토네');
INSERT INTO Actor (actor_id, actor_name) VALUES (204, '하나자와 카나');
INSERT INTO Actor (actor_id, actor_name) VALUES (205, '카미키 류노스케');
INSERT INTO Actor (actor_id, actor_name) VALUES (206, '최민식');
INSERT INTO Actor (actor_id, actor_name) VALUES (207, '김고은');
INSERT INTO Actor (actor_id, actor_name) VALUES (208, '유해진');
INSERT INTO Actor (actor_id, actor_name) VALUES (209, '이도현');
INSERT INTO Actor (actor_id, actor_name) VALUES (210, '김재철');
INSERT INTO Actor (actor_id, actor_name) VALUES (211, '김민준');
INSERT INTO Actor (actor_id, actor_name) VALUES (212, '김병오');
INSERT INTO Actor (actor_id, actor_name) VALUES (213, '전진기');
INSERT INTO Actor (actor_id, actor_name) VALUES (214, '박정자');
INSERT INTO Actor (actor_id, actor_name) VALUES (215, '박지일');
INSERT INTO Actor (actor_id, actor_name) VALUES (216, '류준열');
INSERT INTO Actor (actor_id, actor_name) VALUES (217, '유해진');
INSERT INTO Actor (actor_id, actor_name) VALUES (218, '최무성');
INSERT INTO Actor (actor_id, actor_name) VALUES (219, '조성하');
INSERT INTO Actor (actor_id, actor_name) VALUES (220, '박명훈');
INSERT INTO Actor (actor_id, actor_name) VALUES (221, '김성철');
INSERT INTO Actor (actor_id, actor_name) VALUES (222, '안은진');
INSERT INTO Actor (actor_id, actor_name) VALUES (223, '조윤서');
INSERT INTO Actor (actor_id, actor_name) VALUES (224, '이주원');
INSERT INTO Actor (actor_id, actor_name) VALUES (225, '김예은');
INSERT INTO Actor (actor_id, actor_name) VALUES (226, '라미란');
INSERT INTO Actor (actor_id, actor_name) VALUES (227, '김무열');
INSERT INTO Actor (actor_id, actor_name) VALUES (228, '윤경호');
INSERT INTO Actor (actor_id, actor_name) VALUES (229, '서현우');
INSERT INTO Actor (actor_id, actor_name) VALUES (230, '박진주');
INSERT INTO Actor (actor_id, actor_name) VALUES (231, '김용림');
INSERT INTO Actor (actor_id, actor_name) VALUES (232, '신재휘');
INSERT INTO Actor (actor_id, actor_name) VALUES (233, '배해선');
INSERT INTO Actor (actor_id, actor_name) VALUES (234, '성열석');
INSERT INTO Actor (actor_id, actor_name) VALUES (235, '이진희');
INSERT INTO Actor (actor_id, actor_name) VALUES (236, '강동원');
INSERT INTO Actor (actor_id, actor_name) VALUES (237, '이정현');
INSERT INTO Actor (actor_id, actor_name) VALUES (238, '이레');
INSERT INTO Actor (actor_id, actor_name) VALUES (239, '권해효');
INSERT INTO Actor (actor_id, actor_name) VALUES (240, '김민재');
INSERT INTO Actor (actor_id, actor_name) VALUES (241, '구교환');
INSERT INTO Actor (actor_id, actor_name) VALUES (242, '김도윤');
INSERT INTO Actor (actor_id, actor_name) VALUES (243, '이예원');
INSERT INTO Actor (actor_id, actor_name) VALUES (244, '송강호');
INSERT INTO Actor (actor_id, actor_name) VALUES (245, '이선균');
INSERT INTO Actor (actor_id, actor_name) VALUES (246, '조여정');
INSERT INTO Actor (actor_id, actor_name) VALUES (247, '최우식');
INSERT INTO Actor (actor_id, actor_name) VALUES (248, '박소담');
INSERT INTO Actor (actor_id, actor_name) VALUES (249, '이정은');
INSERT INTO Actor (actor_id, actor_name) VALUES (250, '장혜진');

INSERT INTO Actor (actor_id, actor_name) VALUES (251, '박명훈');
INSERT INTO Actor (actor_id, actor_name) VALUES (252, '현승민');
INSERT INTO Actor (actor_id, actor_name) VALUES (253, '정현준');
INSERT INTO Actor (actor_id, actor_name) VALUES (254, '스티브 카렐');
INSERT INTO Actor (actor_id, actor_name) VALUES (255, '크리스틴 위그');
INSERT INTO Actor (actor_id, actor_name) VALUES (256, '트레이 파커');
INSERT INTO Actor (actor_id, actor_name) VALUES (257, '미란다 코스그로브');
INSERT INTO Actor (actor_id, actor_name) VALUES (258, '줄리 앤드류스');
INSERT INTO Actor (actor_id, actor_name) VALUES (259, '러셀 브랜드');
INSERT INTO Actor (actor_id, actor_name) VALUES (260, '스티브 쿠건');
INSERT INTO Actor (actor_id, actor_name) VALUES (261, '다나 가이어');
INSERT INTO Actor (actor_id, actor_name) VALUES (262, '피에르 꼬팽');
INSERT INTO Actor (actor_id, actor_name) VALUES (263, '앤디 나이먼');
INSERT INTO Actor (actor_id, actor_name) VALUES (264, '유하준');
INSERT INTO Actor (actor_id, actor_name) VALUES (265, '정민결');
INSERT INTO Actor (actor_id, actor_name) VALUES (266, '나상규');
INSERT INTO Actor (actor_id, actor_name) VALUES (267, '강용규');
INSERT INTO Actor (actor_id, actor_name) VALUES (268, '조수정');
INSERT INTO Actor (actor_id, actor_name) VALUES (269, '이상화');
INSERT INTO Actor (actor_id, actor_name) VALUES (270, '황원식');
INSERT INTO Actor (actor_id, actor_name) VALUES (271, '모이세스 아리아스');
INSERT INTO Actor (actor_id, actor_name) VALUES (272, '벤자민 브랫');
INSERT INTO Actor (actor_id, actor_name) VALUES (273, '켄 정');
INSERT INTO Actor (actor_id, actor_name) VALUES (274, '나심 페드라드');
INSERT INTO Actor (actor_id, actor_name) VALUES (275, '태연');
INSERT INTO Actor (actor_id, actor_name) VALUES (276, '서현');
INSERT INTO Actor (actor_id, actor_name) VALUES (277, '제이슨 세걸');
INSERT INTO Actor (actor_id, actor_name) VALUES (278, '윌 아넷');
INSERT INTO Actor (actor_id, actor_name) VALUES (279, '윌 스미스');
INSERT INTO Actor (actor_id, actor_name) VALUES (280, '마틴 로렌스');
INSERT INTO Actor (actor_id, actor_name) VALUES (281, '바네사 허진스');
INSERT INTO Actor (actor_id, actor_name) VALUES (282, '알렉산더 루드윅');
INSERT INTO Actor (actor_id, actor_name) VALUES (283, '파올라 누녜즈');
INSERT INTO Actor (actor_id, actor_name) VALUES (284, '에릭 데인');
INSERT INTO Actor (actor_id, actor_name) VALUES (285, '이안 그루퍼드');
INSERT INTO Actor (actor_id, actor_name) VALUES (286, '제이콥 시피오');
INSERT INTO Actor (actor_id, actor_name) VALUES (287, '엠마 스톤');
INSERT INTO Actor (actor_id, actor_name) VALUES (288, '마크 러팔로');
INSERT INTO Actor (actor_id, actor_name) VALUES (289, '윌렘 대포');
INSERT INTO Actor (actor_id, actor_name) VALUES (290, '안도 사쿠라');
INSERT INTO Actor (actor_id, actor_name) VALUES (291, '에이타');
INSERT INTO Actor (actor_id, actor_name) VALUES (292, '쿠로카와 소야');
INSERT INTO Actor (actor_id, actor_name) VALUES (293, '히이라기 히나타');
INSERT INTO Actor (actor_id, actor_name) VALUES (294, '타카하타 미츠키');
INSERT INTO Actor (actor_id, actor_name) VALUES (295, '카쿠타 아키히로');
INSERT INTO Actor (actor_id, actor_name) VALUES (296, '나카무라 시도');
INSERT INTO Actor (actor_id, actor_name) VALUES (297, '다나카 유코');
INSERT INTO Actor (actor_id, actor_name) VALUES (298, '양자경');
INSERT INTO Actor (actor_id, actor_name) VALUES (299, '스테파니 수');
INSERT INTO Actor (actor_id, actor_name) VALUES (300, '키 호이 콴');

INSERT INTO Actor (actor_id, actor_name) VALUES (301, '제이미 리 커티스');
INSERT INTO Actor (actor_id, actor_name) VALUES (302, '타라지 P. 헨슨');
INSERT INTO Actor (actor_id, actor_name) VALUES (303, '루시 로리스');
INSERT INTO Actor (actor_id, actor_name) VALUES (304, '장 끌로드 반담');
INSERT INTO Actor (actor_id, actor_name) VALUES (305, '에밀리 블런트');
INSERT INTO Actor (actor_id, actor_name) VALUES (306, '킬리언 머피');
INSERT INTO Actor (actor_id, actor_name) VALUES (307, '밀리센트 시몬스');
INSERT INTO Actor (actor_id, actor_name) VALUES (308, '노아 주프');
INSERT INTO Actor (actor_id, actor_name) VALUES (309, '디몬 하운수');
INSERT INTO Actor (actor_id, actor_name) VALUES (310, '웨인 듀발');
INSERT INTO Actor (actor_id, actor_name) VALUES (311, '플로렌스 퓨');
INSERT INTO Actor (actor_id, actor_name) VALUES (312, '잭 레이너');
INSERT INTO Actor (actor_id, actor_name) VALUES (313, '윌 폴터');
INSERT INTO Actor (actor_id, actor_name) VALUES (314, '윌리엄 잭슨 하퍼');
INSERT INTO Actor (actor_id, actor_name) VALUES (315, '빌헬름 브롬그렌');
INSERT INTO Actor (actor_id, actor_name) VALUES (316, '율리아 랑나르손');
INSERT INTO Actor (actor_id, actor_name) VALUES (317, '아치 매더퀴');
INSERT INTO Actor (actor_id, actor_name) VALUES (318, '엘로라 토르치아');
INSERT INTO Actor (actor_id, actor_name) VALUES (319, '이사벨 그릴');
INSERT INTO Actor (actor_id, actor_name) VALUES (320, '안나 아스트롬');
INSERT INTO Actor (actor_id, actor_name) VALUES (321, '김해숙');
INSERT INTO Actor (actor_id, actor_name) VALUES (322, '손호준');
INSERT INTO Actor (actor_id, actor_name) VALUES (323, '강기둥');
INSERT INTO Actor (actor_id, actor_name) VALUES (324, '남보라');
INSERT INTO Actor (actor_id, actor_name) VALUES (325, '이원종');
INSERT INTO Actor (actor_id, actor_name) VALUES (326, '박원상');
INSERT INTO Actor (actor_id, actor_name) VALUES (327, '홍정인');
INSERT INTO Actor (actor_id, actor_name) VALUES (328, '김영민');
INSERT INTO Actor (actor_id, actor_name) VALUES (329, '한승현');
INSERT INTO Actor (actor_id, actor_name) VALUES (330, '백봉기');
INSERT INTO Actor (actor_id, actor_name) VALUES (331, '김다미');
INSERT INTO Actor (actor_id, actor_name) VALUES (332, '조민수');
INSERT INTO Actor (actor_id, actor_name) VALUES (333, '박희순');
INSERT INTO Actor (actor_id, actor_name) VALUES (334, '최우식');
INSERT INTO Actor (actor_id, actor_name) VALUES (335, '고민시');
INSERT INTO Actor (actor_id, actor_name) VALUES (336, '최정우');
INSERT INTO Actor (actor_id, actor_name) VALUES (337, '오미희');
INSERT INTO Actor (actor_id, actor_name) VALUES (338, '정다은');
INSERT INTO Actor (actor_id, actor_name) VALUES (339, '김병옥');
INSERT INTO Actor (actor_id, actor_name) VALUES (340, '이주원');
INSERT INTO Actor (actor_id, actor_name) VALUES (341, '라이언 레이놀즈');
INSERT INTO Actor (actor_id, actor_name) VALUES (342, '모레나 바카린');
INSERT INTO Actor (actor_id, actor_name) VALUES (343, '에드 스크레인');
INSERT INTO Actor (actor_id, actor_name) VALUES (344, '지나 카라노');
INSERT INTO Actor (actor_id, actor_name) VALUES (345, 'T.J. 밀러');
INSERT INTO Actor (actor_id, actor_name) VALUES (346, '브리아나 힐데브란드');
INSERT INTO Actor (actor_id, actor_name) VALUES (347, '스테판 카피식');
INSERT INTO Actor (actor_id, actor_name) VALUES (348, '카란 소니');
INSERT INTO Actor (actor_id, actor_name) VALUES (349, '테일러 힉슨');
INSERT INTO Actor (actor_id, actor_name) VALUES (350, '레슬리 우감스');
INSERT INTO Actor (actor_id, actor_name) VALUES (351, '에단 호크');
INSERT INTO Actor (actor_id, actor_name) VALUES (352, '줄리 델피');
INSERT INTO Actor (actor_id, actor_name) VALUES (353, '샤뮤스 데이비 핏츠패트릭');
INSERT INTO Actor (actor_id, actor_name) VALUES (354, '파노스 코로니스');
INSERT INTO Actor (actor_id, actor_name) VALUES (355, '아디너 레이첼 창가리');
INSERT INTO Actor (actor_id, actor_name) VALUES (356, '월터 래샐리');
INSERT INTO Actor (actor_id, actor_name) VALUES (357, '세니아 칼로예로풀로');
INSERT INTO Actor (actor_id, actor_name) VALUES (358, '야니스 파파도폴로스');
INSERT INTO Actor (actor_id, actor_name) VALUES (359, '아리안 라베드');


-- 배우목록
INSERT INTO Actor_List (movie_id, actor_id) VALUES (1, 1);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (1, 2);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (1, 3);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (1, 4);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (1, 5);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (2, 6);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (2, 7);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (2, 8);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (2, 9);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (2, 10);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (2, 11);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (2, 12);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (2, 13);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (2, 14);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (2, 15);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (3, 16);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (3, 17);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (3, 18);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (3, 19);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (3, 20);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (3, 21);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (3, 22);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (3, 23);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (3, 24);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (3, 25);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (4, 26);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (4, 27);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (4, 28);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (4, 29);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (4, 30);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (4, 31);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (4, 32);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (4, 33);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (4, 34);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (4, 35);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (5, 36);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (5, 37);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (5, 38);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (5, 39);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (5, 40);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (5, 41);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (5, 42);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (5, 43);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (5, 44);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (5, 45);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (6, 1);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (6, 2);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (6, 3);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (6, 4);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (6, 5);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (7, 46);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (7, 47);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (7, 48);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (7, 49);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (7, 50);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (7, 51);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (7, 52);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (7, 53);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (7, 54);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (7, 55);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (8, 56);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (8, 57);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (8, 58);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (8, 59);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (8, 60);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (8, 61);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (8, 62);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (8, 63);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (8, 64);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (8, 65);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (8, 66);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (8, 67);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 6);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 7);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 8);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 9);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 10);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 11);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 12);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 13);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 14);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 15);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 68);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 69);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 70);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 71);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 72);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 73);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 74);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 75);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (11, 76);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (11, 77);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (11, 78);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (11, 79);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (11, 80);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (11, 81);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (11, 82);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (11, 83);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 84);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 85);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 86);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 87);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 88);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 89);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 90);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 91);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 92);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 93);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 94);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 95);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 96);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 97);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (14, 98);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (14, 99);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (14, 100);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (14, 101);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (14, 102);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (14, 103);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (14, 104);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 105);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 106);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 107);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 108);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 109);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 110);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 111);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 112);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 113);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 114);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (16, 115);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (16, 116);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (16, 117);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (16, 118);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (17, 119);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (17, 120);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (17, 121);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (17, 122);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (17, 123);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (17, 124);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (17, 125);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (17, 126);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (18, 127);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (18, 128);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (20, 129);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (20, 130);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (20, 131);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (20, 132);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (20, 133);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (20, 134);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (20, 135);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (20, 136);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (20, 137);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (20, 138);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (21, 139);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (21, 140);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (21, 141);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (21, 142);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (21, 143);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (21, 144);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (21, 145);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (21, 146);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (21, 147);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (21, 148);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (22, 149);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (22, 150);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (22, 151);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (22, 152);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (22, 153);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (23, 154);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (23, 155);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (23, 156);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (23, 157);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (23, 158);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (23, 159);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (23, 160);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (23, 161);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (23, 162);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (23, 163);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (24, 164);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (24, 165);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (24, 166);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (24, 167);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (24, 168);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (24, 169);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (24, 170);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (24, 171);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (24, 172);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (24, 173);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (25, 174);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (25, 175);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (25, 176);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (26, 177);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (26, 178);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (26, 179);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (26, 180);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (26, 181);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (26, 182);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (26, 183);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (26, 184);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (26, 185);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (26, 186);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (28, 187);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (28, 188);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (28, 189);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (28, 190);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (28, 191);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (28, 192);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (28, 193);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (28, 194);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (28, 195);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (28, 196);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (30, 197);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (30, 198);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (30, 199);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (30, 200);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (30, 201);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (30, 202);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (30, 203);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (30, 204);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (30, 205);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (31, 206);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (31, 207);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (31, 208);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (31, 209);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (31, 210);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (31, 211);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (31, 212);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (31, 213);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (31, 214);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (31, 215);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (32, 216);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (32, 217);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (32, 218);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (32, 219);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (32, 220);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (32, 221);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (32, 222);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (32, 223);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (32, 224);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (32, 225);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (33, 226);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (33, 227);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (33, 228);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (33, 229);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (33, 230);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (33, 231);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (33, 232);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (33, 233);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (33, 234);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (33, 235);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (34, 236);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (34, 237);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (34, 238);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (34, 239);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (34, 240);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (34, 241);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (34, 242);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (34, 243);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (35, 244);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (35, 245);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (35, 246);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (35, 247);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (35, 248);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (35, 249);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (35, 250);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (35, 251);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (35, 252);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (35, 253);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (36, 254); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (36, 255); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (36, 256); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (36, 257); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (36, 258); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (36, 259); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (36, 260); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (36, 261); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (36, 262); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (36, 263); 

INSERT INTO Actor_List (movie_id, actor_id) VALUES (37, 264); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (37, 265); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (37, 266); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (37, 267); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (37, 268); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (37, 269); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (37, 270); 

INSERT INTO Actor_List (movie_id, actor_id) VALUES (38, 254); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (38, 257); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (38, 255); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (38, 271); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (38, 261); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (38, 272); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (38, 259); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (38, 273); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (38, 260); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (38, 274); 

INSERT INTO Actor_List (movie_id, actor_id) VALUES (39, 254); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (39, 275); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (39, 276); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (39, 257); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (39, 261); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (39, 277); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (39, 259); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (39, 258); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (39, 278); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (39, 255); 

INSERT INTO Actor_List (movie_id, actor_id) VALUES (40, 279); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (40, 280); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (40, 281); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (40, 282); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (40, 283); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (40, 284); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (40, 285); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (40, 286); 

INSERT INTO Actor_List (movie_id, actor_id) VALUES (41, 287); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (41, 288); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (41, 289); 

INSERT INTO Actor_List (movie_id, actor_id) VALUES (42, 290); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (42, 291); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (42, 292); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (42, 293); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (42, 294); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (42, 295); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (42, 296); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (42, 297); 

INSERT INTO Actor_List (movie_id, actor_id) VALUES (43, 298); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (43, 299); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (43, 300); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (43, 301); 

INSERT INTO Actor_List (movie_id, actor_id) VALUES (44, 254); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (44, 302); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (44, 298); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (44, 303); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (44, 304); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (44, 262); 

INSERT INTO Actor_List (movie_id, actor_id) VALUES (45, 305);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (45, 306); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (45, 307); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (45, 308); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (45, 309); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (45, 310);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (46, 311); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (46, 312);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (46, 313); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (46, 314); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (46, 315); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (46, 316); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (46, 317); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (46, 318); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (46, 319); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (46, 320); 

INSERT INTO Actor_List (movie_id, actor_id) VALUES (47, 321); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (47, 322); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (47, 323); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (47, 324); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (47, 325);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (47, 326); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (47, 327); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (47, 328); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (47, 329); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (47, 330); 

INSERT INTO Actor_List (movie_id, actor_id) VALUES (48, 331); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (48, 332); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (48, 333); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (48, 334); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (48, 335); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (48, 336); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (48, 337); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (48, 338); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (48, 339);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (48, 340); 

INSERT INTO Actor_List (movie_id, actor_id) VALUES (49, 341); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (49, 342); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (49, 343); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (49, 344); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (49, 345); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (49, 346); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (49, 347); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (49, 348); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (49, 349); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (49, 350); 

INSERT INTO Actor_List (movie_id, actor_id) VALUES (50, 351); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (50, 352);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (50, 353); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (50, 354);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (50, 355); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (50, 356); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (50, 357); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (50, 358); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (50, 359); 
