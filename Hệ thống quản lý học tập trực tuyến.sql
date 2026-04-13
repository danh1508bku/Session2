CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Instructors (
    instructor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    instructor_id INT,
    CONSTRAINT fk_instructor
        FOREIGN KEY (instructor_id)
        REFERENCES Instructors(instructor_id)
        ON DELETE SET NULL
);

CREATE TABLE Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enroll_date DATE NOT NULL,
    CONSTRAINT fk_student
        FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_course
        FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
        ON DELETE CASCADE,
    CONSTRAINT unique_enrollment UNIQUE (student_id, course_id)
);

CREATE TABLE Assignments (
    assignment_id SERIAL PRIMARY KEY,
    course_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    due_date DATE NOT NULL,
    CONSTRAINT fk_assignment_course
        FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
        ON DELETE CASCADE
);

CREATE TABLE Submissions (
    submission_id SERIAL PRIMARY KEY,
    assignment_id INT NOT NULL,
    student_id INT NOT NULL,
    submission_date DATE NOT NULL,
    grade DECIMAL(5,2),
    CONSTRAINT fk_submission_assignment
        FOREIGN KEY (assignment_id)
        REFERENCES Assignments(assignment_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_submission_student
        FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
        ON DELETE CASCADE,
    CONSTRAINT check_grade CHECK (grade BETWEEN 0 AND 100)
);
