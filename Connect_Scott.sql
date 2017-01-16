select username, account_status from dba_users;
/* �ּ� */
connect system/1111;

show user;

select tname from tab;
select * from bonus;
select * from dept;
select * from emp;
select * from salgrade;
select * from vw_emp_sales;
select * from vw_objects;

describe emp;

/* SELECT FIELD, FIELD...... FROM [������].���̺��; */
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp;

select empno, ename, job, mgr, comm from emp;

select comm, job, empno from emp;

describe dept;

select deptno, dname, loc from dept;

select * from dept;
select * from emp;

describe pm.online_media;

select * from pm.online_media;

select empno, ename, sal from emp;
select empno, ename, sal, sal+100 from emp;

/* �ߺ� �� ���� */
select distinct deptno from emp;

/* �޿��� ���� ������ ���, �̸�, �޿��� ��ȸ */
select empno, ename, sal from emp order by sal desc;
select empno, ename, sal from emp order by sal, empno desc;
select empno, ename, sal from emp order by sal desc, empno asc;

/* �μ����� �޿��� ���� ������ �̸�, �޿�, �μ��ڵ带 ��ȸ */
select ename, sal, deptno from emp;
select ename, sal, deptno from emp order by deptno;
select ename, sal, deptno from emp order by deptno asc, sal asc;

/* �޿��� 3000 �̻��� ������ ���, �̸�, �޿��� ��ȸ */
select empno, ename, sal from emp;
select empno, ename, sal from emp where sal >= 3000;

/* ������ manager�� ������ ���, �̸�, �μ�, ������ ��ȸ */
/* alias �ܿ� "" ���� ���� ����. */
/* ��ɾ�� ��� ������ �� ����Ÿ�� ����� �� ��ҹ��� ���� �Ѵ� */
select empno, ename, deptno, job from emp where job="manager";
select empno, ename, deptno, job from emp where job='MANAGER';

/* ������ manager�� ������ ���, �̸�, �μ�, ������ �μ���ȣ�� ���� ������ ��ȸ */
/* !! ������ ������ �������� �ϱ� */
select empno, ename, deptno, job from emp where job = 'MANAGER' order by deptno asc;

/* 1982�� 1��1�� ���Ŀ� �Ի��� ������ �̸�, �μ�, �Ի����ڸ� ��ȸ */
select ename, deptno, hiredate from emp where hiredate > '82/01/01';

/* �μ��� 20�̰� ������ analyst�� ������ �̸�, ����, �μ�, �Ի����ڸ� ��ȸ */
select ename, job, deptno, hiredate from emp where deptno = 20 and job = 'ANALYST';

/* �޿��� 1500 �̻� 2500 ���ϸ� �޴� ������ �̸�, �μ�, ����, �޿��� ��ȸ */
select ename, deptno, job, sal from emp where sal >= 1500 and sal <= 2500;
/* �̻� ���� + and �϶� between and ��� */
select ename, deptno, job, sal from emp where sal between 1500 and 2500;

/* ������ clerk, salesman, analyst �� ������ �̸�, �μ�, ������ ��ȸ */
select ename, deptno, job from emp where job = 'CLERK' or job = 'SALESMAN' or job = 'ANALYST';
/* ���� + or �϶� in ��� */
select ename, deptno, job from emp where job in('CLERK','SALESMAN','ANALYST');

/* �̸��� s�� �����ϴ� ������ �̸�, ����, �޿��� ��ȸ */
select ename, job, sal from emp where ename like 'S%';

/* 1981�� �Ի��� ������ �̸�, ����, �Ի����ڸ� ��ȸ */
select ename, job, hiredate from emp where hiredate like '81%';
select ename, job, hiredate from emp where hiredate >= '1981/1/1' and hiredate <= '1981/12/31';
select ename, job, hiredate from emp where hiredate between '1981/1/1' and '1981/12/31';

/* ������ ���, �̸�, �μ�, ����, �޿�, ���ʽ��� ��ȸ */
select empno, ename, deptno, job, sal, comm from emp;
/* ���ʽ��� ���� ���ϴ� ������ �̸�, �μ�, ����, �޿�, ���ʽ� ��ȸ */
select ename, deptno, job, sal, comm from emp where comm is null;
select ename, deptno, job, sal, comm from emp where job != 'SALESMAN';
select ename, deptno, job, sal, comm from emp where not(job = 'SALESMAN');
/* ���ʽ��� �޴� ������ �̸�, �μ�, ����, �޿�, ���ʽ� ��ȸ */
select ename, deptno, job, sal, comm from emp where comm is not null;

