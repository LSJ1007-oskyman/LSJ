--2024_08_01_01

--����
-- 2�� �̻��� ���̺��� �����ؼ� ������ ���ؿ��� ��.

--������ �ʿ伺
--Q. SCOTT����� �Ҽӵ� �μ����� ����ϴ� SQL�� �ۼ�
select dname
from dept, emp
where dept.deptno = emp.deptno and ename = 'SCOTT';

-- cross JOIN�� ����
--1. � ���� , ��������(Equi Join) : 2���̺� �������� �÷��� ������ ���
--2. �� ����(Non-Equi Join) 
--3. ��ü���� (Self Join) 
--4. �ܺ����� (Outer Join) 

--1. � ���� , ��������(Equi Join)
-- �ΰ��� ���̺� ������ �÷��� �������� ���� �ϴ� ��
-- Q. SCOTT����� �Ҽӵ� �μ����� ����ϴ� SQL�� �ۼ�
select b.ename, a.dname, a.deptno --�����÷��� ����Ҷ��� �ݵ�� ���̺���� �ٿ����Ѵ�.
from dept a, emp b
where a.deptno = b.deptno and b.ename = 'SCOTT';

-- ���̺� ��Ī �ο��ϱ�
-- 1) ��Ī���� �ο��� ���� ���ʹ� ���̻� ���� ���̺���� ����� �� ����.
-- 2) ��Ī���� ��ҹ��ڸ� �������� �ʴ´�.
-- 3) �����÷��� �տ� ��Ī�� ������ �Ұ���
-- 4) �����÷��� �ƴ� �÷����� �տ� ��Ī���� ������ �� ����
select D.deptno, e.ename, d.dname 
from dept d, emp e 
where d.deptno = e.deptno and e.ename = 'SCOTT';

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2. �� ���� (Non-Equi Join)
-- �ΰ��� ���̺� ������ �÷����� �ٸ� ������ �̿��ؼ� ���� �ϴ°�.

--Q. ������̺� �ִ� �� ������� �޿��� ���������� ����ϴ� SQL�� �ۼ�
select e.ename ,e.sal,s.grade
from emp e,salgrade s
where e.sal >=s.losal and e.sal<=s.hisal;

select e.ename ,e.sal,s.grade
from emp e,salgrade s
where e.sal between s.losal and s.hisal;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ||~||�� �� ���̿� ���ڸ� ������ִ� �����̴�
-- 3. ��ü����(Self Join)
-- �Ѱ��� ���̺� ������ �÷��� �÷� ������ ���踦 �̿��ؼ� ���� �ϴ� ��.
--Q. ��ü����(Self Join)�� �̿��ؼ� ��� ���̺��� �� ������� ������ �Ŵ���(���ӻ��)�� ����ϴ� SQL�� �ۼ�
Select employee.ename || '�� ���� ' ||manager.ename as ���ӻ��
from emp employee, emp manager
where employee.mgr = manager.empno;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 4. �ܺ�����(Outer Join)
--    ���� ������ �������� �ʴ� �����͸� ������ִ� ����
-- 1) ���̺��� �����Ҷ� ��� ������ ���̺��� �����Ͱ� ����������, 
--    �ٸ� ���̺��� �����Ͱ� �������� �ʴ� ��쿡, �� �����Ͱ� ��µ��� �ʴ� ������ 
--    �ذ��ϱ� ���ؼ� ���Ǵ� ���� ����̴�.
-- 2) ������ ������ ���� (+)�� �߰��Ѵ�.

--Q1.���� ��ü����(Self Join)�� ���, KING����� ���ӻ�簡 ���� ������ ��µ��� �ʾҴµ�, KING����� �ܺ����ε� �̿��ؼ� ����غ�����
Select employee.ename || '�� ���ӻ��� ' ||manager.ename as ���ӻ��
from emp employee, emp manager
where employee.mgr = manager.empno(+);

--Q2.�μ����̺�(DEPT)�� ������̺�(EMP)�� ���������� �ϸ� 40�� �μ��� ��µ��� �ʱ�
--   ������, �ܺ������� �̿��ؼ� 40�� �μ��� ��Ÿ������ ó�� �ϼ���
select distinct d.dname
from emp e, dept d
where e.deptno(+) = d.deptno
order by d.dname asc;

--Ansi(�̱� ǥ����ȸ) ǥ�ؾȿ� ���� ������� Join ���
select * from dept cross join emp;
select * from emp cross join dept; --56���˻�

--ANSI INNER JOIN : �������ΰ� ���� �ǹ̸� ������ �ִ� ���� ���
--Q1. SCOTT����� �Ҽӵ� �μ����� ����ϴ� SQL���� ANSI INNER JOIN���� �ۼ��ϼ���?
select ename,dname 
from dept inner join emp
on dept.deptno = emp.deptno
where ename = 'SCOTT';

