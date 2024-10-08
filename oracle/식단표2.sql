-- 식단표 목록
CREATE TABLE tblKoreanMenu (
	id NUMBER PRIMARY KEY,
	menu VARCHAR2(50) NOT NULL
);

CREATE SEQUENCE seqKoreanMenu;

CREATE TABLE tblKoreanList (
	id NUMBER PRIMARY KEY,
    tblWeeklyMenu_id NUMBER REFERENCES tblWeeklyMenu(id) NOT NULL,
    tblKoreanMenu_id NUMBER REFERENCES tblKoreanMenu(id) NOT NULL
);

CREATE SEQUENCE seqKoreanList;

INSERT INTO tblKoreanList (id, tblWeeklyMenu_id, tblKoreanMenu_id) VALUES (seqKoreanList.nextVal, 1, 1);



CREATE TABLE tblPremiumMenu(
	id NUMBER PRIMARY KEY,
	menu VARCHAR2(50) NOT NULL
);

CREATE SEQUENCE seqPremiumMenu;


CREATE TABLE tblPremiumList(
	id NUMBER PRIMARY KEY,
          tblWeeklyMenu_id NUMBER REFERENCES tblWeeklyMenu(id) NOT NULL,
          tblPremiumMenu_id NUMBER REFERENCES tblPremiumMenu(id) NOT NULL
);

CREATE SEQUENCE seqPremiumList;

CREATE TABLE tblPlusMenu (
	id NUMBER PRIMARY KEY,
	menu VARCHAR2(50) NOT NULL
);

CREATE SEQUENCE seqPlusMenu;

CREATE TABLE tblPremiumList(
	id NUMBER PRIMARY KEY,
          tblWeeklyMenu_id NUMBER REFERENCES tblWeeklyMenu(id) NOT NULL,
          tblPlusMenu_id NUMBER REFERENCES tblPlusMenu(id) NOT NULL
);

CREATE SEQUENCE seqPlusList;






























