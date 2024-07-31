--2024.07.31(��)
--NVL�Լ� : Ư�� row�� ���� null���� ���ϴ� ������ �ٲ۴�.
select to_char(hiredate,'YYYY/MM/DD') from emp;

select ename , nvl(to_char(mgr,'9999'),'CEO') as MANAGER from emp where mgr is null;


--select�� �ִ� ���� ����� dept�� �ִ� row�� ���� ��ŭ ����ϰԵȴ�.
select 10+20 from dept; --30 4�� ���

-- dual���̺�:sys���� ������ ���̺��̰�, ���� ���Ǿ�� ���� �Ǿ� �ִ�.
-- dual���̺��� ������ �Ǿ� �ֱ� ������ ������ ����� �� �ִ�.
-- dual���̺��� �����Ͱ� 1�� �ۿ� ���� ������, �������� 1���� ����Ѵ�.
select 10+20 from dual; --1����� : dual�� ���� ���Ǿ�
select 10+20 from sys.dual;

desc dual;

select * from dual; -- X������ 1�� ����

--���� ���Ǿ� ��
select * from tab;

--1.���� ó�� �Լ�
--abs():���밪�� �����ִ� �Լ�
--      �Լ����� ��ҹ��ڸ� �������� �ʴ´�.
select -10, abs(-10), ABS(-10) FROM dual;

--floor():�Ҽ��� ���ϸ� ������ ����
select 34.5678, floor(34.5678) from dual;

--round():Ư�� �ڸ����� �ݿø��� ���ִ� �Լ�
--round(���,�ڸ���)
select 34.5678,round(34.5678) from dual; -- 35: �Ҽ��� ù°�ڸ����� �ݿø�
select 34.5678,round(34.5678,2) from dual; -- 34.57: �Ҽ��� ��°�ڸ����� �ݿø�
select 34.5678,round(34.5678,-1) from dual; -- 30: ���� �κ� ù°�ڸ����� �ݿø�
select 34.5678,round(35.5678,-1) from dual;

--trunc():Ư���ڸ� �߶󳻴� ����
--trunc(���,�ڸ���)
select trunc(34.5678), trunc(34.5678,2), trunc(34.5678,-1)from dual;

-- mod():�������� �����ִ� �Լ�
select mod(27,2), mod(27,5),mod(27,7) from dual;

select ename from emp where mod(empno,2) =1;

----------------------------------------------------------------------------------------
--2.���� ó�� �Լ�

--upper():�빮�ڷ� ��ȯ ���ִ� �Լ�
select 'Welcome to Oracle', upper('Welcome to Oracle') from dual;

-- lower():�ҹ��ڷ� ��ȯ ���ִ� �Լ�
select 'Welcome to Oracle', lower('Welcome to Oracle') from dual;

--initcap(): �� �ܾ��� ù���ڸ� �빮�ڷ� ��ȯ�ϰ� �������� �ҹ��ڷ� ��ȯ
select 'Welcome to Oracle', initcap('welcome to oracle') from dual;

--Q.��� ���̺��� job�� manager�� ����� �˻��ϴ� sql�� �ۼ�?
select * from emp where job = 'manager'; -- �˻��ȵ�
select * from emp where lower(job) = 'manager';
select * from emp where job = upper('manager');

--length():������ ���̸� ��ȯ�Ѵ�.(���ڼ�)
select length('Oracle'), length('����Ŭ') from dual;

--lengthb(): ���ڿ��� ���̸� ����Ʈ�� �����ִ� �Լ�
--���� 1����: 1Byte, �ѱ� 1����: 3Byte
select lengthb('oracle'),lengthb('����Ŭ') from dual; --�ѱ��� ����Ʈ ũ��� ����Ŭ �������� �ٸ���.

--substr():���ڿ��� �Ϻθ� �����Ҷ� ���Ǵ� �Լ�
--����: substr(���,������ġ,������ ����)
--      ������ ���۹�ȣ�� ���ʿ��� 1������ �����Ѵ�.(0���ƴ�)
select substr('Welcome to Oracle',4,3) from dual;
select substr('Welcome to Oracle',-4,3) from dual; -- -�� ������ �ǹ���->�����ʺ��� 4��° �ڸ��� ���ں��� 3��

