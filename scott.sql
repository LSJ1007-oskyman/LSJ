--2024.07.29(월)

--테이블 목록
select * from tab;
--DEPT:부서 테이블
--EMP:사원 테이블
--BOUNS:상여금 테이블
--SALGRADE: 급여등급 테이블

DESCRIBE dept;
desc dept;

--dept 데이터 검색:SQL문은 대소문자를 구분하지 않는다.
select * from dept;

--EMP 테이블 구조
DESC EMP;

--EMP 테이블 데이터 검색
select * from EMP;

--오라클의 데이터 타입
--1.숫자 데이터
--number(n)
--ex)number(2):정수 2자리까지 저장
--number(n1,n2):n1 - 소수점아래자리 포함 전체 자리수
--              n2 - 소수점에 할당된 자리수
--ex)number(7,2):전체자리수 7,소수점아래2자리 까지

--2.문자 데이터
--char():고정 길이 문자형
--       최대 2000byte까지 저장 가능함.
--varchar2():가변 길이 문자형
--           최대 4000byte 까지 저장 가능함.
--long:2GB 까지 저장 가능함.
--     long형으로 설정된 컬럼은 검색 기능을 지원하지 않는다.<--너무 큰 데이터를 저장해서

--3. 날짜 데이터
--date: 연/월/일 정보 저장함
--timestamp:년/월/일 시:분:죠 저장 정보

--select sql
selet *from dept;
select loc from dpt;
select loc ,dname,deptno from dept;

select * from emp;

--산술 연산자: +, -,*,/
select sal + comm  from emp;

--Q.사원테이블(EMP)에 소속된 사원들의 연봉을 구해보자?
-- 연봉 = 급여(SAL) * 12 +커미션(comm)

select (sal*12+comm) as 연봉 from emp;


