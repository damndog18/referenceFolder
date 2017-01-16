select username, account_status from dba_users;
/* 주석 */
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

/* SELECT FIELD, FIELD...... FROM [소유자].테이블명; */
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

/* 중복 값 제거 */
select distinct deptno from emp;

/* 급여가 많은 순으로 사번, 이름, 급여를 조회 */
select empno, ename, sal from emp order by sal desc;
select empno, ename, sal from emp order by sal, empno desc;
select empno, ename, sal from emp order by sal desc, empno asc;

/* 부서별로 급여가 적은 순으로 이름, 급여, 부서코드를 조회 */
select ename, sal, deptno from emp;
select ename, sal, deptno from emp order by deptno;
select ename, sal, deptno from emp order by deptno asc, sal asc;

/* 급여가 3000 이상인 직원의 사번, 이름, 급여를 조회 */
select empno, ename, sal from emp;
select empno, ename, sal from emp where sal >= 3000;

/* 업무가 manager인 직원의 사번, 이름, 부서, 업무를 조회 */
/* alias 외엔 "" 쓰는 일이 없다. */
/* 명령어는 상관 없으나 실 데이타를 사용할 땐 대소문자 구분 한다 */
select empno, ename, deptno, job from emp where job="manager";
select empno, ename, deptno, job from emp where job='MANAGER';

/* 업무가 manager인 직원의 사번, 이름, 부서, 업무를 부서번호가 높은 순으로 조회 */
/* !! 정렬은 언제나 마지막에 하기 */
select empno, ename, deptno, job from emp where job = 'MANAGER' order by deptno asc;

/* 1982년 1월1일 이후에 입사한 직원의 이름, 부서, 입사일자를 조회 */
select ename, deptno, hiredate from emp where hiredate > '82/01/01';

/* 부서가 20이고 업무가 analyst인 직원의 이름, 업무, 부서, 입사일자를 조회 */
select ename, job, deptno, hiredate from emp where deptno = 20 and job = 'ANALYST';

/* 급여가 1500 이상 2500 이하를 받는 직원의 이름, 부서, 업무, 급여를 조회 */
select ename, deptno, job, sal from emp where sal >= 1500 and sal <= 2500;
/* 이상 이하 + and 일때 between and 사용 */
select ename, deptno, job, sal from emp where sal between 1500 and 2500;

/* 업무가 clerk, salesman, analyst 인 직원의 이름, 부서, 업무를 조회 */
select ename, deptno, job from emp where job = 'CLERK' or job = 'SALESMAN' or job = 'ANALYST';
/* 같고 + or 일때 in 사용 */
select ename, deptno, job from emp where job in('CLERK','SALESMAN','ANALYST');

/* 이름이 s로 시작하는 직원의 이름, 업무, 급여를 조회 */
select ename, job, sal from emp where ename like 'S%';

/* 1981에 입사한 직원의 이름, 업무, 입사일자를 조회 */
select ename, job, hiredate from emp where hiredate like '81%';
select ename, job, hiredate from emp where hiredate >= '1981/1/1' and hiredate <= '1981/12/31';
select ename, job, hiredate from emp where hiredate between '1981/1/1' and '1981/12/31';

/* 직원의 사번, 이름, 부서, 업무, 급여, 보너스를 조회 */
select empno, ename, deptno, job, sal, comm from emp;
/* 보너스를 받지 못하는 직원의 이름, 부서, 업무, 급여, 보너스 조회 */
select ename, deptno, job, sal, comm from emp where comm is null;
select ename, deptno, job, sal, comm from emp where job != 'SALESMAN';
select ename, deptno, job, sal, comm from emp where not(job = 'SALESMAN');
/* 보너스를 받는 직원의 이름, 부서, 업무, 급여, 보너스 조회 */
select ename, deptno, job, sal, comm from emp where comm is not null;

/* 대소문자 구별 없이 이름이 scott인 직원의 이름, 부서, 급여를 조회 하시오. */
select ename, deptno, sal from emp where upper(ename) = upper('scott');

