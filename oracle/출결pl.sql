-- 출결pl.sql

set SERVEROUTPUT on;



---------------------------------뷰---------------------------------------------
CREATE OR REPLACE VIEW vwTeacherOpenCourseList
AS
SELECT tblTeacher_id, tblOpenCourse_id FROM tblOpenSubject GROUP BY tblTeacher_id, tblOpenCourse_id ORDER BY tblOpenCourse_id;

select * from vwstudentAttendDetail;

CREATE OR REPLACE VIEW vwTeacherCourse
AS
SELECT DISTINCT t.id AS teacherId, t.name AS teacherName, oc.id openCourseId, oc.name openCourseName, oc.startDate AS startDate, oc.endDate AS endDate 
    FROM tblOpenSubject os
    INNER JOIN tblTeacher t ON os.tblTeacher_id = t.id
    INNER JOIN tblOpenCourse oc ON os.tblOpenCourse_id = oc.id
        ORDER BY openCourseId;

create or replace view vwstudentAttendDetail
AS
select s.studentId, s.studentName, s.attendanceDate, s.attendanceState, c.name AS openCourseName, c.id AS openCourseId
    FROM vwstudentattend s 
    inner join tblAttendance a on a.id = s.id
    inner join tblOpenCourse c on c.id = a.tblOpenCourse_id;

select * from vwstudentAttendDetail;

DROP VIEW vwAttendState;

CREATE OR REPLACE VIEW vwAttendState 
AS
SELECT oc.id AS openCourseId, oc.name AS openCourseName, a.attendancedate AS attendanceDate, count(*) AS studentCount,
    count(CASE 
        WHEN ad.inTime <= '09:00:00' AND ad.outTime >= '18:00:00' THEN 1
    END) AS normalAttendance,
    count(CASE
        WHEN ad.inTime > '09:00:00' AND ad.outTime >= '18:00:00' THEN 1
    END) AS late,
    count(CASE
        WHEN ad.inTime > '09:00:00' AND  
             ad.outTime < '18:00:00' AND
             (to_number(to_date(ad.outTime, 'hh24:mi:ss') - to_date(ad.inTime, 'hh24:mi:ss')) * 24) >= 4 THEN 1
    END) AS late_earlyLeave,
    count(CASE
        WHEN ad.outTime < '18:00:00' AND ad.inTime <= '09:00:00' THEN 1
    END) AS earlyLeave,
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
    AS outing,
    count(CASE
        WHEN sr.tblAttendance_id = a.id THEN 1
    END) AS sickDay,
    count(CASE
               WHEN ((CASE 
                            WHEN ad.outTime > '18:00:00' THEN to_date('18:00:00', 'hh24:mi:ss') 
                            ELSE to_date(ad.outTime, 'hh24:mi:ss') 
                        END - to_date(ad.inTime, 'hh24:mi:ss')) * 24) < 4
                 THEN 1
                WHEN  ad.id IS NULL AND sr.id IS NULL THEN 1
           END)  
    AS absence
    FROM tblAttendance a
    FULL OUTER JOIN tblAttendDetail ad ON a.id = ad.tblAttendance_id
    INNER JOIN tblOpenCourse oc ON oc.id = a.tblOpenCourse_id
    FULL OUTER JOIN tblSickRecord sr ON sr.tblAttendance_id = a.id
        GROUP BY oc.name, a.attendancedate, oc.id
            ORDER BY attendanceDate;

SELECT * FROM vwAttendState;








CREATE OR REPLACE VIEW vwStudentAttend
AS
SELECT a.id AS id, s.id AS studentId, s.name AS studentName, a.attendancedate AS attendanceDate, 
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
    END AS attendanceState
    FROM tblAttendance a
    FULL OUTER JOIN tblAttendDetail ad ON a.id = ad.tblAttendance_id
    INNER JOIN tblOpenCourse oc ON oc.id = a.tblOpenCourse_id
    FULL OUTER JOIN tblSickRecord sr ON sr.tblAttendance_id = a.id
    INNER JOIN tblStudent s ON s.id = a.tblStudent_id;

SELECT * FROM vwstudentattend;





--------------------------------------------------------------------------------

-- 1. 특정 개설 과정을 선택하는 경우 모든 교육생의 출결을 조회 할 수 있다.

CREATE OR REPLACE PROCEDURE procCourseAttendance (
    pid IN NUMBER
)
IS
    CURSOR vcursor
    IS
    SELECT s.name, a.attendanceDate, ad.inTime, ad.outTime 
        FROM tblAttendance a
        INNER JOIN tblAttendDetail ad ON a.id = ad.tblAttendance_id
        INNER JOIN tblStudent s ON s.id = a.tblStudent_id
        WHERE tblOpenCourse_id = pid
        ORDER BY s.name, a.attendanceDate;

    vname tblStudent.name%type;
    vattendanceDate tblAttendance.attendanceDate%type;
    vinTime tblAttendDetail.inTime%type;
    voutTime tblAttendDetail.outTime%type;
    vprevName tblStudent.name%type := NULL; -- 이전 학생의 이름 저장
    
BEGIN
    OPEN vcursor;
    
    LOOP
        FETCH vcursor INTO vname, vattendanceDate, vinTime, voutTime;
        EXIT WHEN vcursor%notfound;
        
        -- 새로운 학생의 이름이 나오면 이름과 테이블 헤더 출력
        IF vprevName IS NULL OR vprevName <> vname THEN
            IF vprevName IS NOT NULL THEN
                dbms_output.put_line('             ----------------------------------------------------------');
            END IF;
            
            dbms_output.put_line('             ==========================================================');
            dbms_output.put_line('           |   이  름   |    날  짜    |   입실 시간   |   퇴실 시간  |');
            dbms_output.put_line('             ==========================================================');
            dbms_output.put_line('           |   ' || vname || '   |   '   || vattendanceDate || '   |   ' || vinTime || '   |   ' || voutTime || '   |');
            
            vprevName := vname;
            
            FETCH vcursor INTO vname, vattendanceDate, vinTime, voutTime;
            
        END IF;
        
        -- 출결 정보 출력
        dbms_output.put_line('           |              |   ' || vattendanceDate || '   |   ' || vinTime || '   |   ' || voutTime || '   |');
        
    END LOOP;
    
    dbms_output.put_line('             ----------------------------------------------------------');

    CLOSE vcursor;
