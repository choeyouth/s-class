-- 대여pl.sql

set SERVEROUTPUT on;

-- 뷰
CREATE OR REPLACE VIEW vwStudentRentalList 
AS
select s.id AS StudentId, s.name AS studentName, s.tel AS studentTel, il.id AS itemId, il.name AS itemName, ir.rentalDate AS rentalDate, ir.returnDate AS returnDate, tis.id AS itemStateId  
from tblItemRental ir 
inner join tblStudent s on s.id = ir.tblStudent_id 
inner join tblItemState tis ON tis.id = ir.tblItemState_id 
inner join tblItemList il on il.id = tis.tblItemList_id;

select * from vwStudentRentalList;


-- 0. 제약사항
-- 대여 물품의 반납 기한은 일주일 이내로 제한한다.
-- 대여 신청 및 반납은 대여 번호를 통해 관리한다. 


-- 1. 대여 물품 등록
-- 대여 물품 정보 입력시 기본 내용은 물품 이름, 물품 수량(tblItemState > insert 개수), 등록일으로한다.


--------------------------------- 물품 등록 ------------------------------------

CREATE OR REPLACE PROCEDURE procItemReg (
    pname tblItemList.name%type,
    pqty NUMBER
)
IS
  vnum NUMBER;  
  vid NUMBER;
BEGIN
    SELECT count(*) INTO vnum FROM tblItemList WHERE name = pname;
    
    IF vnum = 0 THEN 
        dbms_output.put_line(pname || ' 물품 등록을 진행합니다.');
        INSERT INTO tblItemList(id, name, regDate) VALUES(seqItemList.nextVal, pname, sysdate);
        dbms_output.put_line(pname || ' 물품 등록이 완료되었습니다.');
        dbms_output.put_line('');
        
        dbms_output.put_line('수량 '|| pqty || '개 등록을 진행합니다.');
        
        SELECT id INTO vid FROM tblItemList WHERE name = pname;
        
        FOR i IN 1..pqty LOOP
            INSERT INTO tblItemState(id, state, tblItemList_id) VALUES(seqItemState.nextVal, default, vid);
        END LOOP;
        
        dbms_output.put_line('수량 '|| pqty || '개 등록이 완료되었습니다.');
        
    ELSIF vnum = 1 THEN 
        dbms_output.put_line(pname || '이(가) 이미 등록되어있습니다. 수량 추가를 진행합니다.');
        
        SELECT id INTO vid FROM tblItemList WHERE name = pname;
        
        FOR i IN 1..pqty LOOP
            INSERT INTO tblItemState(id, state, tblItemList_id) VALUES(seqItemState.nextVal, default, vid);
        END LOOP;
        
        dbms_output.put_line('수량 '|| pqty || '개 추가 등록이 완료되었습니다.');
        
    END IF;
    
END;
/

BEGIN
    procItemReg('손수건', 1);
END;
/

select * from tblItemList;
UPDATE tblItemState SET state = '대여중' WHERE id = 374;

--------------------------------- 물품 삭제 ------------------------------------

CREATE OR REPLACE PROCEDURE procItemDelete (
    pname tblItemList.name%type,
    pqty NUMBER
)
IS
    CURSOR vcursor
    IS
    SELECT tis.id 
    FROM tblItemState tis INNER JOIN tblItemList il ON il.id = tis.tblItemList_id
    WHERE il.name = pname AND tis.state = '대여가능';

    vlnum NUMBER;  
    vsnum NUMBER;
    vtnum NUMBER;
    vlid NUMBER;
    vsid NUMBER;
