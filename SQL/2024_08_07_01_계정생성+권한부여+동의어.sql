--2024.08.07(수)

--과제.
--      사원테이블(EMP)에서 급여를 3~5번째로 많이 받는 사원을
--      출력하는 SQL문을 작성 하세요?

-- 급여를 3 ~ 5번째 많이 받는 사원 검색?
select rownum, ename, sal from (
    select * from emp order by sal desc)
where rownum >= 3 and rownum <=5;           -- 검색 안됨

select rownum, ename, sal from ( 
    select rownum rnum, ename, sal from (   -- rownum 컬럼에 별칭 부여  
    select * from emp order by sal desc) )
where rnum >=3 and rnum <=5;    

-- 컬럼명을 간결하게 처리
select rnum, ename, sal, hiredate from (
    select rownum rnum, board.* from(
    select * from emp order by sal desc)  board) --서브쿼리에 별칭 부여
where rnum>=3 and rnum <= 5;
----------------------------------------------------------------------
-- 객체 권한
-- 오라클의 객체 : 테이블, 뷰, 시퀀스, 인덱스, 동의어, 프로시저, 트리거

--1. 새로 생성된 user01 계정에게 scott 계정 소유의 EMP테이블 객체에 대한
--   SELECT 객체 권한을 부여해보자?
conn scott/tiger
grant select on emp to user01;

--2. user01 계정으로 접속후 EMP 테이블 객체에 대해서 select를 실행 해보자?
conn user01/tiger
select * from emp;          -- 오류발생
select * from scott.emp;    -- 검색 가능함

--3. 객체 권한 취소
revoke select on emp from user01;

-- 객체 권한이 취소 되었기 때문에 오류발생
conn user01/tiger
select * from scott.emp;    -- 오류발생

-- with grant option
-- : user02 계정에게 scott 계정 소유의 EMP 테이블 객체에 대해서 SELECT객체
--   부여할때 with grant option을 붙여서 권한이 부여되면, user02계정은
--   자기가 부여받은 객체 권한을 제 3의 계정(user01)에게 재부여할 수 있다.
--1. user02 계정에게 scott계정 소유의 EMP 테이블 객체에 대한 SELECT객체권한을
--   부여해보자?
conn scott/tiger
grant select on emp to user02 with grant option;

--2. user02 계정으로 접속후, user01 계정에게 자기가 부여받은 객체권한을 
--   재부여 해보자?
conn user02/tiger
select * from scott.emp;            -- 검색 가능함

grant select on scott.emp to user01;

--3. user01 계정으로 접속후 검색을 해보자?
conn user01/tiger
select * from scott.emp;           -- 검색 가능함
-------------------------------------------------------------------------
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
conn system/oracle
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
create synonym systbl for system.systbl;

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









