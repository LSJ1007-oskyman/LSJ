--일반 게시판

select * from tab;


insert into board values(board_seq.nextval,'홍길동','test@naver.com','게시판 연습','1234',sysdate,0,'게시판 내용','222.183.0.1')

select count(*) from board;

create table board( 
	num number primary key,
 	writer varchar2(20) not null,
 	email varchar2(30),
 	subject varchar2(50) not null,
 	passwd varchar2(20) not null,
 	reg_date timestamp not null,
 	readcount number default 0,
 	content varchar2(2000) not null,
 	ip varchar2(20) not null );
 
create sequence  board_seq
  	start with 1
 	increment by 1
 	nocache;

select * from board;
commit;