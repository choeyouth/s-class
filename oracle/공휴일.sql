-- 출석
DROP TABLE tblHoliday;

CREATE SEQUENCE seqHoliday;

DROP SEQUENCE seqHoliday;

CREATE TABLE tblHoliday ( 
     id NUMBER PRIMARY KEY,  
     holidayDate DATE NOT NULL,  
     holiday VARCHAR2(30) NOT NULL  
);

-- 2022년 
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-01-01', '신정');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-01-31', '설날 연휴');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-02-01', '설날');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-02-02', '설날 연휴');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-03-01', '삼일절');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-03-09', '20대 대통령선거');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-05-05', '어린이날');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-05-08', '부처님 오신 날');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-06-01', '지방선거');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-06-06', '현충일');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-08-15', '광복절');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-09-09', '추석 연휴');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-09-10', '추석');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-09-11', '추석');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-09-12', '대체공휴일');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-10-03', '개천절');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-10-09', '한글날');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-10-10', '대체공휴일');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2022-12-25', '크리스마스');

-- 2023년
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2023-01-01', '신정');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2023-01-21', '설날 연휴');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2023-01-22', '설날');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2023-01-23', '설날 연휴');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2023-01-24', '대체공휴일');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2023-03-01', '삼일절');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2023-05-05', '어린이날');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2023-05-27', '부처님 오신 날');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2023-06-06', '현충일');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2023-08-15', '광복절');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2023-09-28', '추석');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2023-09-29', '추석');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2023-09-30', '추석');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2023-10-03', '개천절');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2023-10-09', '한글날');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2023-12-25', '크리스마스');

-- 2024년 
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-01-01', '신정');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-02-09', '설 연휴');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-02-10', '설날');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-02-11', '설 연휴');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-02-12', '대체공휴일');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-03-01', '삼일절');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-04-10', '22대 국회의원 선거');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-05-01', '근로자의 날');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-05-05', '어린이날');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-05-15', '부처님 오신 날');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-06-06', '현충일');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-08-15', '광복절');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-09-16', '추석');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-09-17', '추석');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-09-18', '추석');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-10-03', '개천절');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-10-09', '한글날');
INSERT INTO tblHoliday (id, holidayDate, holiday) VALUES (seqHoliday.nextVal, '2024-12-25', '크리스마스');


SELECT * FROM tblHoliday;






































