--데이터 베이스 목록
show databases;
--테이블 목록
show tables;
--테이블 컬럼 속성
describe board;

select * from board;

create table  customer(
	no int(4) auto_increment primary key,
	name varchar(20),
	email varchar(20),
	tel varchar(20),
	address varchar(50),
	reg_date timestamp);
	
create table  board(
	no int(4) auto_increment primary key,
	writer varchar(20) unique not NULL,
	passwd varchar(20) not NULL,
	subject varchar(100) not null,
	content varchar(1000) not null,
	reg_date timestamp);
	
	
commit;


drop table board;