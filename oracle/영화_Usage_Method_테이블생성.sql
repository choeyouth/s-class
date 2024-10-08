--Usage_Method Purchase_Rental 두개 테이블 Insert

drop table Usage_Method;
drop table Purchase_Rental;
drop table Movie;


--Usage_Method

CREATE TABLE Purchase_Rental (
    purchaserental_id NUMBER PRIMARY KEY,
    purchaserental_choose VARCHAR2(30) NOT NULL,
    usage_period VARCHAR2(30) NULL
);

CREATE TABLE Movie (
    movie_id NUMBER NOT NULL PRIMARY KEY,
    title VARCHAR2(100) NOT NULL,
    rating NUMBER NOT NULL,
    release_year NUMBER NOT NULL,
    running_time NUMBER NOT NULL,
    age_rating VARCHAR2(50) NOT NULL,
    heart NUMBER NULL,
    subtitles_available VARCHAR2(50) NULL,
    dubbed_available VARCHAR2(50) NULL,
    description CLOB NOT NULL
);

CREATE TABLE Usage_Method (
    usagemethod_id NUMBER PRIMARY KEY,
    movie_id NUMBER NOT NULL REFERENCES Movie(movie_id),
    purchaserental_id NUMBER NOT NULL REFERENCES Purchase_Rental(purchaserental_id),
    usage_price NUMBER NOT NULL
);


--Purchase_Rental insert

-- 대여, 7일
insert into Purchase_Rental (purchaserental_id, purchaserental_choose, usage_period) values (1, '대여', '7일');

-- 대여, 2일
insert into Purchase_Rental (purchaserental_id, purchaserental_choose, usage_period) values (2, '대여', '2일');

-- 구매, 제한 없음
insert into Purchase_Rental (purchaserental_id, purchaserental_choose, usage_period) values (3, '구매', '제한 없음');

-- 구매, 5년
insert into Purchase_Rental (purchaserental_id, purchaserental_choose, usage_period) values (4, '구매', '5년');




-- Usage_Method insert

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


select * from Usage_Method;
select * from Purchase_Rental;
select * from movie;





