create table reboard( num number  primary key,
 writer varchar2(20) not null,
 email varchar2(30),
 subject varchar2(50) not null,
 passwd varchar2(20) not null,
 reg_date timestamp not null,
 readcount number default 0,
 ref number not null,
 re_step number not null,
 re_level number not null,
 content varchar2(2000) not null,
 ip varchar2(20) not null );
 
 create table reply(
 	reply_num number primary key,
 	writer varchar2(20) not null,
 	content varchar2(2000) not null,
 	reg_date timestamp not null,
 	ref number not null references reboard(num),
 	re_step number not null,
 	re_level number not null,
 	ip varchar2(20) not null
 )
 
  create  sequence  reboard_seq
 start with 1
 increment by 1
 nocache;

 create  sequence  reply_seq
 start with 1
 increment by 1
 nocache;
 
 select * from REBOARD;
 
 select * from (select rownum as rnum, board.*  from (select* from reboard order by ref desc, re_step asc) board) where rnum between 1 and 10;
 
 delete from reboard where re_step>0;
 delete from reboard;
 
 select * from seq; 