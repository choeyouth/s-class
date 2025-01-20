CREATE DATABASE db_codingrecipe
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_sys_configci;

CREATE USER 'user_codingrecipe'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON db_codingrecipe.* TO 'user_codingrecipe'@'localhost';
FLUSH PRIVILEGES;

SELECT User, Host FROM mysql.user WHERE User = 'user_codingrecipe';
SHOW GRANTS FOR 'user_codingrecipe'@'localhost';
USE db_codingrecipe;

ALTER USER 'user_codingrecipe'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON db_codingrecipe.* TO 'user_codingrecipe'@'localhost';
FLUSH PRIVILEGES;

-- board_table
 drop table if exists board_table;
 create table board_table
 (
	id bigint primary key auto_increment,
    boardTitle varchar(50),
    boardWriter varchar(20),
    boardPass varchar(20),
    boardContents varchar(500),
    boardHits int default 0,
    createdAt datetime default now(), 
    fileAttached int default 0
);
-- board_file_table
drop table if exists board_file_table;
create table board_file_table
(
    id	bigint auto_increment primary key,
    originalFileName varchar(100),
    storedFileName varchar(100),
    boardId bigint,
    constraint fk_board_file foreign key(boardId) references board_table(id) on delete cascade
);


select * from board_table;