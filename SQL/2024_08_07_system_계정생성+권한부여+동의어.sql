--2024.08.07(수)

-- 데이터베이스 보안을 위한 권한
--1. 시스템 권한
--2. 객체 권한

-- 시스템 권한 : 데이터베이스 관리자(DBA)가 가지고 있는 권한.
-- ex) create user, drop user..

-- 시스템 관리자(DBA)가 일반 사용자에게 부여해야 되는 시스템 권한
--ex) create session : 데이터베이스 접속 권한
--    create table : 테이블을 생성할 수 있는 권한
--    create view : 뷰를 생성할 수 있는 권한
--    create sequence : 시퀀스를 생성할 수 있는 권한
--    create procedure : 프로시저를 생성할 수 있는 권한

-- 새로운 계정 생성 : user01 / tiger
create user user01 identified by tiger;

-- 생성된 계정 목록 확인
select * from dba_users;

-- user01 계정에게 데이터베이스 접속 권한을 부여 : create session권한
grant create session to user01;
grant create session, create table to user01;

-- with admin option
--: grant 명령으로 권한을 부여 받을때 with admin option을 붙여서 권한이
--  부여되면, 권한을 부여받은 계정은 자기가 부여받은 권한을 제 3의 계정에게
--  재부여할 수 있다.

--1. 새로운 계정 생성 : user02 / tiger
create user user02 identified by tiger;

--2. 데이터베이스 접속 권한 부여 : create session
grant create session to user02 with admin option;

--3. 제 3의 계정 생성 : user03 / tiger
create user user03 identified by tiger;

--4. user01 계정으로 접속후 user03 계정에게 create session 권한을 부여해보자?
SQL> conn user01/tiger
SQL> grant create session to user03;    --오류발생

--5. user02 계정으로 접속후 user03 계정에게 create session 권한을 부여해보자?
SQL> conn user02/tiger
SQL> grant create session to user03; --create session 권한이 부여된다.

--6. user03 계정은  user02 계정으로 부터 create session 권한을 부여 받았기
--   때문에 데이터베이스 접속이 가능하다.
SQL> conn user03/tiger
SQL> show user
SQL> USER is "USER03"
------------------------------------------------------------------------
-- 롤(ROLE) : 여러가지 권한을 묶어 놓은것.

-- 오라클에서 기본적으로 제공되는 롤
-- ex) connect롤(8가지 권한), resource롤(20여개의 권한), dba롤(130여개의 권한)

--1. 새로운 계정 생성 : user04 / tiger
create user user04 identified by tiger;

--2. 생성된 계정 목록 확인
select * from dba_users;

--3. user04 계정에서  role을 부여 : connect, resource 2개의 롤을 부여함
grant connect, resource to user04;

--4. user04 계정으로 접속후 테이블을 생성 해보자?
conn user04/tiger
create table member(id varchar2(20), passwd varchar2(20));
------------------------------------------------------------------------
-- 사용자 정의 롤 생성 : 롤에 시스템 권한
--1.롤 생성
create role mrole;

--2. 생성된 롤에 시스템 권한을 추가한다.
grant create session, create table, create view to mrole;

--3. mrole을 적용하기 위한 계정 생성 : user05 / tiger
create user user05 identified by tiger;

--4. user05 계정에게 mrole을 부여한다.
grant mrole to user05;

--5. user05 계정으로 접속 해보자?
sqlplus user05/tiger
conn user05/tiger
---------------------------------------------------------------
-- 사용자 정의 롤 생성 : 롤에 객체권한을 부여
--1. 롤 생성
conn system/oracle
create role mrole02;

--2. 생성된 롤에 객체 권한을 부여한다.
conn scott/tiger
grant select on emp to mrole02;

--3. user05 계정에게 mrole02를 부여한다.
conn system/oracle
grant mrole02 to user05;

--4. user05 계정으로 접속 후에 검색을 해보자?
conn user05/tiger
select * from scott.emp;
-----------------------------------------------------------------
-- 롤 회수 : 특정 계정에게 부여된 롤을 취소 하는것.
-- 형식 : revoke  롤이름   from  사용자명;