/* ��ҹ��� ���� ���� �̸��� scott�� ������ �̸�, �μ�, �޿��� ��ȸ �Ͻÿ�. */
select ename, deptno, sal from emp where upper(ename) = upper('scott');

/* ���� �Ǿ����� ���� ����Ÿ�� �׽�Ʈ �� �� ���. �׽�Ʈ�� ���̺� dual */
/* �Ϲ� ���̺��� ��� ���� ���� �� �� ����. */
select upper('abc') from emp;
select upper('abc') from dual;

/* '901225-1234567' ���� ������ �ش��ϴ� ���ڸ� �����ض�. */
select substr('901225-1234567', 8, 1) from dual;

/* L ã�� */
select instr('MILLER', 'L') from dual;
select instr('MILLER', 'L', 1, 1) from dual;
/* L ã�� 2 */
select instr('MILLER', 'L', 1, 2) from dual;
/* L ã�� 3 */
select instr('MILLER', 'L', -4, 1) from dual;
select instr('MILLER', 'L', -1, 2) from dual;

/* ltrim() rtrim() */
/* M ���� */
select ltrim('MILLER' , 'M') from dual;
/* ���� ���� */
select ltrim('                  MILLER') from dual;
select ltrim(rtrim('             MILLER            ')) from dual;

/* translate() replace() */
select translate('MILLER', 'L', '*') from dual;
select replace('MILLER', 'L', '*') from dual;
/* 1:1 ��Ī */
select translate(sal, '0123456789', '�����̻�����ĥ�ȱ�') from emp;
select translate(sal, '0123456789', '����') from emp;
/* ��� ��Ī */
select replace(sal, '0123456789', '�����̻�����ĥ�ȱ�') from emp;
select replace(sal, '2450', '�����̻�����ĥ�ȱ�') from emp;

select translate('JACK and JUE', 'J', 'BL') from dual;
select replace('JACK and JUE', 'J', 'BL') from dual;

/* ascii */
select chr(65), chr(97) from dual;
select ascii('B'), ascii('b') from dual;

/* round() �ݿø� */
select round(4567.678), round(4567.678, 0), round(4567.678, 1), round(4567.678, 2), round(4567.678, -2), round(4567.678, -3) from dual;

/* trunc() ���� */
select trunc(4567.678), trunc(4567.678, 0), trunc(4567.678, 1), trunc(4567.678, 2), trunc(4567.678, -2), trunc(4567.678, -3) from dual;

/* floor() �μ� ���� �Ұ�. �߹��� */
select floor(4567.678), floor(4567.478) from dual;

/* ceil() �μ� ���� �Ұ�. �߿ø� */
select ceil(4567.678), ceil(4567.478) from dual;

/* mod() 10/3�� ������ */
select mod(10, 3) from dual;

/* power() 2^10 */
select power(2, 10) from dual;

/* sign() ���� ��� */
select sign(1000), sign(-15), sign(0) from dual;

/* sysdate */
select sysdate from dual;
select sysdate+100 from dual;

/* months_between() ��¥�� ��¥�� ����(month��) */
select months_between('2016/9/5', sysdate) from dual;
select months_between(sysdate, '2016/9/5') from dual;

/* add_months() */
select add_months(sysdate, 21) from dual;

/* next_day() 2016/1/17 ������ �ݿ��� */
select next_day('2016/1/17', 'FRIDAY') from dual;

/* last_day() sysdate ������ ������ �� */
select last_day(sysdate) from dual;

/* ��¥������ round() */
select round(sysdate) from dual;
/* 2016/9/20 ���ڰ� �ƴ� ���� round�� �� ����. ��¥�� ��ȯ�Ͽ� round�� ����. */
select round(to_date('2016/9/20'), 'DAY') from dual;
select round(to_date('2016/9/20'), 'MONTH') from dual;
select round(to_date('2016/9/20'), 'YEAR') from dual;

/* NUMBER ������ sal�� VARCHAR2 �������� �ٲ� */
select ename, sal, to_char(sal) from emp;
select ename, sal, to_char(sal, '$999,999') from emp;
select ename, sal, to_char(sal, 'L999,999') from emp;

/* ��ȯ �� ǥ�� */
select to_char(sysdate, 'YYYY MM DD HH"��" MI"��" SS"��"') from dual;

