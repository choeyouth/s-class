-- Ranking

drop table Movie;
drop table Ranking;



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


-- Ranking insert

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


select * from Ranking;
select * from movie;








