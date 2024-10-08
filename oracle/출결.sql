-- 출결
DROP TABLE tblAttendance;
DROP TABLE tblAttendDetail;
DROP TABLE tblSickRecord;

CREATE SEQUENCE seqAttendance;
CREATE SEQUENCE seqAttendDetail;
CREATE SEQUENCE seqSickRecord;

DROP SEQUENCE seqAttendance;
DROP SEQUENCE seqAttendDetail;
DROP SEQUENCE seqSickRecord;


SELECT count(*) FROM tblAttendance order by id;
SELECT count(*) FROM tblAttendDetail order by id;
SELECT count(*) FROM tblSickRecord order by id;


CREATE TABLE tblAttendance (
     id NUMBER PRIMARY KEY,
     attendanceDate DATE NOT NULL,
     tblStudent_id NUMBER REFERENCES tblStudent(id) NOT NULL,
     tblOpenCourse_id NUMBER REFERENCES tblOpenCourse(id) NOT NULL
);

CREATE TABLE tblAttendDetail (
     id NUMBER PRIMARY KEY,
     inTime VARCHAR2(10) NOT NULL,
     outTime VARCHAR2(10) NULL,
     tblAttendance_id NUMBER REFERENCES tblAttendance(id) NOT NULL
);

CREATE TABLE tblSickRecord (
     id NUMBER PRIMARY KEY,
     tblAttendance_id NUMBER REFERENCES tblAttendance(id) NOT NULL
);

select attendanceDate, tblstudent_id, count(*) 
    from tblAttendance 
        group by attendanceDate, tblStudent_id  
            having count(*) > 1
                order by tblStudent_id;


select tblStudent_id, count(*)
    from tblAttendance
        where tblOpenCourse_id = 16
            group by tblStudent_id
                having count(*) <> 19
                    order by tblStudent_id;

select count(*) from tblattendance order by id;

select * from tblSickRecord;



