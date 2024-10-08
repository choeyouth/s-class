drop table Movie;
drop table Ranking;
drop table Announcement;
drop table Director;
drop table Director_List;
drop table Actor;
drop table Actor_List;
drop table Product_Info;
drop table Guide;
drop table Device;
drop table PurchaseRental;
drop table Usage_Method;
drop table Netizen;
drop table Comments;


desc Movie;
desc Ranking;
desc Announcement;
desc Director;
desc Director_List;
desc Actor;
desc Actor_List;
desc Product_Info;
desc Guide;
desc Device;
desc PurchaseRental;
desc Usage_Method;
desc Netizen;
desc Comments;

select * from Movie;
select * from Ranking;
select * from Announcement;
select * from Director;
select * from Director_List;
select * from Actor;
select * from Actor_List;
select * from Product_Info;
select * from Guide;
select * from Device;
select * from PurchaseRental;
select * from Usage_Method;
select * from Netizen;
select * from Comments;


CREATE TABLE Movie (
	movie_id	NUMBER	NOT NULL PRIMARY KEY,
	title	VARCHAR2(100)	NOT NULL,
	rating	NUMBER	NOT NULL,
	release_year	DATE	NOT NULL,
	running_time	NUMBER	NOT NULL,
	age_rating	VARCHAR2(50)	NOT NULL,
	heart	NUMBER	NULL,
	subtitles_available	VARCHAR2(50)	NULL,
	dubbed_available	VARCHAR2(50)	NULL,
	description	VARCHAR2(3000)	NOT NULL
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


CREATE TABLE Director (
	director_id	NUMBER	NOT NULL PRIMARY KEY,
	director_name	VARCHAR2(50)	NOT NULL
);

CREATE TABLE Director_List (
	directorlist_id	NUMBER	NOT NULL PRIMARY KEY,
    movie_id NUMBER	NOT NULL references Movie(movie_id),
    director_id NUMBER	NOT NULL references Director(director_id)
);

CREATE TABLE Actor (
	actor_id	NUMBER	NOT NULL PRIMARY KEY,
	actor_name	VARCHAR2(50)	NOT NULL
);

CREATE TABLE Actor_List (
	actorlist_id	NUMBER	NOT NULL PRIMARY KEY,
    movie_id NUMBER	NOT NULL references Movie(movie_id),
    actor_id NUMBER	NOT NULL references Actor(actor_id)
);

CREATE TABLE Product_Info (
	productInfo_id	NUMBER	NOT NULL PRIMARY KEY,
	capacity	NUMBER	NOT NULL,
	subtitles_display	VARCHAR2(50)	NOT NULL,
	video_quality	VARCHAR2(50)	NOT NULL,
	foreign_subtitles	VARCHAR2(50)	NOT NULL,
    movie_id NUMBER	NOT NULL references Movie(movie_id)
);


CREATE TABLE Guide (
	guide_id	NUMBER	NOT NULL PRIMARY KEY,
	movie_id	NUMBER	NOT NULL,
	guide_title	VARCHAR2(30)	NOT NULL,
	guide_content	VARCHAR2(2000)	NOT NULL,
    productInfo_id NUMBER	NOT NULL references Product_Info(productInfo_id)
);

CREATE TABLE Device (
	device_id	NUMBER	NOT NULL PRIMARY KEY,
	movie_id	NUMBER	NOT NULL,
	device	VARCHAR2(30)	NOT NULL,
	device_num	NUMBER	NOT NULL,
    productInfo_id NUMBER	NOT NULL references Product_Info(productInfo_id)
);

CREATE TABLE PurchaseRental (
	purchaserental_id	NUMBER	NOT NULL PRIMARY KEY,
	purchaserental_choose	VARCHAR2(30)	NOT NULL,
	Field	VARCHAR2(30)	NULL
);


CREATE TABLE Usage_Method (
	usagemethod_id	NUMBER	NOT NULL PRIMARY KEY,
	usage_price	NUMBER	NOT NULL,
    movie_id NUMBER	NOT NULL references Movie(movie_id),
    purchaserental_id NUMBER	NOT NULL references PurchaseRental(purchaserental_id)
);

CREATE TABLE Netizen (
	netizen_id	NUMBER	NOT NULL PRIMARY KEY,
	id	VARCHAR2(20)	NOT NULL UNIQUE
);

CREATE TABLE Comments (
	comment_id	NUMBER	NOT NULL PRIMARY KEY,
	comment_date	DATE	NOT NULL,
	comment_content	VARCHAR2(1500)	NOT NULL,
	likes_count	NUMBER	NULL,
	dislikes_count	NUMBER	NULL,
    netizen_id NUMBER	NOT NULL references Netizen(netizen_id),
    usagemethod_id NUMBER	NOT NULL references Usage_Method(usagemethod_id)
);




