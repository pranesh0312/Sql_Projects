SELECT * FROM hr_emp.employees  #firstname starts with A and ends with n
where first_name like 'A%n';

SELECT * FROM hr_emp.employees   #Firstname and lastname starting letters must be same
where left(first_name,1)=left(last_name,1);

SELECT * FROM hr_emp.employees   #commission_pct column having null values
where commission_pct is null;

SELECT * FROM hr_emp.employees     #salary between 15000 and 20000
where salary>15000 and salary<20000;

SELECT * FROM hr_emp.employees     #filtering the managers
where job_id like '%mgr%' or job_id like'%man%';

SELECT * FROM hr_emp.employees    #emailid starting with A and having 6 letters
where email like 'A_____';