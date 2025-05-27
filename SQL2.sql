-- 1. Join data from EMP and DEPT using WHERE clause
select e.ename, d.deptno from emp e, dept d where e.deptno = d.deptno;
-- 2. Join data from EMP and DEPT using INNER JOIN
select e.ename, d.deptno from emp e inner join dept d on e.DEPTNO = d.DEPTNO;
-- 3.Select employee name and department name for all employees in alphabetical order
select e.ename, d.deptno from emp e inner join dept d on e.DEPTNO = d.DEPTNO order by e.ename;
-- 4. Find all employees with their numbers and names of departments they work in
select e.ename, d.deptno from emp e inner join dept d on e.DEPTNO = d.DEPTNO;
-- 5.Select employee name, job and department name for all employees who earn more than 1500
select e.ename, e.job, d.dname from emp e inner join dept d on e.DEPTNO = d.DEPTNO where sal > 1500;
-- 6. Get a list of employees with name, job, salary and earning class (table SALGRADE)
select e.ename, e.job, s.grade from emp e, salgrade s where e.sal between s.losal and s.hisal;
-- 7.Select all information for employees in 3ra earning class. 
select e.ename, e.job, s.grade from emp e inner join salgrade s on e.sal between s.losal and s.hisal
where s.GRADE = 3;
-- 8. Find employees who work in Dallas. 
select e.ename, d.loc, d.DEPTNO from emp e inner join dept d on e.DEPTNO = d.DEPTNO where d.loc='DALLAS';
-- 9. For each employee select his name, department name and earning class
select e.ename, d.dname, s.grade from emp e inner join DEPT D on D.DEPTNO = e.DEPTNO inner join SALGRADE s on e.sal between s.LOSAL and s.HISAL;
-- 10. Find all employees with their numbers and names of departments they work in.
-- Include departments without any employees
select e.ename, e.empno, d.dname from emp e right join S32802.DEPT D on D.DEPTNO = e.DEPTNO;
-- 11. Find all employees with their numbers and names of departments they work in.
-- Include employees without departments
select e.ename, e.empno, d.dname from emp e left join S32802.DEPT D on D.DEPTNO = e.DEPTNO;
-- 12. Find employees (name, department number) from departments 20 and 30
select ename, deptno from emp where deptno in (20, 30);
-- 13. List jobs appearing in departments 10 and 30
select distinct e1.job, e2.job, e1.deptno, e2.deptno from emp e1 inner join emp e2 on e1.deptno = 10 and e2.deptno = 30 where e1.job = e2.job;
-- 14. List jobs appearing in department 10 or 30 (or both)
select distinct e1.job, e2.job, e1.deptno, e2.deptno from emp e1 inner join emp e2 on e1.deptno = 10 or e2.deptno = 30 where e1.job = e2.job;
-- 15. List jobs appearing in department 10 but not in department 30
select distinct e1.job, e2.job, e1.deptno, e2.deptno from emp e1 inner join emp e2 on e1.deptno = 10 and e2.deptno != 30 where e1.job = e2.job;
-- 16. Find employees who earn less than their managers
select e1.ename, e2.ename from emp e1 inner join emp e2 on e1.EMPNO = e2.MGR where e1.sal < e2.sal;
-- 17. For each employee show his name and name of the manager.Sort results by managers name
select e1.ename, e2.ename from emp e1 inner join emp e2 on e1.EMPNO = e2.MGR order by e2.ENAME;