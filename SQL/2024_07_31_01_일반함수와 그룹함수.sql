--2024.07.31(수)
--NVL함수 : 특정 row가 가진 null값을 원하는 값으로 바꾼다.
select to_char(hiredate,'YYYY/MM/DD') from emp;

select ename , nvl(to_char(mgr,'9999'),'CEO') as MANAGER from emp where mgr is null;


--select에 있는 연산 결과를 dept에 있는 row의 갯수 만큼 출력하게된다.
select 10+20 from dept; --30 4개 출력

-- dual테이블:sys계정 소유의 테이블이고, 공개 동의어로 설정 되어 있다.
-- dual테이블은 공개가 되어 있기 때문에 누구나 사용할 수 있다.
-- dual테이블은 데이터가 1개 밖에 없기 때문에, 연산결과를 1번만 출력한다.
select 10+20 from dual; --1개출력 : dual이 공개 동의어
select 10+20 from sys.dual;

desc dual;

select * from dual; -- X데이터 1개 있음

--공개 동의어 예
select * from tab;

--1.숫자 처리 함수
--abs():절대값을 구해주는 함수
--      함수명은 대소문자를 구분하지 않는다.
select -10, abs(-10), ABS(-10) FROM dual;

--floor():소수점 이하를 버리는 역할
select 34.5678, floor(34.5678) from dual;

--round():특정 자리에서 반올림을 해주는 함수
--round(대상값,자리수)
select 34.5678,round(34.5678) from dual; -- 35: 소수점 첫째자리에서 반올림
select 34.5678,round(34.5678,2) from dual; -- 34.57: 소수점 셋째자리에서 반올림
select 34.5678,round(34.5678,-1) from dual; -- 30: 정수 부분 첫째자리에서 반올림
select 34.5678,round(35.5678,-1) from dual;

--trunc():특정자리 잘라내는 역할
--trunc(대상값,자리수)
select trunc(34.5678), trunc(34.5678,2), trunc(34.5678,-1)from dual;

-- mod():나머지를 구해주는 함수
select mod(27,2), mod(27,5),mod(27,7) from dual;

select ename from emp where mod(empno,2) =1;

----------------------------------------------------------------------------------------
--2.문자 처리 함수

--upper():대문자로 변환 해주는 함수
select 'Welcome to Oracle', upper('Welcome to Oracle') from dual;

-- lower():소문자로 변환 해주는 함수
select 'Welcome to Oracle', lower('Welcome to Oracle') from dual;

--initcap(): 각 단어의 첫글자를 대문자로 변환하고 나머지를 소문자로 변환
select 'Welcome to Oracle', initcap('welcome to oracle') from dual;

--Q.사원 테이블에서 job이 manager인 사원을 검색하는 sql문 작성?
select * from emp where job = 'manager'; -- 검색안됨
select * from emp where lower(job) = 'manager';
select * from emp where job = upper('manager');

--length():문자의 길이를 반환한다.(글자수)
select length('Oracle'), length('오라클') from dual;

--lengthb(): 문자열의 길이를 바이트로 구해주는 함수
--영문 1글자: 1Byte, 한글 1글자: 3Byte
select lengthb('oracle'),lengthb('오라클') from dual; --한글의 바이트 크기는 오라클 버전마다 다르다.

--substr():문자열의 일부를 추출할때 사용되는 함수
--형식: substr(대상,시작위치,추출할 개수)
--      추출할 시작번호는 왼쪽에서 1번부터 시작한다.(0번아님)
select substr('Welcome to Oracle',4,3) from dual;
select substr('Welcome to Oracle',-4,3) from dual; -- -는 방향을 의미함->오른쪽부터 4번째 자리의 글자부터 3개

--Q1.사원 테이블에서 입사일(hiredate)을 연,월,일을 추출하는 SQL문 작성?
select substr(hiredate,1,2) as 연,substr(hiredate,4,2) as "월",substr(hiredate,7,2) as "일" from EMP;