/* 저장 되어있지 않은 데이타를 테스트 할 때 사용. 테스트용 테이블 dual */
/* 일반 테이블을 사용 했을 때와 비교 해 보자. */
select upper('abc') from emp;
select upper('abc') from dual;

/* '901225-1234567' 에서 성별에 해당하는 문자를 추출해라. */
select substr('901225-1234567', 8, 1) from dual;

/* L 찾기 */
select instr('MILLER', 'L') from dual;
select instr('MILLER', 'L', 1, 1) from dual;
/* L 찾기 2 */
select instr('MILLER', 'L', 1, 2) from dual;
/* L 찾기 3 */
select instr('MILLER', 'L', -4, 1) from dual;
select instr('MILLER', 'L', -1, 2) from dual;

/* ltrim() rtrim() */
/* M 제거 */
select ltrim('MILLER' , 'M') from dual;
/* 공백 제거 */
select ltrim('                  MILLER') from dual;
select ltrim(rtrim('             MILLER            ')) from dual;

/* translate() replace() */
select translate('MILLER', 'L', '*') from dual;
select replace('MILLER', 'L', '*') from dual;
/* 1:1 매칭 */
select translate(sal, '0123456789', '영일이삼사오육칠팔구') from emp;
select translate(sal, '0123456789', '영일') from emp;
/* 덩어리 매칭 */
select replace(sal, '0123456789', '영일이삼사오육칠팔구') from emp;
select replace(sal, '2450', '영일이삼사오육칠팔구') from emp;

select translate('JACK and JUE', 'J', 'BL') from dual;
select replace('JACK and JUE', 'J', 'BL') from dual;

/* ascii */
select chr(65), chr(97) from dual;
select ascii('B'), ascii('b') from dual;

/* round() 반올림 */
select round(4567.678), round(4567.678, 0), round(4567.678, 1), round(4567.678, 2), round(4567.678, -2), round(4567.678, -3) from dual;

/* trunc() 버림 */
select trunc(4567.678), trunc(4567.678, 0), trunc(4567.678, 1), trunc(4567.678, 2), trunc(4567.678, -2), trunc(4567.678, -3) from dual;

/* floor() 인수 지정 불가. 닭버림 */
select floor(4567.678), floor(4567.478) from dual;

/* ceil() 인수 지정 불가. 닭올림 */
select ceil(4567.678), ceil(4567.478) from dual;

/* mod() 10/3의 나머지 */
select mod(10, 3) from dual;

/* power() 2^10 */
select power(2, 10) from dual;

/* sign() 음수 양수 */
select sign(1000), sign(-15), sign(0) from dual;

/* sysdate */
select sysdate from dual;
select sysdate+100 from dual;

/* months_between() 날짜와 날짜의 차이(month로) */
select months_between('2016/9/5', sysdate) from dual;
select months_between(sysdate, '2016/9/5') from dual;

/* add_months() */
select add_months(sysdate, 21) from dual;

/* next_day() 2016/1/17 이후의 금요일 */
select next_day('2016/1/17', 'FRIDAY') from dual;

/* last_day() sysdate 이후의 마지막 날 */
select last_day(sysdate) from dual;

/* 날짜에서의 round() */
select round(sysdate) from dual;
/* 2016/9/20 숫자가 아닌 값은 round에 못 넣음. 날짜로 변환하여 round에 넣음. */
select round(to_date('2016/9/20'), 'DAY') from dual;
select round(to_date('2016/9/20'), 'MONTH') from dual;
select round(to_date('2016/9/20'), 'YEAR') from dual;

/* NUMBER 형식의 sal을 VARCHAR2 형식으로 바꿈 */
select ename, sal, to_char(sal) from emp;
select ename, sal, to_char(sal, '$999,999') from emp;
select ename, sal, to_char(sal, 'L999,999') from emp;

/* 변환 후 표시 */
select to_char(sysdate, 'YYYY MM DD HH"시" MI"분" SS"초"') from dual;

