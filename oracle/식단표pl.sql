-- 식단표pl.sql


set SERVEROUTPUT on;

-------------------------------------관리자-------------------------------------
-- 0. 제약사항
-- 일식은 화요일, 목요일에만 포함한다.
-- 각 메뉴는 날짜로 구분한다.



-- 1. 해당 날짜의 한식(일품, PLUS)메뉴를 등록한다. 
-- 원하는 날짜가 식단표에 등록되어 있지 않을 경우 등록한다.
CREATE OR REPLACE PROCEDURE procMenuReg (
    pdate DATE,
    pdiv NUMBER,
    pmenu VARCHAR2
)
IS
    vwnum NUMBER;
    vmnum NUMBER;  
    vwid NUMBER;
    vmid NUMBER;
    vdate DATE;
BEGIN
    IF to_char(to_date(pdate, 'yy/mm/dd'), 'd') BETWEEN 2 AND 6 THEN
        SELECT count(*) INTO vwnum FROM tblWeeklyMenu WHERE menuDate = pdate;
        IF vwnum = 0 THEN
            dbms_output.put_line('해당 날짜의 등록된 식단표가 없습니다. 식단표를 생성합니다.');
            vdate := pdate - (to_char(to_date(pdate, 'yy/mm/dd'), 'd')) + 2;
            FOR i IN 1..5 LOOP  
                INSERT INTO tblWeeklyMenu VALUES (seqWeeklyMenu.nextVal, vdate);
                vdate := vdate + 1;
            END LOOP;
        END IF;
        
        SELECT id INTO vwid FROM tblWeeklyMenu WHERE menuDate = pdate;
            IF pdiv = 1 THEN
                dbms_output.put_line('한식 메뉴를 등록합니다.');
                INSERT INTO tblKoreanMenu VALUES (seqKoreanMenu.nextVal, pmenu);
                SELECT id INTO vmid 
                FROM (SELECT * FROM tblKoreanMenu pm WHERE menu = pmenu ORDER BY id DESC) a 
                    WHERE rownum = 1;       
                INSERT INTO tblKoreanList VALUES (seqKoreanList.nextVal, vwid, vmid);
                dbms_output.put_line('한식 메뉴를 등록이 완료되었습니다.');
            ELSIF pdiv = 2 THEN
                IF to_char(to_date(pdate, 'yy/mm/dd'), 'd') IN (3, 5) THEN
                    dbms_output.put_line('일품 메뉴를 등록합니다.');
                    INSERT INTO tblPremiumMenu VALUES (seqPremiumMenu.nextVal, pmenu);
                    SELECT id INTO vmid 
                    FROM (SELECT * FROM tblPremiumMenu pm WHERE menu = pmenu ORDER BY id DESC) a 
                        WHERE rownum = 1;       
                    INSERT INTO tblPremiumList VALUES (seqPremiumList.nextVal, vwid, vmid);
                    dbms_output.put_line('일품 메뉴를 등록이 완료되었습니다.');
                ELSIF to_char(to_date(pdate, 'yy/mm/dd'), 'd') IN (2, 4, 6) THEN
                    dbms_output.put_line('일품 메뉴의 날짜는 화요일 또는 목요일이어야만 합니다.');
                END IF;
            ELSIF pdiv = 3 THEN
                dbms_output.put_line('PLUS 메뉴를 등록합니다.');
                INSERT INTO tblPlusMenu VALUES (seqPlusMenu.nextVal, pmenu);
                SELECT id INTO vmid 
                FROM (SELECT * FROM tblPlusMenu pm WHERE menu = pmenu ORDER BY id DESC) a 
                    WHERE rownum = 1;
                INSERT INTO tblPlusList VALUES (seqPlusList.nextVal, vwid, vmid);
                dbms_output.put_line('PLUS 메뉴를 등록이 완료되었습니다.');
                
            ELSIF pdiv NOT IN (1, 2, 3) THEN
                dbms_output.put_line('한식 메뉴는 1번, 일품 메뉴는 2번, PLUS 메뉴는 3번을 눌러주세요.');
            END IF;
    ELSIF to_char(to_date(pdate, 'yy/mm/dd'), 'd') IN (1, 7) THEN
        dbms_output.put_line('식단표의 날짜는 평일만 가능합니다.');
    END IF;
