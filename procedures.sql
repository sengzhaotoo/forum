create sequence person_seq;

create or replace PROCEDURE REGISTRATION(
    p_username person.username%type,
    p_password person.password%type,
    p_name person.name%type,
    p_email person.email_address%type,
    p_year_begin person.year_begin%type,
    p_semester_begin person.semester_begin%type,
    p_degree_status person.d_status%type,
    p_degree_type person.d_type%type,
    p_role person.role%type,
    p_gpa person.gpa%type,
    p_hide_profile person.hide_profile%type
)
    AS
    BEGIN 
        INSERT INTO Person (id, username, password, name, email_address, year_begin, semester_begin, d_status,d_type, role, gpa, hide_profile) 
          VALUES (person_seq.nextval,p_username, p_password, p_name, p_email, p_year_begin, p_semester_begin, p_degree_status, p_degree_type, p_role, p_gpa, p_hide_profile);
    END; 

CREATE OR REPLACE GENERATE_INTERESTS_GROUPS AS 
    p_group_id IN INT, 
    p_name IN VARCHAR2, 
    p_description IN VARCHAR2,
    p_mod1 IN VARCHAR2, 
    p_mod2 IN VARCHAR2, 
    p_course_id IN VARCHAR2, 
    p_type IN VARCHAR2
    counter number; 
    BEGIN 
        SELECT count(*) INTO counter FROM Groups g, Courses c 
        WHERE g.course_id = c.course_id
        AND g.type <> 'Interest Group'
        AND g.type <> 'Club'; 
        
        IF (counter>0) THEN 
            p_group_id = c.group_id; 
            p_name = c.name; 
            p_description = c.description; 
            p_mod1 = c.moderator_1;
            p_mod2 = c.moderator_2;
            p_course_id = c.course_id;
            p_type = 'Interest Group'; 
        END IF; 
        
        INSERT INTO Groups (group_id, name, description, moderator_1, moderator_2, course_id, type) VALUES (p_group_id, p_name, p_description, p_moderator_1, p_moderator_2, p_course_id, p_type);
    END;
        
CREATE OR REPLACE FUNCTION STUDENT_DETAIL(s_name VARCHAR)
RETURNS VARCHAR
DECLARE s_data VARCHAR;
BEGIN
IF TRUE = (SELECT hide_profile
	        FROM Person
	        WHERE name = s_name) 

THEN SET s_data = (SELECT name||’’||email_address||’’||year_begin||’’||semester_begin
||’’||d_status||’’||d_type||’’||role
                                    FROM Person
                                    WHERE name = s_name);
ELSE 
SET s_data = (SELECT name||’’||email_address||’’||d_type
                         FROM Person
                         WHERE name = s_name);
END IF;
RETURN s_data;
END;
            
CREATE OR REPLACE FUNCTION POP_THREADS ( f_title VARCHAR)
RETURNS void
DECLARE f_id INTEGER;
BEGIN 
SET f_id = (SELECT forum_id
	       FROM Forums
	       WHERE forum_title = f_title);
SELECT thread_id,count(message) AS mes_count
FROM Threads
WHERE forum_id = f_id
ORDER BY mes_count DESC LIMIT 3;
END;

CREATE OR REPLACE TRIGGER UPDATE_GPA
AFTER INSERT OR UPDATE ON Takes
REFERENCING 
	NEW as NEWGRADE
FOR EACH ROW
BEGIN
UPDATE Person
SET gpa = new_gpa
WHERE takes.student_id = person.id;
END;

CREATE OR REPLACE TRIGGER APPLY_BONUS_POINT 
AFTER INSERT ON THREADS 
REFERENCING NEW AS NEWTHREAD 
FOR EACH ROW
BEGIN
  insert into bonuspoints (person_id, bonus_id)
  select :NewThread.created_by, p.bonus_id from forums f, groups g, availablebonuspoints p
  where f.forum_id = :NewThread.forum_id
  and g.group_id = f.group_id
  and p.group_id = g.group_id
  and p.description = 'New Post';
END;

CREATE OR REPLACE PROCEDURE ASSIGN_TA(
  p_person_id int,
  p_course_id int
)AS 
BEGIN
  INSERT INTO TA(person_id, course_id) values(p_person_id, p_course_id);
END ASSIGN_TA;

CREATE OR REPLACE TRIGGER CHECK_ENROLLMENT 
BEFORE INSERT OR UPDATE ON TA 
REFERENCING NEW AS NEWTA 
FOR EACH ROW
declare
rowcount number;
BEGIN
  select count(*) into rowcount from takes t
  where t.course_id = :newta.course_id
  and t.person_id = :newta.person_id;
  
  if(rowcount > 0) then
    raise_application_error(-20001, 'user is enrolled as a student');
  end if;
END;

CREATE OR REPLACE PROCEDURE POST_THREAD(
  p_thread_id int,
  p_forum_id int,
  p_created_by int,
  p_created_when date,
  p_message varchar2
)
AS
user_count number;
BEGIN
  select count(*) into user_count from forums f, persontogroup g
  where f.forum_id = p_forum_id
    and g.group_id = f.group_id
    and g.person_id = p_created_by;
  
  if(user_count > 0) then
    insert into threads values(p_thread_id, p_forum_id, p_created_by, p_created_when, p_message);
  else
    Insert into errorlogs values(seq_errorlogs.nextval, p_forum_id, ‘Unauthorized post attempted by user ‘||p_created_by);
  end if;
    
END POST_THREAD;