BEGIN
    
    OPEN vcursor;
    
    SELECT count(*) INTO vlnum FROM tblItemList WHERE name = pname;
    
    IF vlnum = 0 THEN 
        dbms_output.put_line(pname || '이(가) 등록되어있지 않습니다.');
    ELSIF vlnum = 1 THEN 
    
        SELECT id INTO vlid FROM tblItemList WHERE name = pname;
        SELECT count(*) INTO vsnum FROM tblItemState WHERE tblItemList_id = vlid AND state = '대여중';
        SELECT count(*) INTO vtnum FROM tblItemState WHERE tblItemList_id = vlid;
        
        IF vsnum = 0 THEN
            IF vtnum - pqty >= 0 THEN
                IF vtnum = pqty THEN
                    dbms_output.put_line('교육생이 대여중인 물품이 없으므로 물품을 완전히 삭제합니다.');
                    DELETE FROM tblItemState WHERE tblItemList_id = vlid;
                    DELETE FROM tblItemList WHERE id = vlid;
                ELSIF vtnum > pqty THEN
                    dbms_output.put_line('총수량보다 적은 수량을 입력하셨습니다. ' || pqty || '개의 물품을 삭제합니다.');
                    FOR i IN 1..pqty LOOP
                        FETCH vcursor INTO vsid;
                         DELETE FROM tblItemState WHERE id = vsid;
                    END LOOP;
                END IF;
            ELSIF vtnum - pqty < 0 THEN
                dbms_output.put_line('총수량보다 많은 양의 수를 입력하셨습니다. 대여중인 학생이 없으므로 ');
                dbms_output.put_line(pqty - (pqty - vtnum) || '개의 물품을 완전히 삭제합니다.');
                FOR i IN 1..pqty - vtnum LOOP
                    FETCH vcursor INTO vsid;
                    DELETE FROM tblItemState WHERE id = vsid;
                    DELETE FROM tblItemList WHERE id = vlid;
                END LOOP;
            END IF;
        ELSIF vsnum > 0 THEN
            IF vtnum - pqty >= 0 THEN
                IF vtnum - vsnum > 0 THEN
                    IF vtnum - vsnum >= pqty THEN
                        dbms_output.put_line(pqty || '개의 물품을 삭제합니다.');
                        FOR i IN 1..pqty LOOP
                            FETCH vcursor INTO vsid;
                            DELETE FROM tblItemState WHERE id = vsid;
                        END LOOP;
                    ELSIF vtnum - vsnum < pqty THEN
                        dbms_output.put_line('교육생이 대여중인 물품이 있습니다.');
                        dbms_output.put_line(vtnum - vsnum || '개의 물품만 삭제합니다.');
                        FOR i IN 1..vtnum - vsnum LOOP
                            FETCH vcursor INTO vsid;
                            DELETE FROM tblItemState WHERE id = vsid;
                        END LOOP;
                    END IF;
                ELSIF vtnum - vsnum <= 0 THEN
                    dbms_output.put_line('입력하신 물품의 수량 모두 교육생이 대여중이므로 물품 삭제를 진행하지 못합니다.');           
                END IF;
            ELSIF vtnum - pqty < 0 THEN
                dbms_output.put_line('총수량보다 많은 양의 수를 입력하셨습니다. 다시 확인해주세요.');
            END IF;
        END IF; 
    END IF;
    
    CLOSE vcursor;
    
END;
/

BEGIN
    procItemDelete('손수건', 2);
END;
/


-- 2. 대여 서비스 관리
-- 수강생들의 대여 및 반납 현황 조회
-- 특정 물품 이름 입력 > 해당 대여 및 반납 현황 조회

CREATE OR REPLACE PROCEDURE procItemRentalRecord (
    pname VARCHAR2
)
IS
    CURSOR vcursor
    IS
    SELECT studentName, studentTel, itemName, rentalDate, returnDate 
    FROM vwStudentRentalList
    WHERE itemName = pname;
    
    vsname tblStudent.name%type;
    vstel tblStudent.tel%type;
    viName tblItemList.name%type;
    vrentalDate tblItemRental.rentalDate%type;
    vreturnDate tblItemRental.returnDate%type;
    
    vnum NUMBER;
    
