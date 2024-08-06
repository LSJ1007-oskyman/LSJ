-- 2024.08.05(월)

--과제.      
--       Q1. SMITH와 동일한 직급을 가진 사원의 이름과 직급을 출력하는 
--           SQL문을 작성 하세요?
--       Q2. 직급이 'SALESMAN'인 사원이 받는 급여들의 최대 급여보다
-- 	         많이 받는 사원들의 이름과 급여를 출력하되 부서번호가 
--	         20번인 사원은 제외한다.(ALL연산자 이용)
--       Q3. 직급이 'SALESMAN'인 사원이 받는 급여들의 최소 급여보다 
-- 	         많이 받는 사원들의 이름과 급여를 출력하되 부서번호가 
--	         20번이 사원은 제외한다.(ANY연산자 이용)

Ans 1.
        SQL> select ename, job from emp where  
             job = (select job from emp where ename='SMITH') 
                 and  ename != 'SMITH';
	     

Ans 2. // 단일행 서브쿼리
        SQL> select deptno, ename, sal from emp where sal > 
            (select max(sal)  from emp where job='SALESMAN') --1600
                and deptno != 20;

         // 다중행 서브쿼리
        SQL> select ename, sal from emp where sal > all
                (select sal from emp where job='SALESMAN') 
                and deptno != 20;

Ans 3. // 단일행 서브쿼리
        SQL> select deptno, ename, sal from emp where sal > 
            (select min(sal)  from emp where job='SALESMAN')--1250
                and deptno != 20;

         // 다중행 서브쿼리
        SQL> select deptno, ename, sal from emp where sal > any
            (select sal from emp where job='SALESMAN') 
             and deptno != 20;
-----------------------------------------------------------------------
-- 무결성 제약조건
-- : 테이블에 부적절한 데이터가 입력되는 것을 막기 위해서 테이블을 생성할때
--    각 컬럼에 대해서 정의하는 여러가지 규칙을 의미한다.
--   ex) not null, unique, primary key(기본키), foreign key(외래키)
--       check, default

--1. not null 제약조건
--  null  값을 허용하지 않는다.
--  반드시 값을 입력 해야 한다.

--[실습]
drop table emp02 purge;

create table emp02(
    empno number(4) not null,
    ename varchar2(12) not null,
    job varchar2(12),
    deptno number(2));
    
select * from tab;  
select * from emp02;

-- 제약조건에 위배되지 않는 데이터 입력
insert into emp02 values(1111,'홍길동','MANAGER',30);

-- 제약조건(NOT NULL)에 위배되기 때문에 데이터 입력이 되지 않는다.
insert into emp02 values(NULL, NULL, 'SALESMAN',30)
insert into emp02(job, deptno) values('SALESMAN',30);

--2. unique 제약조건
-- 유일한 값만 입력할 수 있다.
-- 중복된 값을 입력할 수 없다.
-- null 값은 입력될 수 있다.

drop table emp03 purge;
create table emp03(
    empno number(4) unique,
    ename varchar2(12) not null,
    job varchar2(12),
    deptno number(2));

select * from tab;
select * from emp03;

-- 정상적인 데이터 입력
insert into emp03 values(1111,'홍길동','개발자',10);

-- unique 제약조건에 위배되는 데이터 입력
insert into emp03 values(1111,'홍길동','개발자',20);

-- NULL값은 입력 가능하다.
insert into emp03 values(NULL,'홍길동','개발자',20);
insert into emp03 values(NULL,'안화수','개발자',30);

--3. primary key(기본키) 제약조건
--   primary key = not nll + unique
--   :  반드시 중복되지 않은 데이터를 저장 해야된다.

-- ex. 부서 테이블(DEPT) -   deptno(pk)
--     사원 테이블(EMP) - empno(pk)

--     게시판(board) - 번호(no) : pk
--     회원관리(member) - 아이디(id) : pk