/* 직원의 이름, 급여, 보너스, 총급여를 검색 */
/* null은 계산 불가. */
select ename, sal, comm, sal + comm "총sal" from emp;
/* nvl() null을 0으로 바꾸기 */
select ename, sal, comm, sal + nvl(comm, 0) "총sal" from emp;

/* decode() */
select ename, job, decode(job, 'SALESMAN', '맞다', '아니다') from emp;
select ename, job, decode(job, 'SALESMAN', '개', 'CLERK', '소', 'MANAGER', '말', '닭') from emp;

/* 업무가 SALESMAN인 직원의 급여 평균, 최고액, 최저액, 합계를 조회 */
select avg(sal) from emp;
select avg(sal+nvl(comm, 0)), sum(sal+nvl(comm, 0)) from emp where job = 'SALESMAN';

/* count() null은 세지 않는다 */
select count(empno) from emp;
select count(*) from emp;
select count(comm) from emp;

/* 부서별로 급여 평균, 최고급여, 최저급여, 급여 합계를 조회 */
select distinct deptno from emp;
select avg(sal), max(sal), min(sal), sum(sal) from emp where deptno = 10;
select avg(sal), max(sal), min(sal), sum(sal) from emp where deptno = 20;
select avg(sal), max(sal), min(sal), sum(sal) from emp where deptno = 30;
/* group by */
select deptno, avg(sal), max(sal), min(sal), sum(sal) from emp group by deptno;
select deptno, avg(sal), max(sal), min(sal), sum(sal) from emp group by deptno order by avg(sal) desc;
/* job은 group by로 묶인 depno(3개)와 갯수가 다르다. 에러 남 */
select deptno, job, avg(sal), max(sal), min(sal), sum(sal) from emp group by deptno;
/* job도 group by 해 줘야 함 */
select deptno, job, avg(sal), max(sal), min(sal), sum(sal) from emp group by deptno, job;

/* 전체 급여의 합계가 5000을 초과하는 업무에 대해 급여 합계 조회 */
select job, sum(sal) from emp group by job having sum(sal)>5000;
/* 전체 급여의 합계가 5000을 초과하는 업무에 대해 급여 합계 조회, SALESMAN만 빼고 */
/* 성능 차이 비교 */
select job, sum(sal) from emp group by job having sum(sal)>5000 and job != 'SALESMAN';
select job, sum(sal) from emp where job != 'SALESMAN' group by job having sum(sal)>5000;

