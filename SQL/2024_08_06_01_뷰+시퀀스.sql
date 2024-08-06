--2024_08_06_01

-- ���� ����
-- �ܼ��� : �ϳ��� �⺻ ���̺�� ������ ��
-- ���պ� : �������� �⺻ ���̺�� ������ ��

-- 1. �ܼ���
-- Q. �⺻ ���̺��� emp_copy�� �̿��ؼ� 20�� �μ��� �Ҽӵ� ������� ����� �̸�,�μ���ȣ,���ӻ���� �����ȣ�� ����ϱ� ���� ��(emp_view20)�� ����

create view emp_view20
as
select  empno , ename,deptno,mgr from emp_copy where deptno =20;

--�� Ȯ��
select * from tab;
select * from user_views;

select * from emp_view20;

--2. ���պ�
--Q. �� �μ���(�μ���) �ִ�޿��� �ּұ޿��� ����ϴ� �並 sal_view��� �̸����� �ۼ��ϼ���
create view sal_view
as
select dname as �μ���, max(sal) as �ִ�޿�,min(sal)�ּұ޿� from dept_copy inner join emp_copy using (deptno) group by dname;

--�� Ȯ��
select * from tab;
select * from user_views;

--�� ������ Ȯ��
select *  from emp_view30;

--�����
-- ���� :  drop view ���̸�;
drop view emp_view30;

-- �並 �����Ҷ� ���Ǵ� �ɼ�
--1. or replace�ɼ�
-- ������ �䰡 �������� ������ �並 �����ϰ�, ���� ������ �̸��� ���� �䰡 �����ϸ� ���� ������ ���� �ϵ��� ����� �ִ� �ɼ�

--1) or replace �ɼǾ��� ������ ��(emp_view30)�� ����:���� �߻�
create view emp_view30
as
select empno,ename, deptno,sal,comm from emp_copy where deptno = 30;

--2) or replace �ɼ��� �ٿ��� ������ ��(emp_view30)�� ����: ���� ���� ����
create or replace view emp_view30
as
select empno,ename, deptno,sal,comm from emp_copy where deptno = 30;

--3) �� Ȯ��
select * from emp_view30;

-- 2. with check option
-- : where �������� ���� ���� �������� ���ϵ��� ����� �ִ� �ɼ�
--1) with check option ������� ���� ���
create or replace view emp_view30
as
select empno,ename, deptno,sal,comm from emp_copy where deptno = 30;

--Q. emp_view30 �信�� �޿��� 1200�̻��� ������� �μ���ȣ�� 30������ 20������ ����
update emp_view30 set deptno=20 where sal>=1200; --������ ����
select * from emp_view30;


--2) with check option�� ����ؼ� �����
create or replace view emp_view30
as
select empno,ename, deptno,sal,comm from emp_copy where deptno = 30 with check option;

--Q. emp_view30 �信�� �޿��� 1200�̻��� ������� �μ���ȣ�� 30������ 20������ ����
update emp_view30 set deptno =20  where sal>=1200;

--3. with read only �ɼ�
-- : �б� ������ �並 ����� �ִ� �ɼ�
-- �並 ���ؼ� �⺻ ���̺��� ������ �������� ���ϵ��� ����� �ִ� ����

create or replace view view_read30
as 
select empno,ename, sal, comm, deptno from emp_copy where deptno=30 with read only;

select * from user_views;
select * from view_read30;

--Q. ������ ��(view_read30)�� �����غ���
update view_read30 set sal = 3000; --read only�� ���� �ȉ�
--------------------------------------------------------------------------------------------------------------------------------------------------------

--rownum�÷�
--1. �������� �˻� ������ ������ �ִ� ������ �÷��̴�.
--2. rownum���� 1������ ���۵ȴ�.
--3. rownum ���� order by���� ���� �ϴ��� ���� �ٲ��� �ʴ´�.
--4. rownum ���� �����ϱ� ���ؼ��� ���̺��� �����ؾ��Ѵ�.

select rownum , rowid, deptno dname, loc from dept;
select rownum, ename, sal from emp;
select rownum, ename from emp where ename = 'SCOTT';

--1 SCOTT

