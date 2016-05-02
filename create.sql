CREATE TABLE PERSON(
    id              INTEGER NOT NULL, 
    username        VARCHAR(30), 
    password        VARCHAR(30),
    name            VARCHAR(30),
    email_address   VARCHAR(50),
    year_begin      DATE,
    semester_begin  VARCHAR(10) NULL,
    d_status        VARCHAR(15) NULL,
    d_type          VARCHAR(10) NULL,
    gpa             FLOAT, 
    role            VARCHAR(30), 
    hide_profile    VARCHAR(5), 
    PRIMARY KEY (id),
    CONSTRAINT chk_semester_begin 
      CHECK (semester_begin IN ('Spring','Summer','Fall')),
    CONSTRAINT chk_role 
      CHECK (role IN ('Bachelor', 'Masters', 'Doctoral', 'Faculty Member', 'Assistant Professor', 'Professor', 'Admin')),
    CONSTRAINT chk_hide_profile
      CHECK (hide_profile IN ('True', 'False')),
    CONSTRAINT chk_d_type 
      CHECK (d_type IN ('Science', 'Arts', 'Fine arts', 'Business Administration', 'Architecture')),
    CONSTRAINT chk_d_status
      CHECK (d_status IN ('First Year', 'Second Year', 'Third Year', 'Fourth Year', 'Fifth Year'))
);

CREATE TABLE COURSE_CATALOGUE(
    cc_id INTEGER NOT NULL, 
    course_code INTEGER, 
    course_title VARCHAR(100), 
    course_description VARCHAR (2000),
    PRIMARY KEY (cc_id)
); 

CREATE TABLE COURSE(
    course_id INTEGER NOT NULL, 
    cc_id INTEGER NOT NULL, 
    year  DATE, 
    semester VARCHAR(10) , 
    instructor VARCHAR(50), 
    avg_pastGPA FLOAT, 
    PRIMARY KEY (course_id),
    FOREIGN KEY (cc_id) REFERENCES COURSE_CATALOGUE(cc_id),
    CONSTRAINT chk_semester
      CHECK (semester IN ('Spring','Summer','Fall'))
);

drop table course cascade constraints;

CREATE TABLE GROUPS(
    group_id INTEGER NOT NULL, 
    name VARCHAR(50),
    description VARCHAR (500), 
    moderator1 INTEGER, 
    moderator2 INTEGER, 
    course_id INTEGER, 
    type VARCHAR(10),
    PRIMARY KEY (group_id), 
    FOREIGN KEY (course_id) REFERENCES COURSE(course_id),
    CONSTRAINT chk_type
      CHECK (type IN ('interest', 'club', 'course'))
);

CREATE TABLE ADMINISTRATORS(
    person_id INTEGER, 
    access_level VARCHAR(10),
    PRIMARY KEY (person_id),
    FOREIGN KEY (person_id) REFERENCES PERSON(id)
);

CREATE TABLE TA(
    person_id INTEGER,
    course_id INTEGER,
    CONSTRAINT pk_ta
      PRIMARY KEY (person_id, course_id)
);

CREATE TABLE TAKES(
    course_id INTEGER,
    person_id INTEGER, 
    grade FLOAT,
    CONSTRAINT pk_takes
      PRIMARY KEY(course_id, person_id),
    FOREIGN KEY (course_id) REFERENCES COURSE(course_id),
    FOREIGN KEY (person_id) REFERENCES PERSON(id)
);

CREATE TABLE FORUMS(
    forum_id INTEGER, 
    group_id INTEGER,
    forum_title VARCHAR (50),
    created_by INTEGER, -- person id
    created_when DATE,
    PRIMARY KEY(forum_id),
    FOREIGN KEY(group_id) REFERENCES GROUPS(group_id),
    FOREIGN KEY(created_by) REFERENCES PERSON(id)
);

CREATE TABLE THREADS(
    thread_id INTEGER, 
    forum_id INTEGER,
    topic varchar(30),
    created_by INTEGER, 
    created_when DATE,
    message VARCHAR(2000),
    PRIMARY KEY (thread_id),
    FOREIGN KEY (forum_id) REFERENCES FORUMS(forum_id),
    FOREIGN KEY(created_by) REFERENCES PERSON(id)
);

CREATE TABLE PRIVACY(
    user_id INTEGER NOT NULL,
    year_beg INTEGER CHECK (year_beg = 0 OR year_beg = 1),
    sem_beg INTEGER CHECK (sem_beg = 0 OR sem_beg = 1),
    d_status INTEGER CHECK (d_status = 0 OR d_status = 1),
    d_type INTEGER CHECK (d_type = 0 OR d_type = 1),
    gpa INTEGER CHECK (gpa = 0 OR gpa = 1),
    FOREIGN KEY (user_id) REFERENCES PERSON(id)
);

drop table person cascade constraints; 
select * from person;
/*drop table person;
drop table course_catalogue;
drop table course;
drop table groups;
drop table forums;
drop table threads;*/