END;
/

-- 실행
BEGIN 
    procCourseAttendance(1); -- 해당 과정 시퀀스 입력 
END;
/
   

-- 2. 출결 현황은 기간별(년,월,일)로 조회 할 수 있다.

-- 특정 날짜를 원할 때 
CREATE OR REPLACE PROCEDURE procDateAttendance (
    pdate IN DATE
)
IS
    CURSOR vcursor
    IS
    SELECT oc.name, s.name, a.attendancedate, ad.inTime, ad.outTime 
    FROM tblAttendance a
    INNER JOIN tblAttendDetail ad ON ad.tblAttendance_id  = a.id
    INNER JOIN tblStudent s ON s.id = a.tblStudent_id
    INNER JOIN tblOpenCourse oc ON oc.id = a.tblOpenCourse_id
        WHERE a.attendancedate = pdate 
        ORDER BY oc.name, s.name, a.attendanceDate;
    
    vcname tblOpenCourse.name%type;
    vsname tblStudent.name%type;
    vdate tblAttendance.attendanceDate%type;
    vinTime tblAttendDetail.inTime%type;
    voutTime tblAttendDetail.outTime%type;
    vprevName tblOpenCourse.name%type := NULL; -- 이전 강좌의 이름 저장
    vprevDate tblAttendance.attendanceDate%type := NULL; -- 이전 날짜 저장 
BEGIN
    
    OPEN vcursor;
    
    LOOP
        FETCH vcursor INTO vcname, vsname, vdate, vinTime, voutTime;
        EXIT WHEN vcursor%notfound;
        
        -- 새로운 강좌가 나오면 이름과 테이블 헤더 출력
        IF vprevName <> vcname THEN
            IF vprevName IS NOT NULL THEN
                dbms_output.put_line('          -----------------------------------------------------------');
            END IF;
            
            dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
            dbms_output.put_line('  ' || vcname);
            dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
            
            
            dbms_output.put_line('          ===========================================================');
            dbms_output.put_line('          |    날  짜    |   이  름   |   입실 시간   |   퇴실 시간  |');
            dbms_output.put_line('          ===========================================================');
            dbms_output.put_line('          |   ' || vdate || '   |   '   || vsname || '   |   ' || vinTime || '   |   ' || voutTime || '   |');
            
            FETCH vcursor INTO vcname, vsname, vdate, vinTime, voutTime;
            
            vprevName := vcname;
            
        ELSIF vprevName IS NULL THEN
        
            dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
            dbms_output.put_line('  ' || vcname);
            dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
            
            vprevName := vcname;
            
        END IF;
        
        -- 새로운 날짜가 나오면 날짜와 테이블 헤더 출력
        IF vprevDate IS NULL OR vprevDate <> vdate THEN
            IF vprevDate IS NOT NULL THEN
                dbms_output.put_line('          -----------------------------------------------------------');
            END IF;
            
            dbms_output.put_line('          ===========================================================');
            dbms_output.put_line('          |    날  짜    |   이  름   |   입실 시간   |   퇴실 시간  |');
            dbms_output.put_line('          ===========================================================');
            dbms_output.put_line('          |   ' || vdate || '   |   '   || vsname || '   |   ' || vinTime || '   |   ' || voutTime || '   |');
            
            vprevDate := vdate;
            
            FETCH vcursor INTO vcname, vsname, vdate, vinTime, voutTime;
            
        END IF;
        
        dbms_output.put_line('          |              |   '   || vsname || '   |   ' || vinTime || '   |   ' || voutTime || '   |');
            
        
    
    END LOOP;        
    
    dbms_output.put_line('          -----------------------------------------------------------');
        
    CLOSE vcursor;
    
END;
/

BEGIN
    procDateAttendance('2023-03-03');
END;
/

-- 특정 기간 사이의 날짜를 원할 때 
CREATE OR REPLACE PROCEDURE procDatePeriodAttendance (
    pstartDate IN DATE,
    pendDate IN DATE 
)
IS
    CURSOR vcursor
    IS
    SELECT oc.name, s.name, a.attendancedate, ad.inTime, ad.outTime 
    FROM tblAttendance a
    INNER JOIN tblAttendDetail ad ON ad.tblAttendance_id  = a.id
    INNER JOIN tblStudent s ON s.id = a.tblStudent_id
    INNER JOIN tblOpenCourse oc ON oc.id = a.tblOpenCourse_id
        WHERE a.attendancedate BETWEEN pstartDate AND pendDate
        ORDER BY oc.name, s.name, a.attendanceDate;
    
    vcname tblOpenCourse.name%type;
    vsname tblStudent.name%type;
    
    vdate tblAttendance.attendanceDate%type;
    vinTime tblAttendDetail.inTime%type;
    voutTime tblAttendDetail.outTime%type;
    
    vprevCname tblOpenCourse.name%type := NULL; -- 이전 강좌의 이름 저장
    vprevSname tblStudent.name%type := NULL; -- 이전 학생의 이름  저장 
    
    
