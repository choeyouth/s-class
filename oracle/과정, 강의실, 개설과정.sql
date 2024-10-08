CREATE TABLE tblCourse (
	id NUMBER PRIMARY KEY,
	name VARCHAR2(100) NOT NULL
);

CREATE SEQUENCE seqCourse;

CREATE TABLE tblClassroom (
	id NUMBER PRIMARY KEY,
	name VARCHAR2(50) NOT NULL,
	capacity NUMBER NOT NULL
);

CREATE SEQUENCE seqClassroom;

CREATE TABLE tblOpenCourse (
	id NUMBER PRIMARY KEY,
	name VARCHAR2(100) NOT NULL,
	startDate DATE NOT NULL,
	endDate DATE NOT NULL,
	tblCourse_id NUMBER REFERENCES tblCourse(id) NOT NULL,
	tblClassroom_id NUMBER REFERENCES tblClassroom(id) NOT NULL
);

CREATE SEQUENCE seqOpenCourse;

set define off;


-- 과정
insert into tblCourse values(seqCourse.nextVal, 'AWS와 Docker & Kubernetes를 활용한 Java Full-Stack 개발자 양성과정');
insert into tblCourse values(seqCourse.nextVal, 'AWS 클라우드와 Elasticsearch를 활용한 Java(자바) Full-Stack 개발자 양성과정');
insert into tblCourse values(seqCourse.nextVal, 'AWS와 Elasticsearch 활용 자바 기반 Full-Stack 개발자 양성 과정');
insert into tblCourse values(seqCourse.nextVal, 'AWS 클라우드와 Kafka를 활용한 Java(자바) Full-Stack 개발자 양성과정');
insert into tblCourse values(seqCourse.nextVal, '자바(Java) 기반 ChatGPT API를 활용한 Full-Stack 개발자 양성과정');

-- 강의실
insert into tblClassroom values(seqClassroom.nextVal, 1, 30);
insert into tblClassroom values(seqClassroom.nextVal, 2, 30);
insert into tblClassroom values(seqClassroom.nextVal, 3, 30);
insert into tblClassroom values(seqClassroom.nextVal, 4, 26);
insert into tblClassroom values(seqClassroom.nextVal, 5, 26);
insert into tblClassroom values(seqClassroom.nextVal, 6, 26);


-- 개설 과정
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS와 Docker & Kubernetes를 활용한 Java Full-Stack 개발자 양성과정(A)', '2023-01-26', '2023-07-11', 1, 5);
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS 클라우드와 Elasticsearch를 활용한 Java(자바) Full-Stack 개발자 양성과정(A)', '2023-02-01', '2023-07-12', 2, 1);
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS 클라우드와 Elasticsearch를 활용한 Java(자바) Full-Stack 개발자 양성과정(B)', '2023-03-15', '2023-08-25', 2, 2);
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS 클라우드와 Elasticsearch를 활용한 Java(자바) Full-Stack 개발자 양성과정(C)', '2023-03-29', '2023-09-08', 2, 6);
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS 클라우드와 Elasticsearch를 활용한 Java(자바) Full-Stack 개발자 양성과정(D)', '2023-07-13', '2023-12-27', 2, 4);
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS 클라우드와 Elasticsearch를 활용한 Java(자바) Full-Stack 개발자 양성과정(E)', '2023-07-14', '2023-12-27', 2, 3);
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS 클라우드와 Elasticsearch를 활용한 Java(자바) Full-Stack 개발자 양성과정(F)', '2023-08-29', '2024-02-14', 2, 2);
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS 클라우드와 Elasticsearch를 활용한 Java(자바) Full-Stack 개발자 양성과정(G)', '2023-09-13', '2024-02-29', 2, 5);
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS와 Elasticsearch 활용 자바 기반 Full-Stack 개발자 양성 과정(A)', '2023-12-29', '2024-06-18', 3, 4);
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS와 Elasticsearch 활용 자바 기반 Full-Stack 개발자 양성 과정(B)', '2023-12-29', '2024-06-17', 3, 6);
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS 클라우드와 Kafka를 활용한 Java(자바) Full-Stack 개발자 양성과정(A)', '2024-02-16', '2024-07-31', 4, 2);
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS와 Docker & Kubernetes를 활용한 Java Full-Stack 개발자 양성과정(B)', '2024-03-25', '2024-10-11', 1, 3);
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS 클라우드와 Kafka를 활용한 Java(자바) Full-Stack 개발자 양성과정(B)', '2024-06-19', '2024-12-02', 4, 1);
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS 클라우드와 Kafka를 활용한 Java(자바) Full-Stack 개발자 양성과정(C)', '2024-07-01', '2024-12-12', 4, 6);
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS 클라우드와 Kafka를 활용한 Java(자바) Full-Stack 개발자 양성과정(D)', '2024-07-17', '2025-01-03', 4, 5);
insert into tblOpenCourse values(seqOpenCourse.nextVal, '자바(Java) 기반 ChatGPT API를 활용한 Full-Stack 개발자 양성과정(A)', '2024-08-05', '2025-01-21', 5, 4);
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS 클라우드와 Kafka를 활용한 Java(자바) Full-Stack 개발자 양성과정(E)', '2024-09-30', '2025-03-19', 4, 2);
insert into tblOpenCourse values(seqOpenCourse.nextVal, 'AWS와 Docker & Kubernetes를 활용한 Java Full-Stack 개발자 양성과정(C)', '2024-10-15', '2025-04-24', 1, 3);

SELECT * FROM tblOpenCourse;









