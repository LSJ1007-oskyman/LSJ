--2024.08.06(화)

--인덱스(index) : 검색을 빠르게 하기 위해서 사용되는 객체

--인덱스 목록 확인
select * from user_indexes;

--기본키(primary key)로 설정된 컬럼은 자동으로 고유 인덱스로 설정된다.

--[실습]
-- 인덱스 실습 : 인덱스 사용 유.무에 따른 검색 속도 비교

--1. 테이블 생성

--복사본 테이블 생성 :  제약조건은 복사가 되지 않는다.
create table emp01 as select * from emp;

--2. emp01 테이블에 데이터 입력
insert into emp01 select * from emp01;

--3. 검색용 데이터 입력
insert into emp01(empno,ename) values(1111,'홍길동');

--4. 시간측정 타이머 온으로 설정
set timing on;

--5. 검색용 데이터 검색시간을 측정 : 인덱스가 설정되지 않은 경우
select * from emp01 where ename='홍길동';--0.393

--6. 인덱스 생성 : emp01 테이블의 ename 컬럼에 인덱스를 적용
create index idx_emp01_ename on emp01(ename);

--7. 인덱스 목록 확인
select * from user_indexes;

--8. 검색용 데이터로 검색시간을 측정 : emp01테이블의 ename컬럼에 인덱스가 적용됌
select * from emp01 where ename='홍길동'; --0.018

--인덱스 삭제
-- 형식 : drop index index_name;
drop index idx_emp01_ename;

--인덱스 종류
-- 고유 인덱스 : 중복된 데이터가 없는 컬럼에 적용할 수 있는 인덱스
-- 비교유 인덱스 : 중복된 데이터가 있는 컬럼에 적용할 수 있는 인덱스

--1. 테이블 생성
drop table emp01 purge;

-- 테이블 구조만 복사
create table dept01 as select * from dept where 1=2;

--2. 데이터 입력: loc 컬럼에 중복된 데이터 입력
select * from dept01;
insert into dept01 values(10,'인사과','서울');
insert into dept01 values(20,'총무과','대전');
insert into dept01 values(30,'교육팀','대전');

--3. 고유 인덱스 : deptno 컬럼에 고유 인덱스를 적용
create unique index idx_dept01_deptno on dept01(deptno);

--4. 인덱스 목록 확인
select * from user_indexes;

-- 고유인덱스가 설정된 deptno컬럼에 중복데이터를 입력 해보자?
-- deptno컬럼은 고유 인덱스가 설정된 이후에 중복된 데이터를 입력할 수 없다.
insert into dept01 values(30,'교육팀','대전');

--5. 비고유 인덱스
-- :loc컬럼에 고유, 비고유 인덱스를 적용 해보자

-- loc 컬럼에 고유 인덱스 적용

create unique index idx_dept01_loc on dept01(loc); --오류발생

--loc 컬럼에 비고유 인덱스 적용
create index idx_dept01_loc on dept01(loc); --비고유 인덱스 생성

select * from user_indexes;

--6.결합 인덱스: 2개 이상의 컬럼으로 만들어진 인덱스
create index idx_dept01_com on dept01(deptno, dname);

--7. 함수 기반 인덱스 : 수식이나 함수를 적용하여 만든 인덱스
create index idx_emp01_annsal on emp(sal*12+nvl(comm,0));