BEGIN
    
    OPEN vcursor;
    
    LOOP
        FETCH vcursor INTO vcname, vsname, vdate, vinTime, voutTime;
        EXIT WHEN vcursor%notfound;
        
        -- 새로운 강좌가 나오면 이름과 테이블 헤더 출력
        IF vprevCname <> vcname THEN
            
            dbms_output.put_line('           ----------------------------------------------------------');
            
            dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
            dbms_output.put_line('  ' || vcname);
            dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
            
            vprevCname := vcname;
            vprevSname := NULL;   -- 새로운 강좌가 시작되면 학생 이름 초기화
            
        ELSIF vprevCname IS NULL THEN
        
            dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
            dbms_output.put_line('  ' || vcname);
            dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
            
            vprevCname := vcname;
            
        END IF;
        
        -- 새로운 학생 이름이 나오면 이름과 테이블 헤더 출력 
        IF vprevSname IS NULL OR vprevSname <> vsname THEN
            IF vprevSname IS NOT NULL THEN
                dbms_output.put_line('           ----------------------------------------------------------');
            END IF;
            
            dbms_output.put_line('           ==========================================================');
            dbms_output.put_line('          |   이  름   |    날  짜    |   입실 시간   |   퇴실 시간  |');
            dbms_output.put_line('           ==========================================================');
            dbms_output.put_line('          |   ' || vsname || '   |   '   || vdate || '   |   ' || vinTime || '   |   ' || voutTime || '   |');
            
            FETCH vcursor INTO vcname, vsname, vdate, vinTime, voutTime;
            
            
            vprevSname := vsname;
            
            
        END IF;
        
        dbms_output.put_line('          |              |   ' || vdate || '   |   ' || vinTime || '   |   ' || voutTime || '   |');
            
        
    
    END LOOP;        
    
    dbms_output.put_line('           ----------------------------------------------------------');
        
    CLOSE vcursor;
    
END;
/

BEGIN
    procDatePeriodAttendance('2023-03-01', '2023-04-01');
END;
/


-- 3. 특정 과정별 출결 현황 조회시 (과정명, 출결날짜, 근태상황, 인원)을 출력 할 수 있다.
            
SELECT * FROM vwAttendState order by openCourseId;


CREATE OR REPLACE PROCEDURE procCourseAttendDetail (
    pid IN NUMBER
)
IS
    CURSOR vcursor 
    IS
    SELECT openCourseName, attendanceDate, studentCount, normalAttendance, late, late_earlyLeave, earlyLeave, outing, sickDay, absence
    FROM vwAttendState
        WHERE openCourseId = pid
            ORDER BY openCourseId;
    
    vcname vwAttendState.openCourseName%type;
    vdate vwAttendState.attendanceDate%type;
    
    vstudentCount NUMBER;
    vnormalAttendance NUMBER;
    vlate NUMBER;
    vlate_earlyLeave NUMBER;
    vearlyLeave NUMBER;
    vouting NUMBER;
    vsickDay NUMBER;
    vabsence NUMBER;
    
    vprevCname vwAttendState.openCourseName%type := NULL; -- 강좌의 이름 저장
    
BEGIN

    OPEN vcursor;
        
    LOOP
        
        FETCH vcursor INTO vcname, vdate, vstudentCount, vnormalAttendance, vlate, vlate_earlyLeave, vearlyLeave, vouting, vsickDay, vabsence;
        EXIT WHEN vcursor%notfound;
        
        -- 강좌 이름과 테이블 헤더 출력
        IF vprevCname IS NULL THEN
            
            dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
            dbms_output.put_line('  ' || vcname);
            dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
            dbms_output.put_line('  ===============================================================================');
            dbms_output.put_line('      날짜    인원   정상출석   지각   지각/조퇴   조퇴   외출   병가   결석');
            dbms_output.put_line('  ===============================================================================');
            
            vprevCname := vcname;
           
        END IF;
                                                                                                
        dbms_output.put_line('|     ' || vdate || '    ' || vstudentCount || '명     ' || vnormalAttendance 
        || '명      ' || vlate || '명       ' || vlate_earlyLeave || '명       ' || vearlyLeave || '명    ' || vouting || '명    ' 
        || vsickDay || '명    ' || vabsence || '명    ' || '  |');
        
    
    END LOOP;
    
    dbms_output.put_line('|______________________________________________________________________________|');
    
    
    CLOSE vcursor;

END;
/



BEGIN
    procCourseAttendDetail(1);
END;
/


            
-- 4. 특정 수강생별 개인 출결 현황 조회시 (수강생 이름, 출결날짜, 근태상황)을 출력 할 수 있다.

SELECT * FROM vwstudentatted;

CREATE OR REPLACE PROCEDURE procStudentAttendance (
    pid NUMBER
)
IS
    CURSOR vcursor 
    IS
    SELECT studentName, attendanceDate, attendanceState
    FROM vwstudentatted
        WHERE studentId = pid
            ORDER BY attendanceDate;
    
    vstudentName vwstudentatted.studentName%type;
    vattendanceDate vwstudentatted.attendanceDate%type;
    vattendanceState vwstudentatted.attendanceState%type;

    vprevName vwstudentatted.studentName%type := NULL; -- 학생 이름 저장
    
BEGIN

    OPEN vcursor;
            
        LOOP
            FETCH vcursor INTO vstudentName, vattendanceDate, vattendanceState;
            EXIT WHEN vcursor%notfound;
            
            IF vprevName IS NULL THEN
                
                dbms_output.put_line('  ︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵');
                dbms_output.put_line('|                                        |');
                dbms_output.put_line('|          ' || vstudentName || ' 학생의 출결 정보        |');
                dbms_output.put_line('|                                        |');
                dbms_output.put_line(' ︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶');
                dbms_output.put_line(' =========================================');
                dbms_output.put_line('|        날   짜        근태 상황         |');
                dbms_output.put_line(' =========================================');
                
                vprevName := vstudentName;
            
            END IF;
            
            IF vattendanceState = '지각/조퇴' THEN
            
                dbms_output.put_line('|        '  || vattendanceDate || '        ' || vattendanceState || '           |');
                FETCH vcursor INTO vstudentName, vattendanceDate, vattendanceState;
            
            END IF;
            
            dbms_output.put_line('|        '  || vattendanceDate || '          ' || vattendanceState || '            |');
            
        END LOOP;
        
        dbms_output.put_line(' -----------------------------------------');
                
    CLOSE vcursor;

END;
/

BEGIN
    procStudentAttendance(1);
END;
/