END;
/


BEGIN
    procMenuReg('2024-09-03', 2, '그린샐러드');
END;
/

rollback;
commit;

select * from tblWeeklyMenu order by id desc;
delete from tblPremiumMenu where id in (106, 107);
select * from tblKoreanList order by id desc;
select * from tblKoreanMenu order by id desc;
select * from tblPremiumMenu order by id desc;
select * from tblPremiumList order by id desc;
select * from tblPlusMenu order by id desc;
select * from tblPlusList order by id desc;
delete from tblKoreanMenu where id = 321;


-- 2. 해당 날짜의 한식(일품, PLUS)메뉴를 조회한다.
CREATE OR REPLACE PROCEDURE procDivMenu (
    pdate DATE,
    pdiv NUMBER
)
IS  
    CURSOR kcursor
    IS
    SELECT km.menu AS 한식
        FROM tblKoreanMenu km
        INNER JOIN tblKoreanList kl ON km.id = kl.tblKoreanMenu_id
        INNER JOIN tblWeeklyMenu wm ON wm.id = kl.tblWeeklyMenu_id
            WHERE wm.menuDate = pdate;
            
    CURSOR prcursor
    IS 
    SELECT pm.menu AS 일품
        FROM tblPremiumMenu pm
        INNER JOIN tblPremiumList pl ON pm.id = pl.tblPremiumMenu_id
        INNER JOIN tblWeeklyMenu wm ON wm.id = pl.tblWeeklyMenu_id  
            WHERE wm.menuDate = pdate;
    
    CURSOR plcursor
    IS
    SELECT pm.menu AS PLUS메뉴
        FROM tblPlusMenu pm
        INNER JOIN tblPlusList pl ON pm.id = pl.tblPlusMenu_id
        INNER JOIN tblWeeklyMenu wm ON wm.id = pl.tblWeeklyMenu_id
            WHERE wm.menuDate = pdate;
            
    vname VARCHAR2(50);
    vnum NUMBER;
    vholiday tblHoliday.holiday%type;
BEGIN
    SELECT count(*) INTO vnum FROM tblHoliday WHERE holidayDate = pdate;
    
    IF vnum = 0 THEN 

        IF to_char(to_date(pdate, 'yy/mm/dd'), 'd') BETWEEN 2 AND 6 THEN
            
            dbms_output.put_line('20' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'yy') || '년 ' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'mm') 
            || '월 ' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'dd') || '일 ' || to_char(to_date(pdate, 'yy/mm/dd'), 'dy') || '요일');
            
            IF pdiv = 1 THEN
                OPEN kcursor;

                    dbms_output.put_line('한식 메뉴');
                    dbms_output.put_line('');
                    LOOP 
                        FETCH kcursor INTO vname;
                        EXIT WHEN kcursor%notfound;
                        dbms_output.put_line(vname);
                    END LOOP;
                CLOSE kcursor;
            ELSIF pdiv = 2 THEN
                IF to_char(to_date(pdate, 'yy/mm/dd'), 'd') IN (3, 5) THEN
                    OPEN prcursor;
                        
                        dbms_output.put_line('일품 메뉴');
                        dbms_output.put_line('');
                        LOOP 
                            FETCH prcursor INTO vname;
                            EXIT WHEN prcursor%notfound;
                            dbms_output.put_line(vname);
                        END LOOP;
                    CLOSE prcursor;
                ELSIF to_char(to_date(pdate, 'yy/mm/dd'), 'd') IN (2, 4, 6) THEN    
                    dbms_output.put_line('일품 메뉴는 화요일, 목요일에만 해당됩니다.');
                END IF;
            ELSIF pdiv = 3 THEN
                OPEN plcursor;
                    dbms_output.put_line('PLUS 메뉴');
                    dbms_output.put_line('');
                    LOOP 
                        FETCH plcursor INTO vname;
                        EXIT WHEN plcursor%notfound;
                        dbms_output.put_line(vname);
                    END LOOP;        
                CLOSE plcursor;
            ELSIF pdiv NOT IN (1, 2, 3) THEN
                dbms_output.put_line('한식 메뉴는 1번, 일품 메뉴는 2번, PLUS 메뉴는 3번을 눌러주세요.');
            END IF;        
        ELSIF to_char(to_date(pdate, 'yy/mm/dd'), 'd') IN (1, 7) THEN
            dbms_output.put_line('식단표의 날짜는 평일만 가능합니다.');
        END IF;
        
    ELSIF vnum = 1 THEN
        SELECT holiday INTO vholiday FROM tblHoliday WHERE holidayDate = pdate;
        dbms_output.put_line(vholiday || '입니다.');
        dbms_output.put_line('공휴일에는 식당 운영을 하지 않습니다.');
    END IF;
