--2024.08.08

--����.
--      Q1. ����ǿ� ���� �Ի��� ������� ���ο� ������ ������ �ַ��� 
--          �մϴ�.�Ʒ��� �䱸 ������ �����ϴ� SQL���� ���� �ۼ� �ϼ��� ? 
--   
--   [�䱸1] USER�� : woman, �н����� : tiger 
--   [�䱸2] CREATE SESSION �̶�� �ý��� ������ �ο��� �ݴϴ�. 
--	  (��, �� �ٸ� �������Ե� ������ �� �� �ֵ��� 
--	      WITH ADMIN OPTION�� �ο��մϴ�). 
--   [�䱸3] woman�������� connect, resource, dba ������ �ο��մϴ�.
--
--   Q2. user01 ������ ���� �ϼ���? (��й�ȣ: tiger)
--
--   Q3. user01 �������� ����Ŭ ������ ���̽��� �����ؼ�, ���̺��� ����
--	�� �� �ִ� ������ �ο��Ͻÿ�.


--Ans 1. 
create user woman identified by tiger;

grant create session to woman with admin option;

grant connect, resource, dba to woman;


--Ans 2. 
create user user01 identified by tiger;


--Ans 3. 
grant create session, create table to user01;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ���ǹ�(=���ù�)

--1. if  ~  then   ~ end if 
--Q1. ������̺�(EMP)���� SCOTT ����� �μ���ȣ�� �˻��ؼ�, �μ����� ����ϴ�
--    PL/SQL���� �ۼ� �ϼ���?

SET SERVEROUTPUT ON
declare
    vempno number(4);
    vename varchar2(20);
    vdeptno dept.deptno%type;
    vdname varchar2(20) := null;
begin
    select empno, ename, deptno into vempno, vename, vdeptno from emp
        where ename='SCOTT';

    if vdeptno = 10 then
        vdname := 'ACCOUNTING';
    end if;
    if vdeptno = 20 then
        vdname := 'RESEARCH';
    end if;
    if vdeptno = 30 then
        vdname := 'SALES';
    end if;
    if vdeptno = 40 then
        vdname := 'OPERATIONS';
    end if;
    
    dbms_output.put_line('���  /  �̸�  /  �μ���');
    dbms_output.put_line('-----------------------');
    dbms_output.put_line(vempno || '/' || vename || '/' || vdname);
end;


--Q2. ��� ���̺��� SCOTT����� ������ ���ϴ� PL/SQL�� �ۼ�?
set SERVEROUTPUT on
declare
    -- %rowtype : emp���̺��� 8�� �÷��� �ڷ����� ��� �����Ѵٴ� �ǹ̸� ������ �ִ�.
    vemp emp%rowtype; -- ���۷��� ����
    annsal number(7,2); -- ��Į�� ����
begin
    select * into vemp from emp where ename = 'SCOTT';
    if vemp.comm is null then vemp.comm :=0;
    end if;
    annsal := vemp.sal * 12 + vemp.comm;
    
    dbms_output.put_line('��� /   �̸�  /   ����');
    dbms_output.put_line('---------------------');
    dbms_output.put_line(vemp.empno || '/' ||vemp.ename||'/'||annsal);
end;

--2. if ~ then ~ else ~ end if
--Q. ��� ���̺��� SCOTT����� ������ ���ϴ� PL/SQL�� �ۼ�
SET SERVEROUTPUT on
declare
    vemp emp%rowtype; -- ���۷��� ����
    annsal number(7,2); -- ��Į�� ����
begin
    select * into vemp
    from emp
    where ename = 'SCOTT';
    
    if vemp.comm is null then annsal := vemp.sal*12;
    else annsal := vemp.sal*12+vemp.comm;
    end if;
    
    dbms_output.put_line('���    /   �̸�  /   ����');
    dbms_output.put_line('-------------------------');
    dbms_output.put_line(vemp.empno ||'/'||vemp.ename||'/'||annsal);
    
end;

