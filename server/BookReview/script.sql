SELECT * FROM tblGenreList;
SELECT * FROM tblSubGenre;
SELECT * FROM tblBook;
SELECT * FROM tblManager;
SELECT * FROM tblMember;
SELECT * FROM tblMemberInfo;
SELECT * FROM tblDiscussionBoard;
SELECT * FROM tblDiscussionReply;
SELECT * FROM tblBookReview;
SELECT * FROM tblNote;
SELECT * FROM tblRank;
SELECT * FROM tblWordList;
SELECT * FROM tblQuoteList;
SELECT * FROM tblFamousLine;
SELECT * FROM tblBookmark;
SELECT * FROM tblPreference;
SELECT * FROM vwDiscussion;

SELECT B.NAME, R.COMMEND FROM tblBookReview R INNER JOIN tblBook B ON R.BOOK_SEQ = B.SEQ WHERE B.seq = 9791171177028;

INSERT INTO tblBookReview (seq, book_seq, member_seq, commend, review_date) VALUES (bookreview_seq.NextVal, 9788901286372, 1, 'ㄴ', SYSDATE);

commit;

CREATE TABLE tblBook ( 
    seq NUMBER(10) PRIMARY KEY
);

CREATE TABLE tblBookReview ( 
    seq NUMBER(10) PRIMARY KEY, 
    book_seq NUMBER(14) NOT NULL, 
    commend VARCHAR2(1000) NOT NULL, 
    member_seq NUMBER NOT NULL, 
    review_date DATE DEFAULT sysdate NOT NULL, 
    FOREIGN KEY (book_seq) REFERENCES tblBook(seq), 
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq) 
);

ALTER TABLE tblRANK
MODIFY rankdate DATE DEFAULT sysdate NOT NULL;

CREATE SEQUENCE bookreview_seq;



CREATE TABLE tblRank ( 
    seq NUMBER PRIMARY KEY, 
    book_seq NUMBER NOT NULL, 
    member_seq NUMBER NOT NULL, 
    score NUMBER NOT NULL, 
    rankDate DATE DEFAULT sysdate NOT NULL, 
    FOREIGN KEY (book_seq) REFERENCES tblBook(seq), 
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq) 
);

DROP TABLE tblBookMark;
DROP TABLE tblRank;
DROP TABLE tblNote;
DROP TABLE tblBookReview;

create table tblBookRank (
    seq number primary key,
    

);