-------------------------------------교사---------------------------------------
-- 0. 제약사항
-- 본인이 강의한 과정에 대한 출결만 조회할 수 있다.
-- 모든 출결 조회는 근태 상황을 구분할 수 있다. (정상, 지각, 조퇴, 외출, 병가, 기타)

SELECT tc.teacherId, tc.teacherName, oc.name, s.name, a.attendancedate, ad.inTime, ad.outTime 
    FROM tblAttendance a
    INNER JOIN tblAttendDetail ad ON ad.tblAttendance_id = a.id
    INNER JOIN tblStudent s ON s.id = a.tblStudent_id
    INNER JOIN tblOpenCourse oc ON oc.id = a.tblOpenCourse_id
    INNER JOIN vwTeacherCourse tc ON tc.openCourseId = oc.id 
        ORDER BY oc.id, oc.name, s.name, a.attendanceDate;
        
SELECT tc.teacherId, tc.teacherName, oc.name, s.name, a.attendancedate, ad.inTime, ad.outTime 
    FROM tblAttendance a
    INNER JOIN tblAttendDetail ad ON ad.tblAttendance_id = a.id
    INNER JOIN tblStudent s ON s.id = a.tblStudent_id
    INNER JOIN tblOpenCourse oc ON oc.id = a.tblOpenCourse_id
    INNER JOIN vwTeacherCourse tc ON tc.openCourseId = oc.id 
        WHERE to_date(a.attendancedate, 'yyyy-mm-dd') = to_date('23-01-26', 'yyyy-mm-dd') AND tc.teacherId = 4
        ORDER BY oc.id, oc.name, s.name, a.attendanceDate;

SELECT count(*) FROM vwTeacherCourse WHERE teacherId = 4 AND to_date('23-01-26', 'yyyy-mm-dd') BETWEEN to_date(startDate, 'yyyy-mm-dd') AND to_date(endDate, 'yyyy-mm-dd');

SELECT * FROM vwTeacherCourse WHERE teacherId = 4 AND to_date('23-01-26', 'yyyy-mm-dd') BETWEEN to_date(startDate, 'yyyy-mm-dd') 
                                                                                               AND to_date(endDate, 'yyyy-mm-dd');
        
SELECT count(*) FROM vwTeacherCourse WHERE to_date('23-01-26', 'yyyy-mm-dd') BETWEEN to_date(startDate, 'yyyy-mm-dd') 
                                                                                               AND to_date(endDate, 'yyyy-mm-dd');
        

-- 1. 수강생들의 출결 현황을 기간별(년, 월, 일) 조회할 수 있다.
-- 특정 날짜를 원할 때 
CREATE OR REPLACE PROCEDURE procTeacherDateAttendance (
    ptid IN NUMBER,
    pdate IN DATE
)
IS
    CURSOR vcursor
    IS
    SELECT oc.name, s.name, a.attendancedate, ad.inTime, ad.outTime 
    FROM tblAttendance a
    INNER JOIN tblAttendDetail ad ON ad.tblAttendance_id = a.id
    INNER JOIN tblStudent s ON s.id = a.tblStudent_id
    INNER JOIN tblOpenCourse oc ON oc.id = a.tblOpenCourse_id
    INNER JOIN vwTeacherCourse tc ON tc.openCourseId = oc.id 
        WHERE a.attendancedate = pdate AND tc.teacherId = ptid
        ORDER BY oc.id, oc.name, s.name, a.attendanceDate;
    
    vcname tblOpenCourse.name%type;
    vsname tblStudent.name%type;
    vdate tblAttendance.attendanceDate%type;
    vinTime tblAttendDetail.inTime%type;
    voutTime tblAttendDetail.outTime%type;
    
    vprevName tblOpenCourse.name%type := NULL; -- 이전 강좌의 이름 저장
    vprevDate tblAttendance.attendanceDate%type := NULL; -- 이전 날짜 저장 
    
    vtnum NUMBER;
    vdnum NUMBER;
    
BEGIN
    
    OPEN vcursor;
    
    SELECT count(*) INTO vtnum FROM vwTeacherCourse WHERE teacherId = ptid AND to_date(pdate, 'yyyy-mm-dd') BETWEEN startDate AND endDate;     
    SELECT count(*) INTO vdnum FROM vwTeacherCourse WHERE to_date(pdate, 'yyyy-mm-dd') BETWEEN startDate AND endDate;
    
    IF vtnum = 1 AND vdnum = 1 THEN
    
        LOOP
            FETCH vcursor INTO vcname, vsname, vdate, vinTime, voutTime;
            EXIT WHEN vcursor%notfound;
        
            -- 새로운 강좌가 나오면 이름과 테이블 헤더 출력
            IF vprevName <> vcname THEN
                IF vprevName IS NOT NULL THEN
                    dbms_output.put_line('          -----------------------------------------------------------');
                END IF;
                
                dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
                dbms_output.put_line('  ' || vcname);
                dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
                
                
                dbms_output.put_line('          ===========================================================');
                dbms_output.put_line('          |    날  짜    |   이  름   |   입실 시간   |   퇴실 시간  |');
                dbms_output.put_line('          ===========================================================');
                dbms_output.put_line('          |   ' || vdate || '   |   '   || vsname || '   |   ' || vinTime || '   |   ' || voutTime || '   |');
                
                FETCH vcursor INTO vcname, vsname, vdate, vinTime, voutTime;
                
                vprevName := vcname;
                
            ELSIF vprevName IS NULL THEN
            
                dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
                dbms_output.put_line('  ' || vcname);
                dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
                
                vprevName := vcname;
                
            END IF;
            
            -- 새로운 날짜가 나오면 날짜와 테이블 헤더 출력
            IF vprevDate IS NULL OR vprevDate <> vdate THEN
                IF vprevDate IS NOT NULL THEN
                    dbms_output.put_line('          -----------------------------------------------------------');
                END IF;
                
                dbms_output.put_line('          ===========================================================');
                dbms_output.put_line('          |    날  짜    |   이  름   |   입실 시간   |   퇴실 시간  |');
                dbms_output.put_line('          ===========================================================');
                dbms_output.put_line('          |   ' || vdate || '   |   '   || vsname || '   |   ' || vinTime || '   |   ' || voutTime || '   |');
                
                vprevDate := vdate;
                
                FETCH vcursor INTO vcname, vsname, vdate, vinTime, voutTime;
                
            END IF;
            
            dbms_output.put_line('          |              |   '   || vsname || '   |   ' || vinTime || '   |   ' || voutTime || '   |');
         
        END LOOP;        
    
    dbms_output.put_line('          -----------------------------------------------------------');
       
    ELSIF vdnum = 0 THEN       
        dbms_output.put_line('잘못된 날짜를 입력하셨습니다.');
    ELSIF vtnum = 0 THEN
        dbms_output.put_line('해당 날짜의 강좌에 대한 출결 정보 열람 권한이 없습니다.');     
    END IF;   
    
       
    CLOSE vcursor;
    
