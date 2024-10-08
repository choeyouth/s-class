create user project identified by java1234;

grant connect, resource, dba to project;

commit;

select * from tabs;

select * from tblSubGenre;
select count(*) from tblSubGenre;

select * from tblManager;
select * from tblMemberInfo;
select * from tblBook where name = '메밀꽃 필 무렵 - 이효석 단편선';
select count(*) from tblBook;
select count(*) from tblBook where subgenre_seq = 9863;
delete from tblBook where name = '메밀꽃 필 무렵 - 이효석 단편선';

commit;
rollback;

SELECT db.seq AS seq, db.title AS title, db.content AS content, 
       db.postdate AS postdate, b.name AS bookTitle, b.author AS author,
       dr.reply AS reply, m.id
    FROM tblDiscussionBoard db 
    JOIN tblBook b ON b.seq = db.book_seq
    JOIN tblDiscussionReply dr ON db.seq = dr.discussionBoard_seq
    JOIN tblMember m ON db.member_seq = m.seq;
    
commit;    
select * from tblDiscussionReply;
select * from tbldiscussionboard;

SELECT distinct seq, title, bookTitle FROM vwDiscussion ORDER BY seq DESC;

select * from tblBookReview;
select * from tblRank;
select * from tblNote;

select * from tblFamousLine;

select * from tblBook;
 
drop view vwDiscussion;
SELECT * FROM vwDiscussionBoard WHERE seq = 1;
commit;
 
Create or replace VIEW vwDiscussionBoard
as
SELECT d.seq, d.title, d.content, d.postdate, d.bookTitle, d.author, d.reply, d.id AS postId, m.id AS replyId, d.commitDate
FROM vwDiscussion d
JOIN tblMember m ON d.replyMember_seq = m.seq;
 
--// 문장 보관함 없음, 선호도 없음

select * from tblMember;
select * from vwDiscussionBoard;