CREATE DATABASE university;


USE university;

CREATE TABLE groups(
	group_no char(8) PRIMARY KEY
);

CREATE TABLE grades(
	grade decimal PRIMARY KEY
);

CREATE TABLE departments(
	department nvarchar PRIMARY KEY
);

CREATE TABLE acad_positions(
	acad_position nvarchar PRIMARY KEY,
	overtime_rate integer
)

CREATE TABLE employees(
	employee_id int identity(1,1) PRIMARY KEY,
	surname nvarchar,
	first_name nvarchar,
	employment_date date,
	PESEL char(11)
);

CREATE TABLE students(
    student_id int identity(1,1) PRIMARY KEY,
    surname nvarchar,
    first_name nvarchar,
    date_of_birth date,
    group_no char(8),
    FOREIGN KEY (group_no) REFERENCES groups(group_no)
)