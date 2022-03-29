create table instructor (ID char(5), name varchar(2), dept_name varchar(2),salary numeric(8,2));

SELECT * FROM instructor;

Alter table instructor Add newcol1 char(5);

SELECT * FROM instructor;

Alter table instructor Drop newcol1;

SELECT * FROM instructor;

Alter table instructor ADD newcol1 char(5), ADD newcol3 char(5);


Alter table instructor ADD newcol2 char(5) AFTER  newcol3;

SELECT * FROM instructor;

Alter table instructor ADD f1 char(5) FIRST;

SELECT * FROM instructor;








