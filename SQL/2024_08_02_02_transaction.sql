--2024.08.02(��)

--Ʈ�����(Transaction)
--1. �������� �ǹ̴� �ŷ���� �ǹ̸� ������ �ִ�.
--2. ������ �۾�����
--3. Ʈ������� DML(insert, update, delete)SQL������ ���۵ȴ�.
--4. Ʈ������� �������� �ϰ����� �����ϸ鼭, �����͸� ���������� �����ϱ� ���ؼ� ���ȴ�.
--5. Ʈ������� All-or-Nothing ������� ó���ȴ�.

--TCL(Transaction Control Language)
-- commit : Ʈ����� ����
-- rollback : Ʈ������� ���
-- savepoint : ������ ����(������)�� �����ϴ� ����

drop table emp02 purge;

create table dept01 as select * from dept;
select* from dept01;

--1. rollback : Ʈ������� ���
-- ���ο� Ʈ������� ���۵ǰ�, �޸� �󿡼��� DELETE�� ����ȴ�.
delete from dept01;
-- Ʈ������� ����ϱ� ������, �޸𸮻󿡼� DELETE�� �����Ͱ� �����ȴ�.
rollback;
select * from dept01;

--2.commit :Ʈ����� ����
delete from dept01 where deptno=20;
commit;

rollback;

--�ڵ� Ŀ�� : �ڵ����� Ŀ���� ����Ǵ� ��
--1)�������� ���� : quit, exit, con.close()
--2) DDL(create, alter, rename, drop, truncate), DCL(grant, revoke) ����� ����ɶ�

--��1. DDL ����� ����(CREATE)
drop table board purge;
create table dept01 as select * from dept;
select * from dept01;
delete from dept01 where deptno=40;
--DDL(create) SQL���� ����Ǹ� �ڵ����� commit�� ����ȴ�.
create table dept03 as select * from dept; --�ڵ� Ŀ��
rollback;--������ 40�� �μ��� ���͵��� �ʴ´�.

--��2. DDL ����� ����(TRUNCATE)
--DELETE (DML) : ������ ������ �����ϴ�. 
--TRUNCATE (DDL) : �ڵ� Ŀ���� ����Ǳ� ������ ������ �����͸� ������ �� ����.

select * from dept01;
delete from dept01 where deptno = 30;
rollback; --������ ������

truncate table dept01; --DDL(TRUNCATE) �ڵ� Ŀ�Լ���

rollback; -- ������ �����ʹ� ���� �ȉ�

-- �ڵ� �ѹ� : �ڵ����� �ѹ��� ����Ǵ� ��.
-- : ���������� ���� - ������ â�� �ݴ� ���, ��ǻ�Ͱ� �ٿ�Ǵ� ���

--savepoint : �ӽ� �������� �����ҋ� ���Ǵ� ���

-- [�ǽ�]
-- 1. dept01���̺� ����
create table dept01 as select * from dept;
select * from dept01;
-- 2. 40�� �μ� ����
delete from dept01 where deptno = 40;
-- 3. commit����: Ʈ����� ����
commit;
-- 4. 30�� �μ� ����
delete from dept01 where deptno = 30;

-- 5. c1������ ����
savepoint c1;

-- 6. 20�� �μ� ����
delete from dept01 where deptno = 20;

-- 7. c2 ������ ����
savepoint c2;

--  8. 10�� �μ� ����
delete from dept01 where deptno = 10;

--  9. c2 ���������� ����
rollback to c2; --10�� �μ� ����
select * from dept01;

-- 10. c1���������� ����
rollback to c1; --20�� �μ� ����
select * from dept01;

-- 11. ������ Ʈ����� ���� ���ĸ� ����
rollback;
select * from dept01;--30�� �μ� ����