BEGIN
    
    OPEN vcursor;
    
    SELECT count(*) INTO vnum
    FROM vwStudentRentalList
    WHERE itemName = pname;

    
    IF vnum = 0 THEN
        dbms_output.put_line('입력하신 정보의 물품 대여 신청 및 반납 내용이 없습니다. ');
    ELSIF vnum > 0 THEN
        dbms_output.put_line('');
        dbms_output.put_line('   ﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊﹊');
        dbms_output.put_line('                        ' || pname || ' 물품 대여 기록');
        dbms_output.put_line('   ﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎');
        dbms_output.put_line('  =============================================================================');
        dbms_output.put_line('        교육생 이름       교육생 전화번호         대여일          반납일     ');
        dbms_output.put_line('  =============================================================================');
        LOOP
            
            FETCH vcursor INTO vsname, vstel, viName, vrentalDate, vreturnDate;
            EXIT WHEN vcursor%notfound;
            
            IF vreturnDate IS NULL THEN
                dbms_output.put_line('|         ' || vsname || '        ' || vstel || '         ' || vrentalDate || '       ' || '     X' || '            |');
            ELSIF vreturnDate IS NOT NULL THEN
                dbms_output.put_line('|         ' || vsname || '        ' || vstel || '         ' || vrentalDate || '        ' || vreturnDate || '         |');
            END IF;
        
        END LOOP;
        
        dbms_output.put_line('  -----------------------------------------------------------------------------');
        
    END IF;
    
    CLOSE vcursor;
END;
/

BEGIN
    procItemRentalRecord('삼성 노트북 충전기');
END;
/



------------------------------------ 교육생 ------------------------------------
-- 0. 제약사항
-- 대여 물품의 반납 기한은 일주일 이내로 제한한다.
-- 대여 번호는 자동으로 누적해서 입력된다. 


-- 1. 대여 가능한 물품을 조회한다. 
-- 대여 물품 내용에는 물품 이름을 조회할 수 있다.
-- 특정 물품을 선택하여 특정 물품의 상태(대여 가능, 대여중)를 확인 가능하다. 
CREATE OR REPLACE PROCEDURE procSearchItem (
    pname VARCHAR2
)
IS
    vlnum NUMBER;
    vsnum NUMBER;
BEGIN
    SELECT count(*) INTO vlnum FROM tblItemList WHERE name = pname;
    SELECT count(*) INTO vsnum 
    FROM tblItemList il 
    INNER JOIN tblItemState tis ON tis.tblItemList_id = il.id 
        WHERE name = pname AND tis.state = '대여가능';
    
    IF vlnum >= 1 THEN
        IF vsnum > 0 THEN
            dbms_output.put_line(pname || '이(가) 대여 가능합니다.');
        ELSIF vsnum <= 0 THEN
            dbms_output.put_line(pname || '의 대여 가능한 수량이 남아있지 않습니다.');
        END IF;
    ELSIF vlnum = 0 THEN
        dbms_output.put_line(pname || '이(가) 등록되어있지 않습니다.');
    END IF;
    
END;
/

BEGIN
    procSearchItem('손수건');
END;
/



-- 2. 물품 대여 신청
-- 필요한 물품을 신청을 통해 대여한다. 
-- 신청서 내용에는 교육생 이름, 교육생 전화번호, 물품 이름, 신청 날짜, 반납 마감 날짜를 포함한다.  
CREATE OR REPLACE PROCEDURE procRentalApplication (
    pid NUMBER,
    pname VARCHAR2
)
IS
    vstartDate DATE := sysdate;
    vendDate DATE := sysdate + 7;
    vlnum NUMBER;
    vsnum NUMBER;
    vid NUMBER;