/* ������ �̸�, �޿�, ���ʽ�, �ѱ޿��� �˻� */
/* null�� ��� �Ұ�. */
select ename, sal, comm, sal + comm "��sal" from emp;
/* nvl() null�� 0���� �ٲٱ� */
select ename, sal, comm, sal + nvl(comm, 0) "��sal" from emp;

/* decode() */
select ename, job, decode(job, 'SALESMAN', '�´�', '�ƴϴ�') from emp;
select ename, job, decode(job, 'SALESMAN', '��', 'CLERK', '��', 'MANAGER', '��', '��') from emp;

/* ������ SALESMAN�� ������ �޿� ���, �ְ��, ������, �հ踦 ��ȸ */
select avg(sal) from emp;
select avg(sal+nvl(comm, 0)), sum(sal+nvl(comm, 0)) from emp where job = 'SALESMAN';

/* count() null�� ���� �ʴ´� */
select count(empno) from emp;
select count(*) from emp;
select count(comm) from emp;

/* �μ����� �޿� ���, �ְ�޿�, �����޿�, �޿� �հ踦 ��ȸ */
select distinct deptno from emp;
select avg(sal), max(sal), min(sal), sum(sal) from emp where deptno = 10;
select avg(sal), max(sal), min(sal), sum(sal) from emp where deptno = 20;
select avg(sal), max(sal), min(sal), sum(sal) from emp where deptno = 30;
/* group by */
select deptno, avg(sal), max(sal), min(sal), sum(sal) from emp group by deptno;
select deptno, avg(sal), max(sal), min(sal), sum(sal) from emp group by deptno order by avg(sal) desc;
/* job�� group by�� ���� depno(3��)�� ������ �ٸ���. ���� �� */
select deptno, job, avg(sal), max(sal), min(sal), sum(sal) from emp group by deptno;
/* job�� group by �� ��� �� */
select deptno, job, avg(sal), max(sal), min(sal), sum(sal) from emp group by deptno, job;

/* ��ü �޿��� �հ谡 5000�� �ʰ��ϴ� ������ ���� �޿� �հ� ��ȸ */
select job, sum(sal) from emp group by job having sum(sal)>5000;
/* ��ü �޿��� �հ谡 5000�� �ʰ��ϴ� ������ ���� �޿� �հ� ��ȸ, SALESMAN�� ���� */
/* ���� ���� �� */
select job, sum(sal) from emp group by job having sum(sal)>5000 and job != 'SALESMAN';
select job, sum(sal) from emp where job != 'SALESMAN' group by job having sum(sal)>5000;