--Q2. 사원테이블에서 87년도에 입사한 사원을 검색하는 SQL문을 작성
select ename, hiredate from emp where to_number(to_char(hiredate,'YY'))=87;
select ename from emp  where hiredate>='87/01/01' and hiredate<='87/12/31'; 
select ename from emp  where hiredate between '87/01/01' and '87/12/31';

--Q3. 사원 테이블에서 사원명이 E로 끝나는 사원을 검색하는 SQL문 작성?
select ename from emp  where substr(ename,-1,1) = 'E';
select ename from emp  where substr(ename,length(ename),1) = 'E';
select ename from emp where ename like '%E';

--instr():특정 문자의 위치를 구해주는 함수
--instr(대상 , 찾을 문자): 가장 먼저 나오는 문자의 위치를 찾아준다.
--instr(대상,  찾을문자, 시작위치, 몇번째 발견)

--Q1. 가장먼저나오는 'o'의 위치를 찾아준다.
select instr('Welcome to Oracle','o') from dual;--5

--Q2. 6번 이후에 2번째 발견된 'o'의 위치를 찾아준다.
select instr('Welcome to oracle', 'o',6,2) from dual; --12

--Q3. 사원 테이블에서 사원명의 3번째 자리가 R로 되어있는 사원을 검색하는 SQL문 작성
select ename from emp where instr(ename,'R',3,1) = 3;
select ename from emp where substr(ename,3,1) = 'R';
select ename from emp where ename like '__R%';

--LPAD() / RPAD() : 특정 기호를 채워주는 함수
select LPAD('oracle',20,'#') from dual;
select RPAD('oracle',20,'#') from dual;

--Ltrim() / Rtrim():공백을 지워주는 함수
select '    Oracle    ', ltrim('    Oracle    ') from dual;
select '    Oracle    ', Rtrim('    Oracle    ') from dual;
--trim():공백을 지워주는 함수+특정 문자를 잘라내는 기능
select '    Oracle    ', trim('    Oracle    ') from dual;
select trim('a' from 'aaaOracleaaa') from dual;
--------------------------------------------------------------------------------------------------------------
--3.날짜 처리 함수

-- sysdate : 시스템의 날짜를 구해오는 함수
select sysdate from dual;

--Q.사원 테이블에서 각 사원들의 현재까지 근무한 근무 일수를 구하는 SQL문을 작성
select ename ,trunc(sysdate-hiredate) as workingdays from emp;

--months_between(): 두 날짜 사이의 경과된 개월 수를 구해주는 함수
--형식 : months_between(date1,date2):date1이 더 미래의 날짜값이여야 양수가 나온다.
--Q.사원 테이를에서 각 사원들의 근무한 개월수를 구하는 SQL문 작성?
select ename ,trunc(months_between(sysdate,hiredate)) as workingmonths from emp;

--ADD_MONTHS():특정 날짜에 경과된 날짜를 구해주는 함수
--형식 : ADD_MONTHS(date,경과된 개월수)
--Q1. 사원테이블에서 각 사원들의 입사한 날짜에 6개월 경과된 일자는 구하는 SQL문 작성
select ename,hiredate ,ADD_MONTHS(hiredate,6) as After6months from emp;
--Q2. 우리과정 입과후에 6개월이 경과된 일자를 구하는 SQL문 과성?
select ADD_MONTHS('24/07/01',6) from dual;

-- next_day() : 해당 요일의 가장 가까운 날짜를 구해주는 함수
-- 형식 : next_day(date, 요일)
-- Q: 오늘을 기준으로 가장 가까운 토요일이 언제인지를 구하는 SQL문 작성
SELECT sysdate, next_day(sysdate,'토요일') from dual;

--Last_DAY():해당 달의 마지막 날을 구해주는 함수
--Q1. 각 사원들이 입사한 달의 마지막 날짜를 구하는 SQL문 작성
select hiredate, LAST_DAY(hiredate)as LastDayofMonth from emp;

