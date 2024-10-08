select * from Movie;
select * from Director;
select * from Director_List;
select * from Actor;
select * from Actor_List;

drop TABLE Movie;
drop TABLE Director;
drop TABLE Director_List;
drop TABLE Actor;
drop TABLE Actor_List;

--무비
drop table Movie;
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

select * from Movie order by movie_id;


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



--디렉터
CREATE TABLE Director (
    director_id NUMBER PRIMARY KEY NOT NULL,
    director_name VARCHAR2(50) NOT NULL
);


INSERT INTO director (director_id, director_name) VALUES (1, '김성한');
INSERT INTO director (director_id, director_name) VALUES (2, '허명행');
INSERT INTO director (director_id, director_name) VALUES (3, '박규태');
INSERT INTO director (director_id, director_name) VALUES (4, '곤 사토시');
INSERT INTO director (director_id, director_name) VALUES (5, '모홍진');
INSERT INTO director (director_id, director_name) VALUES (6, '김성한');
INSERT INTO director (director_id, director_name) VALUES (7, '피트 닥터');
INSERT INTO director (director_id, director_name) VALUES (8, '신카이 마코토');
INSERT INTO director (director_id, director_name) VALUES (9, '허명행');
INSERT INTO director (director_id, director_name) VALUES (10, '아딜 엘 아르비');
INSERT INTO director (director_id, director_name) VALUES (11, '고레에다 히로카즈');
INSERT INTO director (director_id, director_name) VALUES (12, '기타노 다케시');
INSERT INTO director (director_id, director_name) VALUES (13, '마이클 사노스키');
INSERT INTO director (director_id, director_name) VALUES (14, '김세휘');
INSERT INTO director (director_id, director_name) VALUES (15, '박훈정');
INSERT INTO director (director_id, director_name) VALUES (16, '박훈정');
INSERT INTO director (director_id, director_name) VALUES (17, '민용근');
INSERT INTO director (director_id, director_name) VALUES (18, '피터 손');
INSERT INTO director (director_id, director_name) VALUES (19, '신카이 마코토');
INSERT INTO director (director_id, director_name) VALUES (20, '류승완');
INSERT INTO director (director_id, director_name) VALUES (21, '신카이 마코토');
INSERT INTO director (director_id, director_name) VALUES (22, '우에다 신이치로');
INSERT INTO director (director_id, director_name) VALUES (23, '드니 빌뇌브');
INSERT INTO director (director_id, director_name) VALUES (24, '남대중');
INSERT INTO director (director_id, director_name) VALUES (25, '조지 밀러');
INSERT INTO director (director_id, director_name) VALUES (26, '피에르 꼬팽');
INSERT INTO director (director_id, director_name) VALUES (27, '타치카와 유즈루');
INSERT INTO director (director_id, director_name) VALUES (28, '김대우');
INSERT INTO director (director_id, director_name) VALUES (29, '이시하라 슌스케');
INSERT INTO director (director_id, director_name) VALUES (30, '신카이 마코토');
INSERT INTO director (director_id, director_name) VALUES (31, '장재현');
INSERT INTO director (director_id, director_name) VALUES (32, '안태진');
INSERT INTO director (director_id, director_name) VALUES (33, '장유정');
INSERT INTO director (director_id, director_name) VALUES (34, '연상호');
INSERT INTO director (director_id, director_name) VALUES (35, '봉준호');
INSERT INTO director (director_id, director_name) VALUES (36, '카일 발다');
INSERT INTO director (director_id, director_name) VALUES (37, '봉만대');
INSERT INTO director (director_id, director_name) VALUES (38, '피에르 꼬팽');
INSERT INTO director (director_id, director_name) VALUES (39, '피에르 꼬팽');
INSERT INTO director (director_id, director_name) VALUES (40, '아딜 엘 아르비');
INSERT INTO director (director_id, director_name) VALUES (41, '지오르고스 란디모스');
INSERT INTO director (director_id, director_name) VALUES (42, '고레에다 히로카즈');
INSERT INTO director (director_id, director_name) VALUES (43, '다니엘 콴');
INSERT INTO director (director_id, director_name) VALUES (44, '카일 발다');
INSERT INTO director (director_id, director_name) VALUES (45, '존 크래신스키');
INSERT INTO director (director_id, director_name) VALUES (46, '아리 에스터');
INSERT INTO director (director_id, director_name) VALUES (47, '강지은');
INSERT INTO director (director_id, director_name) VALUES (48, '박훈정');
INSERT INTO director (director_id, director_name) VALUES (49, '팀 밀러');
INSERT INTO director (director_id, director_name) VALUES (50, '리처드 링클레이터');