==============================================================================================
select * from emp;
1. 사번이 7902, 7788, 7566이 아닌 사원의 사번, 이름, 업무, 급여, 입사일자를 조회
select empno, ename, job, sal, hiredate from emp where empno!='7902' and empno!='7788' and empno!='7566';
select empno, ename, job, sal, hiredate from emp where empno not in(7902,7788,7566);
2. 업무가 president 또는 salesman이고 급여가 1500인 직원의 이름, 급여, 업무, 부서번호를 조회
select ename, sal, job, deptno from emp where sal = '1500' and job between 'PRESIDENT' and 'SALESMAN';
select ename, sal, job, deptno from emp where job in('PRESIDENT','SALESMAN') and sal=1500;
select ename, sal, job, deptno from emp where (job='PRESIDENT'or job='SALESMAN') and sal=1500;
3. 가장 최근에 입사한 사원의 사번, 이름, 업무, 입사일자 조회
select deptno, ename, job, hiredate from emp order by hiredate desc;
4. 같은 부서내에서 같은 업무를 하는 직원의 급여가 많은 순으로 조회
select ename, job, sal, deptno from emp order by deptno desc, job, sal desc;
5. 커미션이 급여보다 10%이상 많은 직원의 이름, 부서, 업무, 급여, 커미션을 조회
select ename, deptno, job, sal, comm from emp where comm > (sal*0.1);
6. 이름에 L자가 2개 있고 30번 부서이거나 직속상사가 7782인 직원의 이름, 부서, 직속상사를 조회
select ename, deptno, mgr from emp where ename like '%L%L%' and deptno=30 or mgr=7782;
select ename, deptno, mgr from emp where ename like '%L%L%' and mgr=7782 or deptno=30;
=============================================================================================
13. 오늘부터 12월 25일까지는 몇일이 남았는가?
select round(to_date('2016/12/25')-sysdate) from dual;
14. 현재까지 근무한 근무일수를 몇주 몇일로 출력하시오. 단, 근무일수가 많은 사람순으로 조회
select to_char(sysdate-(to_date(hiredate, 'YY/MM/DD'))) from emp;
15. 10번부서 직원들 중 현재까지의 근무 월수를 계산해서 조회
select ename, hiredate, months_between(sysdate, hiredate) from emp where deptno = 10;
16. 20번부서 직원들 중 입사일자로부터 5개월이 지난 후의 날짜를 계산해서 조회
select ename, hiredate, add_months(hiredate, 5) from emp where deptno = 20; 
17. 모든 직원에 대해 입사한 달의 근무 일수를 계산해서 조회
select ename, hiredate, last_day(hiredate)-hiredate "working" from emp;
18. 현재 급여에 15%가 증가된 급여를 계산하여 사번, 이름, 업무, 급여, 증가된 급여를 조회
select empno, ename, job, sal, trunc(sal+(sal*0.15)) "+15%" from emp;
19. 이름, 입사일, 입사일로부터 현재까지의 월수, 급여, 급여총계를 조회
select ename, hiredate, trunc(months_between(sysdate, hiredate)) "총month", sal, sal*trunc(months_between(sysdate, hiredate)) "총sal" from emp;
20. 업무가 analyst이면 급여를 10%증가시키고 clerk이면 15%, manager이면 20% 증가시켜서 이름, 업무, 급여, 증가된 급여를 조회
select ename, job, sal, sal "증가sal" from emp;
=============================================================================================

/* Scott의 급여보다 더 많이 받는 직원의 이름, 업무, 급여를 조회 */
select ename, job, sal from emp where ename='SCOTT';
select ename, job, sal from emp where sal>3000;
/* 두 번 해야 할 작업을 한 번으로 끝냄. subquery */
select ename, job, sal from emp where sal>(select sal from emp where ename='SCOTT');

/* 사번이 7521인 사람의 업무와 같고 급여가 7934보다 많은 직원의 사번, 이름, 업무, 급여를 조회 */
select sal from emp where empno=7934;
select job from emp where empno=7521;
select empno, ename, job, sal from emp where job='SALESMAN' and sal>1300;
/* 세 번 해야 할 작업을 한 번으로 끝냄. */
select empno, ename, job, sal from emp where job=(select job from emp where empno=7521) and sal>(select sal from emp where empno=7934);

/* 업무 중에서 가장 적은 평균 급여를 받는 업무와 평균 급여를 조회 */
/* 최저 평균 급여 구하기 */
select min(avg(sal)) from emp group by job;
/* 최저 평균 급여를 subquery로 이용하여 데이타 조회 */
select job, avg(sal) "총sal" from emp group by job having avg(sal) = (select min(avg(sal)) from emp group by job);

/* 업무별로 최소 급여를 받는 직원의 사번, 이름, 업무, 급여, 부서번호 조회 */
/* 최소 급여 구하기 */
select min(sal) from emp group by job;
/* 최소 급여 기준으로 데이타 조회 */
select empno, ename, job, sal, deptno from emp where sal in(800,1250,2450,3000,5000);
/* subquery를 이용한 조회. in 연산자 */
select empno, ename, job, sal, deptno from emp where sal in(select min(sal) from emp group by job);

/* 업무별 최소급여보다 많은 급여를 받는 직원의 사번, 이름, 급여, 부서번호 조회 */
/* 최소 급여 구하기 */
select min(sal) from emp group by job;
/* 최소 급여 기준으로 데이타 조회 */
select empno, ename, sal, deptno from emp where sal>800 or sal>1250 or sal>5000 or sal>2450 or sal>3000;
/* subquery를 이용한 조회. any 연산자 */
select empno, ename, sal, deptno from emp where sal > any(select min(sal) from emp group by job);

