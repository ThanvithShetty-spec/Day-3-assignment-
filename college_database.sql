-- ========================================================
-- COLLEGE DATABASE DESIGN ASSIGNMENT
-- Script: college_database.sql
-- ========================================================

-- 1. DATABASE SCHEMA CREATION
-- Drop existing tables to ensure a clean execution
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS departments;

-- Create Departments Table
CREATE TABLE departments (
    dept_id INTEGER PRIMARY KEY AUTOINCREMENT,
    dept_name TEXT NOT NULL UNIQUE,
    head_of_dept TEXT
);

-- Create Students Table
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER,
    dept_id INTEGER,
    cgpa REAL,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Create Courses Table
CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_name TEXT NOT NULL,
    credits INTEGER,
    dept_id INTEGER,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


-- 2. DATA INSERTION
-- Insert records into Departments
INSERT INTO departments (dept_name, head_of_dept) VALUES ('Computer Science', 'Dr. Alan Turing');
INSERT INTO departments (dept_name, head_of_dept) VALUES ('Electrical Engineering', 'Dr. Nikola Tesla');
INSERT INTO departments (dept_name, head_of_dept) VALUES ('Mechanical Engineering', 'Dr. James Watt');

-- Insert 10 records into Students
INSERT INTO students (name, age, dept_id, cgpa) VALUES ('Alice Smith', 20, 1, 8.5);
INSERT INTO students (name, age, dept_id, cgpa) VALUES ('Bob Jones', 21, 1, 7.8);
INSERT INTO students (name, age, dept_id, cgpa) VALUES ('Charlie Brown', 22, 2, 9.2);
INSERT INTO students (name, age, dept_id, cgpa) VALUES ('Diana Prince', 20, 1, 8.9);
INSERT INTO students (name, age, dept_id, cgpa) VALUES ('Evan Wright', 23, 3, 6.5);
INSERT INTO students (name, age, dept_id, cgpa) VALUES ('Fiona Gallagher', 21, 2, 8.1);
INSERT INTO students (name, age, dept_id, cgpa) VALUES ('George Clark', 22, 3, 7.4);
INSERT INTO students (name, age, dept_id, cgpa) VALUES ('Hannah Abbott', 20, 1, 9.5);
INSERT INTO students (name, age, dept_id, cgpa) VALUES ('Ian Malcolm', 24, 2, 8.7);
INSERT INTO students (name, age, dept_id, cgpa) VALUES ('Julia Roberts', 21, 3, 7.9);


-- 3. SQL QUERY OPERATIONS

-- ========================================================
-- PART 1: Basic Queries
-- ========================================================

-- Retrieve all columns for all students
SELECT * FROM students;

-- Retrieve only student names and CGPAs
SELECT name, cgpa FROM students;

-- Filter students with CGPA greater than 8.0
SELECT * FROM students WHERE cgpa > 8.0;


-- ========================================================
-- PART 2: Aggregate Functions
-- ========================================================

-- Count total number of students
SELECT COUNT(*) AS total_students FROM students;

-- Find the average CGPA of all students
SELECT AVG(cgpa) AS average_cgpa FROM students;

-- Find the highest CGPA among all students
SELECT MAX(cgpa) AS highest_cgpa FROM students;

-- Find the lowest CGPA among all students
SELECT MIN(cgpa) AS lowest_cgpa FROM students;

-- Find the sum of all CGPAs (standard metric representation)
SELECT SUM(cgpa) AS total_cgpa_sum FROM students;


-- ========================================================
-- PART 3: GROUP BY Queries
-- ========================================================

-- Count students in each department (using explicit JOIN for clarity)
SELECT d.dept_name, COUNT(s.student_id) AS student_count
FROM students s
JOIN departments d ON s.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Find average CGPA by department
SELECT d.dept_name, ROUND(AVG(s.cgpa), 2) AS average_cgpa
FROM students s
JOIN departments d ON s.dept_id = d.dept_id
GROUP BY d.dept_name;