==============================================================================================
select * from emp;
1. ����� 7902, 7788, 7566�� �ƴ� ����� ���, �̸�, ����, �޿�, �Ի����ڸ� ��ȸ
select empno, ename, job, sal, hiredate from emp where empno!='7902' and empno!='7788' and empno!='7566';
select empno, ename, job, sal, hiredate from emp where empno not in(7902,7788,7566);
2. ������ president �Ǵ� salesman�̰� �޿��� 1500�� ������ �̸�, �޿�, ����, �μ���ȣ�� ��ȸ
select ename, sal, job, deptno from emp where sal = '1500' and job between 'PRESIDENT' and 'SALESMAN';
select ename, sal, job, deptno from emp where job in('PRESIDENT','SALESMAN') and sal=1500;
select ename, sal, job, deptno from emp where (job='PRESIDENT'or job='SALESMAN') and sal=1500;
3. ���� �ֱٿ� �Ի��� ����� ���, �̸�, ����, �Ի����� ��ȸ
select deptno, ename, job, hiredate from emp order by hiredate desc;
4. ���� �μ������� ���� ������ �ϴ� ������ �޿��� ���� ������ ��ȸ
select ename, job, sal, deptno from emp order by deptno desc, job, sal desc;
5. Ŀ�̼��� �޿����� 10%�̻� ���� ������ �̸�, �μ�, ����, �޿�, Ŀ�̼��� ��ȸ
select ename, deptno, job, sal, comm from emp where comm > (sal*0.1);
6. �̸��� L�ڰ� 2�� �ְ� 30�� �μ��̰ų� ���ӻ�簡 7782�� ������ �̸�, �μ�, ���ӻ�縦 ��ȸ
select ename, deptno, mgr from emp where ename like '%L%L%' and deptno=30 or mgr=7782;
select ename, deptno, mgr from emp where ename like '%L%L%' and mgr=7782 or deptno=30;
=============================================================================================
13. ���ú��� 12�� 25�ϱ����� ������ ���Ҵ°�?
select round(to_date('2016/12/25')-sysdate) from dual;
14. ������� �ٹ��� �ٹ��ϼ��� ���� ���Ϸ� ����Ͻÿ�. ��, �ٹ��ϼ��� ���� ��������� ��ȸ
select to_char(sysdate-(to_date(hiredate, 'YY/MM/DD'))) from emp;
15. 10���μ� ������ �� ��������� �ٹ� ������ ����ؼ� ��ȸ
select ename, hiredate, months_between(sysdate, hiredate) from emp where deptno = 10;
16. 20���μ� ������ �� �Ի����ڷκ��� 5������ ���� ���� ��¥�� ����ؼ� ��ȸ
select ename, hiredate, add_months(hiredate, 5) from emp where deptno = 20; 
17. ��� ������ ���� �Ի��� ���� �ٹ� �ϼ��� ����ؼ� ��ȸ
select ename, hiredate, last_day(hiredate)-hiredate "working" from emp;
18. ���� �޿��� 15%�� ������ �޿��� ����Ͽ� ���, �̸�, ����, �޿�, ������ �޿��� ��ȸ
select empno, ename, job, sal, trunc(sal+(sal*0.15)) "+15%" from emp;
19. �̸�, �Ի���, �Ի��Ϸκ��� ��������� ����, �޿�, �޿��Ѱ踦 ��ȸ
select ename, hiredate, trunc(months_between(sysdate, hiredate)) "��month", sal, sal*trunc(months_between(sysdate, hiredate)) "��sal" from emp;
20. ������ analyst�̸� �޿��� 10%������Ű�� clerk�̸� 15%, manager�̸� 20% �������Ѽ� �̸�, ����, �޿�, ������ �޿��� ��ȸ
select ename, job, sal, sal "����sal" from emp;
=============================================================================================

/* Scott�� �޿����� �� ���� �޴� ������ �̸�, ����, �޿��� ��ȸ */
select ename, job, sal from emp where ename='SCOTT';
select ename, job, sal from emp where sal>3000;
/* �� �� �ؾ� �� �۾��� �� ������ ����. subquery */
select ename, job, sal from emp where sal>(select sal from emp where ename='SCOTT');

/* ����� 7521�� ����� ������ ���� �޿��� 7934���� ���� ������ ���, �̸�, ����, �޿��� ��ȸ */
select sal from emp where empno=7934;
select job from emp where empno=7521;
select empno, ename, job, sal from emp where job='SALESMAN' and sal>1300;
/* �� �� �ؾ� �� �۾��� �� ������ ����. */
select empno, ename, job, sal from emp where job=(select job from emp where empno=7521) and sal>(select sal from emp where empno=7934);

/* ���� �߿��� ���� ���� ��� �޿��� �޴� ������ ��� �޿��� ��ȸ */
/* ���� ��� �޿� ���ϱ� */
select min(avg(sal)) from emp group by job;
/* ���� ��� �޿��� subquery�� �̿��Ͽ� ����Ÿ ��ȸ */
select job, avg(sal) "��sal" from emp group by job having avg(sal) = (select min(avg(sal)) from emp group by job);

/* �������� �ּ� �޿��� �޴� ������ ���, �̸�, ����, �޿�, �μ���ȣ ��ȸ */
/* �ּ� �޿� ���ϱ� */
select min(sal) from emp group by job;
/* �ּ� �޿� �������� ����Ÿ ��ȸ */
select empno, ename, job, sal, deptno from emp where sal in(800,1250,2450,3000,5000);
/* subquery�� �̿��� ��ȸ. in ������ */
select empno, ename, job, sal, deptno from emp where sal in(select min(sal) from emp group by job);

/* ������ �ּұ޿����� ���� �޿��� �޴� ������ ���, �̸�, �޿�, �μ���ȣ ��ȸ */
/* �ּ� �޿� ���ϱ� */
select min(sal) from emp group by job;
/* �ּ� �޿� �������� ����Ÿ ��ȸ */
select empno, ename, sal, deptno from emp where sal>800 or sal>1250 or sal>5000 or sal>2450 or sal>3000;
/* subquery�� �̿��� ��ȸ. any ������ */
select empno, ename, sal, deptno from emp where sal > any(select min(sal) from emp group by job);

