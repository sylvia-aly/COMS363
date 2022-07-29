match(s:students)
where s.ssn = 746897816
set s.name = "Scott"
return s;

MATCH (s:students)-[m:major]->(d:degrees) 
where s.ssn = 746897816
delete (m);
MATCH (s:students)
where s.ssn = 746897816
with s
MATCH (d:degrees )
where d.name = "Computer Science" and d.level = "MS"
create (d)<-[:major]-(s)


match(a:students)-[r:register{regtime:'Spring2021'}]->(c:courses)
detach delete (r);




