--- Tamást megkérni, hogy mutassa meg hogyan lehet minden constraint droppolni

---
--- drop tables
---

DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS evaulation;
DROP TABLE IF EXISTS coursesandassignements;
DROP TABLE IF EXISTS assignements;
DROP TABLE IF EXISTS assignementtypes;
DROP TABLE IF EXISTS bacgroundmaterials;
DROP TABLE IF EXISTS tasks;

---
--- create tables
---

CREATE TABLE students (
    Student_ID SERIAL,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DOB DATE,
    Email VARCHAR(254)
)
;

CREATE TABLE courses (
    Course_ID SERIAL,
    CourseName VARCHAR(200),
    CourseDescription VARCHAR(3000)
)
;

CREATE TABLE enrollments (
    Enrollment_ID SERIAL,
    Student_ID INT,
    Course_ID INT,
    EnrollmentDate DATE
)
;

CREATE TABLE evaulation (
    Evaulation_ID SERIAL,
    Student_ID INT,
    Course_ID INT,
    Assignement_ID INT,
    Grade INT,
    CompletationStatus BOOLEAN,
    Reviewer_ID INT
)
;

CREATE TABLE coursesandassignements (
    CAA_ID SERIAL,
    Course_ID INT,
    Assignement_ID INT,
    Team BOOLEAN
)
;

CREATE TABLE assignements (
    Assignement_ID SERIAL,
    Type_ID INT,
    AssignementName VARCHAR(200),
    Exercise BOOLEAN
)
;

CREATE TABLE assignementtypes (
    Type_ID SERIAL,
    TypeName VARCHAR (200)
)
;

CREATE TABLE backgroundmaterials (
    Material_ID SERIAL,
    Assignement_ID INT,
    MaterialLink VARCHAR (1000)
)
;

CREATE TABLE tasks (
    Task_ID SERIAL,
    Assignement_ID INT,
    TaskDescription VARCHAR(3000)
)
;

---
--- adding primary keys
---

ALTER TABLE ONLY students
    ADD CONSTRAINT pk_students PRIMARY KEY (Student_ID);

ALTER TABLE ONLY courses
    ADD CONSTRAINT pk_courses PRIMARY KEY (Course_ID);

ALTER TABLE ONLY enrollments
    ADD CONSTRAINT pk_enrollments PRIMARY KEY (Enrollment_ID);

ALTER TABLE ONLY evaulation
    ADD CONSTRAINT pk_evaulation PRIMARY KEY (Evaulation_ID);

ALTER TABLE ONLY coursesandassignements
    ADD CONSTRAINT pk_coursesandassignements PRIMARY KEY (CAA_ID);

ALTER TABLE ONLY assignements
    ADD CONSTRAINT pk_assignements PRIMARY KEY (Assignement_ID);

ALTER TABLE ONLY assignementtypes
    ADD CONSTRAINT pk_assignementstypes PRIMARY KEY (Type_ID);

ALTER TABLE ONLY backgroundmaterials
    ADD CONSTRAINT pk_backgroundmaterials PRIMARY KEY (Material_ID);

ALTER TABLE ONLY tasks
    ADD CONSTRAINT pk_tasks PRIMARY KEY (Task_ID);

---
--- adding foreign keys
---

ALTER TABLE ONLY enrollments
    ADD CONSTRAINT fk_enrollments_students FOREIGN KEY (Student_ID) REFERENCES students (Student_ID);

ALTER TABLE ONLY enrollments
    ADD CONSTRAINT fk_enrollments_courses FOREIGN KEY (Course_ID) REFERENCES courses (Course_ID);

ALTER TABLE ONLY evaulation
    ADD CONSTRAINT fk_evaulation_students FOREIGN KEY (Student_ID) REFERENCES students (Student_ID);

ALTER TABLE ONLY evaulation
    ADD CONSTRAINT fk_enrollments_courses FOREIGN KEY (Course_ID) REFERENCES courses (Course_ID);

ALTER TABLE ONLY evaulation
    ADD CONSTRAINT fk_enrollments_rewvier FOREIGN KEY (Reviewer_ID) REFERENCES students (Student_ID);

ALTER TABLE ONLY coursesandassignements
    ADD CONSTRAINT fk_caa_courses FOREIGN KEY (Course_ID) REFERENCES courses (Course_ID);

ALTER TABLE ONLY coursesandassignements
    ADD CONSTRAINT fk_caa_assignements FOREIGN KEY (Assignement_ID) REFERENCES assignements (Assignement_ID);

ALTER TABLE ONLY assignements
    ADD CONSTRAINT fk_assignements_types FOREIGN KEY (Type_ID) REFERENCES assignementtypes (Type_ID);

ALTER TABLE ONLY backgroundmaterials
    ADD CONSTRAINT fk_backgroundmaterials_assignements FOREIGN KEY (Assignement_ID) REFERENCES assignements (Assignement_ID);

ALTER TABLE ONLY tasks
    ADD CONSTRAINT fk_tasks_assignements FOREIGN KEY (Assignement_ID) REFERENCES assignements (Assignement_ID);