END;
/

BEGIN
    procDivMenu('2024-08-17', 3);
END;
/

SELECT * FROM tblHoliday;

select to_char(to_date('2024-08-05', 'yyyy-mm-dd'), 'dy') || '요일'  from dual;

-- 3. 원하는 날짜의 구내식당 식단표(날짜, 요일, 한식, 일품, PLUS 메뉴)를 조회한다.
CREATE OR REPLACE PROCEDURE procDateMenu (
    pdate DATE
)
IS  
    CURSOR kcursor
    IS
    SELECT km.menu AS 한식
        FROM tblKoreanMenu km
        INNER JOIN tblKoreanList kl ON km.id = kl.tblKoreanMenu_id
        INNER JOIN tblWeeklyMenu wm ON wm.id = kl.tblWeeklyMenu_id
            WHERE wm.menuDate = pdate;
            
    CURSOR prcursor
    IS 
    SELECT pm.menu AS 일품
        FROM tblPremiumMenu pm
        INNER JOIN tblPremiumList pl ON pm.id = pl.tblPremiumMenu_id
        INNER JOIN tblWeeklyMenu wm ON wm.id = pl.tblWeeklyMenu_id  
            WHERE wm.menuDate = pdate;
    
    CURSOR plcursor
    IS
    SELECT pm.menu AS PLUS메뉴
        FROM tblPlusMenu pm
        INNER JOIN tblPlusList pl ON pm.id = pl.tblPlusMenu_id
        INNER JOIN tblWeeklyMenu wm ON wm.id = pl.tblWeeklyMenu_id
            WHERE wm.menuDate = pdate;
            
    vname VARCHAR2(50);
    vnum NUMBER;
    vholiday tblHoliday.holiday%type;
    
BEGIN
    OPEN kcursor;
    OPEN prcursor;
    OPEN plcursor;

    SELECT count(*) INTO vnum FROM tblHoliday WHERE holidayDate = pdate;
    
    
    IF vnum = 0 THEN 
    
        IF to_char(to_date(pdate, 'yy/mm/dd'), 'd') BETWEEN 2 AND 6 THEN
        
        dbms_output.put_line('20' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'yy') || '년 ' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'mm') 
        || '월 ' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'dd') || '일 ' || to_char(to_date(pdate, 'yy/mm/dd'), 'dy') || '요일');
        
        dbms_output.put_line('한식 메뉴');
        dbms_output.put_line('');
        LOOP 
            FETCH kcursor INTO vname;
            EXIT WHEN kcursor%notfound;
            dbms_output.put_line(vname);
        END LOOP;
    
        IF to_char(to_date(pdate, 'yy/mm/dd'), 'd') IN (3, 5) THEN
            dbms_output.put_line('');
            dbms_output.put_line('');
            dbms_output.put_line('일품 메뉴');
            dbms_output.put_line('');
            LOOP 
                FETCH prcursor INTO vname;
                EXIT WHEN prcursor%notfound;
                dbms_output.put_line(vname);
            END LOOP;
        END IF;    
        
        dbms_output.put_line('');
        dbms_output.put_line('');
        dbms_output.put_line('PLUS 메뉴');
        dbms_output.put_line('');
        LOOP 
            FETCH plcursor INTO vname;
            EXIT WHEN plcursor%notfound;
            dbms_output.put_line(vname);
        END LOOP;    
            
        ELSIF to_char(to_date(pdate, 'yy/mm/dd'), 'd') IN (1, 7) THEN
            dbms_output.put_line('식단표의 날짜는 평일만 가능합니다.');
        END IF;
        
    ELSIF vnum = 1 THEN
        SELECT holiday INTO vholiday FROM tblHoliday WHERE holidayDate = pdate;
        dbms_output.put_line(vholiday || '입니다.');
        dbms_output.put_line('공휴일에는 식당 운영을 하지 않습니다.');
    END IF;        
    
    CLOSE prcursor;
    CLOSE kcursor;
    CLOSE plcursor;

