--2024.08.02(금)

--과제.
--       Q1. 직급이 MANAGER인 사원의 이름, 부서명을 출력하는 SQL문을
--             작성 하세요? (JOIN을 사용하여 처리)
--   
--       Q2. 매니저가 KING 인 사원들의 이름과 직급을 출력하는 SQL문 작성?
--
--       Q3. SCOTT과 동일한 근무지에서 근무하는 사원의 이름을 출력하는 SQL문 작성?

--Ans 1.

select ename, dname 
from emp, dept 
where emp.deptno=dept.deptno  and  job='MANAGER'; 

select ename, dname 
from emp inner join dept on emp.deptno=dept.deptno  
where  job='MANAGER'; 

select ename, dname 
from emp inner join dept using(deptno)  
where  job='MANAGER'; 

select ename, dname 
from emp natural join dept 
where job='MANAGER'; 

--Ans 2.
select employee.ename, employee.job 
from emp employee, emp manager
where employee.mgr=manager.empno and manager.ename='KING';

select ename, job 
from emp 
where mgr = (select empno from emp where ename='KING');

--Ans 3.
select deptno, ename 
from emp 
where deptno = (select deptno from emp where ename = 'SCOTT'); 


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--DDL(Data Definition Language):데이터 정의어
-- create : 데이터 생성
-- alter : 테이블 구조 수정
-- rename : 테이블 이름 수정
-- drop : 테이블 삭제
-- truncate : 데이터 삭제

--테이블 목록 
select * from tab;
select * from user_tables;

-- 1.create
--  :데이터베이스 생성, 테이블 생성
-- 형식 : create table 테이블명 ( 컬럼명1 데이터타입1,
--                              컬럼명2 데이터타입2,
--                              컬럼명N 데이터타입N);

--오라클의 데이터 타입
--1) 숫자 데이터
--  number(n) : 정수 n자리 까지 저장
--  number(n1,n2) : n1:전체 자리수, n2:소수점 이하에 할당된 자리수

--2) 문자 데이터
--  char() : 고정길이 문자형
--           최대 2000byte 까지 저장 가능
--  varchar2() : 가변길이 문자형
--               최대 4000byte까지 저장 가능
--  long : 2GB 까지 저장 가능
--         long형으로 설정된 컬럼은 검색기능을 지원하지 않는다.
--3) 날짜형 데이터
-- date : 연, 월, 일 정보 저장
-- timestamp : 연, 월, 일, 시, 분, 초 정보 저장

-- 테이블 생성
-- 1)직접 테이블 생성
create table emp01(
    empno number(4),
    ename varchar2(20),
    sal number(7,2));
    
select * from tab;

-- 2)서브쿼리로 테이블 생성
-- 복사본 테이블이 생성된다.
-- 단, 제약조건은 복사가 되지 않는다.

-- 복사본 테이블 생성
create table emp02 as select * from emp;

-- 원하는 컬럼으로 구성된 복사본 테이블
create table emp03 as select empno,ename from emp;
select * from emp03;

-- 원하는 행(row,데이터)으로 구성된 복사본 테이블
create table emp04 as select * from emp where deptno =10;
select * from emp04;

-- 테이블 구조만 복사
create table emp05 as select * from emp where 1=0;
select *from emp05;

--2. alter
--   : 테이블 구조 변경 (컬럼 추가, 컬럼수정,컬럼삭제)

--1)컬럼 추가
alter table emp01 add(job varchar2(10));
desc emp01;

--2)컬럼 수정
--      1.수정할 컬럼에 데이터가 없는 경우
--        컬럼의 데이터 타입을 변경할 수 있다.
--        컬럼의 크기를 변경할 수 있다.
--      2.수정할 컬럼에 데이터가 있는 경우
--        컬럼의 데이터 타입을 변경할 수 없다.
--        컬럼의 크기를 늘릴수는 있지만, 현재 저장된 테이터 크기보다 작은 크기로 변경할 수 없다.

