--2024_08_09


--사원 테이블에서 사원명을 검색하여 사원의 직급을 구해오는 저장 프로시저를 만들어서 실행하세요?

--1. 저장 프로시저 생성
create or replace procedure ename_job(
        vename in emp.ename%type,
        vjob out emp.job%type)
is
begin
    select job into vjob from emp where ename = vename;
end;

--2. 프로시저 목록 확인
select * from  user_source;

--3. 바인드 변수 생성
variable var_job varchar2(10);

--4. 프로시저 실행
execute ename_job('SCOTT', :var_job); 
execute ename_job('KING', :var_job); 
execute ename_job('SMITH', :var_job); 

--5. 바인드 변수로 받은 값 출력
print var_job;

------------------------------------------------------------------------------------------------------------------------------------------------------------
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
-----------------------------------------------------------------------------------------------------------------------------------
--Q2. 부서 테이블의 모든 데이터를 출력하는  PL/SQL문 작성?
--   For Loop문으로 처리
--   1. open ~ fetch ~ close 없이 처리할 수 있다.
--   2. for loop문을 사용하게 되면, 각 반복문마다 cursor를 열고
--      각 행을 인출(fetch)하고, cursor를 닫는 작업을 자동으로 처리해 준다.

--1.저장 프로시저 생성
create or replace procedure cursor_sample02
is
    vdept dept%rowtype;     -- 로컬변수
    
    cursor c1               -- 커서 선언
    is
    select * from dept;
begin
    dbms_output.put_line('부서번호  /  부서명  /  지역명');
    dbms_output.put_line('---------------------------');
    
    for vdept in c1 LOOP
         exit when c1%notfound; --커서가 가져올 데이터가 없을때 true
dbms_output.put_line(vdept.deptno||'/'||vdept.dname||'/'||vdept.loc);
    end loop;
end;

--2. 저장 프로시저 목록 확인
select * from user_source;

--3. 프로시저 실행
execute cursor_sample02;
 

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q3. 사원테이블에서 부서번호를 전달하여 해당 부서에 소속된 사원의 정보를 출력하는 프로시저를 커서를 이용해서 처리하세요
--1. 저장 프로시저
create or replace procedure info_emp(vdeptno in emp.deptno%type)
is
    vemp emp%rowtype;
    cursor c1
    is
    select * from emp where deptno =vdeptno;
begin
    dbms_output.put_line('부서번호  /   사원번호    /   사원명 /   직급  /   급여');
    dbms_output.put_line('----------------------------------------------------');
    
    for vemp in c1 loop
         dbms_output.put_line(vemp.deptno||'/' ||vemp.empno || '/' ||vemp.ename ||'/' ||vemp.job||'/' ||vemp.sal);
        exit when c1%notfound;
    end loop;
end;

--2. 저장 프로시저 목록 확인
select * from user_source;

--3. 프로시저 실행
execute info_emp(10);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--패키지(package) : 저장 프로시져와 저장 함수를 묶어 놓은것.
-- 패키지 =  패키지 헤드+ 패키지 바디
-- 패키지 생성
--1. 패키지 헤드 생성
create or replace package exam_pack
is
    function cal_bonus(vempno in emp.empno%type) -- 저장 함수
        return number;
    procedure cursor_sample2;
end;

--2. 패키지 바디 생성
create or replace package body exam_pack
is

    --저장함수 : cal_bonus
    function cal_bonus(vempno in emp.empno%type)
    return number                  -- 돌려줄 값의 자료형
    is
        vsal number(7,2);              -- 로컬변수
    begin
        select sal into vsal from emp where empno = vempno;
        return vsal * 2;              -- 200% 인상한 급여를 돌려준다. 
    end;
    
    
    --저장 프로시저 : cursor_ sample2
    procedure cursor_sample2
    is
    vdept dept%rowtype;     -- 로컬변수
    
    cursor c1               -- 커서 선언
        is
        select * from dept;
    begin
        dbms_output.put_line('부서번호  /  부서명  /  지역명');
        dbms_output.put_line('---------------------------');
    
    for vdept in c1 LOOP
        exit when c1%notfound; --커서가 가져올 데이터가 없을때 true
        dbms_output.put_line(vdept.deptno||'/'||vdept.dname||'/'||vdept.loc);
    end loop;
    end;
