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
	overtime_rate integer NOT NULL
)

CREATE TABLE employees(
	employee_id int identity(1,1) PRIMARY KEY,
	surname nvarchar NOT NULL,
	first_name nvarchar NOT NULL,
	employment_date date NOT NULL,
	PESEL char(11) NOT NULL
);

CREATE TABLE students(
    student_id int identity(1,1) PRIMARY KEY,
    surname nvarchar NOT NULL,
    first_name nvarchar NOT NULL,
    date_of_birth date NOT NULL,
    group_no char(8),
    FOREIGN KEY (group_no) REFERENCES groups(group_no)
)

CREATE TABLE tuition_fees(
    payment_id int identity(1,1) PRIMARY KEY,
    student_id int,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    fee_amount decimal NOT NULL,
    date_of_payment date NOT NULL
);

CREATE TABLE lecturers(
    lecturer_id int PRIMARY KEY,
    acad_position nvarchar,
    department nvarchar,
    FOREIGN KEY (lecturer_id) REFERENCES employees(employee_id),
    FOREIGN KEY (acad_position) REFERENCES acad_positions(acad_position),
    FOREIGN KEY (department) REFERENCES departments(department)
)

CREATE TABLE modules(
    module_id int IDENTITY(1,1) PRIMARY KEY,
    module_name nvarchar NOT NULL,
    no_of_hours int NOT NULL,
    lecturer_id int,
    preceding_module int,
    department nvarchar,
    FOREIGN KEY (lecturer_id) REFERENCES lecturers(lecturer_id),
    FOREIGN KEY (preceding_module) REFERENCES modules(module_id),
    FOREIGN KEY (department) REFERENCES departments(department)
)

CREATE TABLE students_modules(
    student_id int,
    module_id int,
    planned_exam_date date,
    PRIMARY KEY (student_id, module_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
)

CREATE TABLE students_grades(
    student_id int,
    module_id int,
    exam_date date NOT NULL,
    grade decimal NOT NULL,
    PRIMARY KEY (student_id, module_id, exam_date),
    FOREIGN KEY (student_id, module_id) REFERENCES students_modules(student_id, module_id),
    FOREIGN KEY (grade) REFERENCES grades(grade)
)