--emp01 테이블의 job 컬럼의 크기를 10에서 30으로 수정해보자?
alter table emp01 modify ( job varchar2(30));
desc emp01;

--3)컬럼 삭제
alter table emp01 drop  column job;
alter table emp01 drop (job);
desc emp01;

--3. rename
-- : 테이블 이름 변경
-- 형식 : rename old_name to new_name;

--Q. emp01 테이블을 test 테이블명으로 이름을 변경 해보자?
rename emp01 to test;
select * from tab;

--4.truncate
--  :테이블의 모든 데이터 삭제
-- 형식 : truncate table table_name
truncate table EMP02;
select * from emp02;

--5. drop
-- : 테이블 삭제
-- 형식 : drop table table_name; (Oracle 10g부터는 임시 테이블로 교체)
--       drop talbe table_name purge;
-- 임시 테이블 삭제
purge recyclebin;

--Q. test 테이블 삭제해보자?
drop table dept02 purge;
select * from tab;

-------------------------------------------------------------------------------------------------------------------------

--* 오라클의 객체
--  테이블, 뷰, 시퀀스, 인덱스, 동의어, 프로시저, 트리거
--
--
--* 데이터 딕셔너리와 데이터 딕셔너리 뷰
--  데이터 딕셔너리를 통해서 접근가능함
--
--  - 데이터 딕셔너리 뷰 : user_xxxx
--     (가상 테이블)         all_xxxx
--		      dba_xxxx
--
--  - 데이터 딕셔너리(시스템 테이블) : 

select * from tab;
select table_name from user_tables; --(테이블)

select * from user_views; --(뷰)

select * from seq;
select * from user_sequences; --(시퀀스)

select * from user_indexes; --(인덱스)

select * from user_synonyms; --(동의어)

select * from user_source; --(프로시저)

select * from user_triggers; --(트리거)

select table_name from all_tables;

select table_name from dba_tables; --(DBA 계정만 사용가능)
 
select username from dba_users; --(DBA 계정만 사용가능)

-------------------------------------------------------------------------------------------------------------------------

--DML ( Data Manipulation Language, 데이터 조작어)
-- insert, update, delete

--1. insert : 데이터 입력
-- 형식 : insert into 테이블(컬럼1, 컬럼2, ....) values(데이터1, 데이터2 ....);
-- 형식2 : insert into 테이블 values(데이터1, 데이터2 ....);

--[실습]
--비어있는 dept01복사본 테이블 생성 - 테이블 구조만 복사
create table dept01 as select * from dept where 1=0;
select * from dept01; 

insert into dept01(deptno, dname, loc) values(10,'ACCOUNTING','NEW YORK');
insert into dept01 values(20,'RESEARCH','DALLAS');
insert into dept01 values(30,'영업부','서울');

--null값 입력
insert into dept01(deptno, dname) values(40,'개발부'); --locl컬럼 NULL
insert into dept01 values(50,'기획부',NULL); --locl컬럼 NULL

--2) 서브쿼리로 데이터 입력
--dept02 테이블 생성 : 테이블 구조만 복사
create table dept02 as select * from dept where 1=0;
select * from dept02; 

--서브쿼리로 데이터 입력
insert into dept02 select * from dept;
select * from dept02;

--3)insert all 명령문으로 다중 테이블에 데이터 입력
-- 2개의 테이블 생성
create table emp_hir as select empno, ename, hiredate from emp where 1=0;
create table emp_mgr as select empno, ename, mgr from emp where 1=0;

--insert all 명령문으로 2개의 테이블에 데이터 입력
insert all 
    into emp_hir values(empno,ename,hiredate)
    into emp_mgr values(empno,ename,mgr)
    select empno, ename,hiredate, mgr from emp where deptno=20;

select * from emp_hir;
select * from emp_mgr;

--2. update : 데이터 수정
-- 형식 : update 테이블 set 컬럼1 = 수정할 값1,
--                        컬럼2 = 수정할 값2,
--                        where 조건절;

