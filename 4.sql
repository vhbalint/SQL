---
--- insert data into Evaluations table, when a fellow evaluates a class mate's assignment
--- Grade should be a number from 1 to 10
---
SELECT * FROM evaulation;

INSERT INTO Evaulation (student_id, assignment_id, reviewer_id, Grade, CompletationStatus)
VALUES ([student_id], [assignment_id], [reviewer_id], [grade], [completion_status]);

INSERT INTO evaulation (student_id, assignement_id, reviewer_id, grade, completationstatus)
VALUES
('2', '5', '5', '8', True),
('3', '5', '4', '7', True),
('4', '5', '2', '9', True),
('5', '5', '3', '6', True);