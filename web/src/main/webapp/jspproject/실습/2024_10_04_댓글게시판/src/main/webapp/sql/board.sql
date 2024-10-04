create table model2board(
 board_num number primary key,
 board_name varchar2(20),
 board_pass varchar2(15),
 board_subject varchar2(50),
 board_content varchar2(2000),
 board_re_ref number,                       
board_re_lev number,
 board_re_seq number,                      
board_readcount number,
 board_date timestamp );
 
 create sequence model2board_seq
 start with 1
 increment by 1
 nocache;
 
 select * from MODEL2BOARD;
 select * from seq;