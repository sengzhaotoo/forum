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
    
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (12345678, 'dmatthews', 'password', 'Dave Matthews', 'dmatthews@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', 'First Year', 'Science', 4.0, 'Bachelor', 'True')
    
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (23456789, 'sstalone', 'password', 'Sylvester Stalone', 'sstalone@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Spring', NULL , 'Science', 3.6 , 'Professor', 'True')
    
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (34567891, 'fflinstone', 'password', 'Fred Flinstone', 'fflinstone@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', 'Third Year', 'Arts', 3.2, 'Masters', 'True')
   
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (56789123, 'jhendrix', 'password', 'Jimi Hendrix', 'jhendrix@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', 'Fourth Year', 'Fine arts', 4.0, 'Doctoral', 'True')  
    
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (45678912, 'brubble', 'password', 'Barney Rubble', 'brubble@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Summer', 'Fifth Year', 'Arts', 2.8, 'Bachelor', 'True')  

  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (8912345, 'cyates', 'password', 'Conner Yates', 'cyates@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', 'Third Year', 'Science', 3.0, 'Bachelor', 'True')  

  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (97234567, 'mbauer', 'password', 'Matt Bauer', 'mbauer@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', NULL, 'Science', 4.0, 'Professor', 'True')  

  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (24681357, 'jhanrath', 'password', 'Jon Hanrath', 'jhanrath@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', NULL, 'Science', 3.8, 'Professor', 'True')  

  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (72918456, 'fleung', 'password', 'Francis Leung', 'fleung@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', NULL , 'Science', 4.0, 'Professor', 'True')  
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
  
 INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
  VALUES (19283746, 425, 'Database Organization', 'Description for cs 425')
  
  INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
    VALUES (28374619, 115, 'Human Biology', 'BIO 115')

INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
  VALUES (37461928, 305, 'Design of Business Processes and Models', 'Dec for BUS 305')
  
INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
  VALUES (46192837, 330, 'Discrete Structures', 'Description for CS 330')
  
INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
  VALUES (91827364, 350, 'Computer Organization and Assembly Language Programming', 'Description for cs 350')
  
INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
  VALUES (73649182, 301, 'Industrial Psychology', 'Desc for PSYCH 301')
  
  INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
  VALUES (11111111, 000, 'Club', 'Club course code')
  
   INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
  VALUES (22222222, 000, 'Interest', 'Interest group course code')
  
SELECT * FROM DUAL; 
SELECT * FROM COURSE_CATALOGUE;

/* COURSE */
INSERT ALL
  INTO COURSE (course_id, cc_id, year, semester, instructor, avg_pastGPA)
  VALUES (36912457, 19283746, TO_DATE('2015', 'YYYY'), 'Spring', 'Francis Leung', 3.2)
  
  INTO COURSE (course_id, cc_id, year, semester, instructor, avg_pastGPA)
  VALUES (14710693, 28374619, TO_DATE('2015', 'YYYY'), 'Spring', 'Sylvester Stalone', 2.8)
  
    INTO COURSE (course_id, cc_id, year, semester, instructor, avg_pastGPA)
  VALUES (49235342, 37461928, TO_DATE('2015', 'YYYY'), 'Fall', 'Matthew J. Bauer', 3.0)
  
    INTO COURSE (course_id, cc_id, year, semester, instructor, avg_pastGPA)
  VALUES (92456132, 91827364, TO_DATE('2015', 'YYYY'), 'Fall', 'Francis Leung', 2.6)
  
    INTO COURSE (course_id, cc_id, year, semester, instructor, avg_pastGPA)
  VALUES (62821843, 46192837, TO_DATE('2015', 'YYYY'), 'Fall', 'Matthew J. Bauer', 3.6)
  
    INTO COURSE (course_id, cc_id, year, semester, instructor, avg_pastGPA)
  VALUES (11111111, 11111111, TO_DATE('2015', 'YYYY'), 'Fall', 'Club', 0.0)
  
   INTO COURSE (course_id, cc_id, year, semester, instructor, avg_pastGPA)
  VALUES (22222222, 22222222, TO_DATE('2015', 'YYYY'), 'Fall', 'Interest', 0.0)

SELECT * FROM DUAL; 

