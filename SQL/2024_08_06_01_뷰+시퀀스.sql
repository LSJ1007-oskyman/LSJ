--2024_08_06_01

-- 뷰의 종류
-- 단순뷰 : 하나의 기본 테이블로 생성된 뷰
-- 복합뷰 : 여러개의 기본 테이블로 생성된 뷰

-- 1. 단순뷰
-- Q. 기본 테이블인 emp_copy를 이용해서 20번 부서에 소속된 사원들의 사번과 이름,부서번호,직속상사의 사원번호를 출력하기 위한 뷰(emp_view20)를 생성

create view emp_view20
as
select  empno , ename,deptno,mgr from emp_copy where deptno =20;

--뷰 확인
select * from tab;
select * from user_views;

select * from emp_view20;

--2. 복합뷰
--Q. 각 부서별(부서명) 최대급여와 최소급여를 출력하는 뷰를 sal_view라는 이름으로 작성하세요
create view sal_view
as
select dname as 부서명, max(sal) as 최대급여,min(sal)최소급여 from dept_copy inner join emp_copy using (deptno) group by dname;

--뷰 확인
select * from tab;
select * from user_views;

--뷰 데이터 확인
select *  from emp_view30;

--뷰삭제
-- 형식 :  drop view 뷰이름;
drop view emp_view30;

-- 뷰를 생성할때 사용되는 옵션
--1. or replace옵션
-- 기존에 뷰가 존재하지 않으면 뷰를 생성하고, 만약 동일한 이름을 가진 뷰가 존재하면 뷰의 내용을 수정 하도록 만들어 주는 옵션

--1) or replace 옵션없이 동일한 뷰(emp_view30)를 생성:오류 발생
create view emp_view30
as
select empno,ename, deptno,sal,comm from emp_copy where deptno = 30;

--2) or replace 옵션을 붙여서 동일한 뷰(emp_view30)를 생성: 뷰의 내용 수정
create or replace view emp_view30
as
select empno,ename, deptno,sal,comm from emp_copy where deptno = 30;

--3) 뷰 확인
select * from emp_view30;

-- 2. with check option
-- : where 조건절에 사용된 값을 수정하지 못하도록 만들어 주는 옵션
--1) with check option 사용하지 않은 경우
create or replace view emp_view30
as
select empno,ename, deptno,sal,comm from emp_copy where deptno = 30;

--Q. emp_view30 뷰에서 급여가 1200이상인 사원들의 부서번호를 30번에서 20번으로 수정
update emp_view30 set deptno=20 where sal>=1200; --데이터 수정
select * from emp_view30;


--2) with check option을 사용해서 뷰생성
create or replace view emp_view30
as
select empno,ename, deptno,sal,comm from emp_copy where deptno = 30 with check option;

--Q. emp_view30 뷰에서 급여가 1200이상인 사원들의 부서번호를 30번에서 20번으로 수정
update emp_view30 set deptno =20  where sal>=1200;

--3. with read only 옵션
-- : 읽기 전용의 뷰를 만들어 주는 옵션
-- 뷰를 통해서 기본 테이블의 내용을 수정하지 못하도록 만들어 주는 역할

create or replace view view_read30
as 
select empno,ename, sal, comm, deptno from emp_copy where deptno=30 with read only;

select * from user_views;
select * from view_read30;

--Q. 생성된 뷰(view_read30)를 수정해보자
update view_read30 set sal = 3000; --read only라 수정 안됌
--------------------------------------------------------------------------------------------------------------------------------------------------------

--rownum컬럼
--1. 데이터의 검색 순서를 가지고 있는 논리적인 컬럼이다.
--2. rownum값은 1번부터 시작된다.
--3. rownum 값은 order by절로 정렬 하더라도 값이 바뀌지 않는다.
--4. rownum 값을 변경하기 위해서는 테이블을 변경해야한다.

select rownum , rowid, deptno dname, loc from dept;
select rownum, ename, sal from emp;
select rownum, ename from emp where ename = 'SCOTT';

--1 SCOTT

select rownum, ename, sal from emp;
--order by절로 정렬해도 rownum값은 바뀌지 않는다.
select rownum, ename, sal from emp order by sal desc;

