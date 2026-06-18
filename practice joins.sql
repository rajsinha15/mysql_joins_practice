CREATE DATABASE college_db;
USE college_db;
---------------------------------------------------------------------
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50)
);
select * from students;
----------------------------------------------------------------------
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    duration VARCHAR(20),
    fees INT
);
select * from courses;
------------------------------------------------------------------------
CREATE TABLE enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    admission_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
select * from enrollments;
--------------------------------------------------------------------------------
CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
select * from marks;
-------------------------------------------------------------------------------
INSERT INTO courses VALUES
(1,'BCA','3 Years',80000),
(2,'BBA','3 Years',75000),
(3,'BTech','4 Years',120000),
(4,'BCom','3 Years',60000);
----------------------------------------------------------------------------
INSERT INTO students VALUES
(1,'Amit',20,'Male','Delhi'),
(2,'Neha',21,'Female','Mumbai'),
(3,'Raj',22,'Male','Patna'),
(4,'Priya',20,'Female','Kolkata'),
(5,'Ravi',23,'Male','Chennai'),
(6,'Sneha',21,'Female','Delhi'),
(7,'Karan',22,'Male','Mumbai'),
(8,'Pooja',20,'Female','Patna'),
(9,'Vikas',23,'Male','Kolkata'),
(10,'Anjali',21,'Female','Chennai'),
(11,'Rohit',22,'Male','Delhi'),
(12,'Simran',20,'Female','Mumbai'),
(13,'Deepak',23,'Male','Patna'),
(14,'Kajal',21,'Female','Kolkata'),
(15,'Arjun',22,'Male','Chennai'),
(16,'Meena',20,'Female','Delhi'),
(17,'Suresh',23,'Male','Mumbai'),
(18,'Nisha',21,'Female','Patna'),
(19,'Manoj',22,'Male','Kolkata'),
(20,'Ritu',20,'Female','Chennai');
--------------------------------------------------------------------------------
INSERT INTO enrollments VALUES
(1,1,1,'2023-06-01','Active'),
(2,2,2,'2023-06-02','Active'),
(3,3,3,'2023-06-03','Inactive'),
(4,4,1,'2023-06-04','Active'),
(5,5,4,'2023-06-05','Active'),
(6,6,2,'2023-06-06','Active'),
(7,7,3,'2023-06-07','Inactive'),
(8,8,1,'2023-06-08','Active'),
(9,9,4,'2023-06-09','Active'),
(10,10,2,'2023-06-10','Active');
----------------------------------------------------------------------------------
INSERT INTO marks VALUES
(1,1,1,78,'B'),
(2,2,2,85,'A'),
(3,3,3,67,'C'),
(4,4,1,90,'A'),
(5,5,4,72,'B'),
(6,6,2,88,'A'),
(7,7,3,60,'C'),
(8,8,1,95,'A'),
(9,9,4,70,'B'),
(10,10,2,82,'A');

-------------------------------------------------------------------------------- 
#join
select s.name,c.course_name,m.marks
from students s
join marks m on s.student_id = m.student_id
join courses c on m.course_id = c.course_id;
---------------------------------------------------
# average marks per course
select c.course_name,avg(m.marks)
from marks m
join courses c on m.course_id=c.course_id
group by c.course_name;
----------------------------------------------------
select c.course_name,s.name,
max(m.marks)
from marks m
join students s on m.student_id =s.student_id
join courses c on m.course_id = c.course_id
group by c.course_name;
--------------------------------------------------
select s.name,e.status
from students s
join enrollments e on s.student_id=
e.student_id
where e.status ='inactive';
--------------------------------------------------------

































