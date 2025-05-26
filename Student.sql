CREATE TABLE Student (
                         IndexNumber INT PRIMARY KEY,
                         FirstName VARCHAR(30),
                         LastName VARCHAR(40),
                         Year INT
);

CREATE TABLE Subject (
                         IdSubject INT PRIMARY KEY,
                         Name VARCHAR(128),
                         Code VARCHAR(5)
);

CREATE TABLE Grade (
                       IdGrade INT PRIMARY KEY,
                       IdSubject INT,
                       IndexNumber INT,
                       DateGiven DATE,
                       Grade DECIMAL(2,1),
                       FOREIGN KEY (IdSubject) REFERENCES Subject(IdSubject),
                       FOREIGN KEY (IndexNumber) REFERENCES Student(IndexNumber)
);

INSERT INTO Student (IndexNumber, FirstName, LastName, Year) VALUES (1001, 'Alice', 'Smith', 1);
INSERT INTO Student (IndexNumber, FirstName, LastName, Year) VALUES (1002, 'Bob', 'Johnson', 2);
INSERT INTO Student (IndexNumber, FirstName, LastName, Year) VALUES (1003, 'Charlie', 'Brown', 1);
INSERT INTO Student (IndexNumber, FirstName, LastName, Year) VALUES (1004, 'John', 'Malkovich', 1);

INSERT INTO Subject (IdSubject, Name, Code) VALUES (1, 'Database Systems', 'CS301');
INSERT INTO Subject (IdSubject, Name, Code) VALUES (2, 'Calculus I', 'MA101');
INSERT INTO Subject (IdSubject, Name, Code) VALUES (3, 'SBD', 'CS101');
INSERT INTO Subject (IdSubject, Name, Code) VALUES (4, 'SBD', 'CS101');
INSERT INTO Subject (IdSubject, Name, Code) VALUES (5, 'AUG', 'CS101');
UPDATE Subject SET Name = 'SBD' WHERE IdSubject = 3;
INSERT INTO Subject (IdSubject, Name, Code) VALUES (6, 'Physical education', 'CS101');
INSERT INTO Subject (IdSubject, Name, Code) VALUES (7, 'PPJ', 'CS101');

INSERT INTO Grade (IdGrade, IdSubject, IndexNumber, DateGiven, Grade) VALUES (1, 1, 1001, TO_TIMESTAMP('2024-01-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4.5);
INSERT INTO Grade (IdGrade, IdSubject, IndexNumber, DateGiven, Grade) VALUES (2, 2, 1001, TO_TIMESTAMP('2024-01-20 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 3.0);
INSERT INTO Grade (IdGrade, IdSubject, IndexNumber, DateGiven, Grade) VALUES (3, 1, 1002, TO_TIMESTAMP('2024-01-15 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3.8);
INSERT INTO Grade (IdGrade, IdSubject, IndexNumber, DateGiven, Grade) VALUES (4, 3, 1003, TO_TIMESTAMP('2024-02-01 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 5.0);
INSERT INTO Grade (IdGrade, IdSubject, IndexNumber, DateGiven, Grade) VALUES (5, 5, 1004, TO_TIMESTAMP('2024-02-01 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 5.0);
INSERT INTO Grade (IdGrade, IdSubject, IndexNumber, DateGiven, Grade) VALUES (6, 6, 1004, TO_TIMESTAMP('2024-02-01 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 5.0);
INSERT INTO Grade (IdGrade, IdSubject, IndexNumber, DateGiven, Grade) VALUES (7, 6, 1003, TO_TIMESTAMP('2024-02-01 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 5.0);
INSERT INTO Grade (IdGrade, IdSubject, IndexNumber, DateGiven, Grade) VALUES (8, 6, 1004, TO_TIMESTAMP('2024-02-01 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 5.0);
INSERT INTO Grade (IdGrade, IdSubject, IndexNumber, DateGiven, Grade) VALUES (9, 7, 1004, TO_TIMESTAMP('2024-02-01 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 5.0);




-- 1. List in the index number, code of the subject name and the date for grades given after
-- January 1, 2014 for subjects other than "SBD" (code).
select st.IndexNumber, s.Code, g.DateGiven
from Grade g
    join Student st on st.IndexNumber = g.IndexNumber
    join Subject S on g.IdSubject = S.IdSubject
where g.DateGiven > to_date('2024-01-16', 'YYYY-MM-DD') and s.Name != 'SBD';
-- 2. In one query, display all grades given for the subjects "SBD" (index number, date, grade)
-- and from "RBD" (index number, SYSDATE, grade).
select s.Name, g.IndexNumber, g.DateGiven, g.Grade
from Subject s
    join Grade g on g.IDSUBJECT = s.IDSUBJECT
where s.Name = 'SBD';
-- 3. For each student, display his first name, last name and average of grades. Include students
-- who do not have any grades.
select s.FirstName, s.LastName, avg(g.Grade)
from Student s
join Grade g on s.IndexNumber = g.IndexNumber
group by s.FirstName, s.LastName;
-- 4. Find repeating subject codes (names and number of occurrences).
select s1.Code, count(s1.Code)
from Subject s1
-- join SUBJECT s2 on s1.IDSUBJECT = s2.IDSUBJECT
group by s1.Code;
-- 5. Find a student (name, surname, index number, average grade) with the highest average on
-- the third year.
select s.FirstName, s.LastName, s.IndexNumber, avg(g.Grade)
from Student s
join Grade G on s.IndexNumber = G.IndexNumber
where s.Year = 1
GROUP BY s.FirstName, s.LastName, s.IndexNumber
order by avg(g.Grade) DESC
Fetch first 1 rows only;
-- 6. Using the operator EXISTS find subjects without any grades.
select s.Name
from SUBJECT s
where not exists (select IdSubject from Grade where IdSubject = s.IdSubject);
-- 7. Change to today's (sysdate) date of the grade for the subject with code "AUG" given to the
-- student John Malkovich.
Update Grade
set DateGiven = sysdate
where IndexNumber in (select IndexNumber from Student where FIRSTNAME || ' ' || LASTNAME = 'John Malkovich')
and
    IdSubject in (select IdSubject from Subject where Name = 'AUG');
-- 8. Find students with average of grades above average of all students on their year.
select s.FirstName, avg(g.Grade), s.Year
from Student s
join Grade G on s.IndexNumber = G.IndexNumber
having avg(g.Grade) >= (select avg(Grade) from Grade join Student on Student.IndexNumber=Grade.IndexNumber where Year = s.Year)
group by s.FirstName, s.Year;
-- 9. Find a student who has only one grade for the subject named "Physical education".
select s.FirstName, count(G.Grade)
from Student s
    join Grade G on s.IndexNumber = G.IndexNumber
    join Subject S2 on G.IdSubject = S2.IdSubject
where S2.Name = 'Physical education'
having count(G.Grade) = 1
group by s.IndexNumber, s.FirstName;
-- 10. Find names and surnames of first year students who have grades for subject "Physical
-- education" but do not have grades given for the subject with code "PPJ".
select distinct s.FirstName, s.LastName
from Student s
    join Grade g on s.IndexNumber = g.IndexNumber
    join Subject st on st.IdSubject = g.IdSubject
where s.Year = 1 and
      exists(select 1 from Grade g
          join Subject st2 on st2.IdSubject = g.IdSubject
                            where g.IndexNumber = s.IndexNumber and st2.Name = 'Physical education')
                and
      not exists(select 1 from Grade g
                                         join Subject st2 on st2.IdSubject = g.IdSubject
                 where g.IndexNumber = s.IndexNumber and st2.Name = 'PPJ');