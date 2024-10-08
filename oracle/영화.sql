--영화
DROP SEQUENCE movie_seq;

CREATE SEQUENCE movie_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;

SELECT movie_seq.NEXTVAL
FROM dual;
  

select * from tblMovie;

drop table tblMovie;

create table tblMovie(
    movie_id number PRIMARY KEY not null,    --배우번호(PK: 식별자)
    title varchar2(100) not null,                    --배우이름
    rating number not null,
    release_year number not null,
    running_time number not null,
    age_rating varchar2(50) not null,
    
    heart number,
    subtitles_available varchar2(50),
    dubbed_available varchar2(50),
    description varchar2(3000) not null
);

insert into tblMovie values (1, '하이재킹', 8.78, 2024, 100, 12, 3, '노출 설정불가능', null , '1971년 겨울 속초공항 여객기 조종사 태인(하정우)과 규식(성동일)은 김포행 비행에 나선다. 승무원 옥순(채수빈)의 안내에 따라 탑승 중인 승객들의 분주함도 잠시, 이륙한지 얼마 되지 않아 사제폭탄이 터지며 기내는 아수라장이 된다. "지금부터 이 비행기 이북 간다" 여객기를 통째로 납치하려는 용대(여진구)는 조종실을 장악하고 무작정 북으로 기수를 돌리라 협박한다. 폭발 충격으로 규식은 한 쪽 시력을 잃고 혼란스러운 기내에서 절체절명의 상황에 처한 태인. 이들은 여객기를 무사히 착륙시키기 위한 사투를 시작하는데... 대한민국 상공 여객기 납치 사건 이 비행에 모두가 목숨을 걸었다! <하이재킹>');
insert into tblMovie values (2, '범죄도시4', 7.44, 2024, 109, 15, 45, '노출 설정가능, 영자막 지원', null , '신종 마약 사건 3년 뒤, 괴물형사 ‘마석도’(마동석)와 서울 광수대는 배달앱을 이용한 마약 판매 사건을 수사하던 중 수배 중인 앱 개발자가 필리핀에서 사망한 사건이 대규모 온라인 불법 도박 조직과 연관되어 있음을 알아낸다. 필리핀에 거점을 두고 납치, 감금, 폭행, 살인 등으로 대한민국 온라인 불법 도박 시장을 장악한 특수부대 용병 출신의 빌런 ‘백창기’(김무열)와 한국에서 더 큰 판을 짜고 있는 IT업계 천재 CEO ‘장동철’(이동휘). ‘마석도’는 더 커진 판을 잡기 위해 ‘장이수’(박지환)에게 뜻밖의 협력을 제안하고 광역수사대는 물론, 사이버수사대까지 합류해 범죄를 소탕하기 시작하는데… 나쁜 놈 잡는데 국경도 영역도 제한 없다! 업그레이드 소탕 작전! 거침없이 싹 쓸어버린다!');






--배우목록(출연작)
DROP TABLE tblActor_list;

select * from tblActor_list;


CREATE TABLE tblActor_list (
    actorlist_id NUMBER PRIMARY KEY NOT NULL,
    seq_num NUMBER,  -- 이 데이터 타입은 unique_words 테이블의 word 열의 데이터 타입과 맞추어야 합니다.
    CONSTRAINT fk_seq_num
        FOREIGN KEY (seq_num)
        REFERENCES unique_words(seq_num)
);

INSERT INTO tblActor_list (actorlist_id, seq_num) VALUES (1, 1);


select title from tblMovie where movie_id = (select actor_id from tblActor_list where actor_id = 1);


--------
CREATE TABLE tblActor_list (
    id NUMBER,
    movie_id NUMBER,
    PRIMARY KEY (id, movie_id),
    CONSTRAINT fk_actor
        FOREIGN KEY (id)
        REFERENCES tblActors(id),
    CONSTRAINT fk_movie
        FOREIGN KEY (movie_id)
        REFERENCES Movie(movie_id)
);



--------------------------------------------------------------
--배우
DROP TABLE tblActor;

select * from tblActor;

CREATE TABLE tblActor (
    id NUMBER PRIMARY KEY,
    words CLOB
);