/* 업무별 최대급여 이상 급여를 받는 직원의 사번, 이름, 업무, 급여, 부서번호 조회 */
/* 최대 급여 구하기 */
select max(sal) from emp group by job;
/* 최대 급여 기준으로 데이타 조회 */
select empno, ename, job, sal, deptno from emp where sal>=1300 and sal>=1600 and sal>=5000 and sal>=2975 and sal>=3000;
/* subquery를 이용한 조회. all 연산자 */
select empno, ename, job, sal, deptno from emp where sal >= all(select max(sal) from emp group by job);

/* 적어도 한명의 직원으로부터 보고를 받을 수 있는 직원의 이름, 업무, 입사일자, 급여를 조회 */
select * from emp;
/* 매니져만 뽑아내기 */
select distinct mgr from emp;
/* 매니져 기준으로 데이타 조회. 연관 subquery. e는 나중에 배움 */
/* 외부 쿼리의 데이타를 내부 쿼리로 가져가서 처리하고 다시 외부 쿼리로 돌아와서 처리 종료 됨. */
/* 부하 문제로 쓰지 않는 방식임. */
select ename, job, hiredate, sal from emp e where exists(select * from emp where e.empno=mgr);

/* 실습을 위한 데이터 변경 */
update emp set sal=1500, comm=300 where empno=7934;

/* 30번 부서에 있는 직원의 급여, 보너스와 같은 급여, 보너스를 받는 직원의 사번, 이름, 부서번호, 급여, 보너스를 조회 */
select empno, ename, deptno, sal, comm from emp where deptno = 30;
/* 이렇게 하면 상관 없는 MILLER가 튀어나온다. 두 개의 subquery가 따로따로 연산해서 그렇다 */
select empno, ename, deptno, sal, comm from emp where sal in(select sal from emp where deptno=30) and comm in(select comm from emp where deptno=30);
/* 다중열 subquery를 이용하면 동시에 연산할 수 있다. MILLER ㅂㅂ3 */
select empno, ename, deptno, sal, comm from emp where (sal, comm) in(select sal, comm from emp where deptno=30);

/* 실습을 위한 데이터 원복 */
update emp set sal=1300, comm=null where empno=7934;
=======================================================================================================
1. emp테이블에서 등록되어 있는 인원수, 보너스에 NULL이 아닌 인원수, 보너스의 평균(보너스가 NULL이 아닌 평균, NULL포함한 평균),
등록되어 있는 부서의 수(총개수와 중복을 제외한 개수)를 구하여 출력
select * from emp;
select count(ename), count(comm), avg(comm), round(avg(nvl(comm,0)),2), count(deptno), count(distinct deptno) from emp ;
2. 부서인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 조회
select deptno from emp group by deptno having count(ename)>4;
select deptno, count(ename), sum(sal) from emp group by deptno having count(ename)>4;
3. 급여가 최대 2900 이상인 부서에 대해 부서번호, 평균 급여, 급여의 합을 조회
select deptno from emp group by deptno having max(sal)>=2900;
select deptno, avg(sal), sum(sal) from emp group by deptno having max(sal)>=2900; 
4. 최고급여와 최소급여의 차이는 얼마인가?
select min(sal), max(sal), max(sal)-min(sal) from emp;
5. 년도별 직원의 수, 최저 임금, 최고 임금, 평균 임금, 임금 합계

6. 총 직원의 수, 입사 년도와 해당 년도에 입사한 직원의 수

7. 업무와 dept별 임금과 각 임금들의 합

8. BLAKE와 같은 부서에 있는 모든 직원의 사번, 이름, 입사일자 조회
select deptno from emp where ename='BLAKE';
select empno, ename, hiredate, deptno from emp where deptno=(select deptno from emp where ename='BLAKE');
9. SELECT empno, ename, deptno, sal, comm FROM emp WHERE (sal, comm) IN(SELECT sal, comm FROM emp WHERE deptno=30);
   이 쿼리를 수정하여 comm이 null인 직원도 출력할 수 있도록 하시오
