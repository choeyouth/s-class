-- Usage_Method

CREATE TABLE Purchase_Rental (
	purchaserental_id	NUMBER	NOT NULL PRIMARY KEY,
	purchaserental_choose	VARCHAR2(30)	NOT NULL,
	usage_period	VARCHAR2(30)	NULL
);


CREATE TABLE Usage_Method (
	usagemethod_id	NUMBER	NOT NULL PRIMARY KEY,
	usage_price	NUMBER	NOT NULL,
    movie_id NUMBER	NOT NULL references Movie(movie_id),
    purchaserental_id NUMBER	NOT NULL references PurchaseRental(purchaserental_id)
);

CREATE TABLE Ranking (
	ranking_id	NUMBER	NOT NULL PRIMARY KEY,
	current_rank	NUMBER	NOT NULL,
	change_rank	NUMBER	NULL,
    movie_id NUMBER	NOT NULL references Movie(movie_id)
);


CREATE TABLE Announcement (
	announcement_id	NUMBER	NOT NULL PRIMARY KEY,
	announcement_content	VARCHAR2(1000)	NOT NULL,
    movie_id NUMBER	NOT NULL references Movie(movie_id)
);


select * from Usage_Method;

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




ranking


insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (1, 1, 1, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (2, 2, 2, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (3, 3, 3, -1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (4, 4, 4, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (5, 5, 5, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (6, 6, 6, -1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (7, 7, 7, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (8, 8, 8, -1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (9, 9, 9, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (10, 10, 10, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (11, 11, 11, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (12, 12, 12, -3);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (13, 13, 13, -3);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (14, 14, 14, -1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (15, 15, 15, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (16, 16, 16, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (17, 17, 17, -5);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (18, 18, 18, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (19, 19, 19, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (20, 20, 20, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (21, 21, 21, -2);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (22, 22, 22, -8);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (23, 23, 23, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (24, 24, 24, -6);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (25, 25, 25, -3);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (26, 26, 26, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (27, 27, 27, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (28, 28, 28, -13);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (29, 29, 29, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (30, 30, 30, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (31, 31, 31, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (32, 32, 32, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (33, 33, 33, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (34, 34, 34, -1);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (35, 35, 35, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (36, 36, 36, -2);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (37, 37, 37, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (38, 38, 38, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (39, 39, 39, -16);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (40, 40, 40, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (41, 41, 41, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (42, 42, 42, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (43, 43, 43, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (44, 44, 44, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (45, 45, 45, -18);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (46, 46, 46, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (47, 47, 47, -27);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (48, 48, 48, null);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (49, 49, 49, -33);
insert into ranking (ranking_id, movie_id, current_rank, change_rank) values (50, 50, 50, -1);



announcement


INSERT INTO Announcement (announcement_id, movie_id, announcement_content) VALUES (1, 4, '본 영상의 최고화질은 854x480으로, 화질 업그레이드가 어려운 점 구매 시 참고 부탁 드립니다.');


INSERT INTO Announcement (announcement_id, movie_id, announcement_content) VALUES (2, 16, '본 영화는 영어자막이 제공되고 있습니다. 자막 설정 On/Off 가능하오니 이용에 참고 부탁드립니다.');

INSERT INTO Announcement (announcement_id, movie_id, announcement_content) VALUES (3, 18, '※ \'엘리멘탈\' 구매 시, \'코멘터리\', \'극장 쇼트 필름-칼의 데이트\' 등 6건의 부가영상이 제공됩니다. 총 64분 길이의 부가영상과 함께 더 즐거운 시간 보내세요! \'엘리멘탈\' 부가영상은 기존 구매자분들께도 지급되었으며, [MY>내 영상]에서 이용하실 수 있습니다.');


INSERT INTO Announcement (announcement_id, movie_id, announcement_content) VALUES (4, 25, '※ \'퓨리오사: 매드맥스 사가\' 구매 시, \'제작 비하인드\' 등 4건의 부가영상이 제공됩니다. 총 91분 길이의 부가영상과 함께 더 즐거운 시간 보내세요! \'퓨리오사: 매드맥스 사가\' 부가영상은 기존 구매자분들께도 지급되었으며, [MY>내 영상]에서 이용하실 수 있습니다.');







purchaserental
-- 대여, 7일
insert into Purchase_Rental (purchaserental_id, purchaserental_choose, usage_period) values (1, '대여', '7일');

-- 대여, 2일
insert into Purchase_Rental (purchaserental_id, purchaserental_choose, usage_period) values (2, '대여', '2일');

-- 구매, 제한 없음
insert into Purchase_Rental (purchaserental_id, purchaserental_choose, usage_period) values (3, '구매', '제한 없음');

-- 구매, 5년
insert into Purchase_Rental (purchaserental_id, purchaserental_choose, usage_period) values (4, '구매', '5년');