--2024.08.06(ȭ)

--������ ���̽� ������ ���� ����
--1. �ý��� ����
--2. ��ü ����

--�ý��� ���� : �����ͺ��̽� �����ڰ�(DBA)�� ������ �ִ� ����.
-- ex)create user, drop user..


--�ý��۰����ڰ�(DBA)�� �Ϲ� ����ڿ��� �ο��ؾ� �Ǵ� �ý��۱���
--ex) create session : �����ͺ��̽� ���ӱ���
-- create table : ���̺��� ������ �� �ִ� ����
-- create view : �並 ������ �� �ִ� ����
-- create sequence : �������� ������ �� �ִ� ����
-- create procedure : ���������� ������ �� �ִ� ����

-- ���ο� ���� ���� : user01 / tiger
create user user01 IDENTIFIED by tiger;

--������ ���� ��� Ȯ��
select * from dba_users;

-- user01 �������� �����ͺ��̽� ���� ������ �ο� : create session
grant create session to user01;