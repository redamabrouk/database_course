select dept_name, avg_salary 
from 
(select dept_name, avg (salary) as avg_salary from	instructor	group by dept_name) as dept_avg 
where avg_salary > 42000;

select dept_name, avg_salary 
from 
(select dept_name, avg (salary) as avg_salary 
from	instructor	
group by dept_name
having avg_salary > 42000) as dept_avg ;

select dept_name, avg_salary
from 
(select dept_name, avg (salary) 
from instructor 
group by dept_name) as dept_avg (dept_name, avg_salary)
    where avg_salary > 42000;


with max_budget (value) as 
 (select max(budget) from department)
   select department.dept_name
   from department, max_budget
   where department.budget = max_budget.value;

with dept_total (dept_name, value) as
        (select dept_name, sum(salary)
         from instructor
         group by dept_name),
dept_total_avg(value) as
       (select avg(value)
       from dept_total)
select dept_name
from dept_total, dept_total_avg
where dept_total.value > dept_total_avg.value;

select dept_name, 
(select count(*) from instructor 
 where department.dept_name = instructor.dept_name)
  as num_instructors from department;

# Runtime error if subquery returns more than one result tuple
select dept_name, 
(select salary from instructor where department.dept_name = instructor.dept_name)
  as num_instructors 
  from department;
# Delete all records
delete from instructor ;

delete from instructor where dept_name= 'Finance';

delete from instructor  
where 
dept name in 
(select dept name  from department where building = 'Watson');

delete from instructor
where salary < (select avg (salary) from instructor);

insert into course 
values ('CS-437', 'Database Systems', 'Comp. Sci.', 4);

insert into course (course_id, title, dept_name, credits)
values ('CS-437', 'Database Systems', 'Comp. Sci.', 4);

insert into student
values ('3003', 'Green', 'Finance', null);

insert into student	
select ID, name, dept_name, 0  from   instructor;

#========================================
update instructor 
set salary = salary * 1.03
where salary > 100000;
update instructor 
set salary = salary * 1.05
where salary <= 100000;
#=======================================

update
	instructor
set
	salary = 
	case
		when salary <= 100000 then salary * 1.05
		else salary * 1.03
	end


update	student S set tot_cred = 
(select	sum(credits)from takes,	course	where
			takes.course_id = course.course_id
			and S.ID = takes.ID.and takes.grade <> 'F' 
			and takes.grade is not null	);

case
	when sum(credits) is not null then sum(credits)
	else 0
end