--[실습]
--복사본 테이블 생성
create table emp01 as select * from emp;
select * from emp01;

--1) 모든 데이터 수정 : where조건절을 사용하지 않음
-- Q1. 모든 사원들의 부서번호를 30번으로 수정
update emp01 set deptno = 30;

--Q2. 모든 사원들의 급여를 10% 인상?
update emp01 set sal = sal *1.1;

--Q3. 모든 사원들의 입사일을 오늘 날짜로 수정?
update emp01 set hiredate = sysdate;

--2) 특정 데이터 수정 : where조건절을 사용해서 수정
--복사본 테이블 생성
create table emp02 as select * from emp;
select * from emp02;

--Q1.급여가 3000이상인 사원만 급여를 10% 인상?
update emp02 set sal = sal*1.1 where sal>=3000;

--Q2.1987년도에 입사한 사원만 입사일을 오늘 날짜로 수정?
update emp02 set hiredate = sysdate where substr(hiredate, 1, 2) = '87';
update emp02 set hiredate = sysdate where to_char(hiredate,'YYYY') = '1987';

--Q3. SCOTT사원의 입사일을 오늘 날짜로 수정하고, 급여를 50으로 comm을 4000으로 수정
update emp02 set hiredate =sysdate, sal = 50, comm=4000 where ename = 'SCOTT';

--3)서브쿼리를 이용한 데이터 수정
--Q.20번 부서의 지역명(DALLAS)을 40번 부서의 지역명(BOSTON)으로 수정
drop table dept01 purge;

create table dept01 as select * from dept;
select * from dept01;

update dept01 set loc = (select loc from dept01 where deptno =40) where deptno = 20;

--3.DELETE : 데이터 삭제
--  형식 : delete from 테이블명 where 조건절;

--1) 모든 데이터 삭제 : where조건절을 사용하지 않는다.
select * from dept01;
delete from dept01; --모든 데이터 삭제
rollback;--트랜잭션 취소

--2) 조건절을 만족하는 데이터 삭제
--Q.dept01 테이블의 30번 부서만 삭제
delete from dept01 where deptno = 30;

--3) 서브쿼리를 이용한 데이터 삭제
--Q. 사원테이블(emp02)에서 부서명이 SALES부서의 사원을 삭제
drop table emp02 purge;
create table emp02 as select * from emp;
select * from emp02;
delete from emp02 where deptno = (select deptno from dept where dname = 'SALES');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--* 테이블 구조가 동일한 두 테이블의 MERGE 연습
--
--  MERGE : 구조가 같은 2개의 테이블을 하나의 테이블로 합치는 기능.
--  MERGE명령을 수행할때 기존에 존재하는 행(ROW)이 있으면 새로운     
--  값으로 UPDATE되고, 존재하지 않으면 새로운 행(ROW)으로 추가된다.


--1. 
create table emp01 as select * from emp;

select * from emp01;

--2. 
create table emp02 as select * from emp where job='MANAGER';
select * from emp02;

--3. 
update emp02 set job='Test';

--4. 
insert into emp02 values(8000, 'ahn', 'top', 7566, '2024/02/09',1200, 10, 20);

--5. 
select * from emp02; --(확인)

--6. 
merge into emp01
using emp02
on(emp01.empno = emp02.empno)
when matched then
    update set emp01.ename = emp02.ename,
			emp01.job = emp02.job,
			emp01.mgr = emp02.mgr,
			emp01.hiredate = emp02.hiredate,
			emp01.sal = emp02.sal,
			emp01.comm = emp02.comm,
			emp01.deptno = emp02.deptno
	when not matched then
	     insert values(emp02.empno, emp02.ename, emp02.job, 		         	         
		          emp02.mgr,emp02.hiredate, 
		         emp02.sal, emp02.comm,emp02.deptno);

--7. 
select * from emp01; --(합병된 결과 확인)