END;
/

BEGIN
    procDateMenu('2024-08-13');
END;
/


SELECT DISTINCT wm.menuDate, to_char(wm.menuDate, 'dy'), km.menu AS 한식, pm.menu AS 일품, plm.menu AS PLUS메뉴
    FROM tblKoreanMenu km
    INNER JOIN tblKoreanList kl ON km.id = kl.tblKoreanMenu_id
    INNER JOIN tblWeeklyMenu wm ON wm.id = kl.tblWeeklyMenu_id
    LEFT OUTER JOIN tblPremiumList pl ON wm.id = pl.tblWeeklyMenu_id
    LEFT OUTER JOIN tblPremiumMenu pm ON pm.id = pl.tblPremiumMenu_id
    INNER JOIN tblPlusList pll ON wm.id = pll.tblWeeklyMenu_id
    INNER JOIN tblPlusMenu plm ON plm.id = pll.tblPlusMenu_id
     order by menuDate;

SELECT wm.menuDate, km.menu AS 한식
    FROM tblKoreanMenu km
    INNER JOIN tblKoreanList kl ON km.id = kl.tblKoreanMenu_id
    INNER JOIN tblWeeklyMenu wm ON wm.id = kl.tblWeeklyMenu_id;
 
SELECT wm.menuDate, pm.menu AS 일품
    FROM tblPremiumMenu pm
    INNER JOIN tblPremiumList pl ON pm.id = pl.tblPremiumMenu_id
    INNER JOIN tblWeeklyMenu wm ON wm.id = pl.tblWeeklyMenu_id;

SELECT wm.menuDate, pm.menu AS PLUS메뉴
    FROM tblPlusMenu pm
    INNER JOIN tblPlusList pl ON pm.id = pl.tblPlusMenu_id
    INNER JOIN tblWeeklyMenu wm ON wm.id = pl.tblWeeklyMenu_id;

select * from tblWeeklyMenu;
-------------------------------------교육생-------------------------------------

-- 구새식단 식단표 조회 (해당 주의 메뉴만 조회 가능하다.)
-- 해당 주에 배식되는 구내식단 메뉴를 조회한다. 
-- 한식, 일식, PLUS 메뉴로 구성되어있으며, 각각의 메뉴를 주 단위로 조회할 수 있다.  
CREATE OR REPLACE PROCEDURE procWeeklyMenu 
IS
    TYPE menu_array IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
    
    vKoreanMenu   menu_array;
    vPremiumMenu  menu_array;
    vPlusMenu     menu_array;
    
    vmdate        DATE;
    vday          NUMBER;
    
    CURSOR kcursor IS
        SELECT wm.menuDate, km.menu AS 한식
          FROM tblKoreanMenu km
          INNER JOIN tblKoreanList kl ON km.id = kl.tblKoreanMenu_id
          INNER JOIN tblWeeklyMenu wm ON wm.id = kl.tblWeeklyMenu_id
         WHERE wm.menuDate BETWEEN trunc(sysdate, 'IW') AND trunc(sysdate, 'IW') + 4;
    
    CURSOR prcursor IS
        SELECT wm.menuDate, pm.menu AS 일품
          FROM tblPremiumMenu pm
          INNER JOIN tblPremiumList pl ON pm.id = pl.tblPremiumMenu_id
          INNER JOIN tblWeeklyMenu wm ON wm.id = pl.tblWeeklyMenu_id
         WHERE wm.menuDate BETWEEN trunc(sysdate, 'IW') AND trunc(sysdate, 'IW') + 4;
    
    CURSOR plcursor IS
        SELECT wm.menuDate, pm.menu AS PLUS메뉴
          FROM tblPlusMenu pm
          INNER JOIN tblPlusList pl ON pm.id = pl.tblPlusMenu_id
          INNER JOIN tblWeeklyMenu wm ON wm.id = pl.tblWeeklyMenu_id
         WHERE wm.menuDate BETWEEN trunc(sysdate, 'IW') AND trunc(sysdate, 'IW') + 4;