END;
/

BEGIN
    procTeacherDateAttendance(4, '2023-09-25');
END;
/

commit;

        
        
-- 특정 기간 사이의 날짜를 원할 때 
CREATE OR REPLACE PROCEDURE procTeacherPeriodAttendance (
    ptid IN NUMBER,
    pstartDate IN DATE,
    pendDate IN DATE 
)
IS
    CURSOR vcursor
    IS
    SELECT oc.name, s.name, a.attendancedate, ad.inTime, ad.outTime 
    FROM tblAttendance a
    INNER JOIN tblAttendDetail ad ON ad.tblAttendance_id = a.id
    INNER JOIN tblStudent s ON s.id = a.tblStudent_id
    INNER JOIN tblOpenCourse oc ON oc.id = a.tblOpenCourse_id
    INNER JOIN vwTeacherCourse tc ON tc.openCourseId = oc.id 
        WHERE a.attendancedate BETWEEN pstartDate AND pendDate AND tc.teacherId = ptid
        ORDER BY oc.id, oc.name, s.name, a.attendanceDate;
        
    
    vcname tblOpenCourse.name%type;
    vsname tblStudent.name%type;
    
    vdate tblAttendance.attendanceDate%type;
    vinTime tblAttendDetail.inTime%type;
    voutTime tblAttendDetail.outTime%type;
    
    vprevCname tblOpenCourse.name%type := NULL; -- 이전 강좌의 이름 저장
    vprevSname tblStudent.name%type := NULL; -- 이전 학생의 이름  저장 
    
    vtnum NUMBER;
    vdnum NUMBER;
    
BEGIN
    
    OPEN vcursor;
    
    SELECT count(*) INTO vtnum FROM vwTeacherCourse WHERE teacherId = ptid AND to_date(pstartDate, 'yyyy-mm-dd') >= startDate 
                                                                           AND to_date(pendDate, 'yyyy-mm-dd') <= endDate;
    SELECT count(*) INTO vdnum FROM vwTeacherCourse WHERE to_date(pstartDate, 'yyyy-mm-dd') >= startDate 
                                                      AND to_date(pendDate, 'yyyy-mm-dd') <= EndDate;
    
    IF vtnum = 1 AND vdnum = 1 THEN
    
        LOOP
            FETCH vcursor INTO vcname, vsname, vdate, vinTime, voutTime;
            EXIT WHEN vcursor%notfound;
        
            -- 새로운 강좌가 나오면 이름과 테이블 헤더 출력
            IF vprevCname <> vcname THEN
                
                
                dbms_output.put_line('           ----------------------------------------------------------');
                
                dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
                dbms_output.put_line('  ' || vcname);
                dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
                
                vprevCname := vcname;
                vprevSname := NULL;   -- 새로운 강좌가 시작되면 학생 이름 초기화
                
            ELSIF vprevCname IS NULL THEN
            
                dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
                dbms_output.put_line('  ' || vcname);
                dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
                
                vprevCname := vcname;
                
            END IF;
            
            -- 새로운 학생 이름이 나오면 이름과 테이블 헤더 출력 
            IF vprevSname IS NULL OR vprevSname <> vsname THEN
                IF vprevSname IS NOT NULL THEN
                    dbms_output.put_line('           ----------------------------------------------------------');
                END IF;
                
                dbms_output.put_line('           ==========================================================');
                dbms_output.put_line('          |   이  름   |    날  짜    |   입실 시간   |   퇴실 시간  |');
                dbms_output.put_line('           ==========================================================');
                dbms_output.put_line('          |   ' || vsname || '   |   '   || vdate || '   |   ' || vinTime || '   |   ' || voutTime || '   |');
                
                FETCH vcursor INTO vcname, vsname, vdate, vinTime, voutTime;
                
                
                vprevSname := vsname;
                
                
            END IF;
            
            dbms_output.put_line('          |              |   ' || vdate || '   |   ' || vinTime || '   |   ' || voutTime || '   |');
               
    END LOOP;        
    
    dbms_output.put_line('           ----------------------------------------------------------');
    
    ELSIF vdnum = 0 THEN              
        dbms_output.put_line('잘못된 날짜를 입력하셨습니다.');
          
    ELSIF vtnum = 0 THEN
        dbms_output.put_line('해당 날짜의 강좌에 대한 출결 정보 열람 권한이 없습니다.');
            
    END IF;
        
    CLOSE vcursor;
    
END;
/

BEGIN
    procTeacherPeriodAttendance(4, '2023-03-01', '2023-04-01');
END;
/



select * from tblTeacher t
    inner join tblOpenSubject os ON t.id = os.tblTeacher_id;
select * from tblOpenSubject;