--Q1.��� ���̺��� �Ի���(hiredate)�� ��,��,���� �����ϴ� SQL�� �ۼ�?
select substr(hiredate,1,2) as ��,substr(hiredate,4,2) as "��",substr(hiredate,7,2) as "��" from EMP;

--Q2. ������̺��� 87�⵵�� �Ի��� ����� �˻��ϴ� SQL���� �ۼ�
select ename, hiredate from emp where to_number(to_char(hiredate,'YY'))=87;
select ename from emp  where hiredate>='87/01/01' and hiredate<='87/12/31'; 
select ename from emp  where hiredate between '87/01/01' and '87/12/31';

--Q3. ��� ���̺��� ������� E�� ������ ����� �˻��ϴ� SQL�� �ۼ�?
select ename from emp  where substr(ename,-1,1) = 'E';
select ename from emp  where substr(ename,length(ename),1) = 'E';
select ename from emp where ename like '%E';

--instr():Ư�� ������ ��ġ�� �����ִ� �Լ�
--instr(��� , ã�� ����): ���� ���� ������ ������ ��ġ�� ã���ش�.
--instr(���,  ã������, ������ġ, ���° �߰�)

--Q1. ������������� 'o'�� ��ġ�� ã���ش�.
select instr('Welcome to Oracle','o') from dual;--5

--Q2. 6�� ���Ŀ� 2��° �߰ߵ� 'o'�� ��ġ�� ã���ش�.
select instr('Welcome to oracle', 'o',6,2) from dual; --12

--Q3. ��� ���̺��� ������� 3��° �ڸ��� R�� �Ǿ��ִ� ����� �˻��ϴ� SQL�� �ۼ�
select ename from emp where instr(ename,'R',3,1) = 3;
select ename from emp where substr(ename,3,1) = 'R';
select ename from emp where ename like '__R%';

--LPAD() / RPAD() : Ư�� ��ȣ�� ä���ִ� �Լ�
select LPAD('oracle',20,'#') from dual;
select RPAD('oracle',20,'#') from dual;

--Ltrim() / Rtrim():������ �����ִ� �Լ�
select '    Oracle    ', ltrim('    Oracle    ') from dual;
select '    Oracle    ', Rtrim('    Oracle    ') from dual;
--trim():������ �����ִ� �Լ�+Ư�� ���ڸ� �߶󳻴� ���
select '    Oracle    ', trim('    Oracle    ') from dual;
select trim('a' from 'aaaOracleaaa') from dual;
--------------------------------------------------------------------------------------------------------------
--3.��¥ ó�� �Լ�

-- sysdate : �ý����� ��¥�� ���ؿ��� �Լ�
select sysdate from dual;

--Q.��� ���̺��� �� ������� ������� �ٹ��� �ٹ� �ϼ��� ���ϴ� SQL���� �ۼ�
select ename ,trunc(sysdate-hiredate) as workingdays from emp;

--months_between(): �� ��¥ ������ ����� ���� ���� �����ִ� �Լ�
--���� : months_between(date1,date2):date1�� �� �̷��� ��¥���̿��� ����� ���´�.
--Q.��� ���̸����� �� ������� �ٹ��� �������� ���ϴ� SQL�� �ۼ�?
select ename ,trunc(months_between(sysdate,hiredate)) as workingmonths from emp;

--ADD_MONTHS():Ư�� ��¥�� ����� ��¥�� �����ִ� �Լ�
--���� : ADD_MONTHS(date,����� ������)
--Q1. ������̺��� �� ������� �Ի��� ��¥�� 6���� ����� ���ڴ� ���ϴ� SQL�� �ۼ�
select ename,hiredate ,ADD_MONTHS(hiredate,6) as After6months from emp;
--Q2. �츮���� �԰��Ŀ� 6������ ����� ���ڸ� ���ϴ� SQL�� ����?
select ADD_MONTHS('24/07/01',6) from dual;

-- next_day() : �ش� ������ ���� ����� ��¥�� �����ִ� �Լ�
-- ���� : next_day(date, ����)
-- Q: ������ �������� ���� ����� ������� ���������� ���ϴ� SQL�� �ۼ�
SELECT sysdate, next_day(sysdate,'�����') from dual;