SELECT sal, comm FROM emp WHERE deptno=30;
SELECT empno, ename, deptno, sal, comm FROM emp WHERE (sal, nvl(comm, 0)) in(SELECT sal, nvl(comm, 0) FROM emp WHERE deptno=30);
10. 평균 급여 이상을 받는 직원들의 사번, 이름을 조회. 단, 급여가 많은 순으로 정렬
select avg(sal) from emp;
select empno, ename from emp where sal>(select avg(sal) from emp) order by sal desc;
11. 이름에 'T'자가 들어가는 직원이 근무하는 부서에서 근무하는 직원의 사번, 이름, 급여 조회
select distinct deptno from emp where ename like '%T%';
select empno, ename, sal, deptno from emp where deptno in(select distinct deptno from emp where ename like '%T%');
12. 부서의 위치가 dallas인 모든 직원에 대해 사번, 이름, 급여, 업무를 조회
select deptno from dept where loc='DALLAS';
select empno, ename, sal, job, deptno from emp where deptno=(select deptno from dept where loc='DALLAS');
13. King에게 보고하는 모든 직원의 이름과 부서,업무,급여를 조회
select empno from emp where mgr=7839;
select ename, deptno, job, sal from emp where empno in(select empno from emp where mgr=7839);
14. 월급이 30번 부서의 최저 급여보다 높은 직원의 사번, 이름, 급여를 조회
select min(sal) from emp where deptno=30;
select empno, ename, sal from emp where sal > any(select min(sal) from emp where deptno=30);
15. 10번 부서에서 30번 부서의 직원과 같은 업무를 하는 직원의 이름과 업무를 조회
select job from emp where deptno=30;
select ename, job from emp where job in(select job from emp where deptno=30) and deptno=10;
=================================================================================================

select * from emp;
select * from dept;

/* Inner Join */

/* 직원의 사번, 이름, 업무, 부서번호, 부서명을 조회 */
/* 표준 SQL */
select emp.empno, emp.ename, emp.job, emp.deptno, dept.dname from emp inner join dept on emp.deptno=dept.deptno;
/* PL-SQL */
select emp.empno, emp.ename, emp.job, emp.deptno, dept.dname from emp, dept where emp.deptno=dept.deptno;

/* SALESMAN에 대한 사번, 이름, 업무, 부서명을 조회 */
/* 동일한 필드명이 없다면 테이블명. 이거 안해도 됨 */
select emp.empno, emp.ename, emp.job, dept.dname from emp inner join dept on emp.deptno=dept.deptno and job='SALESMAN';
select emp.empno, emp.ename, emp.job, dept.dname from emp inner join dept on emp.deptno=dept.deptno and emp.job='SALESMAN';
/* and로 묶으면 조건을 함께 처리. where로 묶으면 따로 처리 */
select emp.empno, emp.ename, emp.job, dept.dname from emp inner join dept on emp.deptno=dept.deptno where job='SALESMAN';

/* New York 에서 근무하는 직원의 사번, 이름, 업무, 부서명, 부서위치를 조회 */
select emp.empno, emp.ename, emp.job, dept.dname, dept.loc from emp inner join dept on emp.deptno=dept.deptno where loc='NEW YORK';

/* Outer Join */

/* 이름, 급여, 부서명, 근무지를 조회, 단 부서명과 근무지는 모두 출력 */
select ename, sal, dname, loc, dept.deptno from emp right outer join dept on emp.deptno=dept.deptno;

/* Non Equi Join */

/* 직원들의 급여에 대한 등급을 조회 */
select ename, job, sal, grade, losal, hisal from emp inner join salgrade on sal>=losal and sal<=hisal;

/* Self Join */

/* 직원의 사번, 이름, 업무, 관리자, 관리자 이름을 조회 */
select a.empno, a.ename, a.job, a.mgr, b.ename from emp a inner join emp b on a.mgr=b.empno;

