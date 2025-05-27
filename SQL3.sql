-- 1. Find average salary in company
select round(avg(sal)) from emp;
-- 2. Find minimum earnings of clerks
select min(sal) from emp where ename = 'CLARK';
-- 3. Count, how many employees work in department 20
select count(e.ename) from emp e inner join dept d on e.deptno = d.deptno where d.deptno = 20;
-- 4. Find average salary for each job
select job, avg(sal)from emp group by job;
-- 5. Find average salary for each job except managers
select avg(sal) from emp where job != 'MANAGER';
-- 6. Find average salary for each job and department
select d.dname, e.job, avg(e.sal) from emp e inner join dept d on e.DEPTNO = d.DEPTNO group by d.dname, e.job;
-- 7. Find maximum salary for each job
select max(sal) from emp;
-- 8. Find average salary for departments with at least 3 employees
select avg(sal) from emp having count(DEPTNO) > 3;
-- 9. Find jobs with average salary > 3000
select job from emp group by job having avg(sal) > 3000;
-- 10. Find average salary and annual earnings for each job (remember about commission)
select job, avg(sal), sum(sal*12 - nvl(comm,0)) from emp group by job;
-- 11. Find departments with at least 3 employees
select d.dname from dept d inner join EMP E on d.DEPTNO = E.DEPTNO group by d.dname having count(e.ename) > 3;
-- 12. Check if all employee numbers are mutually different
select count(empno), count(distinct empno) from emp;
-- 13. Find lowest earnings paid by managers to their subordinates.
select e1.ename, min(e2.sal) from emp e1 inner join emp e2 on e1.empno = e2.mgr group by e1.ename order by min(e2.sal);
-- 11. Display manager name, subordinate name and subordinate salary. Sort results ascending
-- by salary
select e2.ename, e1.ename, e1.sal from emp e1 inner join emp e2 on e1.mgr = e2.empno order by e1.sal;
-- 14. Count how many employees work in department located in DALLAS
select d.loc, count(d.dname) from dept d inner join emp e on e.deptno = d.deptno where d.loc = 'DALLAS' group by d.loc ;
-- 15. Find highest earnings for each salgrade
select s.grade, max(e.sal)from salgrade s inner join emp e on e.sal between s.losal and s.hisal
group by s.grade;
-- 16. Find recurring amounts of earnings and display how many employees receive it
select sal, count(sal) from emp group by sal having count(sal)>1;
-- 17. Find average earnings for employees in second salgrade
select s.grade, avg(e.sal) from emp e inner join SALGRADE s on e.sal between s.LOSAL AND S.HISAL group by s.grade;
-- 18. Find how many subordinates are assigned to each manager. Include employees with no
-- subordinates
select e2.ename, count(e1.ename) from emp e1 inner join emp e2 on e1.mgr = e2.empno group by e2.ename;
-- 19. Display sum of salary in first salgrade
select sum(e.sal) from emp e inner join salgrade s on e.sal between losal and hisal where s.grade = 1;