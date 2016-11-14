desc employees;
select * from departments;
--table with dummy column you can use to view results from functions and calculations.
desc dual;
select * from dual;
--order by
SELECT last_name, department_id, salary FROM employees ORDER BY salary;
SELECT last_name, department_id, salary FROM employees ORDER BY department_id desc;
SELECT last_name, department_id, salary FROM employees ORDER BY department_id desc, salary asc;
SELECT last_name, department_id, salary FROM employees ORDER BY department_id, salary desc;

--substitution
SELECT employee_id, job_id, &column_name FROM employees ORDER BY &column_name ;
SELECT employee_id, job_id, &column_name FROM employees where lower(last_name)= &ln;

--single row functions : character manipulation functions
SELECT employee_id, last_name, department_id FROM employees WHERE lower(last_name) = 'king';
select upper(last_name),employee_id, job_id, FIRST_NAME from EMPLOYEES;
select initcap(concat(concat(FIRST_NAME,' '), Last_name)) as fullname from EMPLOYEES;
select SUBSTR('HelloWorld',1,5) from dual;
select LENGTH('HelloWorld') from dual;
select INSTR(last_name, 'ng') ,last_name,EMPLOYEE_ID,email from EMPLOYEES;
select LPAD(salary,10,'*') from EMPLOYEES;
select RPAD(salary, 10, '*') from EMPLOYEES;
select REPLACE ('JACK and JUE','J','BL') from dual;
select trim('g' from last_name) trimedLastName, job_id from EMPLOYEES WHERE SUBSTR(job_id, 4) = 'REP';

--single row functions : Number functions
SELECT ROUND(45.923,2), ROUND(45.923,0),ROUND(44.923,-1) FROM DUAL;
SELECT ROUND(44.923,-1),ROUND(46.923,-1),ROUND(45.923,-1) FROM DUAL;
SELECT ROUND(144.923,-2),ROUND(150.923,-2),ROUND(174.923,-2) FROM DUAL;

SELECT TRUNC(45.923,2), TRUNC(45.923), TRUNC(45.923,-1) FROM DUAL;
SELECT TRUNC(44.923,-1),TRUNC(46.923,-1),TRUNC(45.923,-1) FROM DUAL;
SELECT TRUNC(144.923,-2),TRUNC(150.923,-2),TRUNC(174.923,-2) FROM DUAL;

select mod(61, 2) from dual;
SELECT last_name, salary, MOD(salary, 5) FROM employees WHERE job_id = 'SA_REP';


--– The default date display format is DD-MON-RR.
select to_char(to_date('12-apr-88','dd-mon-RR'),'yyyy') from dual;
select to_char(to_date('12-apr-88','dd-mon-YY'),'yyyy') from dual;

--dates & basic functions
select sysdate from dual;
SELECT last_name, hire_date FROM employees WHERE hire_date > '01-FEB-88';
SELECT last_name, (SYSDATE-hire_date)/7 AS WEEKS FROM employees WHERE department_id = 90;
SELECT MONTHS_BETWEEN('01-SEP-95','11-JAN-94') from dual;
select ADD_MONTHS ('11-JAN-94',6) from dual;
select NEXT_DAY ('01-SEP-95','FRIDAY') from dual;
select LAST_DAY ('01-FEB-95') from dual;
--https://docs.oracle.com/cd/B28359_01/server.111/b28286/functions242.htm
select ROUND(SYSDATE ,'YEAR') from dual;
select ROUND(SYSDATE ,'Month') from dual;
select ROUND(to_date('15-jun-16') ,'Day') from dual;


--Datatype conversion : For assignment of values - the Oracle server can automatically convert the following:
--varchar to number,date & date,number to varchar;
--For expression evaluation, the Oracle Server can automatically convert the following: varchar to number,date
--implicit data conversion
insert into employees(employee_id,last_name,email,hire_date,salary,job_id) 
values ('3983','Test1','a@a34.com', '16-apr-16', 10000,'IT_PROG');

--explicit conversion
--to convert number to char and char to number
select first_name, to_char(hire_date, 'dd-mon-yy HH24:MI:SS AM') hireDate from employees;
select first_name, to_char(hire_date, 'mm-dd-yyyy') hireDate from employees;
select to_char(salary, '$99,999'), salary from employees;
select to_number('567') from dual;
-- to convert  date to char data type - here we specify what format we want
select TO_CHAR(hire_date, 'fmDD Month YYYY') AS HIREDATE FROM employees;
SELECT last_name, TO_CHAR(hire_date, 'DD-Mon-YYYY') FROM employees WHERE hire_date < TO_DATE('01-Jan-90','DD-Mon-RR');
-- to convert char to date data type - here we specify what format our date is in
select to_date('12-apr-1988','dd-mon-yyyy') from dual;
select to_date('12-apr-88','dd-mon-YY') from dual;

--Dates * formats ; https://docs.oracle.com/cd/B28359_01/server.111/b28286/sql_elements004.htm
SELECT last_name, hire_date FROM employees WHERE hire_date < '01-FEB-88';
SELECT to_date('120888','dd-mm-yy') FROM dual;
SELECT to_date('12-apr-88') FROM dual;
SELECT to_number('1234.64') FROM Dual;
SELECT to_number('12,344', '99,999') FROM Dual;

--Handling null values
select count(NVL(commission_pct, 0)) from employees;--if first val is null return second val
SELECT last_name, salary, NVL(commission_pct, 0), commission_pct FROM employees;
--if comission pct here is null return val2 i.e., CPCTNULL else if not null return val 1 i.e.,CPCTNOTNULL
SELECT last_name, salary, commission_pct, NVL2(commission_pct, 'CPCTNOTNULL', 'CPCTNULL') income FROM employees;
--return first not null value from no(1...n) of values
SELECT last_name, manager_id,commission_pct, COALESCE(manager_id,commission_pct, -1) comm FROM employees ORDER BY commission_pct;
--Nullif – checks for equality of 2 expressions,If(exp1===exp2) it gives null as o/p,If(exp1!=exp2) always it gives exp1 value as o/p
SeLECT first_name,LENGTH(first_name) "expr1", LENGTH(last_name) "expr2",NULLIF(LENGTH(first_name), LENGTH(last_name)) result FROM employees;














