drop table weekly_menu;
drop table Korean_menu;
drop table japanese_menu;
drop table plus_menu;

CREATE TABLE Weekly_Menu (
	Week_Key Number Primary Key NOT NULL,
	week_date date not NULL
);

CREATE TABLE Korean_Menu (
	K_Key	Number Primary Key NOT NULL,
	K_name	VARCHAR(255) not NULL,
    Week_key number references weekly_menu(week_key)
);

CREATE TABLE Japanese_Menu (
	J_Key	Number Primary Key NOT NULL,
	J_name	VARCHAR(255) not NULL,
    Week_key number references weekly_menu(week_key)
);

CREATE TABLE Plus_Menu (
	P_Key	Number  Primary Key NOT NULL,
	P_name	VARCHAR(255) not NULL,
    Week_key number references weekly_menu(week_key)
);


insert into weekly_menu(week_key, week_date) values(1, sysdate);
insert into korean_menu(k_key, k_name, week_key) values(1, '감자', 1);
insert into korean_menu(k_key, k_name, week_key) values(2, '고구마', 1);
insert into Japanese_Menu(J_Key, J_name, week_key) values(1, '라멘', 1);
insert into Plus_Menu(P_key, P_name, week_key) values(1, '샐러드', 1);

select * from weekly_menu;

select w.week_date, k.k_name, j.j_name, p.p_name from weekly_menu w
    left outer join korean_menu k
        on w.week_key = k.week_key
            left outer join japanese_menu j
                on w.week_key = j.week_key
                    left outer join plus_menu p
                        on w.week_key = p.week_key
                            group by w.week_date; 

--------------------------------------------------------------------------------

drop table weekly_menu;
drop table Korean_menu;
drop table japanese_menu;
drop table plus_menu;

CREATE TABLE Korean_Menu (
	K_Key	Number Primary Key NOT NULL,
	K_name	VARCHAR(255) not NULL
);

CREATE TABLE Japanese_Menu (
	J_Key	Number Primary Key NOT NULL,
	J_name	VARCHAR(255) not NULL
);

CREATE TABLE Plus_Menu (
	P_Key	Number  Primary Key NOT NULL,
	P_name	VARCHAR(255) not NULL
);

CREATE TABLE Weekly_Menu (
	Week_Key Number Primary Key NOT NULL,
	week_date date not NULL,
    k_key number references korean_menu(k_key),
    J_key number references japanese_menu(j_key),
    P_key number references plus_menu(p_key)
);


insert into weekly_menu(week_key, week_date, k_key, j_key, p_key) values(1, sysdate, 1, 1, 1);
insert into weekly_menu(week_key, week_date, k_key) values(1, sysdate, 2);
insert into korean_menu(k_key, k_name) values(1, '감자');
insert into korean_menu(k_key, k_name) values(2, '고구마');
insert into Japanese_Menu(J_Key, J_name) values(1, '라멘');
insert into Plus_Menu(P_key, P_name) values(1, '샐러드');

select * from weekly_menu;

select w.week_date, k.k_name, j.j_name, p.p_name from weekly_menu w
    inner join korean_menu k
        on w.k_key = k.k_key
            inner join japanese_menu j
                on w.j_key = j.j_key
                    inner join plus_menu p
                        on w.p_key = p.p_key;
                        
-----------------------------------------------------------------------------------

drop table weekly_menu;
drop table Korean_menu;
drop table japanese_menu;
drop table plus_menu;
drop table Korean_menu_list;
drop table japanese_menu_list;
drop table plus_menu_list;


CREATE TABLE Weekly_Menu (
	Week_Key Number Primary Key NOT NULL,
	week_date date not NULL
);

CREATE TABLE Korean_Menu (
	K_Key	Number Primary Key NOT NULL,
	K_name	VARCHAR(255) not NULL
);

CREATE TABLE Japanese_Menu (
	J_Key	Number Primary Key NOT NULL,
	J_name	VARCHAR(255) not NULL
);

CREATE TABLE Plus_Menu (
	P_Key	Number  Primary Key NOT NULL,
	P_name	VARCHAR(255) not NULL
);

CREATE TABLE Korean_Menu_List (
	Klist_Key	Number Primary Key NOT NULL,
    k_key number references korean_menu(k_key),
	Week_key number references weekly_menu(week_key)
);

CREATE TABLE Japanese_Menu_List (
	Jlist_Key	Number Primary Key NOT NULL,
    J_key number references japanese_menu(j_key),
	Week_key number references weekly_menu(week_key)
);

CREATE TABLE Plus_Menu_List (
	Plist_Key	Number  Primary Key NOT NULL,
    P_key number references plus_menu(p_key),
	Week_key number references weekly_menu(week_key)
);