/* ������ �ִ�޿� �̻� �޿��� �޴� ������ ���, �̸�, ����, �޿�, �μ���ȣ ��ȸ */
/* �ִ� �޿� ���ϱ� */
select max(sal) from emp group by job;
/* �ִ� �޿� �������� ����Ÿ ��ȸ */
select empno, ename, job, sal, deptno from emp where sal>=1300 and sal>=1600 and sal>=5000 and sal>=2975 and sal>=3000;
/* subquery�� �̿��� ��ȸ. all ������ */
select empno, ename, job, sal, deptno from emp where sal >= all(select max(sal) from emp group by job);

/* ��� �Ѹ��� �������κ��� ���� ���� �� �ִ� ������ �̸�, ����, �Ի�����, �޿��� ��ȸ */
select * from emp;
/* �Ŵ����� �̾Ƴ��� */
select distinct mgr from emp;
/* �Ŵ��� �������� ����Ÿ ��ȸ. ���� subquery. e�� ���߿� ��� */
/* �ܺ� ������ ����Ÿ�� ���� ������ �������� ó���ϰ� �ٽ� �ܺ� ������ ���ƿͼ� ó�� ���� ��. */
/* ���� ������ ���� �ʴ� �����. */
select ename, job, hiredate, sal from emp e where exists(select * from emp where e.empno=mgr);

/* �ǽ��� ���� ������ ���� */
update emp set sal=1500, comm=300 where empno=7934;

/* 30�� �μ��� �ִ� ������ �޿�, ���ʽ��� ���� �޿�, ���ʽ��� �޴� ������ ���, �̸�, �μ���ȣ, �޿�, ���ʽ��� ��ȸ */
select empno, ename, deptno, sal, comm from emp where deptno = 30;
/* �̷��� �ϸ� ��� ���� MILLER�� Ƣ��´�. �� ���� subquery�� ���ε��� �����ؼ� �׷��� */
select empno, ename, deptno, sal, comm from emp where sal in(select sal from emp where deptno=30) and comm in(select comm from emp where deptno=30);
/* ���߿� subquery�� �̿��ϸ� ���ÿ� ������ �� �ִ�. MILLER ����3 */
select empno, ename, deptno, sal, comm from emp where (sal, comm) in(select sal, comm from emp where deptno=30);

/* �ǽ��� ���� ������ ���� */
update emp set sal=1300, comm=null where empno=7934;
=======================================================================================================
1. emp���̺��� ��ϵǾ� �ִ� �ο���, ���ʽ��� NULL�� �ƴ� �ο���, ���ʽ��� ���(���ʽ��� NULL�� �ƴ� ���, NULL������ ���),
��ϵǾ� �ִ� �μ��� ��(�Ѱ����� �ߺ��� ������ ����)�� ���Ͽ� ���
select * from emp;
select count(ename), count(comm), avg(comm), round(avg(nvl(comm,0)),2), count(deptno), count(distinct deptno) from emp ;
2. �μ��ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ��ȸ
select deptno from emp group by deptno having count(ename)>4;
select deptno, count(ename), sum(sal) from emp group by deptno having count(ename)>4;
3. �޿��� �ִ� 2900 �̻��� �μ��� ���� �μ���ȣ, ��� �޿�, �޿��� ���� ��ȸ
select deptno from emp group by deptno having max(sal)>=2900;
select deptno, avg(sal), sum(sal) from emp group by deptno having max(sal)>=2900; 
4. �ְ�޿��� �ּұ޿��� ���̴� ���ΰ�?
select min(sal), max(sal), max(sal)-min(sal) from emp;
5. �⵵�� ������ ��, ���� �ӱ�, �ְ� �ӱ�, ��� �ӱ�, �ӱ� �հ�

6. �� ������ ��, �Ի� �⵵�� �ش� �⵵�� �Ի��� ������ ��

7. ������ dept�� �ӱݰ� �� �ӱݵ��� ��

8. BLAKE�� ���� �μ��� �ִ� ��� ������ ���, �̸�, �Ի����� ��ȸ
select deptno from emp where ename='BLAKE';
select empno, ename, hiredate, deptno from emp where deptno=(select deptno from emp where ename='BLAKE');
9. SELECT empno, ename, deptno, sal, comm FROM emp WHERE (sal, comm) IN(SELECT sal, comm FROM emp WHERE deptno=30);
   �� ������ �����Ͽ� comm�� null�� ������ ����� �� �ֵ��� �Ͻÿ�
