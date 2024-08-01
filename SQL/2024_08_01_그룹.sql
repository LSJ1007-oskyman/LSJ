--2024.08.01

select ename, hiredate 
from emp 
where hiredate=(select max(hiredate) from emp);


select ename, sal 
from emp 
where sal=(select max(sal) from emp);

------------------------------------------------------------------------------------------------------------------------

--그룹함수
-- count(): 총 데이터 갯수를 구해주는 함수
-- 형식 : count(컬럼명)
select count(sal) from emp;
select count(mgr) from emp; --13 NULL값은 counting하지 않음
select count(deptno) from dept;
select count(empno) from emp;

--Q1.사원데이블에서 중복행을 제거한 JOB의 갯수를 구하는 SQL문 작성
select count(distinct job) from emp;

--Q2.30번 부서에 소속된 사원중에서 커미션을 받는 사원수를 구해보자?
select count(comm) from emp where deptno =30;  --null값은 카운팅하지 않는다.

----------------------------------------------------------------------------------------------------------------------------

--group by : 특정 컬럼을 기준으로 테이블에 존재하는 데이터를 그룹으로 구분하여 처리해주는 역할
select deptno,sum(sal) as SumofSal, max(sal) as MaxofSal, min(sal) as MinofSal, trunc(avg(sal)) as AvgofSal 
from emp 
group by deptno 
order by deptno asc;

--Q2. job컬럼을 기준을 급여의 합, 평균급여, 최대 급여, 최소 급여를 구하는 sql문을 작성
select job, sum(sal) as SumofSal, trunc(avg(sal)) as AvgofSal, max(sal) as MaxofSal, min(sal) as MinofSal
from emp 
group by job 
order by job asc;


--Q3. 각 부서별(10,20,30..) 사원수와 커미션을 받는 사원수를 구하는 SQL
select deptno, count(*) as enum ,count(comm) as commnum
from emp
group by deptno
order by deptno asc;

--having 조건절
-- : group by절이 사용되는 경우에 데이터 제한을 가히기 위해서 where조건절 대신에 having 조건절을 사용해야 한다.

-- Q1. 각 부서별(10,20,30) 평균급여 금액이 2000이상인 부서만 출력
select deptno, trunc(avg(sal)) as AvgSal
from emp
group by deptno
having avg(sal)>=2000
order by deptno asc;

-- Q1. 각 부서별(10,20,30) 최대급여 금액이 2900이상인 부서만 출력
select deptno, max(sal) as MaxSal
from emp
group by deptno
having max(sal)>=2900
order by deptno asc;