-- 부서 테이블(DEPT) - deptno(pk)
select * from dept;
insert into dept values(10,'개발부','서울'); --unique제약조건 위배
insert into dept values(NULL,'개발부','서울');--not null제약조건 위배

-- 사원 테이블(EMP) - empno(pk)
select * from emp;
insert into emp(empno, ename) values(7788,'홍길동');--unique제약조건 위배
insert into emp(empno, ename) values(NULL,'홍길동');--not null제약조건 위배

drop table emp05 purge;
create table emp05(
    empno number(4) primary key, --반드시 중복되지 않은 값을 입력해야된다.
    ename varchar2(12) not null, --반드시 값을 입력 해야된다.
    job varchar2(12),
    deptno number(2));
    
select * from emp05;    
insert into emp05 values(1111,'홍길동','개발자',20);--정상적인 데이터 입력
insert into emp05 values(1111,'홍길동','개발자',20);--unique제약조건 위배
insert into emp05 values(NULL,'홍길동','개발자',20);--not null제약조건 위배

-- 제약조건 이름(constraint name)을 설정해서 테이블 생성
drop table emp04 purge;
create table emp04(
    empno number(4) constraint emp04_empno_uk unique,
    ename varchar2(10) constraint emp04_ename_nn not null,
    job varchar2(10),
    deptno number(2));
    
--4. foreign key(외래키) 제약조건
--   DEPT(부모 테이블) - deptno(pk) : 부모키 - 10, 20, 30, 40
--   EMP(자식 테이블) - deptno(fk) : 외래키 - 10, 20, 30

--1) 사원테이블(EMP)의 deptno 컬럼이 foreign key 제약조건이 설정되어 있다. 
--2) foreign key(외래키) 제약조건이 가지고 있는 의미는 부모 테이블(DEPT)의
--   부모키(deptno)의 값만 참조할 수 있다.
--3) 부모키가 되기 위한 조건은 primary key나 unique 제약조건으로 설정되어
--   있어야 한다.

--Q. 사원 테이블(EMP)에 새로운 신입사원을 등록 해보자?
-- 외래키(deptno)는 부모키(DEPT-deptno)안에 있는값(10,20,30,40)만 참조할수 있다.
insert into emp(empno, deptno) values(1111, 50);--foreign key제약조건 위배

--[실습]
drop table emp06 purge;
create table emp06(
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(10),
    deptno number(2) references dept(deptno) );

select * from emp06;
insert into emp06 values(1111,'홍길동','개발자',10);
insert into emp06 values(1112,'홍길동','개발자',20);
insert into emp06 values(1113,'홍길동','개발자',30);
insert into emp06 values(1114,'홍길동','개발자',40);
--50번 부서는 부모키에서 참조할 수 없는 값이기 때문에, 외래키 제약조건에
--위배되어서 사용할 수 없다.
insert into emp06 values(1115,'홍길동','개발자',50);--foreign key제약조건 위배
    
--5.check 제약조건
-- : 데이터가 입력될때 특정 조건을 만족하는 데이터만 입력되도록 만들어 주는
--   제약조건 이다.

-- 급여(SAL) : 500 ~ 5000
-- 성별(gender) : M or F
create table emp07(
    empno number(4) primary key,
    ename varchar2(10) not null,
    sal number(7,2) check(sal between 500 and 5000),
    gender varchar2(1) check(gender in('M', 'F')) );
      
select * from emp07;      
insert into emp07 values(1111,'홍길동',3000,'M');--정상적인 데이터 입력     
insert into emp07 values(1112,'홍길동',8000,'M');--check제약조건 위배      
insert into emp07 values(1113,'홍길동',5000,'m');--check제약조건 위배    

--6.default 제약조건
-- : default 제약조건이 설정된 컬럼에 값이 입력되지 않으면, default로 설정된
--   값이 자동으로 입력된다.

drop table dept01 purge;
create table dept01(
    deptno number(2) primary key,
    dname varchar2(14),
    loc varchar2(13) default 'SEOUL');
    
