-- common use of subqueries is to perform tests:
    --For set membership (in, not in)
    --For set comparisons (some,all)
    --For set cardinality. (exists, not exists)

select A1, A2, ..., An
from r1, r2, ..., rm
where P;

-- set membership (in, not in)
select  course_id   -- for each row Section(course_id)
from section                -- from table sections
-- check
where semester = 'Fall' and year= 2009 and  
-- set membership "course_id is subset of..."
course_id in (select course_id from section where semester = 'Spring' and year= 2010);












select course_id from section where course_id in(
select course_id from section where semester = 'Spring' and year= 2010;)
select distinct course_id 
from section 
where semester = 'Fall' and year= 2009 and course_id  
not in (select course_id from section where semester = 'Spring' and year= 2010);

-- set comparisons (some,all)
select distinct T.name, T.salary        -- projection   T(name,salary)             
from instructor as T, instructor as S   -- apply cartesian product
                                        -- for each row T(name,salary)
                                        -- check where conditions(comparisons)
where T.salary > S.salary and S.dept_name = 'Biology';

select distinct name,salary             -- projection   instructor(name,salary)
from instructor                         -- single source
                                        -- for each row  instructor(name,salary)
where salary >                          -- check if salary is greater than at least one salary of
                                        -- subquery result
some (select salary from instructor  where dept_name = 'Comp. Sci.');


select name from instructor 
where salary > 
                                        -- check if salary is greater than all salaries of
                                        -- subquery result
all (select salary from instructor where dept_name = 'Biology');


-- set cardinality. (exists, not exists)

-- Find all courses taught in both the Fall 2009 semester and in the Spring 2010 semester
select course_id                        -- projection section(course_id)
from section as S                       -- single source S
                                        -- apply where filter
                                        -- for each row
where semester = 'Fall' and year = 2009 and  
                                        -- check if there exists row(s) in the following subquery
exists (select *  from section as T  where semester = 'Spring' and year= 2010 );



-- Find all students who have taken all courses offered in the Elec. Eng. department.

select distinct S.ID, S.name    
from student as S               
where not exists (              
    select course_id from course where dept_name = 'Elec. Eng.' 
    -- select courses that taken by T.ID
    and  course_id  not in  (select T.course_id from takes as T  where S.ID = T.ID)   );

-- check for doublication

select T.course_id
from course as T
where unique (select R.course_id from section as R where T.course_id= R.course_id  and R.year = 2009);

-- unique in this context is not supported by mysql

-- alternative soulution

select T.course_id
from course as T
where  
(select count(R.course_id) as c from section as R where T.course_id= R.course_id  and R.year = 2009)>1;

-- ====================================================================
-- Subqueries in the From Clause
-- ====================================================================
select dept_name, avg_salary
from                        -- construct data source of dept_avg(dept_name,avg_salary)
	(select dept_name, avg (salary) as avg_salary
	 from instructor group by dept_name)
     as dept_avg
where avg_salary > 42000;

-- another form
select dept_name, avg_salary
from 
(select dept_name, avg (salary) from instructor  group by dept_name) as 
dept_avg (dept_name, avg_salary)  --dept_avg(dept_name,avg_salary)
where avg_salary > 42000;







select course_id from section where semester='fall';