SELECT sal, comm FROM emp WHERE deptno=30;
SELECT empno, ename, deptno, sal, comm FROM emp WHERE (sal, nvl(comm, 0)) in(SELECT sal, nvl(comm, 0) FROM emp WHERE deptno=30);
10. ��� �޿� �̻��� �޴� �������� ���, �̸��� ��ȸ. ��, �޿��� ���� ������ ����
select avg(sal) from emp;
select empno, ename from emp where sal>(select avg(sal) from emp) order by sal desc;
11. �̸��� 'T'�ڰ� ���� ������ �ٹ��ϴ� �μ����� �ٹ��ϴ� ������ ���, �̸�, �޿� ��ȸ
select distinct deptno from emp where ename like '%T%';
select empno, ename, sal, deptno from emp where deptno in(select distinct deptno from emp where ename like '%T%');
12. �μ��� ��ġ�� dallas�� ��� ������ ���� ���, �̸�, �޿�, ������ ��ȸ
select deptno from dept where loc='DALLAS';
select empno, ename, sal, job, deptno from emp where deptno=(select deptno from dept where loc='DALLAS');
13. King���� �����ϴ� ��� ������ �̸��� �μ�,����,�޿��� ��ȸ
select empno from emp where mgr=7839;
select ename, deptno, job, sal from emp where empno in(select empno from emp where mgr=7839);
14. ������ 30�� �μ��� ���� �޿����� ���� ������ ���, �̸�, �޿��� ��ȸ
select min(sal) from emp where deptno=30;
select empno, ename, sal from emp where sal > any(select min(sal) from emp where deptno=30);
15. 10�� �μ����� 30�� �μ��� ������ ���� ������ �ϴ� ������ �̸��� ������ ��ȸ
select job from emp where deptno=30;
select ename, job from emp where job in(select job from emp where deptno=30) and deptno=10;
=================================================================================================

select * from emp;
select * from dept;

/* Inner Join */

/* ������ ���, �̸�, ����, �μ���ȣ, �μ����� ��ȸ */
/* ǥ�� SQL */
select emp.empno, emp.ename, emp.job, emp.deptno, dept.dname from emp inner join dept on emp.deptno=dept.deptno;
/* PL-SQL */
select emp.empno, emp.ename, emp.job, emp.deptno, dept.dname from emp, dept where emp.deptno=dept.deptno;

/* SALESMAN�� ���� ���, �̸�, ����, �μ����� ��ȸ */
/* ������ �ʵ���� ���ٸ� ���̺��. �̰� ���ص� �� */
select emp.empno, emp.ename, emp.job, dept.dname from emp inner join dept on emp.deptno=dept.deptno and job='SALESMAN';
select emp.empno, emp.ename, emp.job, dept.dname from emp inner join dept on emp.deptno=dept.deptno and emp.job='SALESMAN';
/* and�� ������ ������ �Բ� ó��. where�� ������ ���� ó�� */
select emp.empno, emp.ename, emp.job, dept.dname from emp inner join dept on emp.deptno=dept.deptno where job='SALESMAN';

/* New York ���� �ٹ��ϴ� ������ ���, �̸�, ����, �μ���, �μ���ġ�� ��ȸ */
select emp.empno, emp.ename, emp.job, dept.dname, dept.loc from emp inner join dept on emp.deptno=dept.deptno where loc='NEW YORK';

/* Outer Join */

/* �̸�, �޿�, �μ���, �ٹ����� ��ȸ, �� �μ���� �ٹ����� ��� ��� */
select ename, sal, dname, loc, dept.deptno from emp right outer join dept on emp.deptno=dept.deptno;

/* Non Equi Join */

/* �������� �޿��� ���� ����� ��ȸ */
select ename, job, sal, grade, losal, hisal from emp inner join salgrade on sal>=losal and sal<=hisal;

/* Self Join */

/* ������ ���, �̸�, ����, ������, ������ �̸��� ��ȸ */
select a.empno, a.ename, a.job, a.mgr, b.ename from emp a inner join emp b on a.mgr=b.empno;

/* SET ������ */

/* deptno 14�� */
select deptno from emp;
/* deptno 4�� */
select deptno from dept;
/* �� ���� ���� UNION */
select deptno from emp union select deptno from dept;
/* �� ���� ���� UNION ALL */
select deptno from emp union all select deptno from dept;
/* �� ���� ���� INTERSECT */
select deptno from emp intersect select deptno from dept;
/* �� ���� ���� MINUS */
select deptno from dept minus select deptno from emp;