--Q. user05 계정에게 부여된 mrole과  mrole02를 회수 해보자?
conn system/oracle
revoke mrole from user05;
revoke mrole02 from user05;

-- 롤 삭제 
-- 형식 : drop role  롤이름;
conn system/oracle
drop  role mrole;
drop role mrole02;
--------------------------------------------------------------------
-- 디폴트 롤을 생성해서 여러 사용자에게 롤 부여하기
-- 디폴트 롤 = 시스템 권한 + 객체 권한

--1. 디폴트 롤 생성
conn system/oracle
create role def_role;

--2. 생성된 롤(def_role)에 시스템 권한 추가
conn system/oracle
grant create session, create table to def_role;

--3. 생성된 롤(def_role)에 객체 권한 추가
conn scott/tiger
grant select on emp to def_role;
grant update on emp to def_role;
grant delete on emp to def_role;

--4. def_role을 적용하기 위한 계정생성
conn system/oracle
create user usera1 identified by tiger;
create user usera2 identified by tiger;
create user usera3 identified by tiger;

--5. def_role을 생성된 계정에게 부여하기
conn system/oracle
grant def_role to usera1;
grant def_role to usera2;
grant def_role to usera3;

--6. usera1 계정으로 접속후에 검색을 해보자?
conn usera1/tiger
conn usera2/tiger
conn usera3/tiger

select * from scott.emp;        -- 검색 가능함.

--------------------------------------------------------------------
-- 동의어(synonym) : 같은 의미를 가진 단어.
--1. 비공개 동의어
--   : 객체에 대한 접근 권한을 부여받은 사용자가 정의한 동의어로써 동의어를 
--     만든 사용자만 사용할 수 있다.

--2. 공개 동의어
--   : DBA 권한을 가진 사용자만 생성할 수 있고, 누구나 사용할 수 있다.

-- 공개 동의어의 예
-- sys.tab     --->  tab         select * from tab;
-- sys.seq     --->  seq         select * from seq;
-- sys.dual    --->  dual        select 10+20 from dual;
-------------------------------------------------------------------------
-- 비공개 동의어 예
--1. system 계정으로 접속후 테이블 생성
conn system/oracle
create table systbl(ename varchar2(20));

--2. 생성된 테이블에 데이터 추가
conn system/oracle
insert into systbl values('홍길동');
insert into systbl values('안화수');

select * from systbl;

--3. scott 계정에게 systbl 테이블에 대한  select 객체 권한을 부여한다.
conn  system/oracle
grant select on systbl to scott;

--4. scott 계정으로 접속후에 검색을 해보자?
conn scott/tiger
select * from systbl;          -- 오류발생    
select * from system.systbl;   -- 정상적인 검색 가능함.

--5. scott 계정에게 동의어를 생성할 수 있는 권한을 부여한다.
conn system/oracle
grant create synonym to scott;

--6. scott 계정으로 접속후에 비공개 동의어 생성
--   system.systbl   --->  systbl
conn scott/tiger
create synonym systbl  for system.systbl;

--7. 동의어 목록
conn scott/tiger
select * from user_synonyms;

--8. 동의어를 이용해서 검색을 해보자?
conn scott/tiger
select * from system.systbl;
select * from systbl;          -- 비공개 동의어로 검색 가능함.

--9. 비공개 동의어 삭제
-- 형식 : drop synonym synonym_name;
drop synonym systbl;

select * from user_synonyms;

-- 공개 동의어
--1. DBA 계정으로 접속해서 공개 동의어를 생성할 수 있다.
--2. 공개 동의어를 만들때는 public을 붙여서 생성할 수 있다.

--공개 동의어 생성
conn system/oracle
create public synonym pubdept for scott.dept;

-- 공개 동의어 목록
conn system/oracle
select * from dba_synonyms;

-- 공개 동의어 삭제
conn system/oracle
drop public synonym pubdept;





