-- 감독
CREATE TABLE Director (
    director_id NUMBER PRIMARY KEY NOT NULL,
    director_name VARCHAR2(50) NOT NULL
);


-- 1. 테이블 생성
CREATE TABLE Director (
    director_id NUMBER PRIMARY KEY,
    director_name VARCHAR2(100)
);

-- 2. 중복을 제거한 감독 이름 삽입
INSERT INTO Director (director_id, director_name) VALUES (1, '김성한');
INSERT INTO Director (director_id, director_name) VALUES (2, '허명행');
INSERT INTO Director (director_id, director_name) VALUES (3, '박규태');
INSERT INTO Director (director_id, director_name) VALUES (4, '곤 사토시');
INSERT INTO Director (director_id, director_name) VALUES (5, '모홍진');
INSERT INTO Director (director_id, director_name) VALUES (6, '피트 닥터');
INSERT INTO Director (director_id, director_name) VALUES (7, '신카이 마코토');
INSERT INTO Director (director_id, director_name) VALUES (8, '아딜 엘 아르비');
INSERT INTO Director (director_id, director_name) VALUES (9, '고레에다 히로카즈');
INSERT INTO Director (director_id, director_name) VALUES (10, '기타노 다케시');
INSERT INTO Director (director_id, director_name) VALUES (11, '마이클 사노스키');
INSERT INTO Director (director_id, director_name) VALUES (12, '김세휘');
INSERT INTO Director (director_id, director_name) VALUES (13, '박훈정');
INSERT INTO Director (director_id, director_name) VALUES (14, '민용근');
INSERT INTO Director (director_id, director_name) VALUES (15, '피터 손');
INSERT INTO Director (director_id, director_name) VALUES (16, '류승완');
INSERT INTO Director (director_id, director_name) VALUES (17, '우에다 신이치로');
INSERT INTO Director (director_id, director_name) VALUES (18, '드니 빌뇌브');
INSERT INTO Director (director_id, director_name) VALUES (19, '남대중');
INSERT INTO Director (director_id, director_name) VALUES (20, '조지 밀러');
INSERT INTO Director (director_id, director_name) VALUES (21, '피에르 꼬팽');
INSERT INTO Director (director_id, director_name) VALUES (22, '타치카와 유즈루');
INSERT INTO Director (director_id, director_name) VALUES (23, '김대우');
INSERT INTO Director (director_id, director_name) VALUES (24, '이시하라 슌스케');
INSERT INTO Director (director_id, director_name) VALUES (25, '장재현');
INSERT INTO Director (director_id, director_name) VALUES (26, '안태진');
INSERT INTO Director (director_id, director_name) VALUES (27, '장유정');
INSERT INTO Director (director_id, director_name) VALUES (28, '연상호');
INSERT INTO Director (director_id, director_name) VALUES (29, '봉준호');
INSERT INTO Director (director_id, director_name) VALUES (30, '카일 발다');
INSERT INTO Director (director_id, director_name) VALUES (31, '봉만대');
INSERT INTO Director (director_id, director_name) VALUES (32, '지오르고스 란디모스');
INSERT INTO Director (director_id, director_name) VALUES (33, '다니엘 콴');
INSERT INTO Director (director_id, director_name) VALUES (34, '존 크래신스키');
INSERT INTO Director (director_id, director_name) VALUES (35, '아리 에스터');
INSERT INTO Director (director_id, director_name) VALUES (36, '강지은');
INSERT INTO Director (director_id, director_name) VALUES (37, '팀 밀러');
INSERT INTO Director (director_id, director_name) VALUES (38, '리처드 링클레이터');

-- 3. 순서와 함께 감독 이름 조회
SELECT * FROM Director;
