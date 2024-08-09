-- 2024.08.08(목)

--저장 프로시저
--[실습]
drop table emp01 purge;
create table emp01 as select * from emp;    --복사본 테이블 생성
select * from emp01;

--1. 저장 프로시저 생성
create or replace procedure del_all
is
begin
    delete from emp01;
end;

--2. 프로시저 목록 확인
select * from user_source;

--3. 프로시저 실행
exec del_all;
execute del_all;

--4. 프로시저 실행 결과 확인
select * from emp01;    -- 프로시저에 의해서 모든 데이터가 삭제됨

rollback;
insert into emp01 select * from emp;
-----------------------------------------------------------------
-- 매개변수가 있는 프로시저
-- 매개변수의 mode값 in : 매개변수로 값을 받는 역할 (기본값)
-- 매개변수의 mode값 out : 값을 돌려주는 역할 
--1. 매개변수가 있는 프로시저 생성
create or replace procedure del_ename(vename in emp01.ename%type)
is
begin
    delete from emp01 where ename = vename;
end;

--2. 프로시저 목록 확인
select * from user_source;

--3. 프로시저 실행
execute del_ename('SCOTT');
execute del_ename('KING');
execute del_ename('SMITH');

--4. 프로시저 실행 결과 확인
select * from emp01;
----------------------------------------------------------------
-- 매개변수의 MODE가 in, out 으로 되어있는 프로시저
-- in : 매개변수로 값을 받는 역할
-- out : 매개변수로 값을 돌려주는 역할

--Q.프로시저의 매개변수에 사원번호를 전달해서, 그 사원의 사원명, 급여, 직책을 
--   구하는 프로시저를 생성하고 실행 하세요?
--1. 프로시저 생성
create or replace procedure sal_empno(
    vempno in emp.empno%type,       --사원번호
    vename out emp.ename%type,      --사원명
    vsal out emp.sal%type,          --급여
    vjob out emp.job%type)          --직책
is
begin
    select ename, sal, job into vename, vsal, vjob from emp
        where empno = vempno;
end;

--2.프로시저 목록 확인
select * from user_source;

--3. 바인드 변수 : 프로시저를 실행할때 결과를 돌려받는 변수
variable var_ename varchar2(12);
variable var_sal number;
variable var_job varchar2(10);

--4. 프로시저 실행
execute sal_empno(7788, :var_ename, :var_sal, :var_job);
execute sal_empno(7839, :var_ename, :var_sal, :var_job);

--5. 바인드 변수로 돌려받은 값을 출력
print var_ename;
print var_sal;
print var_job;
-----------------------------------------------------------------------
-- 자바 프로그램으로 프로시저 실행

--예1. 매개변수가 없는 프로시저
--1. 프로시저 생성
create or replace procedure del_all
is
begin
    delete from emp01;
end;

--2. emp01 테이블 생성
drop table emp01 purge;
create table emp01 as select * from emp;
select * from emp01;

--예2. 매개변수가 있는 프로시저 
-- 서브쿼리로 emp01테이블에 데이터 입력
insert into emp01 select * from emp;
select * from emp01;
--1. 프로시저 생성
create or replace procedure del_ename(vename in emp01.ename%type)
is
begin
    delete from emp01 where ename = vename;
end;

-- 자바 프로그램으로 del_ename 프로시저를 실행 해보자?

--2. 프로시저 실행 결과 확인
select * from emp01;

--예3. 매개변수의 MODE가 in, out으로 되어 있는 프로시저
--1. 저장 프로시저 생성
create or replace procedure sel_customer(
    vname in customer.name%type,
    vemail out customer.email%type,
    vtel out customer.tel%type)
is
begin
    select email, tel into vemail, vtel from customer
        where name = vname;
end;

--2. 프로시저 목록 확인
select * from user_source;

select * from customer;
insert into customer values(customer_no_seq.nextval,'ahn',
    'ahn@naver.com','010-2222-2222','서울시',sysdate);

