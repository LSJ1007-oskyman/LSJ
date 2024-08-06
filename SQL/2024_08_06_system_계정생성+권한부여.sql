--2024.08.06(화)

--데이터 베이스 보안을 위한 권한
--1. 시스템 권한
--2. 객체 권한

--시스템 권한 : 데이터베이스 관리자가(DBA)가 가지고 있는 권한.
-- ex)create user, drop user..


--시스템관리자가(DBA)가 일반 사용자에게 부여해야 되는 시스템권한
--ex) create session : 데이터베이스 접속권한
-- create table : 테이블을 생성할 수 있는 권한
-- create view : 뷰를 생성할 수 있는 권한
-- create sequence : 시퀀스를 생성할 수 있는 권한
-- create procedure : 프로지서를 생성할 수 있는 권한

-- 새로운 계정 생성 : user01 / tiger
create user user01 IDENTIFIED by tiger;

--생성된 계정 목록 확인
select * from dba_users;

-- user01 계정에게 데이터베이스 접속 권한을 부여 : create session
grant create session to user01;