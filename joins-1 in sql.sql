charan@charan-Rev-1-0:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.29-0ubuntu0.20.04.3 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| charan             |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.03 sec)

mysql> create database practice;
Query OK, 1 row affected (0.51 sec)

mysql> use practice;
Database changed
mysql> create table student(roll_no int,name varchar(100),address varchar(100),phone varchar(10),age int);
Query OK, 0 rows affected (1.87 sec)

mysql> insert into student(roll_no,name,address,phone,age) values (1,'HARSH','DELHI','9989791145',18),(2,'PRATIK','BIHAR','9959387730',19),(3,'RIYANKA','SUGURI','8686760805',20),(4,'DEEP','RAMNAGAR','9059962880',18),(5,'SAPTARHI','KOLKATA','9381775164',19),(6,'DHANRAJ','BARABAJAR','834795384',20),(7,'ROHIT','BALURGHAT','9381899010',18),(8,'NIRAJ','ALIPUR','9989791145',19);
Query OK, 8 rows affected (0.41 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from student;
+---------+----------+-----------+------------+------+
| roll_no | name     | address   | phone      | age  |
+---------+----------+-----------+------------+------+
|       1 | HARSH    | DELHI     | 9989791145 |   18 |
|       2 | PRATIK   | BIHAR     | 9959387730 |   19 |
|       3 | RIYANKA  | SUGURI    | 8686760805 |   20 |
|       4 | DEEP     | RAMNAGAR  | 9059962880 |   18 |
|       5 | SAPTARHI | KOLKATA   | 9381775164 |   19 |
|       6 | DHANRAJ  | BARABAJAR | 834795384  |   20 |
|       7 | ROHIT    | BALURGHAT | 9381899010 |   18 |
|       8 | NIRAJ    | ALIPUR    | 9989791145 |   19 |
+---------+----------+-----------+------------+------+
8 rows in set (0.00 sec)

mysql> create table studentcourse(course_id int,roll_no int);
Query OK, 0 rows affected (1.37 sec)

mysql> insert into studentcourse(course_id,roll_no) values (1,1),(2,2),(2,3),(3,4),(1,5),(4,9),(5,10),(4,11);
Query OK, 8 rows affected (0.44 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from studentcourse;
+-----------+---------+
| course_id | roll_no |
+-----------+---------+
|         1 |       1 |
|         2 |       2 |
|         2 |       3 |
|         3 |       4 |
|         1 |       5 |
|         4 |       9 |
|         5 |      10 |
|         4 |      11 |
+-----------+---------+
8 rows in set (0.00 sec)

mysql> alter table student add constraint stud_roll_pk primary key(roll_no);
Query OK, 0 rows affected (2.97 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| roll_no | int          | NO   | PRI | NULL    |       |
| name    | varchar(100) | YES  |     | NULL    |       |
| address | varchar(100) | YES  |     | NULL    |       |
| phone   | varchar(10)  | YES  |     | NULL    |       |
| age     | int          | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> alter table studentcourse add constraint stud_roll_fk foreign key(roll_no) references student(roll_no);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`practice`.`#sql-3f2_9`, CONSTRAINT `stud_roll_fk` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`))
mysql> alter table studentcourse add constraint stud_roll_fkey foreign key(roll_no) references student(roll_no);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`practice`.`#sql-3f2_9`, CONSTRAINT `stud_roll_fkey` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`))
mysql> desc student course;
Empty set (0.00 sec)

mysql> desc studentcourse;
+-----------+------+------+-----+---------+-------+
| Field     | Type | Null | Key | Default | Extra |
+-----------+------+------+-----+---------+-------+
| course_id | int  | YES  |     | NULL    |       |
| roll_no   | int  | YES  |     | NULL    |       |
+-----------+------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> create table course(course_id int,roll_no int references student(roll_no));
Query OK, 0 rows affected (4.20 sec)

mysql> insert into course(course_id,roll_no) values (1,1),(2,2),(2,3),(3,4),(1,5),(4,9),(5,10),(4,11);
Query OK, 8 rows affected (0.15 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from course;
+-----------+---------+
| course_id | roll_no |
+-----------+---------+
|         1 |       1 |
|         2 |       2 |
|         2 |       3 |
|         3 |       4 |
|         1 |       5 |
|         4 |       9 |
|         5 |      10 |
|         4 |      11 |
+-----------+---------+
8 rows in set (0.00 sec)

mysql> desc course;
+-----------+------+------+-----+---------+-------+
| Field     | Type | Null | Key | Default | Extra |
+-----------+------+------+-----+---------+-------+
| course_id | int  | YES  |     | NULL    |       |
| roll_no   | int  | YES  |     | NULL    |       |
+-----------+------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> select * from student;
+---------+----------+-----------+------------+------+
| roll_no | name     | address   | phone      | age  |
+---------+----------+-----------+------------+------+
|       1 | HARSH    | DELHI     | 9989791145 |   18 |
|       2 | PRATIK   | BIHAR     | 9959387730 |   19 |
|       3 | RIYANKA  | SUGURI    | 8686760805 |   20 |
|       4 | DEEP     | RAMNAGAR  | 9059962880 |   18 |
|       5 | SAPTARHI | KOLKATA   | 9381775164 |   19 |
|       6 | DHANRAJ  | BARABAJAR | 834795384  |   20 |
|       7 | ROHIT    | BALURGHAT | 9381899010 |   18 |
|       8 | NIRAJ    | ALIPUR    | 9989791145 |   19 |
+---------+----------+-----------+------------+------+
8 rows in set (0.00 sec)

mysql> select roll_no,name,address,course_id from student inner join course on student.roll_no=course.roll_no;
ERROR 1052 (23000): Column 'roll_no' in field list is ambiguous
mysql> select name,address,course_id from student inner join course on student.roll_no=course.roll_no;
+----------+----------+-----------+
| name     | address  | course_id |
+----------+----------+-----------+
| HARSH    | DELHI    |         1 |
| PRATIK   | BIHAR    |         2 |
| RIYANKA  | SUGURI   |         2 |
| DEEP     | RAMNAGAR |         3 |
| SAPTARHI | KOLKATA  |         1 |
+----------+----------+-----------+
5 rows in set (0.00 sec)

mysql> select name,address,course_id,phone from student inner join course on student.roll_no=course.roll_no;
+----------+----------+-----------+------------+
| name     | address  | course_id | phone      |
+----------+----------+-----------+------------+
| HARSH    | DELHI    |         1 | 9989791145 |
| PRATIK   | BIHAR    |         2 | 9959387730 |
| RIYANKA  | SUGURI   |         2 | 8686760805 |
| DEEP     | RAMNAGAR |         3 | 9059962880 |
| SAPTARHI | KOLKATA  |         1 | 9381775164 |
+----------+----------+-----------+------------+
5 rows in set (0.00 sec)

mysql> select name,address,course_id,phone from student inner join course on student.roll_no=course.roll_no order by course_id DESC;
+----------+----------+-----------+------------+
| name     | address  | course_id | phone      |
+----------+----------+-----------+------------+
| DEEP     | RAMNAGAR |         3 | 9059962880 |
| PRATIK   | BIHAR    |         2 | 9959387730 |
| RIYANKA  | SUGURI   |         2 | 8686760805 |
| HARSH    | DELHI    |         1 | 9989791145 |
| SAPTARHI | KOLKATA  |         1 | 9381775164 |
+----------+----------+-----------+------------+
5 rows in set (0.00 sec)

mysql> select name,address,course_id,phone from student inner join course on student.roll_no=course.roll_no order by course_id;
+----------+----------+-----------+------------+
| name     | address  | course_id | phone      |
+----------+----------+-----------+------------+
| HARSH    | DELHI    |         1 | 9989791145 |
| SAPTARHI | KOLKATA  |         1 | 9381775164 |
| PRATIK   | BIHAR    |         2 | 9959387730 |
| RIYANKA  | SUGURI   |         2 | 8686760805 |
| DEEP     | RAMNAGAR |         3 | 9059962880 |
+----------+----------+-----------+------------+
5 rows in set (0.00 sec)

mysql> select name,address,course_id,phone from student inner join course on student.roll_no=course.roll_no order by course_id ASC;
+----------+----------+-----------+------------+
| name     | address  | course_id | phone      |
+----------+----------+-----------+------------+
| HARSH    | DELHI    |         1 | 9989791145 |
| SAPTARHI | KOLKATA  |         1 | 9381775164 |
| PRATIK   | BIHAR    |         2 | 9959387730 |
| RIYANKA  | SUGURI   |         2 | 8686760805 |
| DEEP     | RAMNAGAR |         3 | 9059962880 |
+----------+----------+-----------+------------+
5 rows in set (0.00 sec)

mysql> select name,address,course_id,phone from student left join  course on student.roll_no=course.roll_no order by course_id ASC;
+----------+-----------+-----------+------------+
| name     | address   | course_id | phone      |
+----------+-----------+-----------+------------+
| DHANRAJ  | BARABAJAR |      NULL | 834795384  |
| ROHIT    | BALURGHAT |      NULL | 9381899010 |
| NIRAJ    | ALIPUR    |      NULL | 9989791145 |
| HARSH    | DELHI     |         1 | 9989791145 |
| SAPTARHI | KOLKATA   |         1 | 9381775164 |
| PRATIK   | BIHAR     |         2 | 9959387730 |
| RIYANKA  | SUGURI    |         2 | 8686760805 |
| DEEP     | RAMNAGAR  |         3 | 9059962880 |
+----------+-----------+-----------+------------+
8 rows in set (0.00 sec)

mysql> select name,address,course_id,phone from student left join  course on student.roll_no=course.roll_no;
+----------+-----------+-----------+------------+
| name     | address   | course_id | phone      |
+----------+-----------+-----------+------------+
| HARSH    | DELHI     |         1 | 9989791145 |
| PRATIK   | BIHAR     |         2 | 9959387730 |
| RIYANKA  | SUGURI    |         2 | 8686760805 |
| DEEP     | RAMNAGAR  |         3 | 9059962880 |
| SAPTARHI | KOLKATA   |         1 | 9381775164 |
| DHANRAJ  | BARABAJAR |      NULL | 834795384  |
| ROHIT    | BALURGHAT |      NULL | 9381899010 |
| NIRAJ    | ALIPUR    |      NULL | 9989791145 |
+----------+-----------+-----------+------------+
8 rows in set (0.00 sec)

mysql> select name,address,course_id,phone from student right join  course on student.roll_no=course.roll_no;
+----------+----------+-----------+------------+
| name     | address  | course_id | phone      |
+----------+----------+-----------+------------+
| HARSH    | DELHI    |         1 | 9989791145 |
| PRATIK   | BIHAR    |         2 | 9959387730 |
| RIYANKA  | SUGURI   |         2 | 8686760805 |
| DEEP     | RAMNAGAR |         3 | 9059962880 |
| SAPTARHI | KOLKATA  |         1 | 9381775164 |
| NULL     | NULL     |         4 | NULL       |
| NULL     | NULL     |         5 | NULL       |
| NULL     | NULL     |         4 | NULL       |
+----------+----------+-----------+------------+
8 rows in set (0.00 sec)

mysql> select name,address,course_id,phone from student full join  course on student.roll_no=course.roll_no;
ERROR 1054 (42S22): Unknown column 'student.roll_no' in 'on clause'
mysql> select name,address,course_id,phone from student full join  course on course.roll_no=student.roll_no;
ERROR 1054 (42S22): Unknown column 'student.roll_no' in 'on clause'
mysql> select name,address,course_id,phone from student right join  course on student.roll_no=course.roll_no;
+----------+----------+-----------+------------+
| name     | address  | course_id | phone      |
+----------+----------+-----------+------------+
| HARSH    | DELHI    |         1 | 9989791145 |
| PRATIK   | BIHAR    |         2 | 9959387730 |
| RIYANKA  | SUGURI   |         2 | 8686760805 |
| DEEP     | RAMNAGAR |         3 | 9059962880 |
| SAPTARHI | KOLKATA  |         1 | 9381775164 |
| NULL     | NULL     |         4 | NULL       |
| NULL     | NULL     |         5 | NULL       |
| NULL     | NULL     |         4 | NULL       |
+----------+----------+-----------+------------+
8 rows in set (0.00 sec)

