--2024.08.01

select ename, hiredate 
from emp 
where hiredate=(select max(hiredate) from emp);


select ename, sal 
from emp 
where sal=(select max(sal) from emp);

------------------------------------------------------------------------------------------------------------------------

--�׷��Լ�
-- count(): �� ������ ������ �����ִ� �Լ�
-- ���� : count(�÷���)
select count(sal) from emp;
select count(mgr) from emp; --13 NULL���� counting���� ����
select count(deptno) from dept;
select count(empno) from emp;

--Q1.������̺��� �ߺ����� ������ JOB�� ������ ���ϴ� SQL�� �ۼ�
select count(distinct job) from emp;

--Q2.30�� �μ��� �Ҽӵ� ����߿��� Ŀ�̼��� �޴� ������� ���غ���?
select count(comm) from emp where deptno =30;  --null���� ī�������� �ʴ´�.

----------------------------------------------------------------------------------------------------------------------------

--group by : Ư�� �÷��� �������� ���̺� �����ϴ� �����͸� �׷����� �����Ͽ� ó�����ִ� ����
select deptno,sum(sal) as SumofSal, max(sal) as MaxofSal, min(sal) as MinofSal, trunc(avg(sal)) as AvgofSal 
from emp 
group by deptno 
order by deptno asc;

--Q2. job�÷��� ������ �޿��� ��, ��ձ޿�, �ִ� �޿�, �ּ� �޿��� ���ϴ� sql���� �ۼ�
select job, sum(sal) as SumofSal, trunc(avg(sal)) as AvgofSal, max(sal) as MaxofSal, min(sal) as MinofSal
from emp 
group by job 
order by job asc;


--Q3. �� �μ���(10,20,30..) ������� Ŀ�̼��� �޴� ������� ���ϴ� SQL
select deptno, count(*) as enum ,count(comm) as commnum
from emp
group by deptno
order by deptno asc;

--having ������
-- : group by���� ���Ǵ� ��쿡 ������ ������ ������ ���ؼ� where������ ��ſ� having �������� ����ؾ� �Ѵ�.

-- Q1. �� �μ���(10,20,30) ��ձ޿� �ݾ��� 2000�̻��� �μ��� ���
select deptno, trunc(avg(sal)) as AvgSal
from emp
group by deptno
having avg(sal)>=2000
order by deptno asc;

-- Q1. �� �μ���(10,20,30) �ִ�޿� �ݾ��� 2900�̻��� �μ��� ���
select deptno, max(sal) as MaxSal
from emp
group by deptno
having max(sal)>=2900
order by deptno asc;