-- 2. 특정 과정(과정명, 출결날짜, 근태상황, 인원)에 대한 출결 현황을 조회할 수 있다.
CREATE OR REPLACE PROCEDURE procTeacherCourseAttendDetail (
    ptid IN NUMBER,
    pcid IN NUMBER
)
IS
    CURSOR vcursor 
    IS
    SELECT openCourseName, attendanceDate, studentCount, normalAttendance, late, late_earlyLeave, earlyLeave, outing, sickDay, absence
        FROM vwAttendState vas
        INNER JOIN tblOpenSubject os ON os.tblOpenCourse_id = vas.openCourseId
        INNER JOIN tblTeacher t ON t.id = os.tblTeacher_id
        WHERE openCourseId = pcid AND t.id = ptid
            ORDER BY openCourseId;
    
    vcname vwAttendState.openCourseName%type;
    vdate vwAttendState.attendanceDate%type;
    
    vstudentCount NUMBER;
    vnormalAttendance NUMBER;
    vlate NUMBER;
    vlate_earlyLeave NUMBER;
    vearlyLeave NUMBER;
    vouting NUMBER;
    vsickDay NUMBER;
    vabsence NUMBER;
    
    vprevCname vwAttendState.openCourseName%type := NULL; -- 강좌의 이름 저장
    
    vnum NUMBER;
    
BEGIN

    OPEN vcursor;
        
    SELECT count(DISTINCT openCourseId) INTO vnum
        FROM vwAttendState vas
            INNER JOIN tblOpenSubject os ON os.tblOpenCourse_id = vas.openCourseId
            INNER JOIN tblTeacher t ON t.id = os.tblTeacher_id
            WHERE t.id = ptid AND openCourseId = pcid
            ORDER BY openCourseId;    
    
    IF vnum = 1 THEN
       
        LOOP
            
            FETCH vcursor INTO vcname, vdate, vstudentCount, vnormalAttendance, vlate, vlate_earlyLeave, vearlyLeave, vouting, vsickDay, vabsence;
            EXIT WHEN vcursor%notfound;
            
        
            
                -- 강좌 이름과 테이블 헤더 출력
                IF vprevCname IS NULL THEN
                    
                    dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
                    dbms_output.put_line('  ' || vcname);
                    dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
                    dbms_output.put_line('  ===============================================================================');
                    dbms_output.put_line('      날짜    인원   정상출석   지각   지각/조퇴   조퇴   외출   병가   결석');
                    dbms_output.put_line('  ===============================================================================');
                    
                    vprevCname := vcname;
                   
                END IF;
                                                                                                        
                dbms_output.put_line('|     ' || vdate || '    ' || vstudentCount || '명     ' || vnormalAttendance 
                || '명      ' || vlate || '명       ' || vlate_earlyLeave || '명       ' || vearlyLeave || '명    ' || vouting || '명    ' 
                || vsickDay || '명    ' || vabsence || '명    ' || '  |');
                
            
            END LOOP;
            
            dbms_output.put_line('|______________________________________________________________________________|');
    
    ELSIF vnum = 0 THEN
        dbms_output.put_line('해당 강좌에 대한 출결 정보 열람 권한이 없습니다.');
    END IF; 
    
    CLOSE vcursor;

END;
/



BEGIN
    procTeacherCourseAttendDetail(3, 1);
END;
/


-- 3. 특정 교육생(교육생 이름, 출결날짜, 근태상황)에 대한 출결 현황을 조회할 수 있다.
CREATE OR REPLACE PROCEDURE procTeacherStudentAttendance (
    ptid NUMBER,
    psid NUMBER
)
IS
    CURSOR vcursor 
    IS
    SELECT studentName, attendanceDate, attendanceState
    FROM vwstudentAttendDetail sad 
    INNER JOIN vwTeacherOpenCourseList tos ON sad.openCourseId = tos.tblOpenCourse_id
    INNER JOIN tblTeacher t ON t.id = tos.tblTeacher_id
        WHERE studentId = psid AND tblTeacher_id = ptid
            ORDER BY attendanceDate;
    
    vstudentName vwstudentatted.studentName%type;
    vattendanceDate vwstudentatted.attendanceDate%type;
    vattendanceState vwstudentatted.attendanceState%type;

    vprevName vwstudentatted.studentName%type := NULL; -- 학생 이름 저장
    
    vnum NUMBER;
    
BEGIN

    OPEN vcursor;
    
    SELECT count(DISTINCT tblTeacher_id) INTO vnum
    FROM vwstudentAttendDetail sad 
    INNER JOIN vwTeacherOpenCourseList tos ON sad.openCourseId = tos.tblOpenCourse_id
    INNER JOIN tblTeacher t ON t.id = tos.tblTeacher_id
    WHERE studentId = psid AND tblTeacher_id = ptid;
    
    
    
    IF vnum = 1 THEN
    
        LOOP
            FETCH vcursor INTO vstudentName, vattendanceDate, vattendanceState;
            EXIT WHEN vcursor%notfound;
            
            IF vprevName IS NULL THEN
                
                dbms_output.put_line('  ︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵');
                dbms_output.put_line('|                                        |');
                dbms_output.put_line('|          ' || vstudentName || ' 학생의 출결 정보        |');
                dbms_output.put_line('|                                        |');
                dbms_output.put_line(' ︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶');
                dbms_output.put_line(' =========================================');
                dbms_output.put_line('|        날   짜        근태 상황         |');
                dbms_output.put_line(' =========================================');
                
                vprevName := vstudentName;
            
            END IF;
            
            IF vattendanceState = '지각/조퇴' THEN
            
                dbms_output.put_line('|        '  || vattendanceDate || '        ' || vattendanceState || '           |');
                FETCH vcursor INTO vstudentName, vattendanceDate, vattendanceState;
            
            END IF;
            
            dbms_output.put_line('|        '  || vattendanceDate || '          ' || vattendanceState || '            |');
            
        END LOOP;
        
        dbms_output.put_line(' -----------------------------------------');
    
    ELSIF vnum = 0 THEN
        dbms_output.put_line('해당 학생에 대한 출결 정보 열람 권한이 없습니다.');
    END IF;
        
    CLOSE vcursor;

END;
/

BEGIN
    procTeacherStudentAttendance(4, 1);
END;
/