BEGIN
    
    SELECT count(*) INTO vlnum FROM tblItemList WHERE name = pname;
    SELECT count(*) INTO vsnum 
    FROM tblItemList il 
    INNER JOIN tblItemState tis ON tis.tblItemList_id = il.id 
        WHERE name = pname AND tis.state = '대여가능';
    
    IF vlnum >= 1 THEN
        IF vsnum > 0 THEN
            
            dbms_output.put_line(pname || '이(가) 대여 가능합니다.');
            dbms_output.put_line('신청서를 접수합니다.');
            dbms_output.put_line('대여 마감일은 ' || vendDate || '입니다.');
            
            SELECT a.* INTO vid 
            FROM (SELECT tis.id FROM tblItemState tis INNER JOIN tblItemList il ON tis.tblItemList_id = il.id 
                  WHERE il.name = pname and state = '대여가능') a 
            WHERE ROWNUM = 1;
        
            INSERT INTO tblItemRental VALUES (seqItemRental.nextVal, vstartDate, null, vid, pid);   
            UPDATE tblItemState SET state = '대여중' WHERE id = vid;
            
        ELSIF vsnum <= 0 THEN
            dbms_output.put_line(pname || '의 대여 가능한 수량이 남아있지 않습니다.');
        END IF;
    ELSIF vlnum = 0 THEN
        dbms_output.put_line(pname || '이(가) 등록되어있지 않습니다.');
    END IF;
    
END;
/

BEGIN
    procRentalApplication(350, '우산');
END;
/





-- 3. 물품 대여 신청서 조회
-- 본인이 작성한 대여 신청서를 조회할 수 있다.
-- 대여 신청서 내용에는 교육생 이름, 교육생 전화번호, 물품 이름, 신청 날짜, 반납 마감 날짜를 포함한다.  
CREATE OR REPLACE PROCEDURE procRentalRecord (
    pid NUMBER,
    pname VARCHAR2
)
IS
    
    vsname tblStudent.name%type;
    vstel tblStudent.tel%type;
    viName tblItemList.name%type;
    vrentalDate tblItemRental.rentalDate%type;
    vreturnDate tblItemRental.returnDate%type;
    
    vnum NUMBER;
    
BEGIN
    
    SELECT count(*) INTO vnum
    FROM vwStudentRentalList
    WHERE studentId = pid AND itemName = pname;
    
    IF vnum = 0 THEN
        dbms_output.put_line('입력하신 정보의 물품 대여 신청 내용이 없습니다. ');
    ELSIF vnum > 0 THEN
        
        SELECT studentName, studentTel, itemName, rentalDate, returnDate 
        INTO vsname, vstel, viName, vrentalDate, vreturnDate
        FROM vwStudentRentalList
        WHERE studentId = pid AND itemName = pname;
        
        IF vreturnDate IS NULL THEN
            IF to_date(vrentalDate + 7, 'yyyy-mm-dd') > to_date(sysdate, 'yyyy-mm-dd') THEN 
                dbms_output.put_line('╔══════════════════════════════════════════════════════════════════╗');
                dbms_output.put_line('');
                dbms_output.put_line('                 ' ||  vsname || ' 교육생의 ' || pname || ' 대여 반납 기한이');
                dbms_output.put_line('                            ' || to_char(to_date(vrentalDate + 7, 'yyyy-mm-dd') - to_date(sysdate, 'yyyy-mm-dd')) || '일 남았습니다.');
                dbms_output.put_line('');
                dbms_output.put_line('╚══════════════════════════════════════════════════════════════════╝');
            ELSIF to_date(vrentalDate + 7, 'yyyy-mm-dd') = to_date(sysdate, 'yyyy-mm-dd') THEN
                dbms_output.put_line('╔══════════════════════════════════════════════════════════════════╗');
                dbms_output.put_line('');
                dbms_output.put_line('                 ' ||  vsname || ' 교육생의 ' || pname || ' 대여 반납 기한이');
                dbms_output.put_line('                            오늘입니다. 대여 물품을 반납해주세요.');
                dbms_output.put_line('');
                dbms_output.put_line('╚══════════════════════════════════════════════════════════════════╝');
            ELSIF to_date(vrentalDate + 7, 'yyyy-mm-dd') < to_date(sysdate, 'yyyy-mm-dd') THEN
                dbms_output.put_line('╔══════════════════════════════════════════════════════════════════╗');
                dbms_output.put_line('');
                dbms_output.put_line('                 ' ||  vsname || ' 교육생의 ' || pname || ' 대여 반납 기한이');
                dbms_output.put_line('                            지났습니다. 대여 물품을 반납해주세요.');
                dbms_output.put_line('');
                dbms_output.put_line('╚══════════════════════════════════════════════════════════════════╝');
            END IF;
            dbms_output.put_line('====================================================================');
            dbms_output.put_line('       교육생 이름    교육생 전화번호     대여일      반납 마감 기한     ');
            dbms_output.put_line('====================================================================');
            dbms_output.put_line('|         ' || vsname || '      ' || vstel || '     ' || vrentalDate || '        ' || to_date(vrentalDate  + 7, 'yyyy-mm-dd') || '      |');
            dbms_output.put_line('--------------------------------------------------------------------');
        ELSIF vreturnDate IS NOT NULL THEN
            dbms_output.put_line('╔══════════════════════════════════════════════════════════════════╗');
            dbms_output.put_line('');
            dbms_output.put_line('             ' ||  vsname || ' 교육생의 ' || pname || ' 대여 반납이 완료 되었습니다.');
            dbms_output.put_line('');
            dbms_output.put_line('╚══════════════════════════════════════════════════════════════════╝');
            dbms_output.put_line('====================================================================');
            dbms_output.put_line('       교육생 이름      교육생 전화번호         대여일          반납일     ');
            dbms_output.put_line('====================================================================');
            dbms_output.put_line('|         ' || vsname || '       ' || vstel || '        ' || vrentalDate || '       ' || vreturnDate || '   |');
            dbms_output.put_line('--------------------------------------------------------------------');
  
        END IF;
    END IF;
