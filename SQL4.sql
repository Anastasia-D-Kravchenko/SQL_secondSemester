-- 1. Find all employees with salary equal to lowest salary in company
select ename from emp where sal = (select min(sal) from emp);
select ename from emp where sal in (select sal from emp where sal = 1250);
-- 2. Find all employees that have the same job as BLAKE
select ename from emp where job = (select job from emp where ename = 'BLAKE');
-- 3. Find all employees with salary equal to lowest salary in each department
select deptno, sal from emp where (deptno, sal) in (select deptno, min(sal) from emp group by deptno);
-- 4. Find employees with salary equal to lowest salary in departments they work in
select ename, sal from emp where (deptno, sal) in (select deptno, min(sal) from emp group by deptno);
-- 5. Using ANY, find employees with salary greater than lowest salary in department 30
select ename, sal from emp where sal > ANY(select min(sal) from emp where deptno = 30);
-- 6. Using ALL, find employees with salary greater than every salary in department 30
select ename,sal from emp where sal > ALL(select sal from emp where deptno = 30);
-- 7. Find employees with salary greater than lowest salary in department 30 (without ANY)
select ename, sal from emp where sal > (select min(sal) from emp where deptno = 30);
-- 8. Find employees with salary greater than every salary in department 30 (without ALL)
select ename,sal from emp where sal > (select max(sal) from emp where deptno = 30);
-- 9. Find departments with average salary greater than average salary of department 30
select deptno, avg(sal) from emp group by deptno having avg(sal) > (select max(sal) from emp where deptno=30);
-- 10. Find job with highest average salary
select job from emp group by job having avg(sal) > (select avg(sal) from emp);
-- 11. Find employees with salary lower than highest salary in SALES (department)
select ename, sal from emp where sal < (select max(sal) from emp e inner join DEPT D on D.DEPTNO = e.DEPTNO where D.DNAME = 'SALES');
-- 12. Find employees with salary equal to lowest salary in their departments (correlated subquery)
select d.dname, e.ename, e.sal from emp e inner join DEPT d on D.DEPTNO = e.DEPTNO where e.sal in (select min(sal) from emp where deptno = e.deptno);
-- 13. Using EXISTS, find employees who have subordinates (correlated subquery)
select ename from emp e where EXISTS(select mgr from emp where mgr = e.empno);
select e1.ename from emp e1 inner join emp e2 on e1.empno = e2.mgr group by e1.ename;
-- 14. Find employees whose department does not appear in DEPT table
select ename, deptno from emp where nvl(deptno,0) not in (select deptno from dept);
select ename, deptno from emp where not exists(select deptno from dept where deptno = emp.deptno);
-- 15. For each department find recently hired employees. Sort by hire date
select d.dname, e.ename, e.hiredate from emp e inner join DEPT d on D.DEPTNO = e.DEPTNO where e.hiredate = (select max(hiredate) from emp where deptno = e.deptno);
-- 16. Find departments with no employees (using SUBQUERY) (correlated subquery)
select dname from dept where not exists (select deptno from emp where deptno = dept.deptno);
-- 17. Write a query that returns the percentage share of the number of employees in each
-- department
select e1.deptno, round(count(e1.deptno)/(select count(deptno) from emp)*100) from emp e1 group by e1.deptno;