--Last_DAY():�ش� ���� ������ ���� �����ִ� �Լ�
--Q1. �� ������� �Ի��� ���� ������ ��¥�� ���ϴ� SQL�� �ۼ�
select hiredate, LAST_DAY(hiredate)as LastDayofMonth from emp;

--Q2. �̹����� ����  ������ ��¥�� ���ϴ� SQL�� �ۼ�?
select sysdate, Last_day(sysdate) from dual;

--Q3. 2024�� 2������ ������ ��¥�� ���ϴ� SQL�� �ۼ�?
select last_day('24/02/01') from dual;

--------------------------------------------------------------------------------------------------------------------------

--4.����ȯ �Լ�
--to_char(),to_date(),to_number()

--1. to_char(): ��¥��, ������ �����͸� ���������� ��ȯ ���ִ� �Լ�

--1)��¥�� �����͸� ���������� ��ȯ
--  ���� : to_char(��¥������,'�������')
-- Q1. ���� �ý����� ��¥�� ��,��,��,��,��,��,���Ϸ� ���
select to_char(sysdate,'YYYY/MM/DD am HH:MI:SS DY') as now from dual;
select hiredate,to_char(hiredate,'YYYY/MM/DD am HH:MI:SS DY') as now from emp;

--2)������ �����͸� ���������� ��ȯ
--���� : To_char(���ڵ�����, '���б�ȣ')
--Q1. ���� 1230000�� 3�ڸ��� �ĸ��� �����ؼ� ���
select 1230000 from dual;

--�ڸ����� 0���������ϸ�, �������� ���̰� 9�ڸ��� ���� ������ 0���� ä���.
select 1230000, to_char(1230000,'000,000,000') from dual; --001,230,000

--�ڸ����� 9���������ϸ�, �������� ���̰� 9�ڸ��� ���� �ʾƵ� ä���� �ʴ´�.
select 1230000, to_char(1230000,'999,999,999') from dual; --1,230,000

--Q2. ��� ���̺��� �� ������� �޿��� 3�ڸ��� �ĸ���(,)�����ؼ� ���
select ename, sal, to_char(sal,'999,999,999') as "NEW SAL" from emp;
select ename, sal, to_char(sal,'L999,999,999') as "NEW SAL" from emp; --L�� ���ؼ� �ü������ ��ȭ��ȣ�� �տ� ����
select ename, sal, to_char(sal,'999,999,999L') as "NEW SAL" from emp; --L�� ���ؼ� �ü������ ��ȭ��ȣ�� �ڿ� ����

--2. to_date() : ������ �����͸� ��¥������ ��ȯ ���ִ� �Լ�
--���� : to_date('���� ������','��¥ format')
--Q1.2024�� 1�� 1�� ���� ���� ��������� �ϼ��� ���ϴ� SQL�� �ۼ�
select trunc(sysdate-to_date('2024/01/01','YY/MM/DD')) as today from dual;

--Q2.2024�� 12�� 25�� ���� ���� �ϼ��� ���ϴ� SQL�� �ۼ�
select trunc(to_date('2024/12/25','YY/MM/DD') -  sysdate) as chrismas from dual;

--Q3. 2024/07/01~2024/12/23�� �����ϼ� ���
select trunc(to_date('2024/12/23','YY/MM/DD')-to_date('2024/07/01','YY/MM/DD')) as during from dual;

--3. to_number() : ������ �����͸� ���������� ��ȯ���ִ� �Լ�
-- ���� : to_number('���� ������','���б�ȣ')
select to_number('20,000','99,999') - to_number('10,000','99,999') from dual;

------------------------------------------------------------------------------------------------------------------------------------------

--nvl() : null���� �ٸ������� ��ȯ���ִ� �Լ�
--1. null���� �������� ���� ���� �ǹ��Ѵ�. ���� ����.
--2. null���� �������(+,-,*,/)�� ���� �ʴ´�.

--Q.��� ���̺��� �� ������� ������ ���?
--���� = �޿�(SAL) * 12 + Ŀ�̼�(COMM)
--nvl(comm , 0) : comm�÷����� null�� �����͸� 0���� ġȯ

select ename, sal*12+nvl(comm,0) as "����" from emp;

-----------------------------------------------------------------------------------------------------------------------------------------

--decode() : switch ~ case ������ ����
--���� : decode(�÷���, ��1, ���1,
--                    ��2, ��� 2,
--                    ��3, ��� 3,
--                    ��N, ���N);