--Q2. 이번달의 가장  마지막 날짜를 구하는 SQL문 작성?
select sysdate, Last_day(sysdate) from dual;

--Q3. 2024년 2월달의 마지막 날짜를 구하는 SQL문 작성?
select last_day('24/02/01') from dual;

--------------------------------------------------------------------------------------------------------------------------

--4.형변환 함수
--to_char(),to_date(),to_number()

--1. to_char(): 날짜형, 숫자형 데이터를 문자형으로 변환 해주는 함수

--1)날짜형 데이터를 문자형으로 변환
--  형식 : to_char(날짜데이터,'출력형식')
-- Q1. 현재 시스템의 날짜를 연,월,일,시,분,초,요일로 출력
select to_char(sysdate,'YYYY/MM/DD am HH:MI:SS DY') as now from dual;
select hiredate,to_char(hiredate,'YYYY/MM/DD am HH:MI:SS DY') as now from emp;

--2)숫자형 데이터를 문자형으로 변환
--형식 : To_char(숫자데이터, '구분기호')
--Q1. 숫자 1230000을 3자리씩 컴마로 구분해서 출력
select 1230000 from dual;

--자리수를 0으로지정하면, 데이터의 길이가 9자리가 되지 않으면 0으로 채운다.
select 1230000, to_char(1230000,'000,000,000') from dual; --001,230,000

--자리수를 9으로지정하면, 데이터의 길이가 9자리가 되지 않아도 채우지 않는다.
select 1230000, to_char(1230000,'999,999,999') from dual; --1,230,000

--Q2. 사원 테이블의 각 사원들의 급여를 3자리씩 컴마로(,)구분해서 출력
select ename, sal, to_char(sal,'999,999,999') as "NEW SAL" from emp;
select ename, sal, to_char(sal,'L999,999,999') as "NEW SAL" from emp; --L을 통해서 운영체제상의 동화기호를 앞에 붙음
select ename, sal, to_char(sal,'999,999,999L') as "NEW SAL" from emp; --L을 통해서 운영체제상의 동화기호를 뒤에 붙음

--2. to_date() : 문자형 데이터를 날짜형으로 변환 해주는 함수
--형식 : to_date('문자 데이터','날짜 format')
--Q1.2024년 1월 1일 부터 현재 까지경과된 일수를 구하는 SQL문 작성
select trunc(sysdate-to_date('2024/01/01','YY/MM/DD')) as today from dual;

--Q2.2024년 12월 25일 까지 남은 일수를 구하는 SQL문 작성
select trunc(to_date('2024/12/25','YY/MM/DD') -  sysdate) as chrismas from dual;

--Q3. 2024/07/01~2024/12/23의 교육일수 계산
select trunc(to_date('2024/12/23','YY/MM/DD')-to_date('2024/07/01','YY/MM/DD')) as during from dual;

--3. to_number() : 문자형 데이터를 숫자형으로 변환해주는 함수
-- 형식 : to_number('문자 데이터','구분기호')
select to_number('20,000','99,999') - to_number('10,000','99,999') from dual;

------------------------------------------------------------------------------------------------------------------------------------------

--nvl() : null값을 다른값으로 변환해주는 함수
--1. null값은 정해지지 않은 값을 의미한다. 값이 없다.
--2. null값은 산술연산(+,-,*,/)이 되지 않는다.

--Q.사원 테이블에서 각 사원들의 연봉을 계산?
--연봉 = 급여(SAL) * 12 + 커미션(COMM)
--nvl(comm , 0) : comm컬럼값이 null인 데이터를 0으로 치환

select ename, sal*12+nvl(comm,0) as "연봉" from emp;

-----------------------------------------------------------------------------------------------------------------------------------------

--decode() : switch ~ case 구문과 유사
--형식 : decode(컬럼명, 값1, 결과1,
--                    값2, 결과 2,
--                    값3, 결과 3,
--                    값N, 결과N);

