--2024_08_09


--��� ���̺��� ������� �˻��Ͽ� ����� ������ ���ؿ��� ���� ���ν����� ���� �����ϼ���?

--1. ���� ���ν��� ����
create or replace procedure ename_job(
        vename in emp.ename%type,
        vjob out emp.job%type)
is
begin
    select job into vjob from emp where ename = vename;
end;

--2. ���ν��� ��� Ȯ��
select * from  user_source;

--3. ���ε� ���� ����
variable var_job varchar2(10);

--4. ���ν��� ����
execute ename_job('SCOTT', :var_job); 
execute ename_job('KING', :var_job); 
execute ename_job('SMITH', :var_job); 

--5. ���ε� ������ ���� �� ���
print var_job;

------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ŀ��(cursor)
-- : 2�� �̻��� �����͸� ó���Ҷ� Ŀ���� ����Ѵ�.

--Q1. �μ� ���̺��� ��� �����͸� ����ϱ� ���� PL/SQL�� �ۼ�?
--1. ���� ���ν��� ����
create or replace procedure cursor_sample01
is
    vdept dept%rowtype;         -- ���ú���
    
    cursor c1                   -- Ŀ�� ����
    is
    select * from dept;
begin
    dbms_output.put_line('�μ���ȣ  /  �μ���  /  ������');
    dbms_output.put_line('---------------------------');

    open c1;        -- Ŀ�� ����(ù��° �����͸� �����´�.)
    loop    
        fetch c1 into vdept.deptno, vdept.dname, vdept.loc; --����
            exit when c1%notfound; --Ŀ���� ������ �����Ͱ� ������ true
dbms_output.put_line(vdept.deptno||'/'||vdept.dname||'/'||vdept.loc);        
    end loop;
    close c1;       -- Ŀ�� �ݱ�    
end;

--2. ���ν��� ��� Ȯ��
select * from user_source;

--3. ���ν��� ����
execute cursor_sample01;
-----------------------------------------------------------------------------------------------------------------------------------
--Q2. �μ� ���̺��� ��� �����͸� ����ϴ�  PL/SQL�� �ۼ�?
--   For Loop������ ó��
--   1. open ~ fetch ~ close ���� ó���� �� �ִ�.
--   2. for loop���� ����ϰ� �Ǹ�, �� �ݺ������� cursor�� ����
--      �� ���� ����(fetch)�ϰ�, cursor�� �ݴ� �۾��� �ڵ����� ó���� �ش�.

--1.���� ���ν��� ����
create or replace procedure cursor_sample02
is
    vdept dept%rowtype;     -- ���ú���
    
    cursor c1               -- Ŀ�� ����
    is
    select * from dept;
begin
    dbms_output.put_line('�μ���ȣ  /  �μ���  /  ������');
    dbms_output.put_line('---------------------------');
    
    for vdept in c1 LOOP
         exit when c1%notfound; --Ŀ���� ������ �����Ͱ� ������ true
dbms_output.put_line(vdept.deptno||'/'||vdept.dname||'/'||vdept.loc);
    end loop;
end;

--2. ���� ���ν��� ��� Ȯ��
select * from user_source;

--3. ���ν��� ����
execute cursor_sample02;
 

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q3. ������̺��� �μ���ȣ�� �����Ͽ� �ش� �μ��� �Ҽӵ� ����� ������ ����ϴ� ���ν����� Ŀ���� �̿��ؼ� ó���ϼ���
--1. ���� ���ν���
create or replace procedure info_emp(vdeptno in emp.deptno%type)
is
    vemp emp%rowtype;
    cursor c1
    is
    select * from emp where deptno =vdeptno;
begin
    dbms_output.put_line('�μ���ȣ  /   �����ȣ    /   ����� /   ����  /   �޿�');
    dbms_output.put_line('----------------------------------------------------');
    
    for vemp in c1 loop
         dbms_output.put_line(vemp.deptno||'/' ||vemp.empno || '/' ||vemp.ename ||'/' ||vemp.job||'/' ||vemp.sal);
        exit when c1%notfound;
    end loop;
end;

--2. ���� ���ν��� ��� Ȯ��
select * from user_source;

--3. ���ν��� ����
execute info_emp(10);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--��Ű��(package) : ���� ���ν����� ���� �Լ��� ���� ������.
-- ��Ű�� =  ��Ű�� ���+ ��Ű�� �ٵ�
-- ��Ű�� ����
--1. ��Ű�� ��� ����
create or replace package exam_pack
is
    function cal_bonus(vempno in emp.empno%type) -- ���� �Լ�
        return number;
    procedure cursor_sample2;
end;

