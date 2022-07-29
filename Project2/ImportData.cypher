LOAD CSV with headers FROM 'file:///courses.csv' AS line
CREATE 
(:courses 
{number:toInteger(line.number),
name:line.name,
description:line.description,
credithours:toInteger(line.credithours),
level:line.level,
dcode:toInteger(line.dcode)});

LOAD CSV with headers FROM 'file:///students.csv' AS line
CREATE 
(:students {snum:toInteger(line.snum),ssn:toInteger(line.ssn),name:line.name,gender:line.gender,dob:line.dob,c_addr:line.c_addr,c_phone:line.c_phone,p_addr:line.p_addr,p_phone:line.p_phone});



LOAD CSV with headers FROM 'file:///departments.csv' AS line
CREATE 
(dep:departments { dcode:toInteger(line.dcode),dname:line.name,phone:toInteger(line.phone),college:line.college})
WITH dep, line
MATCH (cou: courses {dcode:toInteger(line.dcode)})
CREATE (cou)<-[:offer]-(dep);


LOAD CSV with headers FROM 'file:///degrees.csv' AS line
CREATE 
(dgr:degrees { name:line.name, level:line.level, dcode: toInteger(line.dcode)})
WITH dgr, line
MATCH (dep: departments {dcode:toInteger(line.dcode)})
CREATE (dgr)<-[:administer]-(dep);


LOAD CSV with headers FROM 'file:///major.csv' AS line
MATCH (stu: students {snum:toInteger(line.snum)}),(dgr: degrees {name:line.name}), (dgr: degrees{level:line.level})
CREATE (stu)-[:major]->(dgr);

LOAD CSV with headers FROM 'file:///minor.csv' AS line
MATCH (stu: students {snum:toInteger(line.snum)}),(dgr: degrees {name:line.name}), (dgr: degrees{level:line.level})
CREATE (stu)-[:minor]->(dgr);

LOAD CSV with headers FROM 'file:///register.csv' AS line
MATCH (stu: students {snum:toInteger(line.snum)}), (cou: courses {number:toInteger(line.course_number)})
CREATE (stu)-[:register{regtime:line.regtime, grade:line.grade}]->(cou);



