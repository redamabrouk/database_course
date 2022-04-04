select sum(salary) from instructor; 

select avg (salary) from instructor 
where dept_name= 'Comp. Sci.';

select count (distinct ID) from teaches 
where semester = 'Spring' and year = 2010;

select count (*) from course;

select dept_name,ID, avg (salary) as avg_salary 
from instructor group by dept_name,ID;

/* erroneous query */
select dept_name, ID, avg (salary) 
from instructor 
group by dept_name;


select dept_name, avg (salary) as "avg salary"
from instructor
group by dept_name;

select sum (salary ) from instructor;
# result=898000.00
# remove 65000.00

select sum (salary ) from instructor;
# result=833000.00