select * from dept01;    
insert into dept01 values(10, 'ACCOUNTING','NEW YORK');
insert into dept01(deptno, dname) values(20, 'RESEARCH');
-----------------------------------------------------------------------
-- 제약조건 설정 방식
--1.컬럼레벨 방식으로 제약조건 설정
--2.테이블레벨 방식으로 제약조건 설정

--1.컬럼레벨 방식으로 제약조건 설정
drop table emp01 purge;

create table emp01(
    empno number(4) primary key,
    ename varchar2(15) not null,
    job varchar2(10) unique,
    doptno number(4) references dept(deptno));

--2.테이블 레벨 방식으로 제약조건 설정
drop table emp02 purge;

create table emp02(
    empno number(4),
    ename varchar2(15) not null, --not null제약조건은 컬럼레벨 방식만 가능함
    job varchar2(10),
    deptno number(4),
    primary key(empno),
    unique(job),
    foreign key(deptno) references dept(deptno));
    
--  제약조건을 설정할때 테이블 레벨 방식만 가능한 경우
--1. 기본키를 복합키로 사용하는 경우(기본키 제약조건을 2개 이상 생성하는것)
--2. alter table 명령으로 제약조건을 추가 

--1. 2개 이상의 컬럼을 기본키로 설정
drop table member01 purge;

--1) 컬럼레벨 방식으로 2개의 컬럼을 primary key로 설정
create table member01(
    id varchar2(20) primary key,
    passwd varchar2(20) primary key);  --  오류발생
    
--02260. 00000 -  "table can have only one primary key"

--2) 테이블레벨 방식으로 2개의 컬럼을 primary key로 설정
create table member01(
    id varchar2(20),
    passwd varchar2(20),
    primary key(id, passwd));
    
--2. alter table 명령으로 제약조건을 추가 
drop table emp01 purge;

--  제약조건 없이 테이블 생성
create table emp01(
    empno number(4),        -- primary key
    ename varchar2(15),     -- not null
    job varchar2(10),       -- unique
    deptno number(2));      -- foreign key

-- primary key 제약조건 추가 : empno
alter table emp01 add primary key(empno);

-- not null 제약조건 추가 : ename
alter table emp01 modify ename not null;   

-- unique 제약조건 추가 : job
alter table emp01 add unique(job);

-- foreign key 제약조건 추가 : deptno
alter table emp01 add foreign key(deptno) references dept(deptno);

-- 제약조건 제거
-- 형식 : alter table 테이블명  drop constraint  constraint_name;

-- primary key 제약조건 제거
alter table emp01 drop  constraint SYS_C007037;
alter table emp01 drop primary key;

-- not null 제약조건 제거
alter table emp01 drop  constraint SYS_C007038;

-- unique 제약조건 제거
alter table emp01 drop constraint SYS_C007039;
alter table emp01 drop unique(job);

-- foreign key 제약조건 제거
alter table emp01 drop constraint SYS_C007040;
---------------------------------------------------------------
-- 제약 조건의 활성화 / 비활성화

--Q.부모 테이블(DEPT)의 데이터를 삭제 해보자?
delete from dept where deptno=10;

--1)자식테이블(EMP)에서 부모키(deptno)를 참조하는 외래키가 있기 때문에
--  부모 테이블의 데이터를 삭제 할 수 없다.
--2)부모테이블(DEPT)의 데이터를 삭제하기 위해서는, 참조하는 자식테이블의 
--  외래키 제약조건을 비활성화 시킨후에 부모 테이블의 데이터를 삭제 할 수 있다.

--1. 부모 테이블 생성
drop table dept01 purge;
create table dept01(
    deptno number(2) primary key,    -- 부모키
    dname varchar2(14),
    loc varchar2(13));

insert into dept01 values(10,'ACCOUNTING','NEW YORK');
select * from dept01;

--2. 자식 테이블 생성
drop table emp01 purge;
create table emp01(
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(10) unique,
    deptno number(2) references dept01(deptno)); --외래키
    
