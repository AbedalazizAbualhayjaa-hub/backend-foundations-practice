-- Task 12 — Design a Schema from Requirements

CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    student_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE teachers (
    teacher_id INTEGER PRIMARY KEY,
    teacher_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT NOT NULL,
    teacher_id INTEGER NOT NULL,
    credits INTEGER NOT NULL CHECK (credits > 0),

    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE enrollments (
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    grade TEXT DEFAULT 'N/A',

    PRIMARY KEY (student_id, course_id),

    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Constraints used:
-- 1. NOT NULL: fields like names and emails cannot be empty.
-- 2. UNIQUE: each student and teacher email must be unique.
-- 3. CHECK: course credits must be greater than 0.
-- 4. DEFAULT: grade is 'N/A' if no grade is entered yet.

-- Cardinality:
-- One teacher can teach many courses.
-- Each course is taught by exactly one teacher.
-- One student can enroll in many courses.
-- One course can have many students.
-- The enrollments table handles the many-to-many relationship between students and courses.
