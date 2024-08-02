--2024.08.02(금)

--트랜잭션(Transaction)
--1. 사전적인 의미는 거래라는 의미를 가지고 있다.
--2. 논리적인 작업단위
--3. 트랜잭션은 DML(insert, update, delete)SQL문으로 시작된다.
--4. 트랜잭션은 데이터의 일관성을 유지하면서, 데이터를 안정적으로 복구하기 위해서 사용된다.
--5. 트랜잭션은 All-or-Nothing 방식으로 처리된다.

--TCL(Transaction Control Language)
-- commit : 트랜잭션 종료
-- rollback : 트랜잭션을 취소
-- savepoint : 복구할 시점(저장점)을 지정하는 역할

drop table emp02 purge;

create table dept01 as select * from dept;
select* from dept01;

--1. rollback : 트랜잭션을 취소
-- 새로운 트랜잭션이 시작되고, 메모리 상에서만 DELETE가 시행된다.
delete from dept01;
-- 트랜잭션을 취소하기 때문에, 메모리상에서 DELETE된 데이터가 복구된다.
rollback;
select * from dept01;

--2.commit :트랜잭션 종료
delete from dept01 where deptno=20;
commit;

rollback;

--자동 커밋 : 자동으로 커밋이 수행되는 것
--1)정상적인 종료 : quit, exit, con.close()
--2) DDL(create, alter, rename, drop, truncate), DCL(grant, revoke) 명령이 수행될때

--예1. DDL 명령이 실행(CREATE)
drop table board purge;
create table dept01 as select * from dept;
select * from dept01;
delete from dept01 where deptno=40;
--DDL(create) SQL문이 실행되면 자동으로 commit이 수행된다.
create table dept03 as select * from dept; --자동 커밋
rollback;--삭제된 40번 부서는 복귀되지 않는다.

--예2. DDL 명령이 실행(TRUNCATE)
--DELETE (DML) : 데이터 복구가 가능하다. 
--TRUNCATE (DDL) : 자동 커밋이 수행되기 때문에 삭제된 데이터를 복구할 수 없다.

select * from dept01;
delete from dept01 where deptno = 30;
rollback; --데이터 복구됌

truncate table dept01; --DDL(TRUNCATE) 자동 커밋수행

rollback; -- 삭제된 데이터는 복구 안됌

-- 자동 롤백 : 자동으로 롤백이 수행되는 것.
-- : 비정상적인 종료 - 강제로 창을 닫는 경우, 컴퓨터가 다운되는 경우

--savepoint : 임시 저장점을 지정할떄 사용되는 명령

-- [실습]
-- 1. dept01테이블 생성
create table dept01 as select * from dept;
select * from dept01;
-- 2. 40번 부서 삭제
delete from dept01 where deptno = 40;
-- 3. commit수행: 트랜잭션 종료
commit;
-- 4. 30번 부서 삭제
delete from dept01 where deptno = 30;

-- 5. c1저장점 생성
savepoint c1;

-- 6. 20번 부서 삭제
delete from dept01 where deptno = 20;

-- 7. c2 저장점 생성
savepoint c2;

--  8. 10번 부서 삭제
delete from dept01 where deptno = 10;

--  9. c2 저장점까지 복구
rollback to c2; --10번 부서 복구
select * from dept01;

-- 10. c1저장점까지 복구
rollback to c1; --20번 부서 복구
select * from dept01;

-- 11. 이전에 트랜잭션 종료 이후를 복구
rollback;
select * from dept01;--30번 부서 복구