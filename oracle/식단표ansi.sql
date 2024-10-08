-- 식단표ansi.sql


-------------------------------------관리자-------------------------------------
-- 0. 제약사항
-- 일식은 화요일, 목요일에만 포함한다.
-- 각 메뉴는 날짜로 구분한다.

-- 1. 원하는 날짜의 구내식당 식단표(날짜, 요일, 한식, 일품, PLUS 메뉴)를 조회한다.
-- >>> PL
SELECT DISTINCT wm.menuDate, to_char(wm.menuDate, 'dy'), km.menu AS 한식, pm.menu AS 일품, plm.menu AS PLUS메뉴
    FROM tblKoreanMenu km
    INNER JOIN tblKoreanList kl ON km.id = kl.tblKoreanMenu_id
    INNER JOIN tblWeeklyMenu wm ON wm.id = kl.tblWeeklyMenu_id
    LEFT OUTER JOIN tblPremiumList pl ON wm.id = pl.tblWeeklyMenu_id
    LEFT OUTER JOIN tblPremiumMenu pm ON pm.id = pl.tblPremiumMenu_id
    INNER JOIN tblPlusList pll ON wm.id = pll.tblWeeklyMenu_id
    INNER JOIN tblPlusMenu plm ON plm.id = pll.tblPlusMenu_id
        WHERE wm.menuDate = '2024-01-04';

-- 2. 구내식당 식단표의 원하는 날짜를 등록한다. 
INSERT INTO tblWeeklyMenu(id, menuDate) VALUES (seqWeeklyMenu.nextVal, '2024-09-02');


-- 3. 해당 날짜의 한식(일품, PLUS)메뉴를 조회 및 등록한다. 
INSERT INTO tblKoreanMenu(id, menu) VALUES(seqKoreanMenu.nextVal, '삼겹살*쌈장');
INSERT INTO tblKoreanList(id, tblWeeklyMenu_id, tblKoreanMenu_id) VALUES (seqKoreanList.nextVal, 181, 301);
INSERT INTO tblKoreanMenu(id, menu) VALUES(seqKoreanMenu.nextVal, '상추');
INSERT INTO tblKoreanList(id, tblWeeklyMenu_id, tblKoreanMenu_id) VALUES (seqKoreanList.nextVal, 181, 302);
INSERT INTO tblKoreanMenu(id, menu) VALUES(seqKoreanMenu.nextVal, '명이나물');
INSERT INTO tblKoreanList(id, tblWeeklyMenu_id, tblKoreanMenu_id) VALUES (seqKoreanList.nextVal, 181, 303);
INSERT INTO tblKoreanMenu(id, menu) VALUES(seqKoreanMenu.nextVal, '배추김치');
INSERT INTO tblKoreanList(id, tblWeeklyMenu_id, tblKoreanMenu_id) VALUES (seqKoreanList.nextVal, 181, 304);
INSERT INTO tblKoreanMenu(id, menu) VALUES(seqKoreanMenu.nextVal, '현미밥');
INSERT INTO tblKoreanList(id, tblWeeklyMenu_id, tblKoreanMenu_id) VALUES (seqKoreanList.nextVal, 181, 305);

commit;

-------------------------------------교육생-------------------------------------

-- 0. 제약사항
-- 주 단위로만 조회 가능하다. 
-- PL

-- 1. 해당 주에 배식되는 구내식단 메뉴를 조회한다. 
-- PL

-- 2. 한식, 일식, PLUS 메뉴로 구성되어있으며, 각각의 메뉴를 주 단위로 조회할 수 있다. 
-- PL


















