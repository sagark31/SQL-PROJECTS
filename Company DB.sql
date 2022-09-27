#Write a SQL query to find the salaries of all employees
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY
FROM employees;


# Write a SQL query to find the unique designations of the employees. Return Job ID.
SELECT DISTINCT DEPARTMENT_ID,JOB_ID FROM employees
GROUP BY DEPARTMENT_ID;


 

#write a SQL query to list the employees’ name, increased their salary by 15%, and expressed as number of Dollars.
SELECT FIRST_NAME,LAST_NAME,((SALARY*1.15)/76.77) AS SALARY_IN_$
FROM employees;



#Write a SQL query to list the employee's name and job name as a format of "Employee & Job_id".
SELECT CONCAT(FIRST_NAME,LAST_NAME,JOB_ID) AS 'EMPLOYEE&JOB_ID' FROM employees;



#Write a SQL query to find those employees with hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY,DATE_FORMAT(HIRE_DATE,'%M %D,%Y') AS HIRE_DATE
FROM employees;



#Write a SQL query to count the number of characters except the spaces for each employee name. Return employee name length.
SELECT FIRST_NAME,LAST_NAME,LENGTH(FIRST_NAME)+LENGTH(LAST_NAME) as length FROM employees;




#Write a SQL query to find the employee ID, salary, and commission of all the employees.
SELECT EMPLOYEE_ID,SALARY,COMMISSION_PCT FROM employees;



#Write a SQL query to find the unique department with jobs. Return department ID, Job count. 
SELECT DEPARTMENT_ID,JOB_ID,COUNT(JOB_ID) FROM employees
group by DEPARTMENT_ID;


#9. Write a SQL query to find those employees who joined before 1991. Return complete information about the employees.
SELECT * FROM employees
WHERE  HIRE_DATE<'1991-01-01';


#10. Write a SQL query to compute the average salary of those employees who work as ‘ANALYST’. Return average salary.
SELECT JOB_ID FROM jobs
WHERE JOB_TITLE='Shipping Clerk';
#here we got job id of the worker working as shipping clerk 

SELECT AVG(SALARY) AS AVG_SALARY FROM employees
WHERE JOB_ID='SH_CLERK';   