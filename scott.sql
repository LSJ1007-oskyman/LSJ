--2024.07.29(��)

--���̺� ���
select * from tab;
--DEPT:�μ� ���̺�
--EMP:��� ���̺�
--BOUNS:�󿩱� ���̺�
--SALGRADE: �޿���� ���̺�

DESCRIBE dept;
desc dept;

--dept ������ �˻�:SQL���� ��ҹ��ڸ� �������� �ʴ´�.
select * from dept;

--EMP ���̺� ����
DESC EMP;

--EMP ���̺� ������ �˻�
select * from EMP;

--����Ŭ�� ������ Ÿ��
--1.���� ������
--number(n)
--ex)number(2):���� 2�ڸ����� ����
--number(n1,n2):n1 - �Ҽ����Ʒ��ڸ� ���� ��ü �ڸ���
--              n2 - �Ҽ����� �Ҵ�� �ڸ���
--ex)number(7,2):��ü�ڸ��� 7,�Ҽ����Ʒ�2�ڸ� ����

--2.���� ������
--char():���� ���� ������
--       �ִ� 2000byte���� ���� ������.
--varchar2():���� ���� ������
--           �ִ� 4000byte ���� ���� ������.
--long:2GB ���� ���� ������.
--     long������ ������ �÷��� �˻� ����� �������� �ʴ´�.<--�ʹ� ū �����͸� �����ؼ�

--3. ��¥ ������
--date: ��/��/�� ���� ������
--timestamp:��/��/�� ��:��:�� ���� ����

--select sql
selet *from dept;
select loc from dpt;
select loc ,dname,deptno from dept;

select * from emp;

--��� ������: +, -,*,/
select sal + comm  from emp;

--Q.������̺�(EMP)�� �Ҽӵ� ������� ������ ���غ���?
-- ���� = �޿�(SAL) * 12 +Ŀ�̼�(comm)

select (sal*12+comm) as ���� from emp;