BEGIN
    OPEN kcursor;
    OPEN prcursor;
    OPEN plcursor;
    
    LOOP
        FETCH kcursor INTO vmdate, vKoreanMenu(to_char(vmdate, 'd'));
        EXIT WHEN kcursor%NOTFOUND;
    END LOOP;
    
    LOOP
        FETCH prcursor INTO vmdate, vPremiumMenu(to_char(vmdate, 'd'));
        EXIT WHEN prcursor%NOTFOUND;
    END LOOP;
    
    LOOP
        FETCH plcursor INTO vmdate, vPlusMenu(to_char(vmdate, 'd'));
        EXIT WHEN plcursor%NOTFOUND;
    END LOOP;
    
    FOR i IN 2..6 LOOP
        dbms_output.put_line('요일 ' || TO_CHAR(trunc(sysdate, 'IW') + i - 2, 'DY'));
        dbms_output.put_line('한식: ' || vKoreanMenu(i));
        dbms_output.put_line('일품: ' || vPremiumMenu(i));
        dbms_output.put_line('PLUS메뉴: ' || vPlusMenu(i));
        dbms_output.put_line('');
    END LOOP;
    
    CLOSE kcursor;
    CLOSE prcursor;
    CLOSE plcursor;
END;
/

BEGIN
    procWeeklyMenu;
END;
/


CREATE OR REPLACE PROCEDURE procWeeklyMenu 
IS
    CURSOR kcursor
    IS
    SELECT wm.menuDate, km.menu AS 한식
        FROM tblKoreanMenu km
        INNER JOIN tblKoreanList kl ON km.id = kl.tblKoreanMenu_id
        INNER JOIN tblWeeklyMenu wm ON wm.id = kl.tblWeeklyMenu_id
            WHERE wm.menuDate BETWEEN sysdate - (to_char(to_date(sysdate, 'yy/mm/dd'), 'd')) 
            AND sysdate - (to_char(to_date(sysdate, 'yy/mm/dd'), 'd')) + 6;    

            
    CURSOR prcursor
    IS 
    SELECT wm.menuDate, pm.menu AS 일품
        FROM tblPremiumMenu pm
        INNER JOIN tblPremiumList pl ON pm.id = pl.tblPremiumMenu_id
        INNER JOIN tblWeeklyMenu wm ON wm.id = pl.tblWeeklyMenu_id
            WHERE wm.menuDate BETWEEN sysdate - (to_char(to_date(sysdate, 'yy/mm/dd'), 'd')) 
            AND sysdate - (to_char(to_date(sysdate, 'yy/mm/dd'), 'd')) + 6;    

            
    CURSOR plcursor
    IS
    SELECT wm.menuDate, pm.menu AS PLUS메뉴
        FROM tblPlusMenu pm
        INNER JOIN tblPlusList pl ON pm.id = pl.tblPlusMenu_id
        INNER JOIN tblWeeklyMenu wm ON wm.id = pl.tblWeeklyMenu_id
            WHERE wm.menuDate BETWEEN sysdate - (to_char(to_date(sysdate, 'yy/mm/dd'), 'd')) 
            AND sysdate - (to_char(to_date(sysdate, 'yy/mm/dd'), 'd')) + 6;    
            
    vmdate DATE;
    vdate DATE;
    vkmenu tblKoreanMenu.menu%type;
    vprmenu tblPremiumMenu.menu%type;
    vplmenu tblPlusMenu.menu%type;
    
    vkDate DATE := to_date(sysdate - (to_char(to_date(sysdate, 'yy/mm/dd'), 'd')) + 2, 'yy/mm/dd');
    vprDate DATE := to_date(sysdate - (to_char(to_date(sysdate, 'yy/mm/dd'), 'd')) + 2, 'yy/mm/dd');
    vplDate DATE := to_date(sysdate - (to_char(to_date(sysdate, 'yy/mm/dd'), 'd')) + 2, 'yy/mm/dd');
    
    vprevkDate DATE := to_date(sysdate - (to_char(to_date(sysdate, 'yy/mm/dd'), 'd')) + 2, 'yy/mm/dd');
    vprevprDate DATE := to_date(sysdate - (to_char(to_date(sysdate, 'yy/mm/dd'), 'd')) + 2, 'yy/mm/dd');
    vprevplDate DATE := to_date(sysdate - (to_char(to_date(sysdate, 'yy/mm/dd'), 'd')) + 2, 'yy/mm/dd');
