/* PERSON */
INSERT ALL 
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (2, 'stoo', '1234', 'Seng Zhao Too', 'stoo@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', 'Third Year', 'Science', 4.0, 'Bachelor', 'True')
  
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (3, NULL, NULL, 'John Smith', 'smith@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', 'Third Year', 'Science', 4.0, 'Bachelor', 'True')
    
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (4, 'klong', 'default1234', 'Karen Long', 'klong@hawk.iit.edu', TO_DATE('2009','YYYY'), 'Fall', NULL, NULL, NULL, 'Professor', 'False')

  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (1, 'root', 'root', 'admin', '', TO_DATE('1904','YYYY'), 'Fall', NULL, NULL, NULL, 'Admin', 'True')
    
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (5, 'fleung', 'leung1234', 'Francis Leung', '', TO_DATE('2009','YYYY'), 'Fall', NULL, NULL, NULL, 'Professor', 'True')
    
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (6, null, null, 'Sebastian Longbottom', '', TO_DATE('2012','YYYY'), 'Spring', 'Second Year', 'Science', 3.2, 'Bachelor', 'False')

  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (7, null, null, 'Neil Armstrong', '', TO_DATE('2015','YYYY'), 'Summer', 'First Year', 'Arts', 3.9, 'Bachelor', 'False')
    
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (8, 'dmatthews', 'password', 'Dave Matthews', 'dmatthews@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', 'First Year', 'Science', 4.0, 'Bachelor', 'True')
    
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (9, 'sstalone', 'password', 'Sylvester Stalone', 'sstalone@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Spring', NULL , 'Science', 3.6 , 'Professor', 'True')
    
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (10, 'fflinstone', 'password', 'Fred Flinstone', 'fflinstone@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', 'Third Year', 'Arts', 3.2, 'Masters', 'True')
   
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (11, 'jhendrix', 'password', 'Jimi Hendrix', 'jhendrix@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', 'Fourth Year', 'Fine arts', 4.0, 'Doctoral', 'True')  
    
  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (12, 'brubble', 'password', 'Barney Rubble', 'brubble@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Summer', 'Fifth Year', 'Arts', 2.8, 'Bachelor', 'True')  

  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (13, 'cyates', 'password', 'Conner Yates', 'cyates@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', 'Third Year', 'Science', 3.0, 'Bachelor', 'True')  

  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (14, 'mbauer', 'password', 'Matt Bauer', 'mbauer@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', NULL, 'Science', 4.0, 'Professor', 'True')  

  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (15, 'jhanrath', 'password', 'Jon Hanrath', 'jhanrath@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', NULL, 'Science', 3.8, 'Professor', 'True')  

  INTO PERSON (id, username, password, name, email_address, year_begin, semester_begin, d_status, d_type, gpa, role, hide_profile) 
    VALUES (16, 'fleung', 'password', 'Francis Leung', 'fleung@hawk.iit.edu', TO_DATE('2015','YYYY'), 'Fall', NULL , 'Science', 4.0, 'Professor', 'True')  
SELECT * from DUAL; 

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
  VALUES (3, 425, 'Database Organization', 'Description for cs 425')
  
  INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
  VALUES (4, 115, 'Human Biology', 'BIO 115')

  INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
  VALUES (5, 305, 'Design of Business Processes and Models', 'Dec for BUS 305')
  
  INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
  VALUES (6, 330, 'Discrete Structures', 'Description for CS 330')
  
  INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
  VALUES (7, 350, 'Computer Organization and Assembly Language Programming', 'Description for cs 350')
  
  INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
  VALUES (8, 301, 'Industrial Psychology', 'Desc for PSYCH 301')
  
  INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
  VALUES (11111111, 000, 'Club', 'Club course code')
  
  INTO COURSE_CATALOGUE(cc_id, course_code, course_title, course_description)
  VALUES (22222222, 000, 'Interest', 'Interest group course code')
SELECT * FROM DUAL;

/* COURSE */
INSERT ALL
  INTO COURSE (course_id, cc_id, year, semester, instructor, avg_pastGPA)
  VALUES (1, 3, TO_DATE('2015', 'YYYY'), 'Spring', 'Francis Leung', 3.2)
  
  INTO COURSE (course_id, cc_id, year, semester, instructor, avg_pastGPA)
  VALUES (2, 4, TO_DATE('2015', 'YYYY'), 'Spring', 'Sylvester Stalone', 2.8)
  
  INTO COURSE (course_id, cc_id, year, semester, instructor, avg_pastGPA)
  VALUES (3, 5, TO_DATE('2015', 'YYYY'), 'Fall', 'Matthew J. Bauer', 3.0)
  
  INTO COURSE (course_id, cc_id, year, semester, instructor, avg_pastGPA)
  VALUES (4, 7, TO_DATE('2015', 'YYYY'), 'Fall', 'Francis Leung', 2.6)
  
  INTO COURSE (course_id, cc_id, year, semester, instructor, avg_pastGPA)
  VALUES (5, 6, TO_DATE('2015', 'YYYY'), 'Fall', 'Matthew J. Bauer', 3.6)
  
  INTO COURSE (course_id, cc_id, year, semester, instructor, avg_pastGPA)
  VALUES (11111111, 11111111, TO_DATE('2015', 'YYYY'), 'Fall', 'Club', 0.0)
  
  INTO COURSE (course_id, cc_id, year, semester, instructor, avg_pastGPA)
  VALUES (22222222, 22222222, TO_DATE('2015', 'YYYY'), 'Fall', 'Interest', 0.0)
SELECT * FROM DUAL; 