--Q.사원 테이블에서 부서번호(depthno)를 부서명으로 바꿔서 출력하는 SQL문 작성
select ename,
       deptno,
       decode(deptno,10,'ACCOUNTING',
                     20,'RESEARCH',
                     30,'SALES',
                     40,'OPERATIONS') as dname 
from emp;

------------------------------------------------------------------------------------------------------------------------------------------------------------

-- case함수 : if ~else if구문과 유사
-- 형식 :  case when 조건1 then 결과1
--             when 조건2 then 결과2
--             else 결과3
--        end

--Q. 사원테이블에서 부서번호(deptno)를 부서명으로 바꿔서 출력하는 SQL문 작성
select ename,
       deptno,
       case when deptno=10 then 'ACCOUNTING'
            when deptno=20 then 'RESEARCH'
            when deptno=30 then 'SALES'
            when deptno=40 then 'OPERATIONS'
        end as dname 
from emp;

----------------------------------------------------------------------------------------------------------------------------
--그룹함수: 하나 이상의 데이터를 그룹으로 묶어서 연산을 수행하고, 하나의 결과로 처리해주는 함수

--sum() :합을 구해주는 함수
select sum(sal) as sal from emp;
select sum(comm) as comm from emp; -- comm의 합, NULL값을 제외한 나머지 값들의 합
select sum(ename) from emp; -- 문자형 데이터들은 산술연산을 못하기 때문에 오류 발생

--그룹함수끼리는 같이 사용할 수 있다.
select sum(sal) as sal , sum(comm) as comm from emp;
-- 일반 컬럼과 그룹함수 끼리는 같이 사용 X ->그룹함수는 1개의 결과만 제공하므로 여러개의 row값을 가질수 있는 일반 컬럼과 같이 사용하지 못한다.
select sal , sum(sal) as sal , sum(comm) as comm from emp; 

select sum(sal) from emp where deptno = 10;
select sum(sal) from emp where deptno = 20;
select sum(sal) from emp where deptno = 30;
select sum(sal) from emp where deptno = 40;

--avg() : 평균값을 구해주는 함수
select avg(sal) from emp;
select avg(sal), avg(comm) from emp;
select avg(sal), avg(comm) from emp where deptno = 10;
select avg(sal), avg(comm) from emp where deptno = 20;
select avg(sal), avg(comm) from emp where deptno = 30;

--max() : 최대값을 구해주는 함수
--Q1. 사원테이블에서 최대 급여 금액을 구해보자?
select max(sal) from emp; 

--Q2. 사원테이블에서 최대급여와 최대 급여를 받는 사원명을 출력하는 SQL문
with maxsal as
(select max(sal) as maxv from emp)
select maxsal.maxv as sal, emp.ename from maxsal,emp where sal = maxsal.maxv;

--Q3. 사원테이블에서 가장 최근에 입사한 사원의 입사일을 출력하는 SQL문 작성?
select max(hiredate) from emp;
--내림차순
select hiredate from emp order by hiredate desc;

--Q4. 사원 테이블에서 사원명이 알파벳으로 가장 나중에 나오는 사원명을 구하는 SQL
select max(ename) from emp;
--내림차순 정렬(사전역순 정렬)
select ename from emp order by ename desc;

-- min() : 최소값을 구해주는 함수
--Q1. 사원 테이블에서 최소급여 금액을 구해보자?
select min(sal) from emp;

--Q2. 사원 테이블에서 가장 먼저 입사한 입사일을 구해보자?
select min(hiredate) from emp;
--오름차순 정렬(이른날짜순 정렬)
select hiredate from emp order by hiredate asc;

--그룹함수들은 같이 사용할 수 있다.
select sum(sal),avg(sal),max(sal),min(sal) from emp;



with lastestemp as
(select max(hiredate) as lastest from emp)
select lastestemp.lastest as sal, emp.ename from lastestemp,emp where hiredate = lastestemp.lastest;

with maxsal as
(select max(sal) as maxv from emp)
select maxsal.maxv as sal, emp.ename from maxsal,emp where sal = maxsal.maxv;