BEGIN
    OPEN kcursor;
    OPEN prcursor;
    OPEN plcursor;
    
    SELECT menuDate INTO vdate FROM tblWeeklyMenu 
    WHERE to_date(menuDate, 'yy/mm/dd') = to_date(sysdate - (to_char(to_date(sysdate, 'yy/mm/dd'), 'd')) + 2, 'yy/mm/dd');

    
    FOR i IN 1..5 LOOP  
    
        dbms_output.put_line('20' || to_char(to_date(vdate, 'yyyy-mm-dd'), 'yy') || '년 ' || to_char(to_date(vdate, 'yyyy-mm-dd'), 'mm') 
        || '월 ' || to_char(to_date(vdate, 'yyyy-mm-dd'), 'dd') || '일 ' || to_char(to_date(vdate, 'yy/mm/dd'), 'dy') || '요일    ');
        
        
        
        LOOP 
            FETCH kcursor INTO vkDate, vkmenu;
            EXIT WHEN vprevkDate <> vkDate OR kcursor%notfound;    
            dbms_output.put_line('한식 ' || vkmenu || ' ');
        END LOOP;
        vprevkDate := vkDate;
            
        LOOP 
            FETCH prcursor INTO vprDate, vprmenu;
            EXIT WHEN vprevprDate <> vprDate OR prcursor%notfound;
                dbms_output.put_line('일품 ' || vprmenu || ' ');
        END LOOP;
        vprevprDate := vprDate;
        
        LOOP    
            FETCH plcursor INTO vplDate, vplmenu;    
            EXIT WHEN vprevplDate <> vplDate OR plcursor%notfound; 
                dbms_output.put_line('PLUS ' || vplmenu || ' ');
        END LOOP;   
        vprevplDate := vplDate;
        
        vdate := vdate + 1;
        dbms_output.put_line('');
        
    END LOOP;  
    
    CLOSE prcursor;
    CLOSE kcursor;
    CLOSE plcursor;
    
END;
/










CREATE OR REPLACE PROCEDURE procWeeklyMenu 
IS
    TYPE menuList IS TABLE OF VARCHAR2(4000) INDEX BY PLS_INTEGER;
    
    vKoreanMenus  menuList;
    vPremiumMenus menuList;
    vPlusMenus    menuList;
    
    vday PLS_INTEGER;
    maxLength PLS_INTEGER := 6;
    
    startDate DATE := trunc(sysdate, 'IW'); 
    
    CURSOR kcursor IS
        SELECT wm.menuDate, km.menu AS 한식
        FROM tblKoreanMenu km
        INNER JOIN tblKoreanList kl ON km.id = kl.tblKoreanMenu_id
        INNER JOIN tblWeeklyMenu wm ON wm.id = kl.tblWeeklyMenu_id
        WHERE wm.menuDate BETWEEN startDate AND startDate + 4
        ORDER BY wm.menuDate;

    CURSOR prcursor IS
        SELECT wm.menuDate, pm.menu AS 일품
        FROM tblPremiumMenu pm
        INNER JOIN tblPremiumList pl ON pm.id = pl.tblPremiumMenu_id
        INNER JOIN tblWeeklyMenu wm ON wm.id = pl.tblWeeklyMenu_id
        WHERE wm.menuDate BETWEEN startDate AND startDate + 4
        ORDER BY wm.menuDate;

    CURSOR plcursor IS
        SELECT wm.menuDate, pm.menu AS PLUS메뉴
        FROM tblPlusMenu pm
        INNER JOIN tblPlusList pl ON pm.id = pl.tblPlusMenu_id
        INNER JOIN tblWeeklyMenu wm ON wm.id = pl.tblWeeklyMenu_id
        WHERE wm.menuDate BETWEEN startDate AND startDate + 4
        ORDER BY wm.menuDate;

