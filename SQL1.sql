-- 1. Find all departments, employee names and employee numbers of their supervisors from table EMP
select deptno,ename,empno from emp;
-- 2. Print all values from all columns from table EMP.
select * from emp;
-- 3. Calculate annual salary for each employee (column sal keeps an information about one month)
select ename, (sal * 12) from emp;
-- 4. Display employee name and his annual salary assuming a raise of 250.
select ename, (sal+250)*12 from emp;
-- 5. Display employee name and his annual salary. Change header of column to Annual
select ename, (sal * 12) as Annual from emp;
-- 6. Display employee name and his annual salary. Change header of column to Annual Salary
select ename, (sal * 12) as "Annual Salary" from emp;
-- 7. Display employee number and name as one column. Change its header to Hired
select empno || ' ' || ename as Hired from emp;
-- 8. Display information about each employee in one column in form:
-- "Employee with number [EMPNO] works in department [DEPTNO] and earns (SAL] per month"
-- Change header of column to Information about Employee
select 'Employee with number ' || empno || ' works in department ' || DEPTNO || ' and earns '
    || SAL || ' per month' from emp;
-- 9. For each employee, display its name and annual earnings including commission (column comm)
select ename, (sal * 12)-NVL(comm,0) from emp;
-- 10. Display all department numbers from table EMP
select deptno from emp;
-- 11. Display all department numbers from table EMP without repetition
select distinct deptno from emp;
-- 12. Display all mutually different combinations of deptno and job from table EMP
select distinct deptno, job from emp;
-- 13. Display all information from table EMP. Sort results ascending according to the value of column ename
select * from emp order by ename;
-- 14. Display all information from table EMP. Sort results descendig according to the hiredate
select * from emp order by hiredate desc;
-- 15. Display all information from table EMP. Sort results according to values in columns:
-- deptno (ascending) and sal (descending)
select * from emp order by deptno, sal desc;