show user;
create user spring identified by java1234;
grant connect, resource, dba to spring;

drop table tblLibrary;
drop table tblCategory;
drop table tblPreference;
drop table tblBookmark;
drop table tblQuoteList;
drop table tblWordList;
drop table tblRank;
drop table tblBookReview;
drop table tblReplyLike;
drop table tblBoardLike;
drop table tblDiscussionReply;
drop table tblDiscussionBoard;
drop table tblMemberInfo;
drop table tblWishTable;
drop table tblMember;
drop table tblBook;
drop table tblSubGenre;
drop table tblGenreList;


drop SEQUENCE category_seq;
drop SEQUENCE library_seq;
drop SEQUENCE preference_seq;
drop SEQUENCE bookmark_seq;
drop SEQUENCE quotelist_seq;
drop SEQUENCE wordlist_seq;
drop SEQUENCE rank_seq;
drop SEQUENCE bookReview_seq;
drop SEQUENCE discussionReply_seq;
drop SEQUENCE discussionBoard_seq;
drop SEQUENCE replyLike_seq;
drop SEQUENCE boardLike_seq;
drop SEQUENCE memberInfo_seq;
drop SEQUENCE member_seq;
drop SEQUENCE manager_seq;
drop SEQUENCE book_seq;
drop SEQUENCE subGenre_seq;
drop SEQUENCE genreList_seq;
drop SEQUENCE wishBook_seq;
drop SEQUENCE recomendbook_seq;


create SEQUENCE category_seq;
create SEQUENCE library_seq;
create SEQUENCE preference_seq;
create SEQUENCE bookmark_seq;
create SEQUENCE quote_seq;
create SEQUENCE wordlist_seq;
create SEQUENCE rank_seq;
create SEQUENCE bookReview_seq;
create SEQUENCE discussionReply_seq;
create SEQUENCE discussionBoard_seq;
create SEQUENCE replyLike_seq;
create SEQUENCE boardLike_seq;
create SEQUENCE memberInfo_seq;
create SEQUENCE member_seq;
create SEQUENCE manager_seq;
create SEQUENCE book_seq;
create SEQUENCE subGenre_seq;
create SEQUENCE genreList_seq;
create SEQUENCE wishBook_seq;
create SEQUENCE recomendbook_seq;

select * from tblDiscussionBoard;
select * from tblDiscussionReply;
select * from tblMember;

CREATE TABLE tblGenreList (
    seq NUMBER PRIMARY KEY, 
    genre VARCHAR2(100) NOT NULL
);

CREATE TABLE tblSubGenre (
    seq NUMBER PRIMARY KEY,
    genre_seq NUMBER NOT NULL, 
    subGenre VARCHAR2(100) NOT NULL, 
    FOREIGN KEY (genre_seq) REFERENCES tblGenreList(seq)
);

CREATE TABLE tblBook (
    seq NUMBER PRIMARY KEY, 
   subGenre_seq NUMBER NOT NULL, 
   name VARCHAR2(200) NOT NULL, 
   author VARCHAR2(1000) NOT NULL, 
   publicationDate DATE NOT NULL, 
   story VARCHAR2(4000) NULL,
   cover VARCHAR2(500) NOT NULL, 
   FOREIGN KEY (subGenre_seq) REFERENCES tblSubGenre(seq)
);


CREATE TABLE tblMember (
    seq NUMBER PRIMARY KEY,
    id VARCHAR2(20) UNIQUE,
    password VARCHAR2(20) NOT NULL,
    ing NUMBER(1) DEFAULT 1 NOT NULL,
    lv NUMBER(1) DEFAULT 1 NOT NULL
);


CREATE TABLE tblMemberInfo (                         
    seq NUMBER PRIMARY KEY,                              
    member_seq NUMBER NOT NULL,                          
    name VARCHAR2(20) NOT NULL,                          
    tel VARCHAR2(20) NOT NULL UNIQUE,                           
    email VARCHAR2(200) NOT NULL,            
    pic VARCHAR2(300) DEFAULT 'basic.png' NULL,
    address VARCHAR2(2000) NOT NULL,                
    addrDetail VARCHAR2(300) NOT NULL,
    zipcode NUMBER NOT NULL,
    regDate date DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq)   
);            
           
CREATE TABLE tblMemberInfo (                         
    seq NUMBER PRIMARY KEY,                              
    member_seq NUMBER NOT NULL,                          
    name VARCHAR2(20) NOT NULL,                          
    address VARCHAR2(2000) NOT NULL,                
    addrDetail VARCHAR2(300) NOT NULL,
    zipcode VARCHAR2(10) NOT NULL,
    tel VARCHAR2(20) NOT NULL,                           
    email VARCHAR2(200) NOT NULL,            
    pic VARCHAR2(300) DEFAULT 'basic.png' NULL,
    regDate date DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq)   
); 

