select username, account_status from dba_users;

alter user pm account lock;

alter user pm account unlock;

alter user pm identified by 1111;

create user testuser1 identified by 1111;
/* 계정을 삭제 할 땐 깨끗해야 한다. */
/* 데이타를 모두 정리 한 후 삭제 하거나 cascade 옵션으로 강제 삭제 한다. */
drop user testuser1;
drop user testuser1 cascade;

grant connect to testuser1;
grant connect, resource to testuser1;

select tname from tab;

show user
/* 기본적으로 다른 유져의 정보에 접근하는 건 관리자 계정만 된다 */
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp;

select empno, ename, job, mgr, hiredate, sal, comm, deptno from scott.emp;

/* 접근 권한 주기 */
grant select on scott.emp to hr;

/* VIEW 권한 주기 */
grant create view to scott;

====================================================================================
