-- member(회원) table
create table tb_board(
 idx int primary key auto_increment,  -->>auto_increment오라클 안됨
 title varchar(20) not null,
 contents varchar(4000) not null, 
 count int,
 writer varchar(30) not null,
 indate date default now() not null -->>오라클 datatine 안됨 now()안됨
);

CREATE SEQUENCE idx_seq 
START WITH 1 INCREMENT 
BY 1 MAXVALUE 100 CYCLE NOCACHE;
-- SQL(CRUD), JDBC
-- 검색
select * from tb_board;

-- insert(저장)
insert into tb_board(idx, title, contents, count, writer)
values(idx_seq.NEXTVAL,'게시판만들기2','게시판만들기2', 0,'admin2');

-- update(수정)
update tb_board set title='9999', contents='tttt' where idx=1;

-- delete(삭제)
delete from member where id='admin';

drop table member;

select * from member where num=2;

alter table member drop column file;

alter table member add  filename varchar(100);