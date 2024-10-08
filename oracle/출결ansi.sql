COMMIT;

-- ANSI SQL

-------------------------------------출결---------------------------------------
------------------------------------관리자--------------------------------------
-- 1. 특정 개설 과정을 선택하는 경우 모든 교육생의 출결을 조회 할 수 있다.
SELECT s.name , a.attendancedate, ad.inTime, ad.outTime 
    FROM tblAttendance a
    INNER JOIN tblAttendDetail ad ON ad.tblAttendance_id  = a.id
    INNER JOIN tblStudent s ON s.id = a.tblStudent_id
        WHERE tblOpenCourse_id = 1
            order by s.name;
                
        

-- 2. 출결 현황은 기간별(년,월,일)로 조회 할 수 있다.
SELECT oc.name, s.name, a.attendancedate, ad.inTime, ad.outTime 
    FROM tblAttendance a
    INNER JOIN tblAttendDetail ad ON ad.tblAttendance_id  = a.id
    INNER JOIN tblStudent s ON s.id = a.tblStudent_id
    INNER JOIN tblOpenCourse oc ON oc.id = a.tblOpenCourse_id
        WHERE a.attendancedate = '2023-03-03'; --조회를 원하는 날짜 
                
        

-- 3. 특정 과정별 출결 현황 조회시 (과정명, 출결날짜, 근태상황, 인원)을 출력 할 수 있다.
SELECT oc.name AS 과정명, a.attendancedate AS 출결날짜, count(*) AS 인원,
    count(CASE 
        WHEN ad.inTime <= '09:00:00' AND ad.outTime >= '18:00:00' THEN 1
    END) AS 정상출석,
    count(CASE
        WHEN ad.inTime > '09:00:00' AND ad.outTime >= '18:00:00' THEN 1
    END) AS 지각,
    count(CASE
        WHEN ad.inTime > '09:00:00' AND  
             ad.outTime < '18:00:00' AND
             (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 THEN 1
    END) AS "지각/조퇴",
    count(CASE
        WHEN ad.outTime < '18:00:00' AND ad.inTime <= '09:00:00' THEN 1
    END) AS 조퇴,
    (count(*) 
        - count(CASE WHEN ad.inTime <= '09:00:00' AND ad.outTime >= '18:00:00' THEN 1 END) 
        - count(CASE WHEN ad.inTime > '09:00:00' AND ad.outTime >= '18:00:00' THEN 1 END) 
        - count(CASE WHEN ad.outTime < '18:00:00' AND ad.inTime <= '09:00:00' THEN 1 END) 
        - count(CASE WHEN (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4 THEN 1 
                     WHEN  ad.id IS NULL AND sr.id IS NULL THEN 1 END)
        - count(CASE WHEN sr.tblAttendance_id = a.id THEN 1 END)) 
        - count(CASE
                    WHEN ad.inTime > '09:00:00' AND  
                         ad.outTime < '18:00:00' AND
                         (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 THEN 1
                END) 
    AS 외출,
    count(CASE
        WHEN sr.tblAttendance_id = a.id THEN 1
    END) AS 병가,
    count(CASE
        WHEN (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4 THEN 1
        WHEN  ad.id IS NULL AND sr.id IS NULL THEN 1
    END) AS 결석
    FROM tblAttendance a
    FULL OUTER JOIN tblAttendDetail ad ON a.id = ad.tblAttendance_id
    INNER JOIN tblOpenCourse oc ON oc.id = a.tblOpenCourse_id
    FULL OUTER JOIN tblSickRecord sr ON sr.tblAttendance_id = a.id
    WHERE oc.id = 1
        GROUP BY oc.name, a.attendancedate, oc.id
            ORDER BY 출결날짜;
            
SELECT oc.name AS 과정명, a.attendancedate AS 출결날짜, count(*) AS 인원,
    count(CASE 
        WHEN ad.inTime <= '09:00:00' AND ad.outTime >= '18:00:00' THEN 1
    END) AS 정상출석,
    count(CASE
        WHEN ad.inTime > '09:00:00' AND ad.outTime >= '18:00:00' THEN 1
    END) AS 지각,
    count(CASE
        WHEN ad.inTime > '09:00:00' AND  
             ad.outTime < '18:00:00' AND
             (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 THEN 1
    END) AS "지각/조퇴",
    count(CASE
        WHEN ad.outTime < '18:00:00' AND ad.inTime <= '09:00:00' THEN 1
    END) AS 조퇴,
    (count(*) 
        - count(CASE WHEN ad.inTime <= '09:00:00' AND ad.outTime >= '18:00:00' THEN 1 END) 
        - count(CASE WHEN ad.inTime > '09:00:00' AND ad.outTime >= '18:00:00' THEN 1 END) 
        - count(CASE WHEN ad.outTime < '18:00:00' AND ad.inTime <= '09:00:00' THEN 1 END) 
        - count(CASE
                WHEN ((CASE 
                            WHEN ad.outTime > '18:00:00' THEN to_date('18:00:00', 'hh24:mi:ss') 
                            ELSE to_date(ad.outTime, 'hh24:mi:ss') 
                        END - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4
                 THEN 1
                WHEN  ad.id IS NULL AND sr.id IS NULL THEN 1
           END) 
        - count(CASE
                    WHEN ad.inTime > '09:00:00' AND  
                         ad.outTime < '18:00:00' AND
                         (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 THEN 1
                END)) 
    AS 외출,
    count(CASE
        WHEN sr.tblAttendance_id = a.id THEN 1
    END) AS 병가,
    count(CASE
               WHEN ((CASE 
                            WHEN ad.outTime > '18:00:00' THEN to_date('18:00:00', 'hh24:mi:ss') 
                            ELSE to_date(ad.outTime, 'hh24:mi:ss') 
                        END - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4
                 THEN 1
                WHEN  ad.id IS NULL AND sr.id IS NULL THEN 1
           END) 
    AS 결석
    FROM tblAttendance a
    FULL OUTER JOIN tblAttendDetail ad ON a.id = ad.tblAttendance_id
    INNER JOIN tblOpenCourse oc ON oc.id = a.tblOpenCourse_id
    FULL OUTER JOIN tblSickRecord sr ON sr.tblAttendance_id = a.id
    WHERE oc.id = 1
        GROUP BY oc.name, a.attendancedate, oc.id
            ORDER BY 출결날짜;

            
-- 4. 특정 수강생별 개인 출결 현황 조회시 (수강생 이름, 출결날짜, 근태상황)을 출력 할 수 있다.
SELECT s.name AS 수강생명, a.attendancedate AS 출결날짜, 
    CASE 
        WHEN ad.inTime <= '09:00:00' AND ad.outTime >= '18:00:00' THEN '정상'
        WHEN ad.inTime > '09:00:00' AND ad.outTime >= '18:00:00' THEN '지각'
        WHEN ad.outTime < '18:00:00' AND ad.inTime <= '09:00:00' THEN '조퇴'
        WHEN ad.inTime > '09:00:00' AND  
             ad.outTime < '18:00:00' AND
             (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 THEN '지각/조퇴'
        WHEN sr.tblAttendance_id = a.id THEN '병가'
        WHEN (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4 THEN '결석'
        WHEN  ad.id IS NULL AND sr.id IS NULL THEN '결석'
        ELSE '외출'
    END AS 근태상황
    FROM tblAttendance a
    FULL OUTER JOIN tblAttendDetail ad ON a.id = ad.tblAttendance_id
    INNER JOIN tblOpenCourse oc ON oc.id = a.tblOpenCourse_id
    FULL OUTER JOIN tblSickRecord sr on sr.tblAttendance_id = a.id
    INNER JOIN tblStudent s ON s.id = a.tblStudent_id
    WHERE s.id = 1;













-------------------------------------교사---------------------------------------
-- 0. 제약사항
-- 본인이 강의한 과정에 대한 출결만 조회할 수 있다.
-- 모든 출결 조회는 근태 상황을 구분할 수 있다. (정상, 지각, 조퇴, 외출, 병가, 기타)



-- 1. 수강생들의 출결 현황을 기간별(년, 월, 일) 조회할 수 있다.
SELECT DISTINCT oc.name, s.name, a.attendancedate, ad.inTime, ad.outTime 
    FROM tblTeacher t 
    INNER JOIN tblOpenSubject os ON t.id = os.tblteacher_id
    INNER JOIN tblOpenCourse oc ON os.tblOpenCourse_id = oc.id
    INNER JOIN tblAttendance a ON a.tblOpenCourse_id = oc.id
    INNER JOIN tblAttendDetail ad ON ad.tblAttendance_id  = a.id
    INNER JOIN tblStudent s ON s.id = a.tblStudent_id
    INNER JOIN tblOpenCourse oc ON oc.id = a.tblOpenCourse_id
        WHERE t.id = 4 AND a.attendancedate BETWEEN '2023-03-01' AND '2023-03-31' --조회를 원하는 날짜
            ORDER BY a.attendancedate;



-- 2. 특정 과정(과정명, 출결날짜, 근태상황, 인원)에 대한 출결 현황을 조회할 수 있다.
SELECT DISTINCT oc.name AS 과정명, a.attendancedate AS 출결날짜, count(*) AS 인원,
    count(CASE WHEN ad.inTime <= '09:00:00' AND ad.outTime >= '18:00:00' THEN 1 END) AS 정상출석,
    count(CASE WHEN ad.inTime > '09:00:00' AND ad.outTime >= '18:00:00' THEN 1 END) AS 지각,
    count(CASE WHEN ad.inTime > '09:00:00' AND  
                    ad.outTime < '18:00:00' AND
                   (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 THEN 1
          END) AS "지각/조퇴",
    count(CASE WHEN ad.outTime < '18:00:00' AND ad.inTime <= '09:00:00' THEN 1 END) AS 조퇴,
    (count(*) 
        - count(CASE WHEN ad.inTime <= '09:00:00' AND ad.outTime >= '18:00:00' THEN 1 END) 
        - count(CASE WHEN ad.inTime > '09:00:00' AND ad.outTime >= '18:00:00' THEN 1 END) 
        - count(CASE WHEN ad.outTime < '18:00:00' AND ad.inTime <= '09:00:00' THEN 1 END) 
        - count(CASE
                   WHEN ((CASE 
                                WHEN ad.outTime > '18:00:00' THEN to_date('18:00:00', 'hh24:mi:ss') 
                                ELSE to_date(ad.outTime, 'hh24:mi:ss') 
                            END - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4
                     THEN 1
                    WHEN  ad.id IS NULL AND sr.id IS NULL THEN 1
               END) 
        - count(CASE WHEN sr.tblAttendance_id = a.id THEN 1 END)) 
        - count(CASE
        WHEN ad.inTime > '09:00:00' AND  
             ad.outTime < '18:00:00' AND
             (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 THEN 1
    END) 
    AS 외출,
    count(CASE WHEN sr.tblAttendance_id = a.id THEN 1 END) AS 병가,
    count(CASE
               WHEN ((CASE 
                            WHEN ad.outTime > '18:00:00' THEN to_date('18:00:00', 'hh24:mi:ss') 
                            ELSE to_date(ad.outTime, 'hh24:mi:ss') 
                        END - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4
                 THEN 1
                WHEN  ad.id IS NULL AND sr.id IS NULL THEN 1
           END)  
    AS 결석
    FROM tblTeacher t 
    INNER JOIN tblOpenSubject os ON t.id = os.tblteacher_id
    INNER JOIN tblOpenCourse oc ON os.tblOpenCourse_id = oc.id
    INNER JOIN tblAttendance a ON a.tblOpenCourse_id = oc.id
    FULL OUTER JOIN tblAttendDetail ad ON a.id = ad.tblAttendance_id
    FULL OUTER JOIN tblSickRecord sr ON sr.tblAttendance_id = a.id
    INNER JOIN tblStudent s ON s.id = a.tblStudent_id
        WHERE t.id = 4 AND oc.id = 1
            GROUP BY oc.name, a.attendancedate, oc.id, os.id
            ORDER BY 출결날짜;




-- 3. 특정 교육생(교육생 이름, 출결날짜, 근태상황)에 대한 출결 현황을 조회할 수 있다.
SELECT s.name AS 수강생명, a.attendancedate AS 출결날짜,
    CASE 
        WHEN ad.inTime <= '09:00:00' AND ad.outTime >= '18:00:00' THEN '정상'
        WHEN ad.inTime > '09:00:00' AND ad.outTime >= '18:00:00' THEN '지각'
        WHEN ad.outTime < '18:00:00' AND ad.inTime <= '09:00:00' THEN '조퇴'
        WHEN ad.inTime > '09:00:00' AND  
             ad.outTime < '18:00:00' AND
             (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 THEN '지각/조퇴'
        WHEN sr.tblAttendance_id = a.id THEN '병가'
        WHEN (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4 THEN '결석'
        WHEN  ad.id IS NULL AND sr.id IS NULL THEN '결석'
        ELSE '외출'
    END AS 근태상황
    FROM tblTeacher t 
    INNER JOIN tblOpenSubject os ON t.id = os.tblteacher_id
    INNER JOIN tblOpenCourse oc ON os.tblOpenCourse_id = oc.id
    INNER JOIN tblAttendance a ON a.tblOpenCourse_id = oc.id
    FULL OUTER JOIN tblAttendDetail ad ON a.id = ad.tblAttendance_id
    FULL OUTER JOIN tblSickRecord sr ON sr.tblAttendance_id = a.id
    INNER JOIN tblStudent s ON s.id = a.tblStudent_id
        WHERE t.id = 4 AND s.id = 1
            ORDER BY 출결날짜;





SELECT * FROM tblOpenSubject;






-----------------------------------교육생---------------------------------------
-- 0. 제약사항
-- 다른 교육생의 현황은 조회할 수 없다.
-- 모든 출결 조회는 근태 상황을 구분할 수 있어야 한다.(정상, 지각, 조퇴, 외출, 병가, 기타) 


-- 1. 매일 출석을 기록해야 한다. 
-- 출근 1회, 퇴근 1회 기록한다.
-- 조퇴(18시 이전 퇴근 기록), 외출(출근, 퇴근 2회씩 기록) 중에 해당되는 사항이 있을 경우 기록한다. 
-- 병가 중에 해당되는 사항이 있을 경우 기록한다.

-- 출결
INSERT INTO tblAttendance(id, attendancedate, tblStudent_id, tblOpenCourse_id) VALUES (seqAttendance.nextVal, sysdate, 351, 16);

-- 출근
INSERT INTO tblAttendDetail(id, inTime, outTime, tblAttendance_id) VALUES (seqAttendDetail.nextVal, '08:31:23', null, 32001);

-- 퇴근
UPDATE tblAttendDetail SET outTime = '18:01:34' WHERE tblAttendance_id = 32001;

-- 병가
INSERT INTO tblAttendance(id, attendancedate, tblStudent_id, tblOpenCourse_id) VALUES (seqAttendance.nextVal, sysdate, 351, 16);
INSERT INTO tblSickRecord(id, tblAttendance_id) VALUES (seqSickRecord.nextVal, 32002);




-- 2. 매일 금일 출석을 조회할 수 있다. 
-- 금일 출석 현황에는 교육생 이름, 과정명, 날짜, 근태 상황이 포함된다.
SELECT s.name, oc.name, a.attendancedate,
    CASE 
        WHEN ad.inTime <= '09:00:00' AND ad.outTime >= '18:00:00' THEN '정상'
        WHEN ad.inTime > '09:00:00' AND ad.outTime >= '18:00:00' THEN '지각'
        WHEN ad.outTime < '18:00:00' AND ad.inTime <= '09:00:00' THEN '조퇴'
        WHEN ad.inTime > '09:00:00' AND  
             ad.outTime < '18:00:00' AND
             (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 THEN '지각/조퇴'
        WHEN sr.tblAttendance_id = a.id THEN '병가'
        WHEN (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4 THEN '결석'
        WHEN  ad.id IS NULL AND sr.id IS NULL THEN '결석'
        ELSE '외출'
    END AS 근태상황
        FROM tblAttendance a
        INNER JOIN tblAttendDetail ad on a.id = ad.tblAttendance_id
        INNER JOIN tblStudent s on s.id = a.tblStudent_id
        INNER JOIN tblOpenCourse oc on oc.id = a.tblOpenCourse_id
        FULL OUTER JOIN tblSickRecord sr on sr.tblAttendance_id = a.id
            WHERE to_date(a.attendancedate, 'yyyy-mm-dd') = to_date(sysdate, 'yyyy-mm-dd')
                  AND s.id = 266;

SELECT * FROM tblAttendance;



-- 3. 본인의 출결 현황을 기간별(전체, 월, 일) 조회할 수 있다.
-- 전체
SELECT DISTINCT oc.name, s.name, a.attendancedate, ad.inTime, ad.outTime 
    FROM tblOpenCourse oc
    INNER JOIN tblAttendance a ON a.tblOpenCourse_id = oc.id
    INNER JOIN tblAttendDetail ad ON ad.tblAttendance_id  = a.id
    INNER JOIN tblStudent s ON s.id = a.tblStudent_id
    INNER JOIN tblOpenCourse oc ON oc.id = a.tblOpenCourse_id
        WHERE s.id = 24 
            ORDER BY a.attendancedate; 

-- 월
SELECT DISTINCT oc.name, s.name, a.attendancedate, ad.inTime, ad.outTime 
    FROM tblOpenCourse oc
    INNER JOIN tblAttendance a ON a.tblOpenCourse_id = oc.id
    INNER JOIN tblAttendDetail ad ON ad.tblAttendance_id  = a.id
    INNER JOIN tblStudent s ON s.id = a.tblStudent_id
    INNER JOIN tblOpenCourse oc ON oc.id = a.tblOpenCourse_id
        WHERE s.id = 24 AND a.attendancedate BETWEEN '2023-03-01' AND '2023-03-31' --조회를 원하는 날짜
            ORDER BY a.attendancedate; 

-- 일
SELECT DISTINCT oc.name, s.name, a.attendancedate, ad.inTime, ad.outTime 
    FROM tblOpenCourse oc
    INNER JOIN tblAttendance a ON a.tblOpenCourse_id = oc.id
    INNER JOIN tblAttendDetail ad ON ad.tblAttendance_id  = a.id
    INNER JOIN tblStudent s ON s.id = a.tblStudent_id
    INNER JOIN tblOpenCourse oc ON oc.id = a.tblOpenCourse_id
        WHERE s.id = 24 AND a.attendancedate = '2023-03-02'  --조회를 원하는 날짜
            ORDER BY a.attendancedate; 








