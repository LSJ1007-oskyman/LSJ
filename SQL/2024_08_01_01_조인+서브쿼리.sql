--2024_08_01_01

--조인
-- 2개 이상의 테이블을 결합해서 정보를 구해오는 것.

--조인의 필요성
--Q. SCOTT사원이 소속된 부서명을 출력하느 SQL문 작성
select dname
from dept, emp
where dept.deptno = emp.deptno and ename = 'SCOTT';

-- cross JOIN의 종류
--1. 등가 조인 , 동등조인(Equi Join) : 2테이블에 공통적인 컬럼이 있을때 사용
--2. 비등가 조인(Non-Equi Join) 
--3. 자체적인 (Self Join) 
--4. 외부조인 (Outer Join) 

--1. 등가 조인 , 동등조인(Equi Join)
-- 두개의 테이블에 동등한 컬럼을 기준으로 조인 하는 것
-- Q. SCOTT사원이 소속된 부서명을 출력하느 SQL문 작성
select b.ename, a.dname, a.deptno --공통컬럼을 출력할때는 반드시 테이블명을 붙여야한다.
from dept a, emp b
where a.deptno = b.deptno and b.ename = 'SCOTT';

-- 테이블에 별칭 부여하기
-- 1) 별칭명이 부여된 다음 부터는 더이상 기존 테이블명을 사용할 수 없다.
-- 2) 별칭명은 대소문자를 구분하지 않는다.
-- 3) 공통컬럼은 앞에 별칭명 생략이 불가함
-- 4) 공통컬럼이 아닌 컬럼들은 앞에 별칭명을 생략할 수 있음
select D.deptno, e.ename, d.dname 
from dept d, emp e 
where d.deptno = e.deptno and e.ename = 'SCOTT';

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2. 비등가 조인 (Non-Equi Join)
-- 두개의 테이블에 동일한 컬럼없이 다른 조건을 이용해서 조인 하는것.

--Q. 사원테이블에 있는 각 사원들의 급여가 몇등급인지를 출력하는 SQL문 작성
select e.ename ,e.sal,s.grade
from emp e,salgrade s
where e.sal >=s.losal and e.sal<=s.hisal;

select e.ename ,e.sal,s.grade
from emp e,salgrade s
where e.sal between s.losal and s.hisal;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ||~||는 그 사이에 글자를 출력해주는 문자이다
-- 3. 자체조인(Self Join)
-- 한개의 테이블 내에서 컬럼과 컬럼 사이의 관계를 이용해서 조인 하는 것.
--Q. 자체조인(Self Join)을 이용해서 사원 테이블의 각 사원들의 사원명과 매니저(직속상사)를 출력하는 SQL문 작성
Select employee.ename || '의 상사는 ' ||manager.ename as 직속상사
from emp employee, emp manager
where employee.mgr = manager.empno;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 4. 외부조인(Outer Join)
--    조인 조건을 만족하지 않는 데이터를 출력해주는 조인
-- 1) 테이블을 조인할때 어느 한쪽의 테이블에는 데이터가 존재하지만, 
--    다른 테이블에는 데이터가 존재하지 않는 경우에, 그 데이터가 출력되지 않는 문제를 
--    해결하기 위해서 사용되는 조인 방법이다.
-- 2) 정보가 부족한 곳에 (+)를 추가한다.

--Q1.위의 자체조인(Self Join)의 결과, KING사원은 직속상사가 없기 때문에 출력되지 않았는데, KING사원도 외부조인들 이용해서 출력해보세요
Select employee.ename || '의 직속상사는 ' ||manager.ename as 직속상사
from emp employee, emp manager
where employee.mgr = manager.empno(+);

--Q2.부서테이블(DEPT)과 사원테이블(EMP)을 동등조인을 하면 40번 부서가 출력되지 않기
--   때문에, 외부조인을 이용해서 40번 부서도 나타나도록 처리 하세요
select distinct d.dname
from emp e, dept d
where e.deptno(+) = d.deptno
order by d.dname asc;

--Ansi(미국 표준협회) 표준안에 따라서 만들어진 Join 방법
select * from dept cross join emp;
select * from emp cross join dept; --56개검색

--ANSI INNER JOIN : 동등조인과 같은 의미를 가지고 있는 조인 방법
--Q1. SCOTT사원이 소속된 부서명을 출력하는 SQL문을 ANSI INNER JOIN으로 작성하세요?
select ename,dname 
from dept inner join emp
on dept.deptno = emp.deptno
where ename = 'SCOTT';