--3. if ~ then ~ elsif ~ else ~ end if;
--Q. SCOTT����� �μ���ȣ�� �̿��ؼ� �μ����� ���ϴ� PL/SQL�� �ۼ�?
SET SERVEROUTPUT ON
declare
    vemp emp%rowtype;       --���۷��� ����
    vdname varchar2(14);    --��Į�� ����
begin
    select * into vemp from emp where ename= 'SCOTT';
    
    if vemp.deptno = 10 then vdname := 'ACCOUTING';
    elsif vemp.deptno = 20 then vdname := 'RESEARCH';
    elsif vemp.deptno = 30 then vdname := 'SALES';
    elsif vemp.deptno = 40 then vdname := 'OPERATION';
    end if;
    
    dbms_OUTPUT.put_line('���    /   �̸�  /   �μ���');
    dbms_OUTPUT.put_line('--------------------------');
    dbms_OUTPUT.put_line(vemp.empno||'/'||vemp.ename||'/'||vdname);
end;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--�ݺ���
--1. basic loop��
-- loop
--      �ݺ� ����� ����;
--      ���ǽ� exit;
-- end loop;

--Q1. Basi Loop������ 1~5���� ���?
SET SERVEROUTPUT ON
declare
    n number := 1; -- n������ �ʱⰪ�� 1�� ����
begin
    loop
        dbms_output.put_line(n);
        n := n+1;
        if n>5 then exit;
        end if;
    end loop;
end;

set serveroutput on
declare
    n number := 1;      --n������ �ʱⰪ�� 1�� ����
begin
    loop
        dbms_output.put_line(n);
        n := n + 1;
        if n > 1000000 then
            exit;     -- loop���� ���� ����
        end if;
    end loop;
end;
--ORA-20000: ORU-10027: buffer overflow, limit of 1000000 bytes

--Q2. 1���� 10���� ���� ���ϴ� ���α׷��� �ۼ�?
declare
    n number := 1;  --������ ���� ����
    s number := 0;  --���� ������ ����
begin
    loop
        s := s + n; --s������ ���� ����
        n := n + 1;
        if n>10 then exit;
        end if;
    end loop;
    dbms_output.put_line('1~10������ ��' || s );
end;

-- 2. FOR LOOP��
-- for ���� in [reverse] ������ .. ū�� loop
--      �ݺ� ����� ����
-- end loop;

--Q1. For Loop������ 1���� 5���� ���
begin
    for n in 1..5 loop          --�ڵ����� 1�� ����
        dbms_output.put_line(n);
--       n := n+2; �����߻� -> for�� ������ ���� ���� ���� ���Ƿ� �����Ұ�
    end loop;
end;

--Q2. For Loop������ 5���� 1���� ���
begin
    for n in reverse 1..5 loop  --�ڵ����� 1�� ����
        dbms_output.put_line(n);
    end loop;
end;

--Q3. For Loop�� �̿��ؼ� �μ����̺�(DEPT)�� ��� ������ ����ϴ� PL/SQL�� �ۼ�?
declare
    vdept dept%rowtype; -- ���۷��� ����
begin
    dbms_output.put_line('�μ���ȣ   /  �μ���    /    ������');
    for cnt IN 1..4 loop
    select * into vdept
    from dept 
    where dept.deptno =10 * cnt;
    dbms_output.put_line(vdept.deptno || '/' || vdept.dname ||'/'|| vdept.loc);
    end loop;
end;

--3 while loop
-- while loop��
-- while ���ǽ� loop
--      �ݺ� ����� ����;
-- end loop;

--Q1. While Loop ������ 1���� 5���� ���?
declare
    n number := 1;
begin
    while n<=5 loop
        dbms_output.put_line(n);
        n := n+1;
    end loop;
end;

--Q2.while loop������ ��(*)�� �ﰢ�� ������� ���
declare
    n number := 1;
    star varchar2(100) := '';
begin
    while n<=10 loop
        star := star || '*';
        dbms_output.put_line(star);
        n := n+1;
    end loop;
end;