CREATE TABLE professor (
    SSN CHAR(11) NOT NULL,
    name TEXT,
    hired_year INTEGER,
    PRIMARY KEY (SSN)
);

CREATE TABLE tenure (
    SSN CHAR(11) NOT NULL,
    start_year INTEGER,
    PRIMARY KEY (SSN),
    FOREIGN KEY (SSN) REFERENCES professor (SSN)
);

CREATE TABLE junior (
    SSN CHAR(11) NOT NULL,
    hired_duration INTEGER,
    PRIMARY KEY (SSN),
    FOREIGN KEY (SSN) REFERENCES professor (SSN)
);

CREATE TABLE department (
    name TEXT NOT NULL,
    chairperson CHAR(11) NOT NULL,
    PRIMARY KEY (name),
    FOREIGN KEY (chairperson) REFERENCES tenure (SSN)
);

CREATE TABLE course (
    department_name TEXT NOT NULL UNIQUE,
    num TEXT NOT NULL,
    name TEXT NOT NULL,
    capacity INTEGER,
    PRIMARY KEY (department_name, num, name),
    FOREIGN KEY (department_name) REFERENCES department (name)
        ON DELETE CASCADE
);

CREATE TABLE term (
    semester TEXT NOT NULL,
    year INTEGER NOT NULL,
    PRIMARY KEY (semester, year)
);

CREATE TABLE affiliate (
    prof_SSN CHAR(11) NOT NULL,
    dept_name TEXT NOT NULL,
    PRIMARY KEY (prof_SSN, dept_name),
    FOREIGN KEY (prof_SSN) REFERENCES professor (SSN),
    FOREIGN KEY (dept_name) REFERENCES department (name)
);

CREATE TABLE offer (
    term_semester TEXT NOT NULL,
    term_year INTEGER NOT NULL,
    course_dept TEXT NOT NULL,
    course_name TEXT NOT NULL,
    course_num INTEGER NOT NULL,
    PRIMARY KEY (term_semester, term_year,
        course_dept, course_num, course_name),
    FOREIGN KEY (term_semester, term_year)
        REFERENCES term (semester, year),
    FOREIGN KEY (course_dept, course_num, course_name)
        REFERENCES course (department_name, num, name)
);

CREATE TABLE teach (
    offer_semester TEXT NOT NULL,
    offer_year INTEGER NOT NULL,
    offer_dept TEXT NOT NULL,
    offer_name TEXT NOT NULL,
    offer_num INTEGER NOT NULL,
    teacher_SSN CHAR(11),
    PRIMARY KEY (teacher_SSN, offer_semester,
        offer_year, offer_dept, offer_name, offer_num),
    FOREIGN KEY (teacher_SSN)
        REFERENCES professor (SSN),
    FOREIGN KEY (offer_semester, offer_year,
        offer_dept, offer_name, offer_num)
        REFERENCES offer (term_semester, term_year,
            course_dept, course_name, course_num)
);
