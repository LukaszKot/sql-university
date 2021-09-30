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
