select now();

select sysdate from dual; --오라클 전용 함수!!!!!!!

create user 'springboot'@'localhost' identified by 'java1234';
grant all privileges on *.* to 'springboot'@'localhost' with grant option;
flush privileges;


create table member (
    id bigint not null auto_increment,
    name varchar(50),
    age integer,
    primary key(id)
);

insert into member (name, age) value ('홍길동', 20);

select * from member;

commit;