--3. 바인드 변수 생성
variable var_email varchar2(20);
variable var_tel varchar2(20);

--4. 프로시저 실행
execute sel_customer('홍길동', :var_email, :var_tel); 
execute sel_customer('안화수', :var_email, :var_tel);

--5. 바인드 변수로 돌려받은 결과 출력
print var_email;
print var_tel;

-- 자바 프로그램으로 sel_customer 프로시저를 실행 해보자?
------------------------------------------------------------------
-- 저장 함수
-- : 저장 함수는 저장 프로시저와 유사한 기능을 수행하지만, 실행 결과를 돌려주는
--   역할을 한다.

--Q1. 사원 테이블에서 특정 사원의 급여를 200% 인상한 결과를 돌려주는 저장함수를
--    생성 하세요?
--1. 저장 함수
create or replace function cal_bonus(vempno in emp.empno%type)
    return number                  -- 돌려줄 값의 자료형
is
    vsal number(7,2);              -- 로컬변수
begin
    select sal into vsal from emp where empno = vempno;
    return vsal * 2;              -- 200% 인상한 급여를 돌려준다. 
end;

--2. 저장함수 목록 확인
select * from user_source;

--3. 바인드 변수 생성
variable var_res number;

--4. 저장함수 실행
execute :var_res := cal_bonus(7788);
execute :var_res := cal_bonus(7900);

--5. 바인드 변수로 돌려받은 값 출력
print var_res;

-- 저장함수를 SQL문에 포함 시켜서 실행
select ename, sal, cal_bonus(7788) from emp where empno=7788;
select ename, sal, cal_bonus(7900) from emp where empno=7900;

--Q2. 사원 테이블에서 사원명을 저장함수의 매개변수로 전달하여 해당 사원의
--    직급(JOB)을 구해오는 저장함수를 생성하고, 실행 하세요?
--1. 저장 함수 생성
create or replace function job_emp(vename in emp.ename%type)
    return varchar2         -- 돌려줄 값의 자료형
is
    vjob emp.job%type;      -- 로컬변수(사원명으로 검색한 사원의 JOB저장)
begin
    select job into vjob from emp where ename = vename;
    return vjob;
end;

--2. 저장 함수 목록 확인
select * from user_source;

--3. 바인드 변수 생성
variable var_job varchar2(10);

--4. 저장함수 실행
execute :var_job := job_emp('SCOTT');
execute :var_job := job_emp('KING');

--5. 바인드 변수에 저장된 결과 출력
print var_job;

-- 저장함수를 SQL문에 포함해서 실행
select ename, job_emp('SCOTT') from emp where ename = 'SCOTT';
select ename, job_emp('KING') from emp where ename = 'KING';
-----------------------------------------------------------------------
-- 커서(cursor)
-- : 2개 이상의 데이터를 처리할때 커서를 사용한다.

--Q1. 부서 테이블의 모든 데이터를 출력하기 위한 PL/SQL문 작성?
--1. 저장 프로시저 생성
create or replace procedure cursor_sample01
is
    vdept dept%rowtype;         -- 로컬변수
    
    cursor c1                   -- 커서 선언
    is
    select * from dept;
begin
    dbms_output.put_line('부서번호  /  부서명  /  지역명');
    dbms_output.put_line('---------------------------');

    open c1;        -- 커서 열기(첫번째 데이터를 가져온다.)
    loop    
        fetch c1 into vdept.deptno, vdept.dname, vdept.loc; --인출
            exit when c1%notfound; --커서가 가져올 데이터가 없을때 true
dbms_output.put_line(vdept.deptno||'/'||vdept.dname||'/'||vdept.loc);        
    end loop;
    close c1;       -- 커서 닫기    
end;

--2. 프로시저 목록 확인
select * from user_source;

--3. 프로시저 실행
execute cursor_sample01;