-- 1. 매일 출석을 기록해야 한다. 출근 1회, 퇴근 1회 기록한다. 외출(출근, 퇴근 2회씩 기록) 중에 해당되는 사항이 있을 경우 기록한다. 


-------------------------------------- 출근 ------------------------------------

CREATE OR REPLACE PROCEDURE procInTimeRecord (
    psid NUMBER,
    pcid NUMBER,
    pdate DATE
)
IS
    
    CURSOR vcursor
    IS
    SELECT tblStudent_id FROM tblCompletion c
    WHERE tblOpenCourse_id = pcid AND state <> '중도탈락';
    
    vsnum NUMBER;
    vcnum NUMBER;
    vsid NUMBER;
    
    vaid NUMBER;
    vdnum NUMBER;
    
    vname tblStudent.name%type;
    
BEGIN
    
    SELECT COUNT(*) INTO vsnum FROM tblAttendance WHERE tblStudent_id = psid AND TRUNC(attendanceDate) = TRUNC(pdate);
    SELECT COUNT(*) INTO vcnum FROM tblAttendance WHERE tblOpenCourse_id = pcid AND TRUNC(attendanceDate) = TRUNC(pdate);
    
    IF vcnum = 0 THEN 
    
        OPEN vcursor;
    
            LOOP
            
                FETCH vcursor INTO vsid;
                EXIT WHEN vcursor%notfound;
                
                INSERT INTO tblAttendance(id, attendancedate, tblStudent_id, tblOpenCourse_id) 
                VALUES (seqAttendance.nextVal, pdate, vsid, pcid);
                
            END LOOP;
            
            dbms_output.put_line('');
            dbms_output.put_line('20' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'yy') || '년 ' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'mm') 
            || '월 ' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'dd') || '일 출결 정보를 생성하였습니다.');
            
        CLOSE vcursor;
        
    END IF;
    
    
    SELECT a.id, s.name INTO vaid, vname FROM tblAttendance a INNER JOIN tblStudent s ON a.tblStudent_id = s.id 
         WHERE tblStudent_id = psid AND tblOpenCourse_id = pcid AND TRUNC(attendanceDate) = TRUNC(pdate); 
    
    SELECT count(*) INTO vdnum FROM tblAttendDetail WHERE tblAttendance_id = vaid;
    
    IF vdnum = 0 THEN
        INSERT INTO tblAttendDetail(id, inTime, outTime, tblAttendance_id) 
        VALUES (seqAttendDetail.nextVal, to_char(sysdate, 'hh24:mi:ss'), null, vaid);
        
        IF to_char(sysdate, 'hh24:mi:ss') BETWEEN '07:00:00' AND '09:00:00' THEN
            
            dbms_output.put_line(vname || '님 ' || to_char(sysdate, 'hh24') || '시 ' || to_char(sysdate, 'mi') || '분 ' 
            || to_char(sysdate, 'hh24:mi:ss') || '초 정상 입실하셨습니다.');
        
        ELSIF to_char(sysdate, 'hh24:mi:ss') > '09:00:00' THEN
            dbms_output.put_line(vname || '님 ' || to_char(sysdate, 'hh24') || '시 ' || to_char(sysdate, 'mi') || '분 ' 
            || to_char(sysdate, 'hh24:mi:ss') || '초 지각하셨습니다.');
        
        END IF;
        
    ELSIF vdnum = 1 THEN
        INSERT INTO tblAttendDetail(id, inTime, outTime, tblAttendance_id) 
        VALUES (seqAttendDetail.nextVal, to_char(sysdate, 'hh24:mi:ss'), null, vaid);
        dbms_output.put_line(vname || '님 ' || to_char(sysdate, 'hh24') || '시 ' || to_char(sysdate, 'mi') || '분 ' 
                          || to_char(sysdate, 'hh24:mi:ss') || '초 재입실하셨습니다.');
    END IF;
        
    
END;
/

BEGIN
    procInTimeRecord(350, 16, '24-09-01');
END;
/



-------------------------------------- 퇴근 ------------------------------------

CREATE OR REPLACE PROCEDURE procOutTimeRecord (
    psid NUMBER,
    pcid NUMBER,
    pdate DATE
)
IS
    vaid NUMBER;
    vnum NUMBER;
    vname tblStudent.name%type;
BEGIN
    
    SELECT a.id, s.name INTO vaid, vname FROM tblAttendance a INNER JOIN tblStudent s ON a.tblStudent_id = s.id 
        WHERE tblStudent_id = psid AND tblOpenCourse_id = pcid AND TRUNC(attendanceDate) = TRUNC(pdate); 

    
    SELECT count(*) INTO vnum FROM tblAttendDetail WHERE tblAttendance_id = vaid AND inTime IS NOT NULL;
    
    IF vnum = 0 THEN 
    
        dbms_output.put_line('아직 입실 전입니다.');
    
    ELSIF vnum = 1 THEN 
    
        UPDATE tblAttendDetail SET outTime = to_char(sysdate, 'hh24:mi:ss') WHERE tblAttendance_id = vaid;
        
        IF to_char(sysdate, 'hh24:mi:ss') >= '18:00:00' THEN
        
            dbms_output.put_line(vname || '님 ' || to_char(sysdate, 'hh24') || '시 ' || to_char(sysdate, 'mi') || '분 ' 
                                 || to_char(sysdate, 'hh24:mi:ss') || '초 퇴실하셨습니다.');
        
        ELSIF to_char(sysdate, 'hh24:mi:ss') < '18:00:00' THEN
            
            dbms_output.put_line(vname || '님 ' || to_char(sysdate, 'hh24') || '시 ' || to_char(sysdate, 'mi') || '분 ' 
                                 || to_char(sysdate, 'ss') || '초 조퇴하셨습니다.');
        
        END IF;
    
    ELSIF vnum = 2 THEN
        dbms_output.put_line(vname || '님 ' || to_char(sysdate, 'hh24') || '시 ' || to_char(sysdate, 'mi') || '분 ' 
                                 || to_char(sysdate, 'hh24:mi:ss') || '초 퇴실하셨습니다.');
        dbms_output.put_line('외출 처리 되셨습니다.');
        
    END IF;