select rownum, ename, sal from emp;
--order by���� �����ص� rownum���� �ٲ��� �ʴ´�.
select rownum, ename, sal from emp order by sal desc;

--Q1. ������̺��� �Ի����� ���� ��� 5���� ���غ���?
--1)�Ի����� ���� ��������� ���� (�Ի����� �������� �������� ����)
select empno,ename, hiredate from emp order by hiredate asc;

--2) �����
create or replace view hire_view
as
select empno, ename, hiredate from emp order by hiredate asc;

--3) �Ի����� ���� ��� 5�� ���
select rownum, ename,hiredate from hire_view;

select rownum, ename, hiredate from hire_view where rownum<=5;

--4) �ζ��� ��(���������� ������� ��)
-- �Ի����� ���� ��� 5���� �˻�
select rownum, ename, hiredate from (select ename,hiredate from emp order by hiredate asc) where rownum<=5;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Q2. ������̺��� �����ȣ(empno)�� ���� ���5��˻�
--1) �����ȣ�� ���� ��������� ����
select empno, ename from emp order by empno asc;

--2) ����� 
create or replace view emp_view
as 
select empno, ename from emp order by empno asc;

--3) �����ȣ�� ���� ��� 5�� ���
select rownum, empno, ename from emp_view;

select rownum, empno, ename from emp_view where rownum <=5;

--4) �ζ��� ��
-- �����ȣ�� ���� ��� 5�� �˻�?
select rownum,empno, ename from (select empno,ename from emp order by empno asc) where rownum <=5;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--Q3. ������̺��� �޿��� ���� �޴� ��� 5�� �˻�?
--1) �޿��� ���� �޴� ��������� ����(�޿��� �������� �������� ����)
select ename, sal from emp order by sal desc;

--2)�����
create or replace view sal_view
as
select ename, sal from emp order by sal desc;

--3)�޿��� ���� �޴� ��� 5�� ���
select rownum, ename, sal from sal_view;
select rownum, ename, sal from sal_view where rownum<=5;

--4) �ζ��κ�
select empno,ename,sal 
from (select empno,ename,sal from emp order by sal desc) 
where rownum<=5;

-- �޿��� 3~5��°�� ���� �޴� ����� �˻�

select rnum,empno,ename,sal 
from (select rownum as rnum,empno,ename,sal 
      from (select rownum,empno,ename,sal 
            from emp 
            order by sal desc)
      ) 
where rownum between 3 and 5;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--������(sequence)
-- : ���̺� ���ڸ� �ڵ����� ���� �����ִ� ������ �Ѵ�.

-- ������ ����
create sequence dept_deptno_seq
start with 10       --������ ��ȣ
increment by 10;    --����ġ

--������ ���
select * from seq;
select * from user_sequences;

--currval : �������� ���簪�� ��ȯ
--nextval : �������� �������� ��ȯ

select dept_deptno_seq.nextval from dual;

--��1. �������� ���̺��� �⺻Ű�� �����ϱ�
create table emp01(
    empno number(4) primary key,
    ename varchar2(10),
    hiredate date);
    
-- 1���� 1�� �����Ǵ�  ������ ����
create sequence emp01_seq;
select * from tab;
select * from seq;

--������ �Է�
insert into emp01 values(emp01_seq.nextval,'ȫ�浿',SYSDATE);

select * from emp01;

--��2)
-- ���̺����
create table dept_example(
    deptno number(1) primary key,
    dame varchar2(15),
    loc varchar2(10));
-- ������ ���� : 10���� 10�� �����Ǵ� ������ ����
create sequence dept_example_seq
start with 10
increment by 10;

--������ �Է�
insert into emp01 values(dept_example_seq.nextval,'ȫ�浿',SYSDATE);

--������ ����
-- ���� : drop sequence �������̸�
drop sequence dept_example_seq;

-- ������ �ִ밪�� ����
create sequence dept_seq
start with 10
increment by 10
maxvalue 30;

--������ ��� Ȯ��
select * from seq;

--������ ������ ���ؿ���
select dept_seq.nextval from dual;

--�������� maxvalue���� 30���� 100000���� ���� �غ���.
alter sequence dept_seq maxvalue 100000;