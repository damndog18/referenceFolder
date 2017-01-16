select username, account_status from dba_users;

alter user pm account lock;

alter user pm account unlock;

alter user pm identified by 1111;

create user testuser1 identified by 1111;
/* ������ ���� �� �� �����ؾ� �Ѵ�. */
/* ����Ÿ�� ��� ���� �� �� ���� �ϰų� cascade �ɼ����� ���� ���� �Ѵ�. */
drop user testuser1;
drop user testuser1 cascade;

grant connect to testuser1;
grant connect, resource to testuser1;

select tname from tab;

show user
/* �⺻������ �ٸ� ������ ������ �����ϴ� �� ������ ������ �ȴ� */
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp;

select empno, ename, job, mgr, hiredate, sal, comm, deptno from scott.emp;

/* ���� ���� �ֱ� */
grant select on scott.emp to hr;

/* VIEW ���� �ֱ� */
grant create view to scott;

====================================================================================