insert into weekly_menu(week_key, week_date) values(1, sysdate);
insert into korean_menu(k_key, k_name) values(1, '감자');
insert into korean_menu(k_key, k_name) values(2, '고구마');
insert into Japanese_Menu(J_Key, J_name) values(1, '라멘');
insert into Plus_Menu(P_key, P_name) values(1, '샐러드');


insert into Korean_Menu_List(klist_key, k_key, week_key) values(1, 1, 1);
insert into Korean_Menu_List(klist_key, k_key, week_key) values(2, 2, 1);
insert into Japanese_Menu_List(jlist_key, j_key, week_key) values(1, 1, 1);
insert into Plus_Menu_list(plist_key, p_key, week_key) values(1, 1, 1);

select * from korean_menu k
    inner join korean_menu_list kl
        on k.k_key = kl.k_key
            inner join weekly_menu w
                on w.week_key = kl.week_key;
                




create table tblItemList (
    id number primary key,
    name varchar2(30) unique,
    ItemlistDate date not null
);


drop table tblItemState;
drop table tblItemRental;

create table tblItemState (
    id number primary key,
    tblItemList_id number references tblItemList(id),
    state varchar2(30) not null
);

create table tblItemRental (
    id number primary key,
    tblItemState_id number references tblItemState(id),
    rentalDate date not null,
    returnDate date null
);

insert into tblItemList(id, name, ItemlistDate) values(1, '우산', '2024-08-09');
insert into tblItemState(id, tblItemList_id, state) values (1, 1, '대여중');
insert into tblItemState(id, tblItemList_id, state) values (2, 1, '대여 가능');
insert into tblItemState(id, tblItemList_id, state) values (3, 1, '대여중');
insert into tblItemState(id, tblItemList_id, state) values (4, 1, '대여 가능');
insert into tblItemState(id, tblItemList_id, state) values (5, 1, '대여중');

insert into tblItemRental(id, tblItemState_id, rentalDate, returnDate) values(1, 2, sysdate, null);

select * from tblItemList;
select * from tblItemState;
select * from tblItemRental;

select '홍길동', l.name, r.rentaldate, r.returndate from tblItemList l
    inner join tblItemState s
        on l.id = s.tblitemlist_id
            inner join tblItemRental r
                on r.tblitemstate_id = s.id;




select * from tbltodo;

----------------------------------------------------

create table tblAttendance (
    id number primary key,
    attendanceDate date not null
);

create table tblSickRecord (
    id number primary key,
    tblAttendance_id references tblAttendance(id)
);

drop table tblAttendanceDitail;
create table tblAttendanceDitail (
    id number primary key,
    inTime varchar2(10) not null,
    outTime varchar2(10) null,
    tblAttendance_id references tblAttendance(id)
);

select * from tblHoliday;
select * from tblattendance;
select * from tblattendanceditail;

insert into tblAttendance (id, attendanceDate) values (1, sysdate);
insert into tblAttendance (id, attendanceDate) values (2, sysdate);

insert into tblAttendanceDitail (id, inTime, outTime, tblAttendance_id) values (2, '08:05:21', '17:55:43', 1); 

--------------------------------------------------------------------------------
-----------------------------------이름 고정------------------------------------
--------------------------------------------------------------------------------
SELECT * FROM tblStudent;

DROP TABLE tblStudent;

CREATE TABLE tblStudent ( 
	id NUMBER PRIMARY KEY, 
	name VARCHAR2(50) NOT NULL,  
	ssn NUMBER NOT NULL,
	tel VARCHAR2(50) NOT NULL,
	regdate DATE DEFAULT SYSDATE NOT NULL
);

DROP SEQUENCE seqStudent;
CREATE SEQUENCE seqStudent;

CREATE TABLE tblAdmin( 
     id NUMBER PRIMARY KEY, 
     name VARCHAR2(50) NOT NULL,  
     tel VARCHAR2(50) NOT NULL
);

CREATE SEQUENCE seqAdmin;


CREATE TABLE tblCourse (
	id NUMBER PRIMARY KEY,
	name VARCHAR2(100) NOT NULL
);

CREATE SEQUENCE seqCourse;

CREATE TABLE tblClassroom (
	id NUMBER PRIMARY KEY,
	name VARCHAR2(50) NOT NULL,
	capacity NUMBER NOT NULL
);

CREATE SEQUENCE seqClassroom;

CREATE TABLE tblOpenCourse (
	id NUMBER PRIMARY KEY,
	name VARCHAR2(100) NOT NULL,
	startDate DATE NOT NULL,
	endDate DATE NOT NULL,
	tblCourse_id NUMBER REFERENCES tblCourse(id) NOT NULL,
	tblClassroom_id NUMBER REFERENCES tblClassroom(id) NOT NULL
);

