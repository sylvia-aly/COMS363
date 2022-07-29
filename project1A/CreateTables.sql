create database if not exists db;
use db;
Create Table Students(
snum int,
ssn int,
name varchar(10),
gender varchar (1),
dob datetime,
c_addr varchar(20),
c_phone varchar(10),
p_addr varchar(20),
p_phone varchar(10),
PRIMARY KEY (ssn),
UNIQUE (snum)
);

Create Table Departments(
code int,
name varchar(50),
phone varchar(10),
college varchar(20),
PRIMARY KEY (code),
UNIQUE (name)
);

Create Table Degrees(
name varchar(50),
level varchar(5),
department_code int,
PRIMARY KEY (name,level),
Foreign Key (department_code) REFERENCES Departments (code)
);

Create Table Courses(
number int,
name varchar(50),
description varchar(50),
credithours int,
level varchar(20),
department_code int,
PRIMARY KEY (number),
Unique (name),
Foreign Key (department_code) REFERENCES Departments (code)
);

Create Table Register(
snum int,
course_number int,
regtime varchar(20),
grade int,
PRIMARY KEY (snum,course_number),
Foreign Key (snum) REFERENCES Students (snum),
Foreign Key (course_number) REFERENCES Courses(number)
);

Create Table Major(
snum int,
name varchar(50),
level varchar (5),
PRIMARY KEY (snum,name,level),
Foreign Key (snum) REFERENCES Students (snum),
Foreign Key (name,level) REFERENCES Degrees(name,level)
);

Create Table Minor(
snum int,
name varchar(50),
level varchar (5),
PRIMARY KEY (snum,name,level),
Foreign Key (snum) REFERENCES Students (snum),
Foreign Key (name,level) REFERENCES Degrees(name,level)
);