--Q.��� ���̺��� �μ���ȣ(depthno)�� �μ������� �ٲ㼭 ����ϴ� SQL�� �ۼ�
select ename,
       deptno,
       decode(deptno,10,'ACCOUNTING',
                     20,'RESEARCH',
                     30,'SALES',
                     40,'OPERATIONS') as dname 
from emp;

------------------------------------------------------------------------------------------------------------------------------------------------------------

-- case�Լ� : if ~else if������ ����
-- ���� :  case when ����1 then ���1
--             when ����2 then ���2
--             else ���3
--        end

--Q. ������̺��� �μ���ȣ(deptno)�� �μ������� �ٲ㼭 ����ϴ� SQL�� �ۼ�
select ename,
       deptno,
       case when deptno=10 then 'ACCOUNTING'
            when deptno=20 then 'RESEARCH'
            when deptno=30 then 'SALES'
            when deptno=40 then 'OPERATIONS'
        end as dname 
from emp;

----------------------------------------------------------------------------------------------------------------------------
--�׷��Լ�: �ϳ� �̻��� �����͸� �׷����� ��� ������ �����ϰ�, �ϳ��� ����� ó�����ִ� �Լ�

--sum() :���� �����ִ� �Լ�
select sum(sal) as sal from emp;
select sum(comm) as comm from emp; -- comm�� ��, NULL���� ������ ������ ������ ��
select sum(ename) from emp; -- ������ �����͵��� ��������� ���ϱ� ������ ���� �߻�

--�׷��Լ������� ���� ����� �� �ִ�.
select sum(sal) as sal , sum(comm) as comm from emp;
-- �Ϲ� �÷��� �׷��Լ� ������ ���� ��� X ->�׷��Լ��� 1���� ����� �����ϹǷ� �������� row���� ������ �ִ� �Ϲ� �÷��� ���� ������� ���Ѵ�.
select sal , sum(sal) as sal , sum(comm) as comm from emp; 

select sum(sal) from emp where deptno = 10;
select sum(sal) from emp where deptno = 20;
select sum(sal) from emp where deptno = 30;
select sum(sal) from emp where deptno = 40;

--avg() : ��հ��� �����ִ� �Լ�
select avg(sal) from emp;
select avg(sal), avg(comm) from emp;
select avg(sal), avg(comm) from emp where deptno = 10;
select avg(sal), avg(comm) from emp where deptno = 20;
select avg(sal), avg(comm) from emp where deptno = 30;

--max() : �ִ밪�� �����ִ� �Լ�
--Q1. ������̺��� �ִ� �޿� �ݾ��� ���غ���?
select max(sal) from emp; 

--Q2. ������̺��� �ִ�޿��� �ִ� �޿��� �޴� ������� ����ϴ� SQL��
with maxsal as
(select max(sal) as maxv from emp)
select maxsal.maxv as sal, emp.ename from maxsal,emp where sal = maxsal.maxv;

--Q3. ������̺��� ���� �ֱٿ� �Ի��� ����� �Ի����� ����ϴ� SQL�� �ۼ�?
select max(hiredate) from emp;
--��������
select hiredate from emp order by hiredate desc;

--Q4. ��� ���̺��� ������� ���ĺ����� ���� ���߿� ������ ������� ���ϴ� SQL
select max(ename) from emp;
--�������� ����(�������� ����)
select ename from emp order by ename desc;

-- min() : �ּҰ��� �����ִ� �Լ�
--Q1. ��� ���̺��� �ּұ޿� �ݾ��� ���غ���?
select min(sal) from emp;

--Q2. ��� ���̺��� ���� ���� �Ի��� �Ի����� ���غ���?
select min(hiredate) from emp;
--�������� ����(�̸���¥�� ����)
select hiredate from emp order by hiredate asc;

--�׷��Լ����� ���� ����� �� �ִ�.
select sum(sal),avg(sal),max(sal),min(sal) from emp;



with lastestemp as
(select max(hiredate) as lastest from emp)
select lastestemp.lastest as sal, emp.ename from lastestemp,emp where hiredate = lastestemp.lastest;

with maxsal as
(select max(sal) as maxv from emp)
select maxsal.maxv as sal, emp.ename from maxsal,emp where sal = maxsal.maxv;