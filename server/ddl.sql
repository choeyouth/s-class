--show user;
--create user rebook identified by java1234;
--grant connect, resource, dba to rebook;

drop table tblPreference;
drop table tblBookmark;
drop table tblQuoteList;
drop table tblWordList;
drop table tblRank;
drop table tblBookReview;
drop table tblDiscussionReply;
drop table tblDiscussionBoard;
drop table tblMemberInfo;
drop table tblMember;
drop table tblManager;
drop table tblBook;
drop table tblSubGenre;
drop table tblGenreList;


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

CREATE TABLE tblManager (
   seq NUMBER PRIMARY KEY, 
   id VARCHAR2(20) NOT NULL, 
   password VARCHAR2(20) NOT NULL,
   name VARCHAR2(20) NOT NULL,
   regDate DATE DEFAULT SYSDATE NOT NULL
);

CREATE SEQUENCE manager_seq;

CREATE TABLE tblMember (
    seq NUMBER PRIMARY KEY,
    id VARCHAR2(20),
    password VARCHAR2(20) NOT NULL,
    ing NUMBER(1) DEFAULT 1 NOT NULL
);

CREATE SEQUENCE member_seq;


CREATE TABLE tblMemberInfo (                         
    seq NUMBER PRIMARY KEY,                              
    member_seq NUMBER NOT NULL,                          
    name VARCHAR2(20) NOT NULL,                          
    address VARCHAR2(2000) NOT NULL,                     
    tel VARCHAR2(20) NOT NULL,                           
    email VARCHAR2(200) NOT NULL,            
    pic VARCHAR2(300) DEFAULT 'basic.png' NULL,
    regDate date DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq)   
);            


CREATE SEQUENCE memberInfo_seq;

CREATE TABLE tblDiscussionBoard (                   
    seq NUMBER PRIMARY KEY,                             
    book_seq NUMBER NOT NULL,                           
    member_seq NUMBER NOT NULL,                         
    title VARCHAR2(100) NOT NULL,                       
    content VARCHAR2(4000) NOT NULL,                    
    postDate DATE NOT NULL,              
    likes NUMBER DEFAULT 0 NULL,
    FOREIGN KEY (book_seq) REFERENCES tblBook(seq),     
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq)  
);   
                                            
                                                     
CREATE SEQUENCE discussionBoard_seq;


CREATE TABLE tblDiscussionReply (                                      
    seq NUMBER PRIMARY KEY,                                                
    discussionBoard_seq NUMBER NOT NULL,                                   
    member_seq NUMBER NOT NULL,                                            
    reply VARCHAR2(1000) NOT NULL,                                         
    commitDate DATE NOT NULL,                      
    likes NUMBER DEFAULT 0 NULL,
    FOREIGN KEY (discussionBoard_seq) REFERENCES tblDiscussionBoard(seq),  
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq)                     
);                                                                     


CREATE SEQUENCE discussionReply_seq;

CREATE TABLE tblBookReview (                          
    seq NUMBER(10) PRIMARY KEY,                           
    book_seq NUMBER(14) NOT NULL,                         
    commend VARCHAR2(1000) NOT NULL,                      
    member_seq NUMBER NOT NULL,                           
    review_date DATE DEFAULT sysdate NOT NULL,            
    FOREIGN KEY (book_seq) REFERENCES tblBook(seq),       
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq)    
);                                

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

CREATE SEQUENCE rank_seq;

CREATE TABLE tblPreference (                           
    seq NUMBER PRIMARY KEY,                                
    member_seq NUMBER NOT NULL,                            
    subGenre_seq NUMBER NOT NULL,                          
    targetRead NUMBER NOT NULL,                            
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq),    
    FOREIGN KEY (subGenre_seq) REFERENCES tblSubGenre(seq) 
);           

CREATE SEQUENCE preference_seq;

CREATE TABLE tblWordList (          
    target_code NUMBER PRIMARY KEY,     
    word VARCHAR(200) NOT NULL,         
    pos VARCHAR(200) NOT NULL,          
    definition VARCHAR2(1000) NOT NULL  
);           

CREATE TABLE tblQuoteList (     
    seq NUMBER PRIMARY KEY,         
    quote VARCHAR2(4000) NOT NULL,  
    author VARCHAR2(1000) NOT NULL,
    authorPic VARCHAR2(300) NULL
);                        


CREATE SEQUENCE quote_seq;


CREATE TABLE tblBookMark (                                           
    seq NUMBER PRIMARY KEY,                                                
    book_seq NUMBER NOT NULL,  
    member_seq NUMBER NOT NULL,
    famousline VARCHAR2(4000) NOT NULL,                                    
    CONSTRAINT fk_book_seq FOREIGN KEY (book_seq) REFERENCES tblBook(seq),
    CONSTRAINT fk_member_seq FOREIGN KEY (member_seq) REFERENCES tblMember(seq) 
);                                                                     








