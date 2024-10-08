-- 대여ansi.sql

------------------------------------관리자--------------------------------------

-- 0. 제약사항
-- 대여 물품의 반납 기한은 일주일 이내로 제한한다.
-- 대여 신청 및 반납은 대여 번호를 통해 관리한다. 


-- 1. 대여 물품 등록
-- 대여 물품 정보 입력시 기본 내용은 물품 이름, 물품 수량(tblItemState > insert 개수), 등록일으로한다.

ROLLBACK;

-- 물품 등록
INSERT INTO tblItemList(id, name, regDate) VALUES(seqItemList.nextVal, '손풍기', sysdate);

-- 물품 상태 및 수량 등록
INSERT INTO tblItemState(id, state, tblItemList_id) VALUES(seqItemState.nextVal, default, 21);

SELECT * FROM tblItemList;
SELECT * FROM tblItemState;


-- 2. 대여 물품 조회
-- 대여 가능한 물품의 정보를 출력한다. (물품 이름, 총 수량, 대여가능 수량)


SELECT DISTINCT il.name AS 물품, count(*) AS "총 수량",
count(CASE
    WHEN tis.state = '대여가능' THEN 1
END) AS "대여가능 수량"
    FROM tblItemList il
    INNER JOIN tblItemState tis ON il.id = tis.tblItemList_id
            GROUP BY il.name;

-- 특정 물품을 선택하면 해당 물품들의 상태를 출력한다. 이 때 상태는 대여 가능, 대여중으로 나뉜다.
SELECT il.name, tis.state
    FROM tblItemList il
    INNER JOIN tblItemState tis ON il.id = tis.tblItemList_id
        WHERE il.id = 1;


-- 3. 대여 물품 관리 및 수정
-- 교육생의 대여 신청 및 반납을 통해 물품 수량의 수정사항이 발생 시 물품의 상태(대여가능/대여중)를 수정할 수 있다.

-- 대여
UPDATE tblItemState SET state = '대여중' WHERE id = 3;

-- 반납
UPDATE tblItemState SET state = '대여가능' WHERE id = 3;

-- 4. 대여 서비스 관리
-- 수강생들의 대여 및 반납 현황을 조회하고, 대여 물품의 상태를 변경한다. 
SELECT * FROM tblItemRental;

-- 대여
INSERT INTO tblItemRental(id, rentalDate, returnDate, tblItemState_id, tblStudent_id) VALUES (seqItemRental.nextVal, sysdate, null, 4, 296);
UPDATE tblItemState SET state = '대여중' WHERE id = 4;

-- 반납
UPDATE tblItemRental SET returnDate = sysdate WHERE id = 264;
UPDATE tblItemState SET state = '대여가능' WHERE id = 4;


-- 대여 신청서 내용에는 대여 번호, 교육생 이름, 교육생 전화번호, 물품 이름, 신청 날짜, 반납 마감 날짜를 포함한다.  
-- 물품 반납 내용에는 대여 번호, 교육생 이름, 교육생 전화번호,  물품 이름, 신청 날짜, 반납 날짜를 포함한다. 반납 기한이 7일 이상 경과 시 문자 메시지를 보낸다.
-- >>> PL 



------------------------------------ 교육생 ------------------------------------
-- 0. 제약사항
-- 대여 물품의 반납 기한은 일주일 이내로 제한한다.
-- 대여 번호는 자동으로 누적해서 입력된다. 


-- 1. 대여 가능한 물품을 조회한다. 
-- 대여 물품 내용에는 물품 이름을 조회할 수 있다.
-- 대여 가능한 물품을 조회할 때
SELECT name FROM tblItemList WHERE name = '우산';

-- 대여가 불가능한 물품을 조회할 때 
SELECT name FROM tblItemList WHERE name = '텀블러';


-- 특정 물품을 선택하여 특정 물품의 상태(대여 가능, 대여중)를 확인 가능하다. 
SELECT il.name, tis.state
    FROM tblItemList il
    INNER JOIN tblItemState tis ON il.id = tis.tblItemList_id
        WHERE name = '우산';


-- 2. 물품 대여 신청
-- 필요한 물품을 신청을 통해 대여한다. 
-- 신청서 내용에는 교육생 이름, 교육생 전화번호, 물품 이름, 신청 날짜, 반납 마감 날짜를 포함한다.  
-- >>> PL

-- 3. 물품 대여 신청서 조회
-- 본인이 작성한 대여 신청서를 조회할 수 있다.
-- 대여 신청서 내용에는 교육생 이름, 교육생 전화번호, 물품 이름, 신청 날짜, 반납 마감 날짜를 포함한다.  
-- >>> PL

-- 4. 대여 물품 반납
-- 대여한 물품을 반납한다. 반납 시 교육생 이름, 교육생 전화번호,  물품 이름, 신청 날짜, 반납 날짜를 작성한다.
-- >>> PL






