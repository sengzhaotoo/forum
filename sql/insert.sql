/* PERSON */
INSERT ALL 
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (20352412, 'stoo', '1234', 'Seng Zhao Too', 'stoo@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', 'Third Year', 'Science', 4.0, 'Bachelor', 'True')
  
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (20111313, NULL, NULL, 'John Smith', 'smith@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', 'Third Year', 'Science', 4.0, 'Bachelor', 'True')
    
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (10330011, 'klong', 'default1234', 'Karen Long', 'klong@hawk.iit.edu', TO_DATE('2009','YYYY'), 'Fall', NULL, NULL, NULL, 'Professor', 'False')

  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (1, 'root', 'root', 'admin', '', TO_DATE('1904','YYYY'), 'Fall', NULL, NULL, NULL, 'Admin', 'True')
    
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (10011001, 'fleung', 'leung1234', 'Francis Leung', '', TO_DATE('2009','YYYY'), 'Fall', NULL, NULL, NULL, 'Professor', 'True')
    
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (20332424, null, null, 'Sebastian Longbottom', '', TO_DATE('2012','YYYY'), 'Spring', 'Second Year', 'Science', 3.2, 'Bachelor', 'False')

  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (20499493, null, null, 'Neil Armstrong', '', TO_DATE('2015','YYYY'), 'Summer', 'First Year', 'Arts', 3.9, 'Bachelor', 'False')

SELECT * from DUAL; 

delete from person;
select * from person; 
select * from all_tables;

/* COURSE CATALOGUE*/
INSERT ALL 
  INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
  VALUES (0001, 110, 'Computing Principles', 'An introduction to the following "big ideas" of computer science: 
  (1) computing is a creative activity; (2) abstraction reduces information and detail to facilitate focus on relevant concepts;
  (3) data and information facilitate the creation of knowledge; 
  (4) algorithms are used to develop and express solutions to computational problems; 
  (5) programming enables problem solving, human expression, and creation of knowledge; 
  (6) the internet pervades modern computing; and (7) computing has global impacts.')
  
  INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
  VALUES (0002, 115, 'Object-Oriented Programming I', 'Introduces the use of a high-level object-oriented programming language 
  as a problem-solving tool, including basic data structures and algorithms, object-oriented programming techniques, 
  and software documentation. Designed for students who have had little or no prior experience with computer programming. 
  For students in CS and CS-related degree programs.')
SELECT * FROM DUAL; 
SELECT * FROM COURSE_CATALOGUE;

/* COURSE */
INSERT ALL
  INTO COURSE (course_id, cc_id, year, semester, instructor, avg_pastGPA)
  VALUES (110, 1, TO_DATE('2015', 'YYYY'), 'Spring', 'Matthew J. Bauer', 3.5)
  
  INTO COURSE (course_id, cc_id, year, semester, instructor, avg_pastGPA)
  VALUES (115, 2, TO_DATE('2015', 'YYYY'), 'Fall', 'Jon Hanrath', 3.3)
SELECT * FROM DUAL; 

/* GROUPS */
INSERT ALL 
  INTO GROUPS(group_id, name, description, moderator1, moderator2, course_id, type)
  VALUES (1, 'Video Gaming', 'An interest club that unites all gamers!', 20352412, null, null, 'interest')
  
  INTO GROUPS(group_id, name, description, moderator1, moderator2, course_id, type)
  VALUES (2, 'Computing Principles', 'An course group for CS110!', 20111313, null, 110, 'course')
  
  INTO GROUPS(group_id, name, description, moderator1, moderator2, course_id, type)
  VALUES (3, 'Object-Oriented Programming I', 'An course group for CS115!', null, null, 115, 'course')
SELECT * FROM DUAL;

select * from groups;
select group_id from groups where course_id = 110; 
select g.moderator1, g.name from groups g;

drop table groups;

/* TA */
INSERT ALL 
    INTO TA(person_id, course_id)
    VALUES(20352412, 110) 
SELECT * FROM DUAL; 

/* ADMINISTRATORS */
INSERT ALL 
  INTO ADMINISTRATORS (person_id, access_level)
  VALUES (20352412, 'user')
  
  INTO ADMINISTRATORS (person_id, access_level)
  VALUES (20111313, 'user')
  
  INTO ADMINISTRATORS (person_id, access_level)
  VALUES (1, 'root')
SELECT * FROM DUAL;

/* TAKES */
INSERT ALL 
  INTO TAKES (course_id, person_id, grade)
  VALUES (115, 20332424, null)
  
  INTO TAKES (course_id, person_id, grade)
  VALUES (115, 20352412, null)
SELECT * FROM DUAL; 

/* FORUMS */
INSERT ALL 
  INTO FORUMS(forum_id, group_id, forum_title, created_by, created_when)
  VALUES (1, 1, 'Video Gaming', 20352412, SYSDATE)
  
  INTO FORUMS(forum_id, group_id, forum_title, created_by, created_when)
  VALUES (2, 2, 'Computing Principles', 20352412, SYSDATE)
SELECT * FROM DUAL;

/* THREADS */
INSERT ALL 
  INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (1, 1, 'Introduction', 20352412, SYSTIMESTAMP, 'Hello guys, this is the first post for Video Gaming interest group! Hope you enjoy your stay here!')
  
  INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (2, 2, 'Intro to CS110', 20352412, SYSTIMESTAMP, 'This will be a discussion forum for CS110')
SELECT * FROM DUAL;

drop table threads;
select * from administrators;
select * from course;
select * from groups;
select * from person;
select * from ta;
select * from takes;
select * from FORUMS;
select * from threads;


-- QUERY 
SELECT instructor, AVG(avg_pastGPA) FROM COURSE
group by instructor;

SELECT group_id FROM GROUPS WHERE COURSE_ID = 110; 
SELECT * FROM GROUPs;