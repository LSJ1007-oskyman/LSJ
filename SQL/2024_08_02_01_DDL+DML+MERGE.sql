--2024.08.02(��)

--����.
--       Q1. ������ MANAGER�� ����� �̸�, �μ����� ����ϴ� SQL����
--             �ۼ� �ϼ���? (JOIN�� ����Ͽ� ó��)
--   
--       Q2. �Ŵ����� KING �� ������� �̸��� ������ ����ϴ� SQL�� �ۼ�?
--
--       Q3. SCOTT�� ������ �ٹ������� �ٹ��ϴ� ����� �̸��� ����ϴ� SQL�� �ۼ�?

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
--DDL(Data Definition Language):������ ���Ǿ�
-- create : ������ ����
-- alter : ���̺� ���� ����
-- rename : ���̺� �̸� ����
-- drop : ���̺� ����
-- truncate : ������ ����

--���̺� ��� 
select * from tab;
select * from user_tables;

-- 1.create
--  :�����ͺ��̽� ����, ���̺� ����
-- ���� : create table ���̺��� ( �÷���1 ������Ÿ��1,
--                              �÷���2 ������Ÿ��2,
--                              �÷���N ������Ÿ��N);

--����Ŭ�� ������ Ÿ��
--1) ���� ������
--  number(n) : ���� n�ڸ� ���� ����
--  number(n1,n2) : n1:��ü �ڸ���, n2:�Ҽ��� ���Ͽ� �Ҵ�� �ڸ���

--2) ���� ������
--  char() : �������� ������
--           �ִ� 2000byte ���� ���� ����
--  varchar2() : �������� ������
--               �ִ� 4000byte���� ���� ����
--  long : 2GB ���� ���� ����
--         long������ ������ �÷��� �˻������ �������� �ʴ´�.
--3) ��¥�� ������
-- date : ��, ��, �� ���� ����
-- timestamp : ��, ��, ��, ��, ��, �� ���� ����

-- ���̺� ����
-- 1)���� ���̺� ����
create table emp01(
    empno number(4),
    ename varchar2(20),
    sal number(7,2));
    
select * from tab;

-- 2)���������� ���̺� ����
-- ���纻 ���̺��� �����ȴ�.
-- ��, ���������� ���簡 ���� �ʴ´�.

-- ���纻 ���̺� ����
create table emp02 as select * from emp;

-- ���ϴ� �÷����� ������ ���纻 ���̺�
create table emp03 as select empno,ename from emp;
select * from emp03;

-- ���ϴ� ��(row,������)���� ������ ���纻 ���̺�
create table emp04 as select * from emp where deptno =10;
select * from emp04;

-- ���̺� ������ ����
create table emp05 as select * from emp where 1=0;
select *from emp05;

--2. alter
--   : ���̺� ���� ���� (�÷� �߰�, �÷�����,�÷�����)

--1)�÷� �߰�
alter table emp01 add(job varchar2(10));
desc emp01;

--2)�÷� ����
--      1.������ �÷��� �����Ͱ� ���� ���
--        �÷��� ������ Ÿ���� ������ �� �ִ�.
--        �÷��� ũ�⸦ ������ �� �ִ�.
--      2.������ �÷��� �����Ͱ� �ִ� ���
--        �÷��� ������ Ÿ���� ������ �� ����.
--        �÷��� ũ�⸦ �ø����� ������, ���� ����� ������ ũ�⺸�� ���� ũ��� ������ �� ����.

--emp01 ���̺��� job �÷��� ũ�⸦ 10���� 30���� �����غ���?
alter table emp01 modify ( job varchar2(30));
desc emp01;

--3)�÷� ����
alter table emp01 drop  column job;
alter table emp01 drop (job);
desc emp01;

--3. rename
-- : ���̺� �̸� ����
-- ���� : rename old_name to new_name;

--Q. emp01 ���̺��� test ���̺������� �̸��� ���� �غ���?
rename emp01 to test;
select * from tab;

--4.truncate
--  :���̺��� ��� ������ ����
-- ���� : truncate table table_name
truncate table EMP02;
select * from emp02;

--5. drop
-- : ���̺� ����
-- ���� : drop table table_name; (Oracle 10g���ʹ� �ӽ� ���̺��� ��ü)
--       drop talbe table_name purge;
-- �ӽ� ���̺� ����
purge recyclebin;

--Q. test ���̺� �����غ���?
drop table dept02 purge;
select * from tab;

-------------------------------------------------------------------------------------------------------------------------

--* ����Ŭ�� ��ü
--  ���̺�, ��, ������, �ε���, ���Ǿ�, ���ν���, Ʈ����
--
--
--* ������ ��ųʸ��� ������ ��ųʸ� ��
--  ������ ��ųʸ��� ���ؼ� ���ٰ�����
--
--  - ������ ��ųʸ� �� : user_xxxx
--     (���� ���̺�)         all_xxxx
--		      dba_xxxx
--
--  - ������ ��ųʸ�(�ý��� ���̺�) : 

select * from tab;
select table_name from user_tables; --(���̺�)

select * from user_views; --(��)

select * from seq;
select * from user_sequences; --(������)