update emp set sal=6000 where ename='SCOTT';
select sal from emp where ename='SCOTT';
rollback;

=====================================================================================================
select * from emp;
select * from dept;

1. Ŀ�̼��� �޴� ������ ���� �̸�, �μ���, �ٹ����� ��ȸ
select ename, dname, loc, comm from emp, dept where emp.deptno=dept.deptno;
select ename, dname, loc from emp, dept where emp.deptno=dept.deptno and emp.comm>=0;
2. �̸� �߰��� L�ڰ� �ִ� ������ ���� �̸�, ����, �μ���, �ٹ��� ��ȸ
select ename, job, dname, loc from emp, dept where emp.deptno=dept.deptno and emp.ename like '%L%';
3. �� �����鿡 ���ؼ� �׵��� �����ں��� ���� �Ի��� ������ ���� �̸�, �Ի���, �������̸�, ������ �Ի����� ��ȸ
select a.ename, a.hiredate, b.ename, b.hiredate from emp a, emp b where a.mgr=b.empno and a.hiredate < b.hiredate;
4. ���ܻ���� ���, �̸�, ����, �μ���ȣ, �ٹ����� ��ȸ
select a.empno, a.ename, a.job, a.deptno, loc, a.mgr from emp a inner join emp b on a.mgr!=b.empno join dept c on a.deptno=c.deptno and a.job!='MANAGER';
select a.empno, a.ename, a.job, a.deptno, a.mgr, a.hiredate from emp a inner join emp b on a.mgr=b.empno;

======================================================================================================

/* ������ ���� �� ���, �̸�, �޿�, Ŀ�̼��� view�� �ۼ� */
select empno, ename, sal, comm from emp where job='SALESMAN';
/* VIEW�� ����� */
/* �����ڳ� �����ڸ� VIEW�� ���� �� �ִ�. */
create view vw_emp_sales as select empno, ename, sal, comm from emp where job='SALESMAN';
/* �����ڰ� �� �� view ����� ��ȸ */
select * from tab;
select * from vw_emp_sales;
/* VIEW�� ������ �� �̰� ¯¯�� */
create or replace view vw_emp_sales as select empno, ename, sal, comm from emp where deptno=30;
/* ���� �� ��ȸ */
select * from tab;
select * from vw_emp_sales;

desc user_views;
select view_name from user_views;
desc user_objects;
create view vw_objects as select object_name, object_type from user_objects;
select * from vw_objects;

/* �����θ� �����ϰ� �޿��� 2000�̻��� �������� ���, �̸�, �޿�, �μ�, �μ���, �޿������ ��ȸ�ϴ� ���̺��� ��� ����� */
select * from emp;
select * from dept;
select * from salgrade;

select empno, ename, sal, a.deptno, dname, grade from emp a inner join dept b on a.deptno=b.deptno join salgrade c on a.sal>=losal and a.sal<=hisal where a.deptno!=30;
=====================================================================================================

/* PROCEDURE */
/* ����� 7788�� ����� �޿��� 3500���� �����ϴ� ���ν��� �ۼ� */
select ename, sal from emp where empno=7788;
/* update emp set sal=3500 where empno=7788; �̰Ÿ� ���ν����� ���� */
create or replace procedure usp_sal is begin update emp set sal=3500 where empno=7788; end;
/* �� �ڿ� /�� �ٿ��� run ��. �̰��� ������. SQLPLUS������ ���� / �������� SQL DEVELOPER������ �� ����. */
create or replace procedure usp_sal is begin update emp set sal=3500 where empno=7788; end;/
/* ���ν��� ���� �Ǿ����� Ȯ�� */
describe user_objects;
select object_name, object_type from user_objects;
/* ���ν��� ���� */
execute usp_sal;

/* �Ű������� Ȱ���ϴ� ���ν��� ����� */
create or replace procedure usp_sal(p_empno in number, p_sal in number) is begin update emp set sal=p_sal where empno=p_empno; end;
/* �Ű����� ���ν��� ���� */
execute usp_sal(7788, 3000);
/* ���� ���� Ȯ�� */
select empno, sal from emp where empno=7788;

/* �޽����� ��� �� �ִ� ���ν����� ����� */
create or replace procedure usp_sal(p_empno in number, p_sal in number) is begin
        update emp set sal=p_sal where empno=p_empno;
