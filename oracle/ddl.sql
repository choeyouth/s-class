
drop table Ranking;
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

CREATE TABLE Ranking (
	ranking_id NUMBER PRIMARY KEY,
	movie_id NUMBER	NOT NULL REFERENCES Movie(movie_id),
	current_rank NUMBER	NOT NULL,
	change_rank	NUMBER NULL
);

