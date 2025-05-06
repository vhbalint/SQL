---
--- Assignments are listed by courses
---

SELECT coursename, assignementname
FROM courses
JOIN coursesandassignements ON courses.course_id = coursesandassignements.course_id
JOIN assignements ON coursesandassignements.assignement_id = assignements.assignement_id
ORDER BY coursename, assignementname;

---
--- Assignments with all related elements are listed
---

SELECT assignements.assignementname, assignements.exercise, assignementtypes.typename, backgroundmaterials.materialLink, tasks.taskdescription
FROM assignements
JOIN assignementtypes ON assignements.type_id = assignementtypes.type_id
LEFT JOIN backgroundmaterials ON assignements.assignement_id = backgroundmaterials.assignement_id
LEFT JOIN tasks ON assignements.assignement_id = tasks.assignement_id;

---
--- Students are listed by courses
---

SELECT courses.coursename, students.firstName, students.lastName
FROM students
JOIN enrollments ON students.student_id = enrollments.student_id
JOIN courses ON enrollments.course_id = courses.course_id;

---
--- The students' evaluations per assignments, based on their results, including all the details of the evaluation
---

SELECT
students.firstname, students.lastname, assignements.assignementname, evaulation.grade
FROM students
JOIN evaulation ON students.student_id = evaulation.student_id
JOIN assignements ON evaulation.assignement_id = assignements.assignement_id
WHERE evaulation.completationStatus = TRUE;

---
---Aggregated result of the students' performance. The query should calculate an average of the scores achieved and if the student scored above 60%, he would receive an "advanced" rating, if below, he would be "considered advanced".
---

SELECT students.firstName, students.lastName, AVG(evaulation.grade) AS averagescore,
CASE
    WHEN AVG(evaulation.grade) > 60 THEN 'Advanced'
    ELSE 'Considered Advanced'
END
FROM students
JOIN evaulation ON students.student_id = evaulation.student_id
GROUP BY students.firstname, students.lastname
ORDER BY AverageScore DESC;

---
---List of the 3 best performing students based on their scores.
---

SELECT students.student_id, students.firstName, students.lastname, AVG(grade) AS averagescore
FROM students
JOIN evaulation ON students.student_id = evaulation.student_id
GROUP BY students.student_id, students.firstname, students.lastname
ORDER BY averagescore DESC
LIMIT 3;