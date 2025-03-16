-- Create the student table
CREATE TABLE student (
    student_id INT IDENTITY(1,1) PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    classes INT NOT NULL,
    tuition_per_class DECIMAL(10,2) NOT NULL,
    total_tuition AS (classes * tuition_per_class) PERSISTED 
);

INSERT INTO student (student_name, classes, tuition_per_class) VALUES
('Abror', 6, 200),
('Bobur', 3, 250),
('Samandar', 4, 180);

SELECT * FROM student;
