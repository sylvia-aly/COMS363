match (a: students {name:"Becky"})
return a.snum, a.ssn;

match (a:students {ssn:123097834})-->(d:degrees)
return d.name,d.level;

 match(d:departments {dname:"Computer Science"})-->(c:courses)
 return c.name;

match(d:departments {dname:"Computer Science"})-->(dee:degrees)
 return dee.name,dee.level;

match(a:students)-[m:minor]->(d:degrees)
return a.name;

match(a:students)-[m:minor]->(d:degrees)
return count(a);

match(a:students)-[r:register]->(c: courses {name:"Algorithm"})
return a.name,a.snum;

match(a:students) with min(a.dob) as old
match(b:students {dob:old})
return b.name;

match(a:students) with max(a.dob) as young
match(b:students {dob:young})
return b.name;

match (stu:students) where stu.name contains 'n'or stu.name contains 'N'
return stu.name, stu.snum,stu.ssn;

match (stu:students) where not (stu.name contains 'n'or stu.name contains 'N') 
return stu.name, stu.snum,stu.ssn;

match (a:students)-->(c:courses)  
return c.name, c.number,count(a);

match(a:students)-[r:register{regtime:'Fall2020'}]->(c:courses)
return a.name;

match(d:departments {dname:"Computer Science"})-->(c:courses)
 return c.name,c.number;

match (d:departments)-->(c:courses)
where d.dname = "Computer Science" or d.dname = "Landscape Architect" 
 return c.name,c.number;















match (d:departments)-->(c:courses)
where d.dname = "Computer Science" 
 return c.name,c.number;

match (d:departments)-->(c:courses) where d.dname = "Computer Science" return c.name


-[r:register]

where r.regtime = 'fall2020'



Select s.name
FROM Students s
JOIN Register r on s.snum = r.snum
WHERE r.regtime = 'Fall2020';

Select c.number,c.name,COUNT(r.snum)
FROM Courses c
LEFT OUTER JOIN register r on c.number = r.course_number
group by c.number;



 SELECT c.name FROM Courses c
Join Departments d on c.department_code = d.code
WHERE d.name  = 'Computer Science';