BEGIN

    FOR i IN 1..5 LOOP
        vKoreanMenus(i) := '';
        vPremiumMenus(i) := '';
        vPlusMenus(i) := '';
    END LOOP;


    FOR krec IN kcursor LOOP
        vday := krec.menuDate - startDate + 1;
        vKoreanMenus(vday) := vKoreanMenus(vday) || krec.한식 || chr(10); 
    END LOOP;


    FOR prec IN prcursor LOOP
        vday := prec.menuDate - startDate + 1; 
        vPremiumMenus(vday) := vPremiumMenus(vday) || prec.일품 || chr(10); 
    END LOOP;


    FOR plrec IN plcursor LOOP
        vday := plrec.menuDate - startDate + 1;
        vPlusMenus(vday) := vPlusMenus(vday) || plrec.PLUS메뉴 || chr(10); 
    END LOOP;

    dbms_output.put_line('');  
    dbms_output.put_line('    ' || startDate || ' ~ ' || to_date(sysdate - (to_char(to_date(sysdate, 'yy/mm/dd'), 'd')) + 6, 'yy/mm/dd'));
    dbms_output.put_line(' ︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵');
    dbms_output.put_line('|                                                                                                                   |');
    dbms_output.put_line('|                                                    주간 메뉴표                                                    |');
    dbms_output.put_line('|                                                                                                                   |');
    dbms_output.put_line(' ︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶');
    dbms_output.put_line('');
    dbms_output.put_line('==================================================================================================================');
    dbms_output.put_line('         월요일                화요일                수요일                목요일                금요일');
    dbms_output.put_line('==================================================================================================================');
    dbms_output.put_line('');
    
    FOR i IN 1..maxLength LOOP

        IF i = 3 THEN
            dbms_output.put('한식');
        ELSIF i IN (1, 2, 4, 5, 6) THEN
            dbms_output.put('    ');
        END IF;

        dbms_output.put_line(
            '    ' || RPAD(NVL(SUBSTR(vKoreanMenus(1), 1, INSTR(vKoreanMenus(1), chr(10))-1), ' '), 20) || '  ' ||
            RPAD(NVL(SUBSTR(vKoreanMenus(2), 1, INSTR(vKoreanMenus(2), chr(10))-1), ' '), 20) || '  ' ||
            RPAD(NVL(SUBSTR(vKoreanMenus(3), 1, INSTR(vKoreanMenus(3), chr(10))-1), ' '), 20) || '  ' ||
            RPAD(NVL(SUBSTR(vKoreanMenus(4), 1, INSTR(vKoreanMenus(4), chr(10))-1), ' '), 20) || '  ' ||
            RPAD(NVL(SUBSTR(vKoreanMenus(5), 1, INSTR(vKoreanMenus(5), chr(10))-1), ' '), 20)
        );
        
        vKoreanMenus(1) := SUBSTR(vKoreanMenus(1), INSTR(vKoreanMenus(1), chr(10))+1);
        vKoreanMenus(2) := SUBSTR(vKoreanMenus(2), INSTR(vKoreanMenus(2), chr(10))+1);
        vKoreanMenus(3) := SUBSTR(vKoreanMenus(3), INSTR(vKoreanMenus(3), chr(10))+1);
        vKoreanMenus(4) := SUBSTR(vKoreanMenus(4), INSTR(vKoreanMenus(4), chr(10))+1);
        vKoreanMenus(5) := SUBSTR(vKoreanMenus(5), INSTR(vKoreanMenus(5), chr(10))+1);
    END LOOP;
    
    dbms_output.put_line('');
    dbms_output.put_line('------------------------------------------------------------------------------------------------------------------');
    dbms_output.put_line('');
    
    FOR i IN 1..maxLength LOOP

        IF i = 3 THEN
            dbms_output.put('일품');
        ELSIF i IN (1, 2, 4, 5, 6) THEN
            dbms_output.put('    ');
        END IF;

        dbms_output.put_line(
            '    ' || RPAD(NVL(SUBSTR(vPremiumMenus(1), 1, INSTR(vPremiumMenus(1), chr(10))-1), ' '), 20) || '  ' ||
            RPAD(NVL(SUBSTR(vPremiumMenus(2), 1, INSTR(vPremiumMenus(2), chr(10))-1), ' '), 20) || '  ' ||
            RPAD(NVL(SUBSTR(vPremiumMenus(3), 1, INSTR(vPremiumMenus(3), chr(10))-1), ' '), 20) || '  ' ||
            RPAD(NVL(SUBSTR(vPremiumMenus(4), 1, INSTR(vPremiumMenus(4), chr(10))-1), ' '), 20) || '  ' ||
            RPAD(NVL(SUBSTR(vPremiumMenus(5), 1, INSTR(vPremiumMenus(5), chr(10))-1), ' '), 20)
        );

        vPremiumMenus(1) := SUBSTR(vPremiumMenus(1), INSTR(vPremiumMenus(1), chr(10))+1);
        vPremiumMenus(2) := SUBSTR(vPremiumMenus(2), INSTR(vPremiumMenus(2), chr(10))+1);
        vPremiumMenus(3) := SUBSTR(vPremiumMenus(3), INSTR(vPremiumMenus(3), chr(10))+1);
        vPremiumMenus(4) := SUBSTR(vPremiumMenus(4), INSTR(vPremiumMenus(4), chr(10))+1);
        vPremiumMenus(5) := SUBSTR(vPremiumMenus(5), INSTR(vPremiumMenus(5), chr(10))+1);

    END LOOP;
    
    dbms_output.put_line('');
    dbms_output.put_line('------------------------------------------------------------------------------------------------------------------');
    dbms_output.put_line('');
    
    FOR i IN 1..maxLength LOOP

        IF i = 2 THEN
            dbms_output.put('PLUS');
        ELSIF i IN (1, 3, 4, 5) THEN
            dbms_output.put('    ');
        END IF;

        dbms_output.put_line(
            '    ' || RPAD(NVL(SUBSTR(vPlusMenus(1), 1, INSTR(vPlusMenus(1), chr(10))-1), ' '), 20) || '  ' ||
            RPAD(NVL(SUBSTR(vPlusMenus(2), 1, INSTR(vPlusMenus(2), chr(10))-1), ' '), 20) || '  ' ||
            RPAD(NVL(SUBSTR(vPlusMenus(3), 1, INSTR(vPlusMenus(3), chr(10))-1), ' '), 20) || '  ' ||
            RPAD(NVL(SUBSTR(vPlusMenus(4), 1, INSTR(vPlusMenus(4), chr(10))-1), ' '), 20) || '  ' ||
            RPAD(NVL(SUBSTR(vPlusMenus(5), 1, INSTR(vPlusMenus(5), chr(10))-1), ' '), 20)
        );

        vPlusMenus(1) := SUBSTR(vPlusMenus(1), INSTR(vPlusMenus(1), chr(10))+1);
        vPlusMenus(2) := SUBSTR(vPlusMenus(2), INSTR(vPlusMenus(2), chr(10))+1);
        vPlusMenus(3) := SUBSTR(vPlusMenus(3), INSTR(vPlusMenus(3), chr(10))+1);
        vPlusMenus(4) := SUBSTR(vPlusMenus(4), INSTR(vPlusMenus(4), chr(10))+1);
        vPlusMenus(5) := SUBSTR(vPlusMenus(5), INSTR(vPlusMenus(5), chr(10))+1);

    END LOOP;
    
    dbms_output.put_line('------------------------------------------------------------------------------------------------------------------');
    

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('오류: 데이터가 없습니다.');
    WHEN OTHERS THEN
        dbms_output.put_line('오류: ' || SQLERRM);
END;
/

-- 프로시저 실행
BEGIN
    procWeeklyMenu;
END;
/

















