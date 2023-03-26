-- Table: teachers
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name_teacher STRING NOT NULL
);

-- Table: groups
DROP TABLE IF EXISTS [groups];
CREATE TABLE [groups] (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name_group STRING UNIQUE NOT NULL
);


-- Table: students
DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name_student STRING NOT NULL,
    group_id REFERENCES [groups] (id)
);


-- Table: subjects with the indication of the teacher who reads the subject
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subject STRING UNIQUE NOT NULL,
    teacher_id REFERENCES teachers (id)
);

-- Table: student grades
DROP TABLE IF EXISTS grades;
CREATE TABLE grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id REFERENCES students (id),
    subject_id REFERENCES subjects (id),
    grade STRING,
    date_of DATE
);