--Q1. 사원테이블에서 입사일이 빠른 사원 5명을 구해보자?
--1)입사일이 빠른 사원순으로 정렬 (입사일을 기준으로 오름차순 정렬)
select empno,ename, hiredate from emp order by hiredate asc;

--2) 뷰생성
create or replace view hire_view
as
select empno, ename, hiredate from emp order by hiredate asc;

--3) 입사일이 빠른 사원 5명 출력
select rownum, ename,hiredate from hire_view;

select rownum, ename, hiredate from hire_view where rownum<=5;

--4) 인라인 뷰(서브쿼리로 만들어진 뷰)
-- 입사일이 빠른 사원 5명을 검색
select rownum, ename, hiredate from (select ename,hiredate from emp order by hiredate asc) where rownum<=5;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q2. 사원테이블에서 사원번호(empno)가 빠른 사원5명검색
--1) 사원번호가 빠른 사원순으로 정렬
select empno, ename from emp order by empno asc;

--2) 뷰생성 
create or replace view emp_view
as 
select empno, ename from emp order by empno asc;

--3) 사원번호가 빠른 사원 5명 출력
select rownum, empno, ename from emp_view;

select rownum, empno, ename from emp_view where rownum <=5;

--4) 인라인 뷰
-- 사원번호가 빠른 사원 5명 검색?
select rownum,empno, ename from (select empno,ename from emp order by empno asc) where rownum <=5;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--Q3. 사원테이블에서 급여를 많이 받는 사원 5명 검색?
--1) 급여를 많이 받는 사원순으로 정렬(급여를 기준으로 내림차순 정렬)
select ename, sal from emp order by sal desc;

--2)뷰생성
create or replace view sal_view
as
select ename, sal from emp order by sal desc;

--3)급여를 많이 받는 사원 5명 출력
select rownum, ename, sal from sal_view;
select rownum, ename, sal from sal_view where rownum<=5;

--4) 인라인뷰
select empno,ename,sal 
from (select empno,ename,sal from emp order by sal desc) 
where rownum<=5;

-- 급여를 3~5번째로 많이 받는 사원을 검색

select rnum,empno,ename,sal 
from (select rownum as rnum,empno,ename,sal 
      from (select rownum,empno,ename,sal 
            from emp 
            order by sal desc)
      ) 
where rownum between 3 and 5;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--시퀀스(sequence)
-- : 테이블에 숫자를 자동으로 증가 시켜주는 역할을 한다.

-- 시퀀스 생성
create sequence dept_deptno_seq
start with 10       --시작할 번호
increment by 10;    --증가치

--시퀀스 목록
select * from seq;
select * from user_sequences;

--currval : 시퀀스의 현재값을 반환
--nextval : 시퀀스의 다음값을 반환

select dept_deptno_seq.nextval from dual;

--예1. 시퀀스를 테이블의 기본키에 적용하기
create table emp01(
    empno number(4) primary key,
    ename varchar2(10),
    hiredate date);
    
-- 1부터 1씩 증가되는  시퀀스 생성
create sequence emp01_seq;
select * from tab;
select * from seq;

--데이터 입력
insert into emp01 values(emp01_seq.nextval,'홍길동',SYSDATE);

select * from emp01;

--예2)
-- 테이블생성
create table dept_example(
    deptno number(1) primary key,
    dame varchar2(15),
    loc varchar2(10));
-- 시퀀스 생성 : 10부터 10씩 증가되는 시퀀스 생성
create sequence dept_example_seq
start with 10
increment by 10;

--데이터 입력
insert into emp01 values(dept_example_seq.nextval,'홍길동',SYSDATE);

--시퀀스 삭제
-- 형식 : drop sequence 스퀀스이름
drop sequence dept_example_seq;

-- 시퀀스 최대값을 수정
create sequence dept_seq
start with 10
increment by 10
maxvalue 30;

--시퀀스 목록 확인
select * from seq;

--시퀀스 다음값 구해오기
select dept_seq.nextval from dual;

--시퀀스의 maxvalue값을 30에서 100000으로 수정 해보자.
alter sequence dept_seq maxvalue 100000;