--디렉터리스트
CREATE TABLE Director_List (
    movie_id NUMBER NOT NULL,
    director_id NUMBER NOT NULL,
    PRIMARY KEY (movie_id, director_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (director_id) REFERENCES Director(director_id)
);

INSERT INTO Director_List (movie_id, director_id) VALUES (1, 1); 
INSERT INTO Director_List (movie_id, director_id) VALUES (2, 2); 
INSERT INTO Director_List (movie_id, director_id) VALUES (3, 3); 
INSERT INTO Director_List (movie_id, director_id) VALUES (4, 4); 
INSERT INTO Director_List (movie_id, director_id) VALUES (5, 5); 
INSERT INTO Director_List (movie_id, director_id) VALUES (6, 6); 
INSERT INTO Director_List (movie_id, director_id) VALUES (7, 7); 
INSERT INTO Director_List (movie_id, director_id) VALUES (8, 8); 
INSERT INTO Director_List (movie_id, director_id) VALUES (9, 9); 
INSERT INTO Director_List (movie_id, director_id) VALUES (10, 10); 
INSERT INTO Director_List (movie_id, director_id) VALUES (11, 11); 
INSERT INTO Director_List (movie_id, director_id) VALUES (12, 12); 
INSERT INTO Director_List (movie_id, director_id) VALUES (13, 13); 
INSERT INTO Director_List (movie_id, director_id) VALUES (14, 14); 
INSERT INTO Director_List (movie_id, director_id) VALUES (15, 15); 
INSERT INTO Director_List (movie_id, director_id) VALUES (16, 16); 
INSERT INTO Director_List (movie_id, director_id) VALUES (17, 17); 
INSERT INTO Director_List (movie_id, director_id) VALUES (18, 18); 
INSERT INTO Director_List (movie_id, director_id) VALUES (19, 19); 
INSERT INTO Director_List (movie_id, director_id) VALUES (20, 20); 
INSERT INTO Director_List (movie_id, director_id) VALUES (21, 21); 
INSERT INTO Director_List (movie_id, director_id) VALUES (22, 22); 
INSERT INTO Director_List (movie_id, director_id) VALUES (23, 23); 
INSERT INTO Director_List (movie_id, director_id) VALUES (24, 24); 
INSERT INTO Director_List (movie_id, director_id) VALUES (25, 25); 
INSERT INTO Director_List (movie_id, director_id) VALUES (26, 26); 
INSERT INTO Director_List (movie_id, director_id) VALUES (27, 27); 
INSERT INTO Director_List (movie_id, director_id) VALUES (28, 28); 
INSERT INTO Director_List (movie_id, director_id) VALUES (29, 29); 
INSERT INTO Director_List (movie_id, director_id) VALUES (30, 30); 
INSERT INTO Director_List (movie_id, director_id) VALUES (31, 31); 
INSERT INTO Director_List (movie_id, director_id) VALUES (32, 32); 
INSERT INTO Director_List (movie_id, director_id) VALUES (33, 33); 
INSERT INTO Director_List (movie_id, director_id) VALUES (34, 34); 
INSERT INTO Director_List (movie_id, director_id) VALUES (35, 35); 
INSERT INTO Director_List (movie_id, director_id) VALUES (36, 36); 
INSERT INTO Director_List (movie_id, director_id) VALUES (37, 37); 
INSERT INTO Director_List (movie_id, director_id) VALUES (38, 38); 
INSERT INTO Director_List (movie_id, director_id) VALUES (39, 39); 
INSERT INTO Director_List (movie_id, director_id) VALUES (40, 40); 
INSERT INTO Director_List (movie_id, director_id) VALUES (41, 41); 
INSERT INTO Director_List (movie_id, director_id) VALUES (42, 42); 
INSERT INTO Director_List (movie_id, director_id) VALUES (43, 43); 
INSERT INTO Director_List (movie_id, director_id) VALUES (44, 44); 
INSERT INTO Director_List (movie_id, director_id) VALUES (45, 45); 
INSERT INTO Director_List (movie_id, director_id) VALUES (46, 46); 
INSERT INTO Director_List (movie_id, director_id) VALUES (47, 47); 
INSERT INTO Director_List (movie_id, director_id) VALUES (48, 48); 
INSERT INTO Director_List (movie_id, director_id) VALUES (49, 49); 
INSERT INTO Director_List (movie_id, director_id) VALUES (50, 50);


select* from Director_List;

--액터
CREATE TABLE Actor (
    actor_id NUMBER PRIMARY KEY NOT NULL,
    actor_name VARCHAR2(50) NOT NULL
);


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
-- 129번부터 배우 추가
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


--액터리스트
CREATE TABLE Actor_List (
    movie_id NUMBER NOT NULL,
    actor_id NUMBER NOT NULL,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actor(actor_id)
);




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


INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 68);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 69);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 70);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 71);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 72);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 73);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 74);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 75);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 76);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 77);


INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 78);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 79);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 80);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 81);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 82);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 83);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 84);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 85);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 86);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 87);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 88);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (10, 89);


INSERT INTO Actor_List (movie_id, actor_id) VALUES (11, 90);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (11, 91);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (11, 92);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (11, 93);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 94);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 95);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 96);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 97);


INSERT INTO Actor_List (movie_id, actor_id) VALUES (11, 98);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (11, 99);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (11, 100);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (11, 101);

INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 102);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 103);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 104);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 105);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 106);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 107);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 108);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 109);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 110);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (12, 111);


INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 112);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 113);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 114);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 115);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 116);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 117);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 118);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 119);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 120);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (13, 121);


INSERT INTO Actor_List (movie_id, actor_id) VALUES (14, 122);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (14, 123);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (14, 124);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (14, 125);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (14, 126);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (14, 127);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (14, 128);



INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 129);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 130);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 131);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 132);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 133);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 134);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 135);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 136);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 137);
INSERT INTO Actor_List (movie_id, actor_id) VALUES (15, 138);


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
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 303); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 304); 
INSERT INTO Actor_List (movie_id, actor_id) VALUES (9, 262); 


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


