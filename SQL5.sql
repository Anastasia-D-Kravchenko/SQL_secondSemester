-- 1. Find employees who earn the most in their departments.
select d.dname, e.ename from emp e inner join dept d on d.deptno = e.deptno where e.sal = (select max(sal) from emp where deptno = d.deptno);
-- 2. Find employees who earn above average in their departments.
select d.dname, e.ename, e.sal from emp e inner join dept d on d.deptno = e.deptno where e.sal > (select avg(sal) from emp where deptno = e.deptno);
select d.dname, avg(e.sal) from emp e inner join dept d on d.deptno = e.deptno group by d.dname;
-- 3. Find employees with the lowest earnings in their jobs.
select job, ename, sal from emp e where sal in (select min(sal) from emp where job = e.job);
select job, min(sal) from emp group by job;
-- 4. Find employees who have subordinates using the EXISTS predicate.
select e1.ename, count(e2.ename) from emp e1 inner join emp e2 on e1.empno = e2.mgr group by e1.ename;
select ename from emp e where exists(select mgr from emp where e.empno = mgr);
-- 5. Find employees whose department does not appear in the DEPT table.
select ename from emp where not exists(select dname from dept where EMP.DEPTNO = deptno);
-- 6. Using a subquery, find the names and locations of departments without any employees.
select dname, loc from dept where deptno not in (select nvl(deptno,0) from emp);
select dname, loc from dept where not exists(select deptno from emp where deptno = dept.deptno);
-- 7. Find employees earning the maximum salary in their job positions. Sort results according to decreasing earnings.
select job, ename, sal from emp e where sal in (select max(sal) from emp where e.job = job) order by sal DESC;
-- 8. Find employees earning a minimum salary in their earning groups. Sort results according to descending earning groups.
select job, ename, sal from emp e where sal in (select min(sal) from emp where e.job = job) order by sal DESC;
-- 9. Identify recently hired employees for each department. Sort results by hire dates.
select ename, hiredate from emp e where HIREDATE in (select max(hiredate) from emp where e.deptno = deptno);
-- 10. Provide the name, salary and name of the department for employees whose salary exceeds the average of their earning groups.
select e.ename, e.sal, d.dname from emp e inner join dept d on d.deptno = e.deptno where e.sal > (select avg(sal) from emp where e.deptno = deptno);
-- 11. Using a subquery, find employees assigned to non-existent departments.
select e.ename from emp e where deptno is null or deptno not in (select deptno from dept);
-- 12. Indicate the top three earning employees in the company. Show their names and salaries.
-- (Assume, that salaries in company are unique)
select ename, sal from emp order by sal DESC fetch first 3 rows only;
-- 13. Indicate employees whose wages belong to the top three wages in the company. Give them their
-- names and salaries. (Assume, that salaries in company are not unique)
select ename, sal from emp where sal in (select distinct sal from emp order by sal DESC fetch first 3 rows only);
-- 14. List the name, salary, department number and average earnings in the department (in one row!)
-- for employees whose earnings exceed the average of their departments (the solution does not require
-- the use of correlations).
select ename, sal, emp.deptno, round(e1.avrg)
from emp
inner join (select deptno, avg(sal) as avrg from emp group by deptno) e1 on emp.deptno = e1.deptno
where sal > e1.avrg;
select ename, sal, deptno from emp where sal > (select avg(sal) as avrg from emp where deptno = emp.deptno);
select deptno, avg(sal) from emp group by deptno;
-- 15. Write a query generating a list of employees and their employment dates, with an asterisk (*) in
-- the result of last employed.
select ename, hiredate from emp where hiredate = (select max(hiredate) from emp);
select ename, hiredate, case when hiredate = (select max(hiredate) from emp) then '*' else ' ' end as asterics from emp;