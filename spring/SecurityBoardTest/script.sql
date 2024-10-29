-- SecurityBoardTest > script.sql

create table Board (
    seq number primary key,
    subject varchar2(500) not null,
    content varchar2(2000) not null,
    regdate date default sysdate not null,
    memberid varchar2(50) not null references Member(memberid)
);

create sequence seqBoard;

insert into Board(seq, subject, content, regdate, memberid)
    values (seqBoard.nextVal, '게시판입니다.', '내용입니다.', default, 'dog');
insert into Board(seq, subject, content, regdate, memberid) 
    values (seqBoard.nextVal, 'd', d, default, dog) 

select * from Board;

commit;