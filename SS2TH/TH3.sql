-- Tạo cơ sở dữ liệu tudent_management
CREATE DATABASE student_management;

-- Trở đến database để thao tác với khối database đó
USE student_management;

-- Tạo bảng Student
CREATE TABLE students(
student_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
student_name VARCHAR(45) NOT NULL,
age INT ,
class_id INT,
CHECK(age>18)
);

-- Tạo bảng class
CREATE TABLE classes(
class_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
class_name VARCHAR(50) NOT NULL
);

-- Tạo bảng subject
CREATE TABLE subjects(
subject_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
subject_name VARCHAR(50) NOT NULL
);

ALTER TABLE students 
ADD CONSTRAINT fk_class FOREIGN KEY (class_id) REFERENCES classes(class_id);

-- Tạo bảng phụ
CREATE TABLE student_subject(
student_id INT,
subject_id INT);

ALTER TABLE student_subject
ADD CONSTRAINT pk_student_subject PRIMARY KEY (student_id, subject_id);
ALTER TABLE student_subject 
ADD CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES students (student_id);
ALTER TABLE student_subject 
ADD CONSTRAINT fk_subject FOREIGN KEY (subject_id) REFERENCES subjects (subject_id);

ALTER TABLE student_subject 
ADD COLUMN mark INT DEFAULT 0;
-- Thêm môn học vào subject