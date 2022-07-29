SELECT snum,ssn FROM Students
WHERE name  = 'Becky';
SELECT m.name,m.level FROM Major m
Join Students s on m.snum = s.snum
WHERE ssn  = 123097834;
SELECT c.name FROM Courses c
Join Departments d on c.department_code = d.code
WHERE d.name  = 'Computer Science';
SELECT degree.name,degree.level FROM Degrees degree
Join Departments d on degree.department_code = d.code
WHERE d.name  = 'Computer Science';
SELECT s.name FROM Students s
Join Minor m on s.snum = m.snum;
SELECT COUNT(*) FROM Students s
Join Minor m on s.snum = m.snum;
SELECT s.name,s.snum FROM Students s
Join Register r on s.snum = r.snum
Join Courses c on c.number = r.course_number
WHERE c.name = 'Algorithm';
SELECT s.name,s.snum FROM Students s
ORDER BY dob 
LIMIT 1
;
SELECT s.name,s.snum FROM Students s
ORDER BY dob DESC
LIMIT 1
;
SELECT s.name,s.snum, s.ssn FROM Students s
Where name LIKE '%n%' or name LIKE '%N%';
;
SELECT s.name,s.snum, s.ssn FROM Students s
Where name NOT LIKE '%n%' or name NOT LIKE '%N%';
;
Select c.number,c.name,COUNT(r.snum)
FROM Courses c
LEFT OUTER JOIN register r on c.number = r.course_number
group by c.number;
Select s.name
FROM Students s
JOIN Register r on s.snum = r.snum
WHERE r.regtime = 'Fall2020';
Select c.name, c.number From Courses c
Join departments d on d.code = c.department_code
WHERE d.name = 'Computer Science';
SELECT c.number, c.name FROM courses c
Join Departments d on d.code = c.department_code
Where d.name = 'Computer Science' or d.name ='Landscape Architect';