/* SET 연산자 */

/* deptno 14개 */
select deptno from emp;
/* deptno 4개 */
select deptno from dept;
/* 두 개를 합쳐 UNION */
select deptno from emp union select deptno from dept;
/* 두 개를 합쳐 UNION ALL */
select deptno from emp union all select deptno from dept;
/* 두 개를 합쳐 INTERSECT */
select deptno from emp intersect select deptno from dept;
/* 두 개를 합쳐 MINUS */
select deptno from dept minus select deptno from emp;

update emp set sal=6000 where ename='SCOTT';
select sal from emp where ename='SCOTT';
rollback;

=====================================================================================================
select * from emp;
select * from dept;

1. 커미션을 받는 직원에 대해 이름, 부서명, 근무지를 조회
select ename, dname, loc, comm from emp, dept where emp.deptno=dept.deptno;
select ename, dname, loc from emp, dept where emp.deptno=dept.deptno and emp.comm>=0;
2. 이름 중간에 L자가 있는 직원에 대해 이름, 업무, 부서명, 근무지 조회
select ename, job, dname, loc from emp, dept where emp.deptno=dept.deptno and emp.ename like '%L%';
3. 각 직원들에 대해서 그들의 관리자보다 먼저 입사한 직원에 대해 이름, 입사일, 관리자이름, 관리자 입사일을 조회
select a.ename, a.hiredate, b.ename, b.hiredate from emp a, emp b where a.mgr=b.empno and a.hiredate < b.hiredate;
4. 말단사원의 사번, 이름, 업무, 부서번호, 근무지를 조회
select a.empno, a.ename, a.job, a.deptno, loc, a.mgr from emp a inner join emp b on a.mgr!=b.empno join dept c on a.deptno=c.deptno and a.job!='MANAGER';
select a.empno, a.ename, a.job, a.deptno, a.mgr, a.hiredate from emp a inner join emp b on a.mgr=b.empno;

======================================================================================================

/* 영업부 직원 중 사번, 이름, 급여, 커미션을 view로 작성 */
select empno, ename, sal, comm from emp where job='SALESMAN';
/* VIEW로 만들기 */
/* 관리자나 권한자만 VIEW를 만들 수 있다. */
create view vw_emp_sales as select empno, ename, sal, comm from emp where job='SALESMAN';
/* 권한자가 된 후 view 만들고 조회 */
select * from tab;
select * from vw_emp_sales;
/* VIEW를 수정할 땐 이게 짱짱맨 */
create or replace view vw_emp_sales as select empno, ename, sal, comm from emp where deptno=30;
/* 수정 후 조회 */
select * from tab;
select * from vw_emp_sales;

desc user_views;
select view_name from user_views;
desc user_objects;
create view vw_objects as select object_name, object_type from user_objects;
select * from vw_objects;

/* 영업부를 제외하고 급여가 2000이상인 직원들의 사번, 이름, 급여, 부서, 부서명, 급여등급을 조회하는 테이블을 뷰로 만들어 */
select * from emp;
select * from dept;
select * from salgrade;

select empno, ename, sal, a.deptno, dname, grade from emp a inner join dept b on a.deptno=b.deptno join salgrade c on a.sal>=losal and a.sal<=hisal where a.deptno!=30;
=====================================================================================================

/* PROCEDURE */
/* 사번이 7788인 사원의 급여를 3500으로 수정하는 프로시져 작성 */
select ename, sal from emp where empno=7788;
/* update emp set sal=3500 where empno=7788; 이거를 프로시져로 만듬 */
create or replace procedure usp_sal is begin update emp set sal=3500 where empno=7788; end;
/* 맨 뒤에 /를 붙여서 run 함. 이것이 컴파일. SQLPLUS에서는 끝에 / 붙이지만 SQL DEVELOPER에서는 안 붙임. */
create or replace procedure usp_sal is begin update emp set sal=3500 where empno=7788; end;/
/* 프로시져 생성 되었는지 확인 */
describe user_objects;
select object_name, object_type from user_objects;
/* 프로시져 실행 */
execute usp_sal;

