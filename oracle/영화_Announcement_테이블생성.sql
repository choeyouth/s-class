--Announcement


drop table Movie;
drop table Announcement;


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


CREATE TABLE Announcement (
	announcement_id	NUMBER PRIMARY KEY,
	movie_id NUMBER	NOT NULL REFERENCES Movie(movie_id),
	announcement_content VARCHAR2(1000)	NOT NULL
);


-- Announcement insert

insert into Announcement (announcement_id, movie_id, announcement_content) values (1, 4, '본 영상의 최고화질은 854x480으로, 화질 업그레이드가 어려운 점 구매 시 참고 부탁 드립니다.');

insert into Announcement (announcement_id, movie_id, announcement_content) values (2, 16, '본 영화는 영어자막이 제공되고 있습니다. 자막 설정 On/Off 가능하오니 이용에 참고 부탁드립니다.');

insert into Announcement (announcement_id, movie_id, announcement_content) values (3, 18, '※ ''엘리멘탈'' 구매 시, ''코멘터리'', ''극장 쇼트 필름-칼의 데이트'' 등 6건의 부가영상이 제공됩니다. 총 64분 길이의 부가영상과 함께 더 즐거운 시간 보내세요! ''엘리멘탈'' 부가영상은 기존 구매자분들께도 지급되었으며, [MY>내 영상]에서 이용하실 수 있습니다.');

insert into Announcement (announcement_id, movie_id, announcement_content) values (4, 25, '※ ''퓨리오사: 매드맥스 사가'' 구매 시, ''제작 비하인드'' 등 4건의 부가영상이 제공됩니다. 총 91분 길이의 부가영상과 함께 더 즐거운 시간 보내세요! ''퓨리오사: 매드맥스 사가'' 부가영상은 기존 구매자분들께도 지급되었으며, [MY>내 영상]에서 이용하실 수 있습니다.');



select * from Announcement;
select * from movie;