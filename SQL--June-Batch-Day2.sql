--RR
SELECT last_name, TO_CHAR(hire_date, 'DD-Mon-YYYY') FROM employees WHERE hire_date < TO_DATE('01-Jan-90','DD-Mon-RR');
SELECT last_name, TO_CHAR(hire_date, 'DD-Mon-YYYY') FROM employees WHERE hire_date < TO_DATE('01-Jan-90','DD-Mon-YY');
--– The default date display format is DD-MON-RR.
select to_char(to_date('12-apr-88','dd-mon-RR'),'yyyy') from dual;

--Conditional Expressions - if then else statements
--Case when then else
SELECT last_name, job_id, salary,
CASE job_id WHEN 'IT_PROG' THEN (1.10*salary)
WHEN 'ST_CLERK' THEN 1.15*salary
WHEN 'SA_REP' THEN 1.20*salary
ELSE salary END "REVISED_SALARY"
FROM employees;

--decode
SELECT last_name, job_id, salary,
DECODE(job_id, 'IT_PROG', 1.10*salary,
'ST_CLERK', 1.15*salary,
'SA_REP', 1.20*salary,
salary) REVISED_SALARY
FROM employees;

--group or aggregate functions
select count(nvl(salary,0)) from employees;

select count(distinct salary) from employees;

select max(salary), min(salary), avg(salary),count(distinct salary)  from employees;
select sum(salary) from employees;

--the columns in select statement should be part of group by clause or it should be within any group function
select max(salary),DEPARTMENT_ID, job_id from employees group by DEPARTMENT_ID, job_id;

--JOINS

--natural join  - using the common column(should have same name and same data type) between two tables
select EMPLOYEE_ID,DEPARTMENT_ID,FIRST_NAME, DEPARTMENTS.DEPARTMENT_NAME from employees natural join DEPARTMENTS;

--join with using
SELECT e.employee_id, e.last_name,d.location_id, department_id FROM employees e JOIN departments d
USING (department_id) ;

--join with ON
SELECT emp.employee_id, emp.last_name, emp.department_id,d.department_id, d.location_id
FROM employees emp JOIN departments d 
ON (emp.department_id = d.dept_id);

--self join - to get the employees who are acting as managers for other employees
select e.email, m.email, e.employee_id,m.manager_id from employees e join employees m on e.employee_id = m.manager_id; 