insert into emp01 values(1111,'홍길동','개발자',10);    
select * from emp01;

--3. 부모 테이블(DEPT01)의 데이터를 삭제 해보자?
delete from dept01; --자식테이블(emp01)에서 참조하고 있기 때문에 삭제안됨
select * from dept01;
select * from emp01;

--4. 자식 테이블의 외래키 제약조건을 비활성화 시켜보자?
-- 부모 테이블(DEPT01)의 데이터를 삭제하기 위해서는 자식 테이블(EMP01)의
-- 외래키 제약조건을 비활성화 시키면, 부모 테이블의 데이터를 삭제 할 수 있다.

--  제약조건 비활성화
--형식: alter table  테이블명  disable  constraint constraint_name;
alter table emp01 disable constraint SYS_C007045;

--  제약조건 활성화
--형식: alter table  테이블명  enable  constraint constraint_name;
alter table emp01 enable constraint SYS_C007045;

--5. 부모 테이블의 데이터를 삭제 해보자?
delete from dept01;  -- 참조하는 외래키가 없기 때문에 삭제됨
select * from dept01;
-----------------------------------------------------------------
-- cascade 옵션
--1. cascade 옵션을 붙여서 부모(DEPT01)의 제약조건을 비활성화 시키면,
--   참조하는 있는 자식테이블(EMP01)의 외래키 제약조건도 같이 비활성화 된다.
alter table dept01 disable constraint SYS_C007041 cascade;

--2. cascade 옵션을 붙여서 부모테이블(DEPT01)의 primary key제약조건을 
--   제거하면, 참조하는 자식테이블(EMP01)의 외래키 제약조건도 같이 제거해준다.
alter table dept01 drop constraint SYS_C007041 cascade;
alter table dept01 drop primary key cascade;

--3. 부모 테이블의 데이터가 삭제되면, 참조하는 자식의 데이터도 같이 삭제된다.

--1) 부모 테이블 생성
drop table dept01 purge;
create table dept01(
    deptno number(2) primary key,    -- 부모키
    dname varchar2(14),
    loc varchar2(13));

insert into dept01 values(10,'ACCOUNTING','NEW YORK');
select * from dept01;

--2) 자식 테이블 생성
drop table emp01 purge;
create table emp01(
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(10) unique,
    deptno number(2) references dept01(deptno) on delete cascade );

-- on delete cascade 옵션
-- : 부모 테이블의 데이터를 삭제하면, 참조하는 자식 테이블의 데이터도 같이
--    삭제 해주는 옵션.

insert into emp01 values(1111,'홍길동','개발자',10);    
select * from emp01;

--3.부모 테이블(DEPT01)의 데이터를 삭제 해보자?
delete from dept01 where deptno=10;

select * from dept01;   -- 부모 테이블 데이터 삭제됨
-- on delete cascade 옵션 때문에 자식테이블 데이터도 같이 삭제됨
select * from emp01;  
----------------------------------------------------------------
-- 뷰(view) : 기본 테이블을 이용해서 만들어지 가상 테이블

-- 실습을 위한 기본 테이블 생성 : dept_copy, emp_copy

-- 2개의 기본 테이블 생성
create table dept_copy as select * from dept;
create table emp_copy as select * from emp;

select * from tab;
select * from dept_copy;
select * from emp_copy;

-- 뷰 생성
create view emp_view30
as
select empno, ename, deptno from emp_copy where deptno=30;

-- 뷰목록 확인
select * from tab;
select * from user_views;

--뷰 검색
select * from emp_view30;
desc emp_view30;

--Q. 뷰(emp_view30)에 insert로 데이터를 입력 했을 경우에,
--   기본 테이블(emp_copy)에 데이터가 입력 될까요?
insert into emp_view30 values(1111,'홍길동',30);

-- view에 데이터가 입력 되면, 기본 테이블에도 데이터가 입력 된다.
select * from emp_view30;
select * from emp_copy;








