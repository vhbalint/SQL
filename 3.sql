--- most jöttem rá hogy ha serialt használok mindenhol akkor a script egy új adatbázisban nem fog működni, mert ott előröl indulnaak a serialok...
--- de már nincs lélekjelenlétem az egészet kijavítani :(

---
--- insert data into students
---

INSERT INTO students (FirstName, LastName, DOP, Email)
VALUES
('Balint', 'Veres-Husz', '1985-03-12', 'ragnarjr@gmail.com'),
('Fanni', 'Sárándi', '1992-02-10', 'fannisarandi@gmail.com'),
('Luca', 'Rendes-Kardos', '1986-11-10', 'lucakardos@gmail.com'),
('Andras', 'Tardy', '1978-04-15', 'andrastardy@gmail.com');

---
--- insert data into courses
---

INSERT INTO courses (CourseName, CourseDescription)
VALUES
('Software tester', 'Git, GitHub, Jira, Postgre, Python, SQL, Virtual box, Linux, UML'),
('Data Analyst', 'SQL, Python, Excel, Numpy, Pandas, Matplotlib, Seaborn'),
('Full-Stack', 'JavaScript, HTML, CSS, React, Node.js, Express.js, Java/C#, Spring/ASP.NET')
;

---
---insert data into enrolment (connect multiple students with multiple courses)
---

INSERT INTO enrollments (Student_id, EnrollmentDate, Course_id)
VALUES
('2', '2025-02-05','1'),
('3', '2025-01-12','1'),
('4', '2025-01-01','1'),
('5', '2025-03-05','1');

---
--- insert data into assignementtypes
---

INSERT INTO assignementtypes (TypeName)
VALUES
('From scratch'),
('LINUX'),
('SQL');

---
--- insert data into assignements
---

INSERT INTO assignements (type_id, AssignementName, Exercise)
VALUES
('1', 'Spaceship', True),
('2', 'Virtual Storage Fun', True),
('3', 'Students of Codecool', True),
('2', 'Introduction to Linux', False);

---
--- insert data into coursesandassignement (connect multiple courses with multiple assignements)
---

INSERT INTO coursesandassignements (course_id, assignement_id, Team)
VALUES
('1', '5', True),
('1', '6', False),
('1', '7', True),
('1', '8', False),
('2', '5', True),
('3', '5', True),
('2', '7', True);



---
--- insert data into bacgroundmaterials
---

INSERT INTO backgroundmaterials (assignement_id, MaterialLink)
VALUES
('5', 'https://journey.study/v2/learn/materials/pages/scratch/visual-programming-in-scratch.md'),
('5', 'https://www.youtube.com/watch?v=y1RsHeFqZqw'),
('5', 'https://www.w3schools.com/sql/'),
('6', 'https://www.computernetworkingnotes.com/linux-tutorials/linux-virtual-console-and-terminal-explained.html'),
('7', 'https://www.drawio.com/'),
('8', 'https://linuxsurvival.com/');


---
--- insert data into tasks
---

INSERT INTO tasks (assignement_id, TaskDescription)
VALUES
('5', 'Move_spaceship'),
('5', 'ASteroids and stars'),
('5', 'Collisons'),
('6', 'Creating'),
('6', 'Attaching'),
('6', 'Formating'),
('7', 'ER diagram'),
('7', 'Create database'),
('7', 'Create table structure');