--using을 이용해서 조인
select ename,dname 
from dept inner join emp
using (deptno)
where ename = 'SCOTT';

--ANSI Natural Join
--DEPT와 EMP테이블 사이에 공통컬럼이 같다는 의미를 가지고 있다.
select ename,dname
from dept natural join emp
where ename = 'SCOTT';
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--ANSI OUTER JOIN
--형식 : SELECT * from table1 [left | right | full ] outer join table2;
--1. dept01테이블 생성
create table dept01(
    deptno number(2),
    dname varchar2(14));
    
insert into dept01 values(10,'ACCOUNTING');
insert into dept01 values(20,'RESEARCH');
select * from dept01;

--2. dept02테이블 생성
create table dept02(
    deptno number(2),
    dname varchar2(14));
    
insert into dept02 values(10,'ACCOUNTING');
insert into dept02 values(30,'SALES');
select * from dept01;

--3. left outer join : dept01 테이블의 정보만 출력됨
select * from dept01 left outer join dept02 using(deptno);

--4. right outer join : dept01 테이블의 정보만 출력됨
select * from dept01 right outer join dept02 using(deptno);

--5. full outer join : dept01 테이블의 정보만 출력됨
select * from dept01 full outer join dept02 using(deptno);

------------------------------------------------------------------------------------------------------------------------------------------

-- 서브 쿼리
--Q.SCOTT사원이 소속된 부서명을 출력하는 SQL문 작성?
--서브쿼리로 구하기
select dname 
from dept 
where deptno = (select deptno
                from emp
                where ename = 'SCOTT');
--Join으로 구하기 :4가지 방법
select dname from dept,emp where dept.deptno = emp.deptno and ename = 'SCOTT';
select dname from dept inner join emp on emp.deptno = dept.deptno where ename ='SCOTT';
select dname from dept inner join emp USING(deptno) where ename ='SCOTT';
select dname from dept natural join emp where ename ='SCOTT';

-- 1. 단일행 서브쿼리
-- 1)서브쿼리의 검색 결과가 1개만 반환되는 쿼리
-- 2)메인쿼리의 where조건절에서 비교 연산자로 처리할 수 있다.
--   비교연산자: =, >, >=, <, <=, !=
--Q1.사원테이블에서 가장 최근에 입사한 사원명을 출력하는 SQL문 작성
select ename from emp where hiredate = (select max(hiredate) from emp);

--Q2. 사원테이블에서 최대 급여를 받는 사원명과 최대급여 금액을 출력하는 SQL문을 작성하시오
select ename,sal from emp where sal = (select max(sal) from emp);

--Q3. 직속상사(mgr)가 KING인 사원의 사원명과 급여를 출력하는 SQL문 작성?
select ename, sal from emp where mgr = (select empno from emp where ename = 'KING');

--2. 다중행 서브쿼리
--1) 서브쿼리에서 반환되는 검색 결과가 2개 이상인 서브쿼리
--2)메인쿼리의 where 조건절에서 다중행 연산자(in,any,all ...)를 사용해야한다.

-- in연산자
-- : 서브쿼리에 검색결과중에서 하나라도 일치되면 참이된다

--Q.급여를 3000이상 받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원들의 정보를 출력하는 SQL문 작성

--각부서별 최대급여 금액 구하기
select deptno from emp group by deptno having max(sal)>=3000;

select ename,sal,deptno from emp where deptno in (select distinct deptno from emp where sal>=3000);

--all 연산자
-- : 메인쿼리의 비교 조건이 서브쿼리의 검색 결과와 모든 값이 일치되면 참이 된다.
--Q. 30번 부서에 소속된 사원 중에서 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사원의 이름과 급여를 출력하는 SQL문 작성?
--1)단일행 서브쿼리로 구하기
select ename, sal from emp where sal>(select max(sal) from emp where deptno=30);
--2) 다중행서브쿼리로 구하기
select ename, sal from emp where sal>all (select sal from emp where deptno=30);

--any 연산자
-- : 메인쿼리의 비교조건이 서브쿼리의 검색 결과와 하나 이상 일치되면 참이된다.
--Q. 부서번호가 30번인 사원들의 급여중 가장 낮은 금여(950)보다 더 높은 급여를 받는 사원명과 급여를 출력하는 SQL문 작성
--1)단일행 서브쿼리로 구하기
select ename, sal from emp where sal>(select min(sal) from emp where deptno=30);
--2)다중행 서브쿼리로 구하기
select ename, sal from emp where sal> any(select sal from emp where deptno=30);