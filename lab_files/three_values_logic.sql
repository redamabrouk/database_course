
# 
SELECT Null+Null AS RESULT;
#Three values true, false, unknown
# Any comparison with null returns unknown(Null)
SELECT Null = 0;
SELECT NULL <> 1;

SELECT NULL > 1;

SELECT NULL = NULL;

# OR: (unknown or true) = true,
SELECT (NULL = 1) OR (1 = 1);
# (unknown or false) = unknown
SELECT (NULL = 1) OR (1 = 2);

# (unknown or unknown) = unknown
SELECT (NULL = 1) OR (NULL > 1);

# AND: (true and unknown) = unknown
SELECT (1 = 1) AND (NULL = 1);

# (false and unknown) =false
SELECT (0 = 1) AND (NULL = 1);

# (unknown and unknown) = unknown
SELECT (NULL = 0) AND (NULL > 1);

# NOT: (not unknown) = unknown
SELECT NOT (NULL = 0) ;

# Result of where clause predicate is treated as false if it evaluates to unknown
CREATE TABLE employee (
    First_Name varchar(20),
    Last_Name varchar(20),
    Salary INT(5),
    Bonus INT(5)
);

# every arithmetic operation that includes an operand with a NULL value returns a NULL result.
SELECT * FROM employee WHERE bonus + salary > 1200;
#  the condition salary < 1500 is true, it  is not necessary to evaluate the condition bonus > 200.
SELECT * FROM employee WHERE salary < 1500 OR bonus > 200;

# You can sometimes avoid using “unknown” values 
# in WHERE conditions by converting NULL values to other values (like 0) using the COALESCE() function.
SELECT * FROM employee WHERE coalesce(bonus,0) > 200 OR salary < 1500;


select name	from instructor	where salary is null;