end;

--3 저장 프로시저 실행 : cursor_sample2
exec exam_pack.cursor_sample2;

--4. 저장 함수 실행 : cal_bonus
--바인드 변수 생성
variable var_res number;

-- 저장 함수 실행
exec :var_res := exam_pack.cal_bonus(7788);

--바인드 변수로 받은 결과 출력
print var_res;

--sql문으로 저장함수 실행
select ename ,exam_pack.cal_bonus(7788) as double from emp where empno = 7788;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--트리거(trigger)
--1. 트리거의 사전적 의미는 방아쇠라는 의미를 가지고 있다.
--2. 트리거는 이벤트를 발생시켜서, 연쇄적으로 다른 작업을 자동으로 수행할때 사용한다.
--3. 이벤트는 DML SQL문을 이용해서 이벤트를 발생시켜고, 이때 연쇄적으로 실행부(begin~end)안의 내용을 자동으로 실행시켜주는 역할을 한다.

--Q1. 사원테이블에 사원이 등록되면, "신입 사원이 입사 했습니다."라는 메세지를 출력하는 트리거를 생성 하세요
--1.사원 테이블 생성
create table emp01(
    empno number(4) primary key,
    ename varchar(20),
    job varchar2(20));
    
select *from tab;

--2. 트리거 생성
create or replace trigger trg_01
        after insert on emp01 --이벤트발생
begin
    dbms_output.put_line('신입사원이 입사 했습니다.');
end;

--3. 트리거 목록 확인
select * from user_triggers;

--4. 이벤트 발생: emp01테이블에 회원가입(데이터 입력)
set serveroutput on
insert into emp01 values(1111,'홍길동','개발자');
insert into emp01 values(1112,'홍길동','개발자');
insert into emp01 values(1113,'홍길동','개발자');
insert into emp01 values(1114,'홍길동','개발자');

delete from emp01;

commit;

--Q2. 사원테이블(emp01)에 신입 사원이 등록되면, 급여 테이블(SAL01)에 급여정보를 자동으로 추가 해주는 트리거 생성하세요
--1. 사원테이블 : emp01

--2. 급여 테이블 생성 : SAL01
create table sal01(
    salno number(4) primary key,
    sal number(7,2),
    empno number(4) references emp01(empno));


--3. 시퀀스 생성
create sequence sal01_salno_seq; --1부터 1씩 증가되는 시퀀스 생성

select * from seq;

--4 트리거 생성
-- :new.컬럼명 : insert,update문을 이용해서 이벤트가 발생한 경우
-- :old.컬럼명 : delete문을 이용해서 이벤트가 발생한 경우
create or replace trigger trg_02
    after insert on emp01   --이벤트 감지
    for each row            --행레벨 트리거
begin
    insert into sal01 values(sal01_salno_seq.nextval,300,:new.empno);
end;

--5. 트리거 목록 확인
select * from user_triggers;

--6. 이벤트 발생 : EMP01
insert into emp01 values(1111,'홍길동','개발자');

--7. 데이터 확인
select * from emp01;

--Q3. 사원테이블(EMP01)에서 사원정보가 삭제되면, 급여테이블(SAL01)의 정보를 자동으로 삭제하는 트리거를 생성하라
--1.트리거 생성
-- :new.컬럼명 : insert,update문을 이용해서 이벤트가 발생한 경우
-- :old.컬럼명 : delete문을 이용해서 이벤트가 발생한 경우

create or replace trigger trg_03
    after delete on emp01 --이벤트 감지 코드
    for each row
begin
    delete from sal01 where empno = :old.empno;
end;

--2. 트리거 목록 확인
select * from user_triggers;

--3. 이벤트 발생
-- : 사원테이블(EMP01)의 사원번호 1111번 사원을 삭제(탈퇴)하면, 연쇄적으로 급여테이블(SAL01)의 급여 정보도 같이 삭제된다.
delete from emp01 where empno = 1111;

--4. 실행 결과 확인
select * from emp01;
select * from sal01;

