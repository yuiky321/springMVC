-- member(회원) table
create table tb_board(
 idx int primary key auto_increment,
 title varchar(20) not null,
 contents varchar(4000) not null, 
 count int,
 writer varchar(30) not null,
 indate datetime default now() not null
);
-- SQL(CRUD), JDBC
-- 검색
select * from tb_board;

-- insert(저장)
insert into tb_board(title, contents, count, writer)
values('게시판만들기','게시판만들기', 0,'admin');

-- update(수정)
update tb_board set title='9999', contents='tttt' where idx=1;

-- delete(삭제)
delete from member where id='admin';

drop table member;

select * from member where num=2;

alter table member drop column file;

alter table member add  filename varchar(100);