CREATE TABLE tblDiscussionBoard (                   
    seq NUMBER PRIMARY KEY,                             
    book_seq NUMBER NOT NULL,                           
    member_seq NUMBER NOT NULL,                         
    title VARCHAR2(100) NOT NULL,                       
    content VARCHAR2(4000) NOT NULL,                    
    postDate DATE NOT NULL,             
    readcount NUMBER DEFAULT 0 NOT NULL,
    FOREIGN KEY (book_seq) REFERENCES tblBook(seq),     
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq)  
);   
                                                                                            

CREATE TABLE tblDiscussionReply (                                      
    seq NUMBER PRIMARY KEY,                                                
    discussionBoard_seq NUMBER NOT NULL,                                   
    member_seq NUMBER NOT NULL,                                            
    reply VARCHAR2(1000) NOT NULL,                                         
    commitDate DATE NOT NULL,        
    FOREIGN KEY (discussionBoard_seq) REFERENCES tblDiscussionBoard(seq),  
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq)                     
);                                                                     


CREATE TABLE tblBoardLike (
    seq NUMBER PRIMARY KEY,
    discussionBoard_seq NUMBER NOT NULL,
    member_seq NUMBER NOT NULL,
    FOREIGN KEY (discussionBoard_seq) REFERENCES tblDiscussionBoard(seq),
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq)
);

CREATE TABLE tblReplyLike (
    seq NUMBER PRIMARY KEY,
    discussionReply_seq NUMBER NOT NULL,
    member_seq NUMBER NOT NULL,
    FOREIGN KEY (discussionReply_seq) REFERENCES tblDiscussionReply(seq),
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq)
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


CREATE TABLE tblRank (                             
    seq NUMBER PRIMARY KEY,                            
    book_seq NUMBER NOT NULL,                          
    member_seq NUMBER NOT NULL,                        
    score NUMBER NOT NULL,                             
    rankDate DATE DEFAULT sysdate NOT NULL,            
    FOREIGN KEY (book_seq) REFERENCES tblBook(seq),    
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq) 
);           



CREATE TABLE tblPreference (                           
    seq NUMBER PRIMARY KEY,                                
    member_seq NUMBER NOT NULL,                            
    subGenre_seq NUMBER NOT NULL,                          
    targetRead NUMBER NOT NULL,                            
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq),    
    FOREIGN KEY (subGenre_seq) REFERENCES tblSubGenre(seq) 
);           


CREATE TABLE tblWordList (          
    target_code NUMBER PRIMARY KEY,     
    word VARCHAR(200) NOT NULL,         
    pos VARCHAR(200) NOT NULL,          
    definition VARCHAR2(1000) NOT NULL  
);           


create table tblQuoteList (
    seq number primary key,
    quote varchar2(4000) not null,
    author varchar2(1000) not null,
    engAuthor varchar2(1000) not null,
    authorPic varchar2(400) null
);


CREATE TABLE tblBookMark (                                           
    seq NUMBER PRIMARY KEY,                                                
    book_seq NUMBER NOT NULL,  
    member_seq NUMBER NOT NULL,
    famousline VARCHAR2(4000) NOT NULL,        
    regDate DATE NOT NULL,
    CONSTRAINT fk_book_seq FOREIGN KEY (book_seq) REFERENCES tblBook(seq),
    CONSTRAINT fk_member_seq FOREIGN KEY (member_seq) REFERENCES tblMember(seq) 
);                                                                     


create table tblCategory (
    seq number primary key,             -- PK
    category varchar2(300) not null     -- 1 - 도서관, 2 - 서점
);


create table tblLibrary (
    seq number primary key,         -- PK
    name varchar2(600) not null,    -- 도서관 or 서점명
    lat number not null,            -- 위도
    lng number not null,            -- 경도
    address varchar2(600) not null, -- 주소
    category number not null,        -- 카테고리 : 1 - 도서관, 2 - 서점
    
    constraint fk_category foreign key (category) references tblCategory(seq)
);


CREATE TABLE tblRecomendBook (
    seq NUMBER PRIMARY KEY, 
    book_seq NUMBER NOT NULL, 
    FOREIGN KEY (book_seq) REFERENCES tblBook(seq)
);

CREATE TABLE tblWishBook (
    seq NUMBER PRIMARY KEY,
    member_seq NUMBER NOT NULL,
    book_seq NUMBER NOT NULL,
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq),
    FOREIGN KEY (book_seq) REFERENCES tblBook(seq)
);