--using�� �̿��ؼ� ����
select ename,dname 
from dept inner join emp
using (deptno)
where ename = 'SCOTT';

--ANSI Natural Join
--DEPT�� EMP���̺� ���̿� �����÷��� ���ٴ� �ǹ̸� ������ �ִ�.
select ename,dname
from dept natural join emp
where ename = 'SCOTT';
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--ANSI OUTER JOIN
--���� : SELECT * from table1 [left | right | full ] outer join table2;
--1. dept01���̺� ����
create table dept01(
    deptno number(2),
    dname varchar2(14));
    
insert into dept01 values(10,'ACCOUNTING');
insert into dept01 values(20,'RESEARCH');
select * from dept01;

--2. dept02���̺� ����
create table dept02(
    deptno number(2),
    dname varchar2(14));
    
insert into dept02 values(10,'ACCOUNTING');
insert into dept02 values(30,'SALES');
select * from dept01;

--3. left outer join : dept01 ���̺��� ������ ��µ�
select * from dept01 left outer join dept02 using(deptno);

--4. right outer join : dept01 ���̺��� ������ ��µ�
select * from dept01 right outer join dept02 using(deptno);

--5. full outer join : dept01 ���̺��� ������ ��µ�
select * from dept01 full outer join dept02 using(deptno);

------------------------------------------------------------------------------------------------------------------------------------------

-- ���� ����
--Q.SCOTT����� �Ҽӵ� �μ����� ����ϴ� SQL�� �ۼ�?
--���������� ���ϱ�
select dname 
from dept 
where deptno = (select deptno
                from emp
                where ename = 'SCOTT');
--Join���� ���ϱ� :4���� ���
select dname from dept,emp where dept.deptno = emp.deptno and ename = 'SCOTT';
select dname from dept inner join emp on emp.deptno = dept.deptno where ename ='SCOTT';
select dname from dept inner join emp USING(deptno) where ename ='SCOTT';
select dname from dept natural join emp where ename ='SCOTT';

-- 1. ������ ��������
-- 1)���������� �˻� ����� 1���� ��ȯ�Ǵ� ����
-- 2)���������� where���������� �� �����ڷ� ó���� �� �ִ�.
--   �񱳿�����: =, >, >=, <, <=, !=
--Q1.������̺��� ���� �ֱٿ� �Ի��� ������� ����ϴ� SQL�� �ۼ�
select ename from emp where hiredate = (select max(hiredate) from emp);

--Q2. ������̺��� �ִ� �޿��� �޴� ������ �ִ�޿� �ݾ��� ����ϴ� SQL���� �ۼ��Ͻÿ�
select ename,sal from emp where sal = (select max(sal) from emp);

--Q3. ���ӻ��(mgr)�� KING�� ����� ������ �޿��� ����ϴ� SQL�� �ۼ�?
select ename, sal from emp where mgr = (select empno from emp where ename = 'KING');

--2. ������ ��������
--1) ������������ ��ȯ�Ǵ� �˻� ����� 2�� �̻��� ��������
--2)���������� where ���������� ������ ������(in,any,all ...)�� ����ؾ��Ѵ�.

-- in������
-- : ���������� �˻�����߿��� �ϳ��� ��ġ�Ǹ� ���̵ȴ�

--Q.�޿��� 3000�̻� �޴� ����� �Ҽӵ� �μ��� ������ �μ����� �ٹ��ϴ� ������� ������ ����ϴ� SQL�� �ۼ�

--���μ��� �ִ�޿� �ݾ� ���ϱ�
select deptno from emp group by deptno having max(sal)>=3000;

select ename,sal,deptno from emp where deptno in (select distinct deptno from emp where sal>=3000);

--all ������
-- : ���������� �� ������ ���������� �˻� ����� ��� ���� ��ġ�Ǹ� ���� �ȴ�.
--Q. 30�� �μ��� �Ҽӵ� ��� �߿��� �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� ����� �̸��� �޿��� ����ϴ� SQL�� �ۼ�?
--1)������ ���������� ���ϱ�
select ename, sal from emp where sal>(select max(sal) from emp where deptno=30);
--2) �����༭�������� ���ϱ�
select ename, sal from emp where sal>all (select sal from emp where deptno=30);

--any ������
-- : ���������� �������� ���������� �˻� ����� �ϳ� �̻� ��ġ�Ǹ� ���̵ȴ�.
--Q. �μ���ȣ�� 30���� ������� �޿��� ���� ���� �ݿ�(950)���� �� ���� �޿��� �޴� ������ �޿��� ����ϴ� SQL�� �ۼ�
--1)������ ���������� ���ϱ�
select ename, sal from emp where sal>(select min(sal) from emp where deptno=30);
--2)������ ���������� ���ϱ�
select ename, sal from emp where sal> any(select sal from emp where deptno=30);