/* ���ǹ� ���. sql% �� �����ϴ� ��������ִ� ���� ������ ���� �ִ�. ����! */
/* put_line()�� ���ڸ� ��� ����. to_char�� �̿��Ͽ� ���ڷ� ĳ����. */
/* ���⼭ || �� or�� �ƴ� �ڹٿ����� + �� */
/* sql%notfound�� �մܿ��� ó���Ȱ� ������ true, ������ false�̴�. ���⼭ ���� ��� ����� ��Ȳ�� �°� ���� ����. */
        if sql%notfound then dbms_output.put_line(to_char(p_empno) || '�� ���� �����');
        else dbms_output.put_line(to_char(sql%rowcount) || '���� ����Ÿ�� ���� �Ǿ����ϴ�.');
        end if;
end;
/* ���� ��¿� ���� ���� ���� */
set serveroutput on;
/* �Ű����� ���ν��� ���� */
execute usp_sal(7788, 3000);
execute usp_sal(1818, 3000);
/* ���� ���� Ȯ�� */
select empno, sal from emp where empno=7788;

/* Ư���� ���� 7%�� ������ ����Ͽ� �� ����� �������� �� �ִ� ���ν��� ������ */
create or replace procedure usp_tax(p_innum in number, p_outnum out number) is begin
/* := ���� ������. java������ = �̴�. */
    p_outnum := p_innum * 0.07;
end;
/* ���� ���� */
var g_outnum number;
/* ������ ������ ����Ͽ� ���ν��� ȣ�� */
execute usp_tax(2500, :g_outnum);
/* ��� */
print :g_outnum;

/* ��� ��� ���ν��� : usp_register */
/* ����̸�, ����, ���ӻ��, �޿��� �Է� �޾� ��� �Ѵ�. */
/* �μ���ȣ�� ���ӻ��� ���� ���ʽ��� salesman�� ��� 0, �� �ܿ��� null�� �Է� */

/* ������ ���� */
create sequence seq_empno start with 9000;
print seq_empno;
/* ���ν��� ����� */
create or replace procedure 
    usp_register(p_ename in emp.ename%type, p_job in emp.job%type, p_mgr in emp.mgr%type, p_sal in emp.sal%type)
    is
        /* ���ν��� �ȿ��� ��� �� ���� ���� */
        v_comm emp.comm%type;
        v_deptno emp.deptno%type;
    begin
        if p_job = 'salesman' then v_comm := 0;
    else
        v_comm := null;        
    end if;
        
    /* ���ν��� �ȿ����� select ����. �ʵ���� ���� ������ �ְڴ�! */
    /* select �ʵ�� into ������ from ���̺��; */
        select deptno into v_deptno from emp where empno=p_mgr;
        
        insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
        values(seq_empno.nextval, p_ename, p_job, p_mgr, sysdate, p_sal, v_comm, v_deptno);
end;
/* ���ν����� �̿��Ͽ� �� �Է��غ��� */
select * from emp;
execute usp_register('netsong7', 'salesman', 7698, 500);
execute usp_register('muyongseja', 'clerk', 7902, 700);

/* �̸��� �Է¹޾� �� ������ �μ���� �޿��� �˻��ϴ� ���ν��� */

create or replace procedure
    usp_search(p_ename in emp.ename%type, p_dname out dept.dname%type, p_sal out emp.sal%type)
is
    v_deptno  emp.deptno%type;
begin
    select sal, deptno into p_sal, v_deptno from emp where ename=p_ename;
    select dname into p_dname from dept where deptno=v_deptno;
end;

var g_sal number;
var g_dname varchar2;

execute usp_search('netsong7', :g_dname, :g_sal);

print :g_dname;
print :g_sal;

/* ��ȭ��ȣ�� �Է� ���� �� ��ȭ��ȣ�� �����ϴ� ���ν��� */
create or replace procedure
    /* ���� ������ ����Ÿ��� ���� ���� ���� �ʰ� in out�� ���ÿ� ����ص� �ȴ�. */
    usp_tel(p_tel in out varchar2)
    is
    
    begin
        p_tel := substr(p_tel, 1, 3) || '-' || substr(p_tel, 4);
    end;
    
    var g_tel varchar2;
    
    begin
        :g_tel := 1234567;
    end;
    
execute usp_tel(:g_tel);

print :g_tel;

select empno, ename, sal, job from emp order by empno desc;