INSERT INTO tblActor (id, words) VALUES (1, '하정우, 여진구, 성동일, 채수빈, 한송호,
마동석, 김무열, 박지환, 이동휘, 이범수, 김민재, 이지훈, 김도건, 김지훈, 현봉식,
고경표, 이이경, 음문석, 박세완, 이순원, 곽동연, 김민호, 류승수, 윤병희, 이준혁,
이와오 준코, 마츠모토 리카, 츠지 신파치, 오쿠라 마사아키, 스티븐 블럼, 존 라터 리, 스티브 벌렌, 다로 밤비, 웬디 리, 루비 마로우,
심은경, 윤제문, 김성오, 오태경, 정해균, 안재홍, 김원해, 정찬훈, 한서진, 이갑선,
하정우, 여진구, 성동일, 채수빈, 한송호,
에이미 포엘러, 필리스 스미스, 민디 캘링, 빌 헤이더, 루이스 블랙, 케이틀린 디아스, 카일 맥라클란, 다이안 레인, 리처드 카인드, 라레인 뉴먼,
김가령, 이경태, 카미키 류노스케, 카미시라이시 모네, 나가사와 마사미, 나리타 료, 유우키 아오이, 이치하라 에츠코, 시마자키 노부나가, 이시카와 카이토, 타니 카논, 테라소마 마사키,
마동석, 김무열, 박지환, 이동휘, 이범수, 김민재, 이지훈, 김도건, 김지훈, 현봉식,
윌 스미스, 마틴 로렌스, 바네사 허진스, 알렉산더 루드윅, 파올라 누녜즈, 에릭 데인, 이안 그루퍼드, 제이콥 시피오,
안도 사쿠라, 에이타, 쿠로카와 소야, 히이라기 히나타, 타카하타 미츠키, 카쿠타 아키히로, 나카무라 시도, 다나카 유코,
기타노 다케시, 세키구치 유스케, 키시모토 가요코, 다이케 요코, 요시유키 카즈코, 비트 키요시, 그레이트 기다유, 이데 랏쿄, 마무라 네즈미, 호소카와 후미에,
루피타 뇽, 조셉 퀸, 디몬 하운수, 알렉스 울프,
변요한, 신혜선, 이엘, 윤병희, 박예니, 지현준, 장성범, 심달기,
신시아, 박은빈, 서은수, 진구, 성유빈, 조민수, 차순배, 저스틴 하비, 변서윤, 채원빈,
김선호, 강태주, 김강우, 고아라,
김다미, 전소니, 변우석, 장혜진, 박충선, 남윤수, 김수형, 류지안,
레아 루이스, 마무두 아티,
김혜수, 염정아, 조인성, 박정민, 김종수, 고민시, 김재화, 박준면, 박경혜, 주보비,
심규혁, 김유림, 최한, 강은애, 이장원, 손정아, 다이고 코타로, 모리 나나, 오구리 슌, 혼다 츠바사');

INSERT INTO tblActor (id, words) VALUES (151, '하마츠 타카유키, 아키야마 유즈키, 나가야 카즈아키, 슈하마 하루미, 마오,
티모시 샬라메, 젠데이아 콜먼, 레베카 퍼거슨, 조슈 브롤린, 오스틴 버틀러, 플로렌스 퓨, 데이브 바티스타, 크리스토퍼 월켄, 스티븐 헨더슨, 레아 세이두,
강하늘, 정소민, 조민수, 김선영, 황세인, 윤경호, 이상진, 원우, 송해나, 엄지윤,
안야 테일러 조이, 크리스 헴스워스, 톰 버크,
스티브 카렐, 태연, 서현, 미란다 코스그로브, 다나 가이어, 제이슨 세걸, 러셀 브랜드, 줄리 앤드류스, 윌 아넷, 크리스틴 위그,
송승헌, 임지연, 조여정, 온주완, 유해진, 박혁권, 전혜진, 배성우, 엄태구, 예수정,
하라 나노카, 마츠무라 호쿠토, 후카츠 에리, 마츠모토 코시로, 소메타니 쇼타, 이토 사이리, 하나세 코토네, 하나자와 카나, 카미키 류노스케,
최민식, 김고은, 유해진, 이도현, 김재철, 김민준, 김병오, 전진기, 박정자, 박지일,
류준열, 유해진, 최무성, 조성하, 박명훈, 김성철, 안은진, 조윤서, 이주원, 김예은,
라미란, 김무열, 윤경호, 서현우, 박진주, 김용림, 신재휘, 배해선, 성열석, 이진희,
강동원, 이정현, 이레, 권해효, 김민재, 구교환, 김도윤, 이예원,
송강호, 이선균, 조여정, 최우식, 박소담, 이정은, 장혜진, 박명훈, 현승민, 정현준,
스티브 카렐, 크리스틴 위그, 트레이 파커, 미란다 코스그로브, 줄리 앤드류스, 러셀 브랜드, 스티브 쿠건, 다나 가이어, 피에르 꼬팽, 앤디 나이맨,
유하준, 정민결, 나상규, 강용규, 조수정, 이상화, 황원식,
스티브 카렐, 미란다 코스그로브, 크리스틴 위그, 모이세스 아리아스, 다나 가이어, 벤자민 브랫, 러셀 브랜드, 켄 정, 스티브 쿠건, 나심 페드라드,
스티브 카렐, 태연, 서현, 미란다 코스그로브, 다나 가이어, 제이슨 세걸, 러셀 브랜드, 줄리 앤드류스, 윌 아넷, 크리스틴 위그');


INSERT INTO tblActor (id, words) VALUES (261, '윌 스미스, 마틴 로렌스, 바네사 허진스, 알렉산더 루드윅, 파올라 누녜즈, 에릭 데인, 이안 그루퍼드, 제이콥 시피오,
엠마 스톤, 마크 러팔로, 윌렘 대포,
안도 사쿠라, 에이타, 쿠로카와 소야, 히이라기 히나타, 타카하타 미츠키, 카쿠타 아키히로, 나카무라 시도, 다나카 유코,
양자경, 스테파니 수, 키 호이 콴, 제이미 리 커티스,
스티브 카렐, 타라지 P. 헨슨, 양자경, 루시 로리스, 장 끌로드 반담, 피에르 꼬팽,
에밀리 블런트, 킬리언 머피, 밀리센트 시몬스, 노아 주프, 디몬 하운수, 웨인 듀발,
플로렌스 퓨, 잭 레이너, 윌 폴터, 윌리엄 잭슨 하퍼, 빌헬름 브롬그렌, 율리아 랑나르손, 아치 매더퀴, 엘로라 토르치아, 이사벨 그릴, 안나 아스트롬,
김해숙, 손호준, 강기둥, 남보라, 이원종, 박원상, 홍정인, 김영민, 한승현, 백봉기,
김다미, 조민수, 박희순, 최우식, 고민시, 최정우, 오미희, 정다은, 김병옥, 이주원,
라이언 레이놀즈, 모레나 바카린, 에드 스크레인, 지나 카라노, T.J. 밀러, 브리아나 힐데브란드, 스테판 카피식, 카란 소니, 테일러 힉슨, 레슬리 우감스,
에단 호크, 줄리 델피, 샤뮤스 데이비 핏츠패트릭, 파노스 코로니스, 아디너 레이첼 창가리, 월터 래샐리, 세니아 칼로예로풀로, 야니스 파파도폴로스, 아리안 라베드');

CREATE TABLE unique_words (
    seq_num NUMBER PRIMARY KEY,
    word VARCHAR2(100)
);



INSERT INTO unique_words (seq_num, word)
SELECT
    ROW_NUMBER() OVER (ORDER BY word) AS seq_num,
    word
FROM (
    WITH words AS (
        SELECT
            TRIM(REGEXP_SUBSTR(DBMS_LOB.SUBSTR(words, 4000, 1), '[^,]+', 1, LEVEL)) AS word
        FROM
            tblActor
        CONNECT BY
            REGEXP_SUBSTR(DBMS_LOB.SUBSTR(words, 4000, 1), '[^,]+', 1, LEVEL) IS NOT NULL
            AND PRIOR id = id
            AND PRIOR SYS_GUID() IS NOT NULL
    )
    SELECT DISTINCT word FROM words
)
ORDER BY word;



SELECT * FROM unique_words;


DROP TABLE unique_words 


