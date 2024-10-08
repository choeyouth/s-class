-- 물품 대여

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

-- 물품 목록 추가 
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '우산', '2022-07-02');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '보조배터리', '2022-06-11');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '삼성 노트북 충전기', '2021-05-01');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, 'LG 노트북 충전기', '2021-05-01');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, 'C타입 노트북 충전기', '2022-05-01');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '담요', '2022-06-30');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '독서대', '2022-02-11');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '공학용 계산기', '2020-11-11');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '아이폰 충전기', '2021-10-10');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '갤럭시 충전기', '2021-10-10');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, 'C타입 충전기', '2022-05-10');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '슬리퍼', '2022-12-23');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '볼펜', '2022-12-01');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '테이프', '2022-12-11');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '가위', '2021-08-13');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '풀', '2022-12-01');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '안경 닦이', '2022-09-22');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '머리끈', '2022-05-03');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '마우스 패드', '2022-07-12');
INSERT INTO tblItemList (id, name, regDate) VALUES (seqItemList.nextVal, '이어폰', '2022-01-30');



-- 우산
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 1);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 1);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 1);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 1);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 1);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 1);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 1);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 1);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 1);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 1);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 1);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 1);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 1);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 1);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 1);


-- 보조배터리
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 2);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 2);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 2);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 2);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 2);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 2);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 2);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 2);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 2);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 2);


-- 삼성 노트북 충전기 
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 3);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 3);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 3);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 3);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 3);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 3);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 3);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 3);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 3);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 3);


-- LG 노트북 충전기 
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 4);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 4);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 4);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 4);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 4);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 4);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 4);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 4);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 4);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 4);


-- C타입 노트북 충전기 
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 5);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 5);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 5);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 5);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 5);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 5);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 5);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 5);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 5);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 5);


-- 담요
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 6);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 6);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 6);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 6);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 6);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 6);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 6);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 6);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 6);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 6);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 6);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 6);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 6);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 6);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 6);


-- 독서대 
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 7);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 7);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 7);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 7);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 7);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 7);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 7);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 7);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 7);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 7);


-- 공학용 계산기 
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 8);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 8);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 8);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 8);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 8);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 8);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 8);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 8);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 8);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 8);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 8);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 8);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 8);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 8);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 8);


-- 아이폰 충전기 
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 9);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 9);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 9);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 9);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 9);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 9);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 9);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 9);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 9);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 9);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 9);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 9);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 9);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 9);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 9);


-- 갤럭시 충전기 
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 10);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 10);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 10);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 10);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능 ', 10);


-- C타입 충전기 
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 11);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 11);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 11);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 11);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 11);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 11);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 11);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 11);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 11);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 11);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 11);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 11);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 11);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 11);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 11);


-- 슬리퍼
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 12);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 12);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 12);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 12);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 12);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 12);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 12);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 12);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 12);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 12);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 12);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 12);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 12);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 12);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 12);


-- 볼펜
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 13);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 13);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 13);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 13);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 13);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 13);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 13);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 13);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 13);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 13);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 13);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 13);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 13);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 13);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 13);


-- 테이프
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 14);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 14);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 14);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 14);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 14);


-- 가위
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 15);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 15);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 15);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 15);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 15);


-- 풀
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 16);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 16);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 16);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 16);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 16);


-- 안경 닦이 
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 17);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 17);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 17);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 17);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 17);


-- 머리끈
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 18);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 18);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 18);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 18);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 18);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 18);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 18);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 18);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 18);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 18);


-- 마우스 패드
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 19);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 19);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 19);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 19);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 19);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 19);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 19);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 19);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 19);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 19);


-- 이어폰
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 20);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여중', 20);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 20);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 20);
INSERT INTO tblItemState (id, state, tblItemList_id) VALUES (seqItemState.nextVal, '대여가능', 20);


SELECT * FROM tblItemList;
SELECT id FROM tblItemState where state = '대여중' order by id;
SELECT * FROM tblItemRental;