/* GROUPS */
INSERT ALL 
  INTO GROUPS(group_id, name, description, course_id, type)
  VALUES (1, 'Video Gaming', 'An interest club that unites all gamers!', 22222222, 'interest')
  
  INTO GROUPS(group_id, name, description, moderator1, moderator2, course_id, type)
  VALUES (2, 'Music', 'Group for Music Club', 11, null, 11111111, 'club')
  
  INTO GROUPS(group_id, name, description, moderator1, moderator2, course_id, type)
  VALUES (3, 'CS Majors', 'For CS Majors', 14, null, 11111111, 'course')

INTO GROUPS(group_id, name, description, course_id, type)
  VALUES (4, 'Fine Arts Major', 'For Fine Arts Majors', 11111111, 'course')
  
  INTO GROUPS(group_id, name, description, moderator1, moderator2, course_id, type)
  VALUES (5, 'CS 425', 'Group for CS 425', 16, null, 1, 'course')
SELECT * FROM DUAL;


/* MODERATORS */
INSERT ALL 
  INTO MODERATORS(p_id, group_id)
  VALUES (2, 1)
  
  INTO MODERATORS(p_id, group_id)
  VALUES (13, 1)
  
  INTO MODERATORS(p_id, group_id)
  VALUES (11, 2)
  
  INTO MODERATORS(p_id, group_id)
  VALUES (14, 3)
  
  INTO MODERATORS(p_id, group_id)
  VALUES (11, 4)
  
  INTO MODERATORS(p_id, group_id)
  VALUES (16, 5)
SELECT * FROM DUAL; 

/* TA */
INSERT ALL 
  INTO TA(person_id, course_id)
  VALUES(2, 110) 
SELECT * FROM DUAL; 

/* ADMINISTRATORS */
INSERT ALL 
  INTO ADMINISTRATORS (person_id, access_level)
  VALUES (2, 'user')
  
  INTO ADMINISTRATORS (person_id, access_level)
  VALUES (3, 'user')
  
  INTO ADMINISTRATORS (person_id, access_level)
  VALUES (1, 'root')
SELECT * FROM DUAL;

/* TAKES */
INSERT ALL 
  INTO TAKES (course_id, person_id, grade)
  VALUES (115, 2, null)
  
  INTO TAKES (course_id, person_id, grade)
  VALUES (115, 2, null)
SELECT * FROM DUAL; 

/* FORUMS */
INSERT ALL 
  INTO FORUMS(forum_id, group_id, forum_title, created_by, created_when)
  VALUES (1, 3, 'Welcome CS Students!', 14, SYSDATE)
  
  INTO FORUMS(forum_id, group_id, forum_title, created_by, created_when)
  VALUES (2, 1, 'Smash Bros. Tounament?', 12, SYSDATE)
  
  INTO FORUMS(forum_id, group_id, forum_title, created_by, created_when)
  VALUES (3, 1, 'What is you Favorite Game?', 13, SYSDATE)
  
  INTO FORUMS(forum_id, group_id, forum_title, created_by, created_when)
  VALUES (4, 5, 'Study Group?', 13, SYSDATE)
  
    INTO FORUMS(forum_id, group_id, forum_title, created_by, created_when)
  VALUES (5, 5, 'Final Project Discussion', 16, SYSDATE)
  
    INTO FORUMS(forum_id, group_id, forum_title, created_by, created_when)
  VALUES (6, 2, 'Concert this Weekend!', 11, SYSDATE)
SELECT * FROM DUAL;

/* THREADS */
INSERT ALL 
  INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (1, 1, 'Welcome Students!', 14, SYSTIMESTAMP, 'blahblahablhablahsblahablaahbalhabalhablahab')
  
  INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (2, 1, 'Nice to be Here!', 13, SYSTIMESTAMP, 'blahblahblahblahblahblahblahbahahlahaha')

INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (3, 1, 'Hello!', 2, SYSTIMESTAMP, 'blahblahblahblahblahblahblahbahahlahaha')

INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (4, 1, 'Hope to see you in class!', 15, SYSTIMESTAMP, 'blahblahblahblahblahblahblahbahahlahaha')

INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (5, 2, 'Anyone?', 12, SYSTIMESTAMP, 'blahblahblahblahblahblahblahbahahlahaha')

INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (6, 5, 'Questions HW 2', 13, SYSTIMESTAMP, 'blahblahblahblahblahblahblahbahahlahaha')

INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (7, 5, 'Part 3', 16, SYSTIMESTAMP, 'blahblahblahblahblahblahblahbahahlahaha')

INTO THREADS(thread_id, forum_id, topic, created_by, created_when, message)
  VALUES (8, 5, 'How do I PHP?',8, SYSTIMESTAMP, 'blahblahblahblahblahblahblahbahahlahaha')
SELECT * FROM DUAL;

/* Privacy Table*/
INSERT ALL 
  INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (8, 1, 1, 1, 1,1)

INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (9, 0, 0, 0, 0,1)
  
INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (10, 1, 0, 1, 1,0)
  
  INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (12, 1, 1, 0, 1,0)
  
  INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (11, 0, 0, 0, 1,0)
  
  INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (13, 0, 0, 0, 0,0)
  
  INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (14, 1, 0, 1, 0,1)
  
  INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (15, 0, 1, 0, 0,1)
  
  INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (2, 0, 0, 1, 0,0)
  
  INTO Privacy(user_id, year_beg, sem_beg, d_status, d_type, gpa)
  VALUES (16, 1, 1, 0, 1,1)

-- QUERY 
SELECT instructor, AVG(avg_pastGPA) FROM COURSE
group by instructor;

SELECT group_id FROM GROUPS WHERE COURSE_ID = 19283746; 
SELECT * FROM GROUPs;