--2. ��Ű�� �ٵ� ����
create or replace package body exam_pack
is

    --�����Լ� : cal_bonus
    function cal_bonus(vempno in emp.empno%type)
    return number                  -- ������ ���� �ڷ���
    is
        vsal number(7,2);              -- ���ú���
    begin
        select sal into vsal from emp where empno = vempno;
        return vsal * 2;              -- 200% �λ��� �޿��� �����ش�. 
    end;
    
    
    --���� ���ν��� : cursor_ sample2
    procedure cursor_sample2
    is
    vdept dept%rowtype;     -- ���ú���
    
    cursor c1               -- Ŀ�� ����
        is
        select * from dept;
    begin
        dbms_output.put_line('�μ���ȣ  /  �μ���  /  ������');
        dbms_output.put_line('---------------------------');
    
    for vdept in c1 LOOP
        exit when c1%notfound; --Ŀ���� ������ �����Ͱ� ������ true
        dbms_output.put_line(vdept.deptno||'/'||vdept.dname||'/'||vdept.loc);
    end loop;
    end;
end;

--3 ���� ���ν��� ���� : cursor_sample2
exec exam_pack.cursor_sample2;

--4. ���� �Լ� ���� : cal_bonus
--���ε� ���� ����
variable var_res number;

-- ���� �Լ� ����
exec :var_res := exam_pack.cal_bonus(7788);

--���ε� ������ ���� ��� ���
print var_res;

--sql������ �����Լ� ����
select ename ,exam_pack.cal_bonus(7788) as double from emp where empno = 7788;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Ʈ����(trigger)
--1. Ʈ������ ������ �ǹ̴� ��Ƽ��� �ǹ̸� ������ �ִ�.
--2. Ʈ���Ŵ� �̺�Ʈ�� �߻����Ѽ�, ���������� �ٸ� �۾��� �ڵ����� �����Ҷ� ����Ѵ�.
--3. �̺�Ʈ�� DML SQL���� �̿��ؼ� �̺�Ʈ�� �߻����Ѱ�, �̶� ���������� �����(begin~end)���� ������ �ڵ����� ��������ִ� ������ �Ѵ�.

--Q1. ������̺� ����� ��ϵǸ�, "���� ����� �Ի� �߽��ϴ�."��� �޼����� ����ϴ� Ʈ���Ÿ� ���� �ϼ���
--1.��� ���̺� ����
create table emp01(
    empno number(4) primary key,
    ename varchar(20),
    job varchar2(20));
    
select *from tab;

--2. Ʈ���� ����
create or replace trigger trg_01
        after insert on emp01 --�̺�Ʈ�߻�
begin
    dbms_output.put_line('���Ի���� �Ի� �߽��ϴ�.');
end;

--3. Ʈ���� ��� Ȯ��
select * from user_triggers;

--4. �̺�Ʈ �߻�: emp01���̺� ȸ������(������ �Է�)
set serveroutput on
insert into emp01 values(1111,'ȫ�浿','������');
insert into emp01 values(1112,'ȫ�浿','������');
insert into emp01 values(1113,'ȫ�浿','������');
insert into emp01 values(1114,'ȫ�浿','������');

delete from emp01;

commit;

--Q2. ������̺�(emp01)�� ���� ����� ��ϵǸ�, �޿� ���̺�(SAL01)�� �޿������� �ڵ����� �߰� ���ִ� Ʈ���� �����ϼ���
--1. ������̺� : emp01

--2. �޿� ���̺� ���� : SAL01
create table sal01(
    salno number(4) primary key,
    sal number(7,2),
    empno number(4) references emp01(empno));


--3. ������ ����
create sequence sal01_salno_seq; --1���� 1�� �����Ǵ� ������ ����

select * from seq;

--4 Ʈ���� ����
-- :new.�÷��� : insert,update���� �̿��ؼ� �̺�Ʈ�� �߻��� ���
-- :old.�÷��� : delete���� �̿��ؼ� �̺�Ʈ�� �߻��� ���
create or replace trigger trg_02
    after insert on emp01   --�̺�Ʈ ����
    for each row            --�෹�� Ʈ����
begin
    insert into sal01 values(sal01_salno_seq.nextval,300,:new.empno);
end;

--5. Ʈ���� ��� Ȯ��
select * from user_triggers;

--6. �̺�Ʈ �߻� : EMP01
insert into emp01 values(1111,'ȫ�浿','������');

--7. ������ Ȯ��
select * from emp01;

--Q3. ������̺�(EMP01)���� ��������� �����Ǹ�, �޿����̺�(SAL01)�� ������ �ڵ����� �����ϴ� Ʈ���Ÿ� �����϶�
--1.Ʈ���� ����
-- :new.�÷��� : insert,update���� �̿��ؼ� �̺�Ʈ�� �߻��� ���
-- :old.�÷��� : delete���� �̿��ؼ� �̺�Ʈ�� �߻��� ���

create or replace trigger trg_03
    after delete on emp01 --�̺�Ʈ ���� �ڵ�
    for each row
begin
    delete from sal01 where empno = :old.empno;
end;

--2. Ʈ���� ��� Ȯ��
select * from user_triggers;

--3. �̺�Ʈ �߻�
-- : ������̺�(EMP01)�� �����ȣ 1111�� ����� ����(Ż��)�ϸ�, ���������� �޿����̺�(SAL01)�� �޿� ������ ���� �����ȴ�.
delete from emp01 where empno = 1111;

--4. ���� ��� Ȯ��
select * from emp01;
select * from sal01;