EXCEPTION

     when NO_DATA_FOUND then
        dbms_output.put_line('아직 입실 전입니다.');
    
END;
/

BEGIN
    procOutTimeRecord(350, 16, '24-09-01');
END;
/



-- 병가 중에 해당되는 사항이 있을 경우 기록한다.
CREATE OR REPLACE PROCEDURE procSickRecord (
        psid NUMBER,
        pcid NUMBER,
        pdate DATE
)
IS
    CURSOR vcursor
    IS
    SELECT tblStudent_id FROM tblCompletion WHERE tblOpenCourse_id = pcid AND state <> '중도탈락';
    
    vsnum NUMBER;
    vcnum NUMBER;
    
    vsid NUMBER;
    vaid NUMBER;
    vdnum NUMBER;
    
    vrnum NUMBER;
    vname tblStudent.name%type;
    
BEGIN
    
    SELECT COUNT(*) INTO vsnum FROM tblAttendance WHERE tblStudent_id = psid AND TRUNC(attendanceDate) = TRUNC(pdate);
    SELECT COUNT(*) INTO vcnum FROM tblAttendance WHERE tblOpenCourse_id = pcid AND TRUNC(attendanceDate) = TRUNC(pdate);
    
    IF vcnum = 0 THEN 
    
        OPEN vcursor;
    
            LOOP
            
                FETCH vcursor INTO vsid;
                EXIT WHEN vcursor%notfound;
                
                INSERT INTO tblAttendance(id, attendancedate, tblStudent_id, tblOpenCourse_id) 
                VALUES (seqAttendance.nextVal, pdate, vsid, pcid);
                
            END LOOP;
            
            dbms_output.put_line('');
            dbms_output.put_line('20' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'yy') || '년 ' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'mm') 
            || '월 ' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'dd') || '일 출결 정보를 생성하였습니다.');
            
        CLOSE vcursor;
        
    END IF;
    
    SELECT a.id, s.name INTO vaid, vname FROM tblAttendance a INNER JOIN tblStudent s ON a.tblStudent_id = s.id 
        WHERE tblStudent_id = psid AND tblOpenCourse_id = pcid AND TRUNC(attendanceDate) = TRUNC(pdate); 
    
    SELECT count(*) INTO vrnum FROM tblSickRecord WHERE tblAttendance_id = vaid;
    
    IF vrnum = 0 THEN
        INSERT INTO tblSickRecord VALUES(seqSickRecord.nextVal, vaid);
        dbms_output.put_line('20' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'yy') || '년 ' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'mm') 
                             || '월 ' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'dd') || '일 ' || vname || '님의 병결 처리가 완료되었습니다.');
    ELSIF vrnum = 1 THEN    
        dbms_output.put_line('20' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'yy') || '년 ' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'mm') 
                     || '월 ' || to_char(to_date(pdate, 'yyyy-mm-dd'), 'dd') || '일 ' || vname || '님의 병결 처리가 이미 완료되었습니다.');
    END IF;
    
    
END;
/

BEGIN
    procSickRecord(350, 16, '24-09-01');
END;
/



-- 2. 매일 금일 출석을 조회할 수 있다. 
-- 금일 출석 현황에는 교육생 이름, 과정명, 날짜, 근태 상황이 포함된다.
CREATE OR REPLACE PROCEDURE procDailyAttendance (
    pid NUMBER
)
IS
    CURSOR vcursor 
    IS
    SELECT studentId, studentName, attendanceDate, attendanceState, openCourseName
    FROM vwstudentAttendDetail 
    WHERE studentId = pid AND TRUNC(attendanceDate) = TRUNC(SYSDATE)
    ORDER BY attendanceDate;
    
    vstudentId vwstudentAttendDetail.studentId%TYPE;
    vstudentName vwstudentAttendDetail.studentName%TYPE;
    vattendanceDate vwstudentAttendDetail.attendanceDate%TYPE;
    vattendanceState vwstudentAttendDetail.attendanceState%TYPE;
    vcourseName vwstudentAttendDetail.openCourseName%TYPE;
   
BEGIN

    OPEN vcursor;
            
        LOOP
            FETCH vcursor INTO vstudentId, vstudentName, vattendanceDate, vattendanceState, vcourseName;
            EXIT WHEN vcursor%NOTFOUND;
            
        END LOOP;
        
        
            dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
            dbms_output.put_line('  ' || vcourseName);
            dbms_output.put_line('〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰');
            
            
            dbms_output.put_line('                    ︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵︵');
            dbms_output.put_line('                  |                                        |');
            dbms_output.put_line('                  |          ' || vstudentName || ' 학생의 출결 정보        |');
            dbms_output.put_line('                  |                                        |');
            dbms_output.put_line('                   ︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶︶');
            
            
            dbms_output.put_line('                   =========================================');
            dbms_output.put_line('                  |        날   짜        근태 상황         |');
            dbms_output.put_line('                   =========================================');
            
            IF vattendanceState = '지각/조퇴' THEN
                
                dbms_output.put_line('                  |                                         |');
                dbms_output.put_line('                  |        '  || vattendanceDate || '        ' || vattendanceState || '           |');
                dbms_output.put_line('                  |                                         |');
                
            END IF;
            
            
            dbms_output.put_line('                  |                                         |');
            dbms_output.put_line('                  |        '  || vattendanceDate || '          ' || vattendanceState || '            |');
            dbms_output.put_line('                  |                                         |');
        
        dbms_output.put_line('                   -----------------------------------------');
                
    CLOSE vcursor;

END;
/

BEGIN
    procDailyAttendance(351);
END;
/

SELECT studentName, attendanceDate, attendanceState
FROM vwstudentatted
    WHERE studentId = 351 AND trunc(attendanceDate) = trunc(sysdate)
        ORDER BY attendanceDate;



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
