select * from user_indexes; --(�ε���)

select * from user_synonyms; --(���Ǿ�)

select * from user_source; --(���ν���)

select * from user_triggers; --(Ʈ����)

select table_name from all_tables;

select table_name from dba_tables; --(DBA ������ ��밡��)
 
select username from dba_users; --(DBA ������ ��밡��)

-------------------------------------------------------------------------------------------------------------------------

--DML ( Data Manipulation Language, ������ ���۾�)
-- insert, update, delete

--1. insert : ������ �Է�
-- ���� : insert into ���̺�(�÷�1, �÷�2, ....) values(������1, ������2 ....);
-- ����2 : insert into ���̺� values(������1, ������2 ....);

--[�ǽ�]
--����ִ� dept01���纻 ���̺� ���� - ���̺� ������ ����
create table dept01 as select * from dept where 1=0;
select * from dept01; 

insert into dept01(deptno, dname, loc) values(10,'ACCOUNTING','NEW YORK');
insert into dept01 values(20,'RESEARCH','DALLAS');
insert into dept01 values(30,'������','����');

--null�� �Է�
insert into dept01(deptno, dname) values(40,'���ߺ�'); --locl�÷� NULL
insert into dept01 values(50,'��ȹ��',NULL); --locl�÷� NULL

--2) ���������� ������ �Է�
--dept02 ���̺� ���� : ���̺� ������ ����
create table dept02 as select * from dept where 1=0;
select * from dept02; 

--���������� ������ �Է�
insert into dept02 select * from dept;
select * from dept02;

--3)insert all ���ɹ����� ���� ���̺��� ������ �Է�
-- 2���� ���̺� ����
create table emp_hir as select empno, ename, hiredate from emp where 1=0;
create table emp_mgr as select empno, ename, mgr from emp where 1=0;

--insert all ���ɹ����� 2���� ���̺��� ������ �Է�
insert all 
    into emp_hir values(empno,ename,hiredate)
    into emp_mgr values(empno,ename,mgr)
    select empno, ename,hiredate, mgr from emp where deptno=20;

select * from emp_hir;
select * from emp_mgr;

--2. update : ������ ����
-- ���� : update ���̺� set �÷�1 = ������ ��1,
--                        �÷�2 = ������ ��2,
--                        where ������;

--[�ǽ�]
--���纻 ���̺� ����
create table emp01 as select * from emp;
select * from emp01;

--1) ��� ������ ���� : where�������� ������� ����
-- Q1. ��� ������� �μ���ȣ�� 30������ ����
update emp01 set deptno = 30;

--Q2. ��� ������� �޿��� 10% �λ�?
update emp01 set sal = sal *1.1;

--Q3. ��� ������� �Ի����� ���� ��¥�� ����?
update emp01 set hiredate = sysdate;

--2) Ư�� ������ ���� : where�������� ����ؼ� ����
--���纻 ���̺� ����
create table emp02 as select * from emp;
select * from emp02;

--Q1.�޿��� 3000�̻��� ����� �޿��� 10% �λ�?
update emp02 set sal = sal*1.1 where sal>=3000;

--Q2.1987�⵵�� �Ի��� ����� �Ի����� ���� ��¥�� ����?
update emp02 set hiredate = sysdate where substr(hiredate, 1, 2) = '87';
update emp02 set hiredate = sysdate where to_char(hiredate,'YYYY') = '1987';

--Q3. SCOTT����� �Ի����� ���� ��¥�� �����ϰ�, �޿��� 50���� comm�� 4000���� ����
update emp02 set hiredate =sysdate, sal = 50, comm=4000 where ename = 'SCOTT';

--3)���������� �̿��� ������ ����
--Q.20�� �μ��� ������(DALLAS)�� 40�� �μ��� ������(BOSTON)���� ����
drop table dept01 purge;

create table dept01 as select * from dept;
select * from dept01;

update dept01 set loc = (select loc from dept01 where deptno =40) where deptno = 20;

--3.DELETE : ������ ����
--  ���� : delete from ���̺��� where ������;

--1) ��� ������ ���� : where�������� ������� �ʴ´�.
select * from dept01;
delete from dept01; --��� ������ ����
rollback;--Ʈ����� ���

--2) �������� �����ϴ� ������ ����
--Q.dept01 ���̺��� 30�� �μ��� ����
delete from dept01 where deptno = 30;

--3) ���������� �̿��� ������ ����
--Q. ������̺�(emp02)���� �μ����� SALES�μ��� ����� ����
drop table emp02 purge;
create table emp02 as select * from emp;
select * from emp02;
delete from emp02 where deptno = (select deptno from dept where dname = 'SALES');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--* ���̺� ������ ������ �� ���̺��� MERGE ����
--
--  MERGE : ������ ���� 2���� ���̺��� �ϳ��� ���̺��� ��ġ�� ���.
--  MERGE������ �����Ҷ� ������ �����ϴ� ��(ROW)�� ������ ���ο�     
--  ������ UPDATE�ǰ�, �������� ������ ���ο� ��(ROW)���� �߰��ȴ�.


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
select * from emp02; --(Ȯ��)

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
select * from emp01; --(�պ��� ��� Ȯ��)