END;
/

BEGIN
    procRentalRecord(349, '머리끈');
END;
/
select * from tblItemRental;
select * from vwStudentRentalList;

-- 4. 대여 물품 반납
-- 대여한 물품을 반납한다. 반납 시 교육생 이름, 교육생 전화번호,  물품 이름, 신청 날짜, 반납 날짜를 작성한다.
CREATE OR REPLACE PROCEDURE procRentalReturn (
    pid NUMBER,
    pname VARCHAR2
)
IS
    vrentalDate tblItemRental.rentalDate%type;
    vreturnDate tblItemRental.returnDate%type;
    vname tblStudent.name%type;
    vtel tblStudent.tel%type;
    
    vlnum NUMBER;
    vrnum NUMBER;
    
    vsid NUMBER;
    
BEGIN
        
    SELECT count(*) INTO vlnum
    FROM vwStudentRentalList 
    WHERE StudentId = pid AND ItemName = pname;
    
    IF vlnum >= 1 THEN
    
        SELECT count(*) INTO vrnum
        FROM vwStudentRentalList 
        WHERE StudentId = pid AND ItemName = pname AND returnDate IS NULL;
        
        IF vrnum = 1 THEN 
            SELECT studentName, studentTel, rentalDate, returnDate, itemStateId INTO vname, vtel, vrentalDate, vreturnDate, vsid
            FROM vwStudentRentalList 
            WHERE StudentId = pid AND ItemName = pname AND returnDate IS NULL;
            
            UPDATE tblItemRental 
            SET returnDate = TRUNC(sysdate) 
            WHERE tblStudent_Id = pid AND tblItemState_id = vsid AND returnDate IS NULL;
            
            UPDATE tblItemState SET state = '대여가능' WHERE id = vsid;
            dbms_output.put_line('반납 완료');
            
        ELSIF vrnum = 0 THEN
        
            dbms_output.put_line(vname || '님의 ' || pname || ' 대여는 ' 
            || to_char(to_date(vreturnDate, 'yyyy-mm-dd'), 'yy') || '년 ' 
            || to_char(to_date(vreturnDate, 'yyyy-mm-dd'), 'mm') || '월 ' 
            || to_char(to_date(vreturnDate, 'yyyy-mm-dd'), 'dd') || '일에 이미 반납 완료되었습니다.');
            
        END IF;
        
    ELSIF vlnum = 0 THEN
        dbms_output.put_line('입력하신 정보의 물품 대여 신청 내용이 없습니다.');
    END IF;
    
END;
/

BEGIN
    procRentalReturn(350, '우산');
END;
/


