/* 매개변수를 활용하는 프로시져 만들기 */
create or replace procedure usp_sal(p_empno in number, p_sal in number) is begin update emp set sal=p_sal where empno=p_empno; end;
/* 매개변수 프로시져 실행 */
execute usp_sal(7788, 3000);
/* 변경 사항 확인 */
select empno, sal from emp where empno=7788;

/* 메시지를 출력 해 주는 프로시져로 만들기 */
create or replace procedure usp_sal(p_empno in number, p_sal in number) is begin
        update emp set sal=p_sal where empno=p_empno;
/* 조건문 사용. sql% 로 시작하는 만들어져있는 전역 변수가 많이 있다. 공부! */
/* put_line()은 문자만 출력 가능. to_char를 이용하여 문자로 캐스팅. */
/* 여기서 || 는 or가 아닌 자바에서의 + 임 */
/* sql%notfound는 앞단에서 처리된게 있으면 true, 없으면 false이다. 여기서 없는 사번 출력은 상황에 맞게 만든 것임. */
        if sql%notfound then dbms_output.put_line(to_char(p_empno) || '는 없는 사번임');
        else dbms_output.put_line(to_char(sql%rowcount) || '명의 데이타가 수정 되었습니다.');
        end if;
end;
/* 문자 출력용 서버 설정 변경 */
set serveroutput on;
/* 매개변수 프로시져 실행 */
execute usp_sal(7788, 3000);
execute usp_sal(1818, 3000);
/* 변경 사항 확인 */
select empno, sal from emp where empno=7788;

/* 특정한 수에 7%의 세금을 계산하여 그 결과를 돌려받을 수 있는 프로시져 만들자 */
create or replace procedure usp_tax(p_innum in number, p_outnum out number) is begin
/* := 대입 연산자. java에서의 = 이다. */
    p_outnum := p_innum * 0.07;
end;
/* 변수 선언 */
var g_outnum number;
/* 선언한 변수를 사용하여 프로시져 호출 */
execute usp_tax(2500, :g_outnum);
/* 출력 */
print :g_outnum;

/* 사원 등록 프로시져 : usp_register */
/* 사원이름, 업무, 직속상사, 급여를 입력 받아 등록 한다. */
/* 부서번호는 직속상사와 같고 보너스는 salesman일 경우 0, 그 외에는 null을 입력 */

/* 씨퀀스 생성 */
create sequence seq_empno start with 9000;
print seq_empno;
/* 프로시져 만들기 */
create or replace procedure 
    usp_register(p_ename in emp.ename%type, p_job in emp.job%type, p_mgr in emp.mgr%type, p_sal in emp.sal%type)
    is
        /* 프로시져 안에서 사용 할 변수 선언 */
        v_comm emp.comm%type;
        v_deptno emp.deptno%type;
    begin
        if p_job = 'salesman' then v_comm := 0;
    else
        v_comm := null;        
    end if;
        
    /* 프로시져 안에서의 select 문법. 필드명의 값을 변수명에 넣겠다! */
    /* select 필드명 into 변수명 from 테이블명; */
        select deptno into v_deptno from emp where empno=p_mgr;
        
        insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
        values(seq_empno.nextval, p_ename, p_job, p_mgr, sysdate, p_sal, v_comm, v_deptno);
end;
/* 프로시져를 이용하여 값 입력해보기 */
select * from emp;
execute usp_register('netsong7', 'salesman', 7698, 500);
execute usp_register('muyongseja', 'clerk', 7902, 700);

/* 이름을 입력받아 그 직원의 부서명과 급여를 검색하는 프로시져 */

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

/* 전화번호를 입력 받은 후 전화번호를 리턴하는 프로시져 */
create or replace procedure
    /* 동일 형식의 데이타라면 따로 선언 하지 않고 in out을 동시에 사용해도 된다. */
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