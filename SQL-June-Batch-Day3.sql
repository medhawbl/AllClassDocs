--Non Equi Joins
SELECT e.last_name,e.salary,j.JOB_TITLE FROM employees e JOIN JOBS ON j.min_salary > 5000;
SELECT * FROM JOBS;

--Outer Joins
SELECT e.first_name,e.EMPLOYEE_ID, e.department_id,d.DEPARTMENT_ID, d.department_name
FROM employees e full outer Join departments d ON (e.department_id = d.department_id) ;

--cartesian product or using cross join
SELECT count(*) FROM employees CROSS JOIN departments ;

--sub queries

SELECT last_name, salary FROM employees WHERE salary  = (SELECT salary

FROM employees WHERE email='DAUSTIN') and  salary <> (SELECT salary FROM employees WHERE email='LDEHAAN');

--u can use group funcs in sub queries
SELECT last_name, job_id, salary FROM employees WHERE salary > (SELECT min(salary) FROM employees);

SELECT department_id, MIN(salary) FROM employees GROUP BY department_id HAVING MIN(salary) >

(SELECT MIN(salary) FROM employees WHERE department_id = 50);
--
SELECT employee_id, last_name FROM employees WHERE salary > 

(SELECT MIN(salary) FROM employees GROUP BY department_id);


--In,Any,All
SELECT employee_id, last_name, job_id, salary FROM employees WHERE salary < ALL

(SELECT salary FROM employees WHERE job_id = 'FI_MGR') AND job_id <> 'FI_MGR';


--union,intersect,minus

SELECT employee_id, job_id FROM employees union all SELECT employee_id, job_id FROM job_history;

--DML - insert, update, delete
desc employees;

insert into employees values(3984,'SahitiShah','Goud','ab@acom','123456790',sysdate,'IT_PROG',25000,'',null,'60');

insert into employees(employee_id,last_name,email,hire_date,salary,job_id) 
values ('3987','Venakat','a@a5345.com', '16-apr-16', 10000,'IT_PROG');

rollback;

desc departments;

select * from LOCATIONS;

INSERT INTO departments

(department_id, department_name, location_id)

VALUES (&department_id, '&department_name',&location);



INSERT INTO sales_reps(id, name, salary, commission_pct)

SELECT employee_id, last_name, salary, commission_pct

FROM employees

WHERE job_id LIKE '%REP%';

update EMPLOYEES set EMAIL='new@two.com',last_name='rao' where EMPLOYEE_ID='3984';

delete from EMPLOYEES where EMPLOYEE_ID='3987';

--will save the changes from session to DB but once comiited u cannot rollback
commit;

--rollback the last uncommited changes
rollback;

select * from EMPLOYEES where EMPLOYEE_ID=3986;

INSERT INTO (SELECT employee_id, last_name, email, hire_date, job_id, salary,department_id FROM employees

 WHERE department_id = 50)

VALUES (99999, 'Taylor', 'DTAYLOR',

 TO_DATE('07-JUN-99', 'DD-MON-RR'),

'ST_CLERK', 5000, 50);

--dml - u can always use comit and rollback

--ddl,dcl - autocommit



insert into employees(employee_id,last_name,email,hire_date,salary,job_id) 
values ('3988','Venakat','a@a534665.com', '16-apr-16', 10000,'IT_PROG');

update EMPLOYEES set EMAIL='new@two689.com',last_name='Venakat' where EMPLOYEE_ID='3988';

SAVEPOINT first_savepoint;

update EMPLOYEES set EMAIL='new@two7.com',last_name='rao' where EMPLOYEE_ID='3986';

SAVEPOINT second_savepoint;
update EMPLOYEES set EMAIL='fresh@one.com',last_name='rao' where EMPLOYEE_ID='3986';


rollback;














