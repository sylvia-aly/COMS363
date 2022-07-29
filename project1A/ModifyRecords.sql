UPDATE Students
SET name = 'Scott'
WHERE ssn = 746897816;
UPDATE major m
Join Students s on s.snum = m.snum
set m.name = 'Computer Science', m.level = 'MS'
WHERE s.ssn = 746897816;
DELETE FROM Register
WHERE regtime = "Spring2021";