CREATE SEQUENCE seqOpenCourse;


---------------------------------물품 대여--------------------------------------

DROP TABLE tblItemList;
DROP TABLE tblItemState;
DROP TABLE tblItemRental;

CREATE SEQUENCE seqItemList;
CREATE SEQUENCE seqItemState;
CREATE SEQUENCE seqItemRental;

DROP SEQUENCE seqItemList;
DROP SEQUENCE seqItemState;
DROP SEQUENCE seqItemRental;

CREATE TABLE tblItemList (
     id NUMBER PRIMARY KEY,
     name VARCHAR2(30) NOT NULL,
     regDate DATE NOT NULL
);

CREATE TABLE tblItemState (
	id NUMBER PRIMARY KEY,
	state VARCHAR2(15) NOT NULL,
	tblItemList_id NUMBER REFERENCES tblItemList(id)
);

CREATE TABLE tblItemRental (
	id NUMBER PRIMARY KEY,
	rentalDate DATE NOT NULL,
	returnDate DATE NOT NULL,
	tblItemState_id NUMBER REFERENCES tblItemState(id) NOT NULL,
	tblStudent_id NUMBER REFERENCES tblStudent(id) NOT NULL
);

SELECT * FROM tblItemList;
SELECT * FROM tblItemState;
SELECT * FROM tblItemRental;

--------------------------------------------------------------------------------

SELECT * FROM tblAttendance;
SELECT * FROM tblAttendDitail;
SELECT * FROM tblSickRecord;
SELECT * FROM tblHoliday;

DROP TABLE tblAttendance;
DROP TABLE tblAttendDitail;
DROP TABLE tblSickRecord;
DROP TABLE tblHoliday;

CREATE SEQUENCE seqAttendance;
CREATE SEQUENCE seqAttendDitail;
CREATE SEQUENCE seqSickRecord;
CREATE SEQUENCE seqHoliday;

DROP SEQUENCE seqAttendance;

CREATE TABLE tblAttendance (
     id NUMBER PRIMARY KEY,
     attendanceDate DATE NOT NULL,
     tblStudent_id NUMBER REFERENCES tblStudent(id) NOT NULL,
     tblOpenCourse_id NUMBER REFERENCES tblOpenCourse(id) NOT NULL
);

CREATE TABLE tblAttendDitail (
     id NUMBER PRIMARY KEY,
     inTime VARCHAR2(10) NOT NULL,
     outTime VARCHAR2(10) NULL,
     tblAttendance_id NUMBER REFERENCES tblAttendance(id) NOT NULL
);

CREATE TABLE tblSickRecord (
     id NUMBER PRIMARY KEY,
     tblAttendance_id NUMBER REFERENCES tblAttendance(id) NOT NULL
);

CREATE TABLE tblHoliday ( 
     id NUMBER PRIMARY KEY,  
     holidayDate DATE NOT NULL,  
     holiday VARCHAR2(30) NOT NULL  
);




--------------------------------------------------------------------------------
SELECT * FROM tblWeeklyMenu;
SELECT * FROM tblKoreanMenu;
SELECT * FROM tblPremiumMenu;
SELECT * FROM tblPlusMenu;

DROP TABLE tblWeeklyMenu;
DROP TABLE tblKoreanMenu;
DROP TABLE tblPremiumMenu;
DROP TABLE tblPlusMenu;

CREATE SEQUENCE seqWeeklyMenu;
CREATE SEQUENCE seqKoreanMenu;
CREATE SEQUENCE seqPremiumMenu;
CREATE SEQUENCE seqPlusMenu;

DROP SEQUENCE seqWeeklyMenu;
DROP SEQUENCE seqKoreanMenu;
DROP SEQUENCE seqPremiumMenu;
DROP SEQUENCE seqPlusMenu;

CREATE TABLE tblWeeklyMenu (
     id NUMBER  PRIMARY KEY, 
     menuDate DATE NOT NULL
);

CREATE TABLE tblKoreanMenu (
     id NUMBER PRIMARY KEY,
     menu VARCHAR2(50) NOT NULL,
     tblWeeklyMenu_id NUMBER REFERENCES tblWeeklyMenu(id) NOT NULL
);

CREATE TABLE tblPremiumMenu (
     id NUMBER PRIMARY KEY,
     menu VARCHAR2(30) NOT NULL,
     tblWeeklyMenu_id NUMBER REFERENCES tblWeeklyMenu(id) NOT NULL
);

CREATE TABLE tblPlusMenu (
     id NUMBER PRIMARY KEY,
     menu VARCHAR2(50) NOT NULL,
     tblWeeklyMenu_id NUMBER REFERENCES tblWeeklyMenu(id) NOT NULL
);



--------------------------------------------------------------------------------







