create table customer(
	no number(4) primary key,
	name varchar2(20),
	email varchar2(20),
	tel varchar2(20)
);
alter table customer add(address varchar2(50));
alter table customer add(reg_data timestamp);

select * from customer;

--시퀀스 생성 ->시퀀스: 번호(no)를 1부터 1씩 자동으로 증가 시켜서 처리해주는 역할
create sequence customer_no_seq
		start with 1
		increment by 1;

--시퀀스 목록 확인
select * from seq;		
		
--테이블 목록확인
select * from tab;

--시퀀스 다음값 구해오기
select customer_no_seq.nextval from dual

--실습2
create table board(
		no number primary key,
		writer varchar2(20) not null,
		passwd varchar2(20) not null,
		subject varchar2(20) not null,
		content varchar2(1000) not null,
		reg_date timestamp);
		
create sequence board_seq
start with 1
increment by 1;

select * from board;

select no,passwd from board where writer ='홍길동';