/* GROUPS */
INSERT ALL 
  INTO GROUPS(group_id, name, description, moderator1, moderator2, course_id, type)
  VALUES (98743125, 'Video Gaming', 'An interest club that unites all gamers!', 20352412, 89123456, 22222222, 'interest')
  
  INTO GROUPS(group_id, name, description, moderator1, moderator2, course_id, type)
  VALUES (87126817, 'Music', 'Group for Music Club', 56789123, null, 11111111, 'club')
  
  INTO GROUPS(group_id, name, description, moderator1, moderator2, course_id, type)
  VALUES (83942915, 'CS Majors', 'For CS Majors', 97234567, null, 11111111, 'course')

INTO GROUPS(group_id, name, description, moderator1, moderator2, course_id, type)
  VALUES (42119356, 'Fine Arts Major', 'For Fine Arts Majors', 56789123, 67891234, 11111111, 'course')
  
  INTO GROUPS(group_id, name, description, moderator1, moderator2, course_id, type)
  VALUES (53879124, 'CS 425', 'Group for CS 425', 72918456, null, 36912457, 'course')
SELECT * FROM DUAL;

select * from groups;
select group_id from groups where course_id = 62821843; 
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
  VALUES (1, 83942915, 'Welcome CS Students!', 97234567, SYSDATE)
  
  INTO FORUMS(forum_id, group_id, forum_title, created_by, created_when)
  VALUES (2, 98743125, 'Smash Bros. Tounament?', 45678912, SYSDATE)
  
  INTO FORUMS(forum_id, group_id, forum_title, created_by, created_when)
  VALUES (3, 98743125, 'What is you Favorite Game?', 89123456, SYSDATE)
  
  INTO FORUMS(forum_id, group_id, forum_title, created_by, created_when)
  VALUES (4, 53879124, 'Study Group?', 89123456, SYSDATE)
  
    INTO FORUMS(forum_id, group_id, forum_title, created_by, created_when)
  VALUES (5, 53879124, 'Final Project Discussion', 72918456, SYSDATE)
  
    INTO FORUMS(forum_id, group_id, forum_title, created_by, created_when)
  VALUES (6, 87126817, 'Concert this Weekend!', 56789123, SYSDATE)
SELECT * FROM DUAL;

/* THREADS */
INSERT ALL 
  INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (19876534, 1, 'Welcome Students!', 97234567, SYSTIMESTAMP, 'blahblahablhablahsblahablaahbalhabalhablahab')
  
  INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (00945421, 1, 'Nice to be Here!', 89123456, SYSTIMESTAMP, 'blahblahblahblahblahblahblahbahahlahaha')

INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (94021874, 1, 'Hello!', 20352412, SYSTIMESTAMP, 'blahblahblahblahblahblahblahbahahlahaha')

INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (56935612, 1, 'Hope to see you in class!', 24681357, SYSTIMESTAMP, 'blahblahblahblahblahblahblahbahahlahaha')

INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (23498756, 2, 'Anyone?', 45678912, SYSTIMESTAMP, 'blahblahblahblahblahblahblahbahahlahaha')

INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (87541002, 5, 'Questions HW 2', 89123456, SYSTIMESTAMP, 'blahblahblahblahblahblahblahbahahlahaha')

INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (42910910, 5, 'Part 3', 72918456, SYSTIMESTAMP, 'blahblahblahblahblahblahblahbahahlahaha')

INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (, 5, 'How do I PHP?', 12345678, SYSTIMESTAMP, 'blahblahblahblahblahblahblahbahahlahaha')
SELECT * FROM DUAL;

/* Privacy Table*/
INSERT ALL 
  INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (12345678, 1, 1, 1, 1,1)

INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (23456789, 0, 0, 0, 0,1)
  
INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (34567891, 1, 0, 1, 1,0)
  
  INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (45678912, 1, 1, 0, 1,0)
  
  INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (56789123, 0, 0, 0, 1,0)
  
  INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (89123456, 0, 0, 0, 0,0)
  
  INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (97234567, 1, 0, 1, 0,1)
  
  INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (24681357, 0, 1, 0, 0,1)
  
  INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (20352412, 0, 0, 1, 0,0)
  
  INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (72918456, 1, 1, 0, 1,1)

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

SELECT group_id FROM GROUPS WHERE COURSE_ID = 19283746; 
SELECT * FROM GROUPs;
