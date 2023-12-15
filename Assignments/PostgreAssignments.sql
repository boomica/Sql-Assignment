CREATE TABLE tblDirectors
(
	DirectorId SERIAL PRIMARY KEY,
	FirstName VARCHAR(150),
	LastName VARCHAR(150)
)

CREATE TABLE tblMovies
(
	MovieId SERIAL PRIMARY KEY,
	MovieName VARCHAR(100) NOT NULL,
	MovieLength INT NOT NULL,
	MovieLang VARCHAR(20) NOT NULL,
	MovieCertificate VARCHAR(20) NOT NULL,
	ReleaseDate DATE NOT NULL,
	DirectorId INT REFERENCES tblDirectors(DirectorId)
)

CREATE TABLE tblActors
(
	ActorId SERIAL PRIMARY KEY,
	FirstName VARCHAR(150) NOT NULL,
	LastName VARCHAR(150) NOT NULL,
	Gender CHAR(1) NULL,
	DateOfBirth DATE, 
	MovieId INT REFERENCES tblMovies(MovieId)
)

drop table tblDirectors
drop table tblMovies
drop table tblActors

SELECT * FROM tblDirectors
SELECT * FROM tblMovies
SELECT * FROM tblActors

INSERT INTO public.tblDirectors(FirstName,LastName) VALUES
('Joshna','Priya'),
('Sri','Krishna'),
('Varsha','Mahadev'),
('Sandya','Shree'),
('Anusha','Gowda'),
('Joyline','Maxima');

INSERT INTO public.tblMovies
	(MovieName, MovieLength,MovieLang,MovieCertificate,ReleaseDate,DirectorId ) VALUES
	('Leo',250,'Tamil','B','2023/11/08',1),
	('Mersal',250,'Tamil','B','2023/10/08',2),
	('Ghili',250,'Tamil','B','2023/09/08',3),
	('Master',250,'Tamil','B','2023/08/08',4),
	('Bigil',250,'Tamil','B','2023/07/08',5),
	('Thuppakki',250,'Tamil','B','2023/06/08',6),
	('Theri',250,'Tamil','B','2023/05/08',5),
	('Kushi',250,'Tamil','B','2023/04/08',1),
	('Thalaivaa',250,'Tamil','B','2023/03/08',2),
	('Nanban',250,'Tamil','B','2023/02/08',3);
	
INSERT INTO public.tblActors
	(FirstName, LastName, Gender, DateOfBirth, MovieId) VALUES
	('Vijay','Joseph','M','1980/11/08',10),
	('Vijay','Sethupathi','M','1981/11/08',9),
	('Medona','Sebastin','F','1982/11/08',8),
	('Samantha','RuthPrabhu','F','1983/11/08',7),
	('Rajini','Kanth','M','1984/11/08',6),
	('Jesmitha','Vegus','F','1985/11/08',5),
	('Dilip','Raju','M','1986/11/08',4),
	('Sanjay','Datt','M','1987/11/08',3),
	('Priya','Peter','F','1988/11/08',2),
	('Joshna','John','F','1989/11/08',1);
	
SELECT * FROM tblActors
order by First_name Asc,Date_of_birth Desc;	

--1.Display Movie name, movie language and release date from movies table. 
SELECT movieid, movielang, releasedate FROM tblMovies

--2.Display only 'Kannada' movies from movies table. 
SELECT * FROM tblMovies WHERE movielang='Kannada'

--3.Display movies released before 1st Jan 2011. 
SELECT moviename FROM tblMovies
WHERE releasedate<'2023/10/10'
	 
--4.Display Hindi movies with movie duration more than 150 minutes.
SELECT Moviename FROM tblMovies
WHERE Movielang='Tamil' AND Movielength>150;

--5.Display movies of director id 3 or Kannada language. 
SELECT * FROM tblMovies
WHERE directorid=3 AND movielang='kannada'

--6.Display movies released in the year 2023. 
SELECT Moviename FROM tblMovies
WHERE Extract(Year from Releasedate)=2023;

--7.Display movies that can be watched below 15 years. 
SELECT Moviename FROM tblMovies
WHERE EXTRACT(YEAR FROM Releasedate)<15;

--8.Display movies that are released after the year 2015 and directed by directorid 3. 
SELECT Movie_name FROM tblMovies
WHERE EXTRACT(YEAR FROM Release_date)>2015 AND Director_id=3;

--9.Display all other language movies except Hindi language. 
SELECT Moviename FROM tblMovies
WHERE Movielang !='Hindi'

--10.Display movies whose language name ends with 'u'. 
SELECT Moviename FROM tblMovies
WHERE Moviename Like '%u';

--11.Display movies whose language starts with 'm'. 
SELECT Movie_name FROM tblMovies
WHERE Movie_lang like 'T%';

--12.Display movies with language name that has only 5 characters. 
SELECT Moviename FROM tblMovies
WHERE LENGTH(Movielang)=5;

--13.Display the actors who were born before the year 1980. 
SELECT Firstname, Lastname FROM tblActors
WHERE EXTRACT( YEAR FROM Dateofbirth)<1980;

--14.Display the youngest actor from the actors table. 
SELECT Firstname,Lastname FROM tblActors
ORDER BY Dateofbirth DESC
LIMIT 1;

--15.Display the oldest actor from the actors table. 
SELECT Firstname,Lastname
FROM tblActors
ORDER BY Dateofbirth ASC
LIMIT 1;

--16.Display all the female actresses whose ages are between 30 and 35. 
SELECT Firstname,Lastname
FROM tblActors
WHERE Gender='F' AND Extract (YEAR From Age(now(),Dateofbirth)) BETWEEN 30 AND 35;

--17.Display the actors whose movie ids are in 1 to 5. 
SELECT Firstname,Lastname FROM tblActors
WHERE Movieid in (1,5);

--18.Display the longest duration movie from movies table. 
SELECT Moviename FROM tblMovies
ORDER BY Movielength DESC
LIMIT 1;

--19.Display the shortest duration movie from movies table. 
SELECT Moviename FROM tblMovies
Order By Movielength ASC
LIMIT 1;

->vd->>ij::INT
SELECt '{"abgkb":"s"}'::VARCHAR::JSON

--20.Display the actors whose name starts with vowels. 
SELECT Firstname,SUBSTRING(Firstname,3,1) FROM tblActors
WHERE firstname ~ 'aa+bbb+c'
SIMILAR TO '%aabbbc%'
WHERE SUBSTRING(Firstname,3,1) ILIKE '%aabbbb%'
IN ('A','E','I','O','U','i','a','e','o','u');

SELECT 1
WHERE 'iya' IN ('a','e')

select 'bhoomika' WHERE 'bhoomika' 

OR

SELECT * FROM tblActors
WHERE Firstname ~ '^[veiouVEIOU].*$'; 

--21.Display all the records from tblactors by sorting the data based on the fist_name in the
--ascending order and date of birth in the descending order.
SELECT * FROM tblActors
ORDER BY firstname, dateofbirth DESC;

----------------------------------------------------------------------------------------------------------
ASSIGNMENT 2

	SELECT * FROM tblDirectors
	SELECT * FROM tblMovies
	SELECT * FROM tblActors
 
-- 1.List the different languages of movies. 
SELECT DISTINCT movielang FROM tblMovies;
 
-- 2.Display the unique first names of all directors in ascending order by 
-- their first name and then for each group of duplicates, keep the first row in the 
-- returned result set. 
SELECT DISTINCT ON (firstname)*
FROM tblDirectors
ORDER BY firstname;

-- 3. write a query to retrieve 4 records starting from the fourth one, to 
-- display the actor ID, name (first_name, last_name) and date of birth, and 
-- arrange the result as Bottom N rows from the actors table according to their 
-- date of birth.  

 SELECT actorid, firstname, lastname, dateofbirth
 FROM (SELECT actorid, firstname, lastname, dateofbirth, ROW_NUMBER() OVER (ORDER BY dateofbirth DESC) AS row_num
 FROM tblActors ) AS ActorRank
 WHERE row_num BETWEEN 4 AND 7;
 
  [OR]
 
 SELECT actorid, CONCAT(firstname, ' ' ,lastname) AS actorname, dateofbirth
 FROM tblActors
 ORDER BY dateofbirth DESC
 OFFSET 3 LIMIT 4;

-- 4.Write a query to get the first names of the directors who holds the letter 
-- 'S' or 'J' in the first name.     
 SELECT firstname FROM tblDirectors
 WHERE firstname LIKE '%s%' OR firstname LIKE '%j%';
 
-- 5.Write a query to find the movie name and language of the movie of all 
-- the movies where the director name is Joshna. 
 SELECT moviename, movielang 
 FROM tblMovies M INNER JOIN tblDirectors D ON M.directorid= D.directorid
 WHERE firstname ='Joshna';
 
-- 6.Write a query to find the number of directors available in the movies 
-- table. 
 SELECT COUNT(DISTINCT directorid) AS NoOfDirectors
 FROM tblMovies;

-- 7. Write a query to find the total length of the movies available in the 
-- movies table. 
 SELECT SUM(movielength) AS "TotalLength" 
 FROM tblMovies;

-- 8.Write a query to get the average of movie length for all the directors 
-- who are working for more than 1 movie. 
 SELECT directorid, ROUND(AVG(movielength)) AS "AvgMovieLength"
 FROM tblMovies 
 GROUP BY directorid
 HAVING COUNT(directorid)>1;
 
-- 9.Write a query to find the age of the actor vijay for the year 2001-04-10. 
 SELECT firstname, AGE('2001-04-10',dateofbirth)
 FROM tblActors
 WHERE firstname= 'Vijay';

-- 10.Write a query to fetch the week of this release date 2020-10-10 
-- 13:00:10. 
 SELECT EXTRACT(WEEK FROM releasedate) AS "WEEK"
 FROM tblMovies
 where releasedate= '2023-11-08';
---------------------------------------------------------
 SELECT TO_TIMESTAMP('2023*11*08', 'YYYY*MM*DD')
 
 SELECT '2023-11-08'::DATE
 
 SELECT CONVERT(DATE,'2023-11-08')
 
 SELECT CAST('2023-11-08' AS timesTamp)
 
 SELECT TO_CHAR('2023-11-08'::DATE,'YYYY')  FROM tblMovies;
--------------------------------------------------------------------------------
-- 11.Write a query to fetch the day of the week and year for this release date 
-- 2020-10-10 13:00:10. 

 SELECT TO_CHAR(ReleaseDate,'Day'),TO_CHAR(ReleaseDate,'Y'),TO_CHAR(ReleaseDate,'ww')
 FROM tblmovies M;
 
 SELECT TO_CHAR(ReleaseDate,'Day'),EXTRACT(YEAR FROM ReleaseDate),TO_CHAR(ReleaseDate,'ww')
 FROM tblmovies M
 WHERE ReleaseDate= '2023-11-08';
 
 --W  -WEEK OF THAT MONTH
 --WW -WEEK OF THAT YEAR

-- 12.Write a query to convert the given string '20201114' into date and time. 
 SELECT TO_TIMESTAMP('2020*11*14', 'YYYY*MM*DD');

-- 13.Display Today's date. 
 SELECT CURRENT_DATE;
          		   
-- 14.Display Today's date with time. 
 SELECT CURRENT_TIMESTAMP;
 OR
 SELECT NOW()::timestamp;
 
-- 15.Write a query to add 10 Days 1 Hour 15 Minutes to the current date. 
 SELECT CURRENT_DATE +INTERVAL '10 Days 1 Hour 15 Minutes';      
	   
-- 16.Write a query to find the details of those actors who contain eight or 
-- more characters in their first name. 
 SELECT * FROM tblActors
 WHERE firstname LIKE '________%';

-- 17.Write a query to join the text 'movie' with the movie_name column. 
 SELECT CONCAT('Movie ', moviename) AS fullmoviename
 FROM tblMovies;

-- 18.Write a query to get the actor id, first name and birthday month of an 
-- actor. 
 SELECT actorid, firstname, EXTRACT(MONTH FROM dateofbirth) AS birthmonth
 FROM tblActors;
 
-- 19.Write a query to get the actor id, last name to discard the last three 
-- characters. 
 SELECT actorid, LEFT(lastname, LENGTH(lastname)-3) AS trimmedlastname
 FROM tblactors;    

-- 20.Write a query that displays the first name and the character length of 
-- the first name for all directors whose name starts with the letters 'A', 'J' or 'V'. 
-- Give each column an appropriate label. Sort the results by the directors' first 
-- names. 
 SELECT firstname, LENGTH(firstname) AS CharLength 
 FROM tblDirectors
 WHERE firstname ILIKE 'A%' OR firstname LIKE 'J%' OR firstname LIKE 'V%'
 ORDER BY firstname;
 
 SELECT firstname, LENGTH(firstname) AS CharLength 
 FROM tblDirectors
 WHERE firstname SIMILAR TO '[AJVavj]%'
 ORDER BY firstname;
 
-- 21.Write a query to display the first word in the movie name if the movie 
-- name contains more than one words. 
 SELECT moviename, SPLIT_PART(moviename,' ', 1) FROM tblMovies
 WHERE moviename ILIKE '% %';
 
-- 22.Write a query to display the actors name with movie name.       
 SELECT CONCAT(firstname,' ',lastname) AS ActorName , moviename
 FROM tblMovies M INNER JOIN tblActors A ON M.movieid= A.movieid;
 
-- 23.Write a query to make a join with three tables movies, actors, and 
-- directors to display the movie name, director name, and actors date of birth. 
 SELECT moviename, CONCAT(D.firstname,' ',D.lastname) AS DirectorName, dateofbirth 
 FROM tblDirectors D INNER JOIN tblMovies M ON D.directorid= M.directorid 
 INNER JOIN tblActors A ON M.movieid= A.movieid;
 
-- 24.Write a query to make a join with two tables directors and movies to 
-- display the status of directors who is currently working for the movies above 1. 
--PENDINGGG...................................
 SELECT D.directorid, CONCAT(D.firstname,' ',D.lastname) AS DirectorName , COUNT(M.movieid) AS MovieCount
 FROM tblDirectors D INNER JOIN tblMovies M ON D.directorid= M.directorid
 GROUP BY D.directorid
 HAVING COUNT(M.movieid)>1;
 
-- 25.Write a query to make a join with two tables movies and actors to get 
-- the movie name and number of actors working in each movie. 
 SELECT M.moviename, COUNT(A.actorid) AS ActorCount
 FROM tblMovies M LEFT OUTER JOIN tblActors A ON M.movieid= A.movieid
 GROUP BY M.moviename
 HAVING COUNT(A.actorid) = 1;
 
-- 26.Write a query to display actor id, actors name (first_name, last_name)  
-- and movie name to match ALL records from the movies table with each 
-- record from the actors table.      
 SELECT actorid, CONCAT(A.firstname,' ',A.lastname), M.moviename
 FROM tblActors A CROSS JOIN tblMovies M;
 
 ON A.movieid= M.movieid;
 
 SELECT * FROM tblDirectors
 SELECT * FROM tblMovies
 SELECT * FROM tblActors

----------------------------------------------------------------------------------------------------------------

CREATE TABLE tbldepartment
(
	department_id NUMERIC PRIMARY KEY,
	department_name VARCHAR(20)
);

CREATE TABLE tblEmployee
( 
	employee_id NUMERIC PRIMARY KEY, 
	department_id NUMERIC REFERENCES tblDepartment,
	first_name VARCHAR(200) NOT NULL, 
	last_name VARCHAR(200) NOT NULL,
	email_id VARCHAR(200) UNIQUE, 
	phonenumber VARCHAR(200),
	hire_date DATE DEFAULT CURRENT_DATE,
	job_id VARCHAR(200),
	salary NUMERIC CHECK (salary > 0), 
	manager_id NUMERIC REFERENCES tblEmployee 
	ON DELETE SET NULL ON UPDATE SET NULL, 
	commission_pct numeric(2,2) 
);

DROP TABLE tbldepartment
DROP TABLE tblEmployee
DROP TABLE tblJobHistory

CREATE TABLE tblJobHistory
(
	employee_id NUMERIC,
	start_date DATE,
	end_date DATE,
	job_id VARCHAR(20),
	department_id NUMERIC REFERENCES tblDepartment 
	ON DELETE SET NULL ON UPDATE SET NULL,
	CONSTRAINT emp_date PRIMARY KEY (employee_id,start_date), 
	CONSTRAINT empid_fk foreign key (employee_id) references tblEmployee 
	ON DELETE SET NULL ON UPDATE SET NULL,
	CONSTRAINT job_hist_date CHECK (start_date < end_date) 
);

INSERT INTO tblDepartment (department_id, department_name)
VALUES (10, 'HR'),
       (20, 'Finance'),
       (30, 'IT'),
       (40, 'Marketing'),
       (50, 'Operations');

INSERT INTO tblEmployee (employee_id,department_id, first_name, last_name, email_id, phonenumber, job_id, salary, manager_id, hire_date)
VALUES (1,10, 'John', 'Doe', 'john.doe@example.com', '123456789', 'Manager', 60000, NULL, '2023-01-01'),
       (2,20,'Jane', 'Smith', 'jane.smith@example.com', '987654321', 'Analyst', 50000, 1, '2023-02-15'),
       (3,30, 'Bob', 'Johnson', 'bob.johnson@example.com', '555123456', 'Developer', 70000, 1, '2023-03-20'),
       (4,40, 'Alice', 'Williams', 'alice.williams@example.com', '444555666', 'Coordinator', 45000, 2, '2023-04-10'),
       (5,50,'Charlie', 'Brown', 'charlie.brown@example.com', '333222111', 'Administrator', 55000, 2, '2023-05-05');

INSERT INTO tblJobHistory (employee_id, start_date, end_date, job_id, department_id)
VALUES (2, '2023-02-15', '2023-06-30', 'Analyst', 20),
       (3, '2023-03-20', NULL, 'Developer', 20),
       (4, '2023-04-10', NULL, 'Coordinator', 30),
       (5, '2023-05-05', NULL, 'Administrator', 30),
       (1, '2023-01-01', '2023-12-31', 'Manager', 10);

--11.Write a query to display the last_name and number of  months for which the 
--employee have worked rounding the months_worked column to its nearest whole number.   
--Hint: No of months should be calculated from the date of joining of an employee to till date. 
SELECT last_name,EXTRACT(YEAR FROM age(now(),hire_date))* 12 + EXTRACT(MONTH FROM age(now(),hire_date)) As Months_work
FROM tblEmployee

--12.calculate their spending's designation-wise from each department.  
SELECT department_id, job_id, ROUND(SUM(salary)) AS total_spending
FROM employees
GROUP BY department_id, job_id;

--13.calculate the following details of the employees using aggregate function in a 
--department. 
--∙Employee with highest salary 
--∙Employee with lowest salary 
--∙Total salary of all the employees in the department  
--∙Average salary of the department 
--Write a query to display the output  rounding the resultant values to its nearest whole 
--number.
SELECT department_id,
      MAX(salary),
      MIN(salary),
      SUM(salary),
      AVG(salary) 
FROM tblEmployee
GROUP BY department_id;

--14.Modify the result obtained in the previous exercise to display the minimum, 
--maximum, total and average salary for each job type. 
SELECT department_id, job_id,
       MIN(salary),
       MAX(salary),
       ROUND(SUM(salary)) AS total_salary,
       ROUND(AVG(salary)) AS average_salary
FROM tblEmployee
GROUP BY department_id, job_id;

--15.fetch the details of the departments having less than 3 employees and are working in 
--the department whose department_id is greater than 10.  
SELECT department_id, COUNT(*) AS num_employees
FROM tblEmployee
GROUP BY department_id
HAVING COUNT(*) < 3 AND department_id > 10;

--16.fetch the manager_id and the minimum salary of the employee reporting to him. 
--Arrange the result in descending order of the salaries excluding the details given below: 
--∙Exclude the employee whose manager is not mapped / not known. 
--∙Exclude the details if the minimum salary is less than or equal to 6000. 
SELECT manager_id, MIN(salary) AS MinSalary
FROM tblEmployee
WHERE manager_id IS NOT NULL AND Salary > 6000
GROUP BY manager_id
ORDER BY MinSalary DESC;

--17. details of the employees who have never changed their job role in the company. 
SELECT * FROM tblEmployee
WHERE employee_id NOT IN (SELECT DISTINCT employee_id FROM tblJobHistory);

--18.fetch the employee names and their departments in which they are working. 
SELECT E.first_name, E.last_name, D.department_name
FROM tblEmployee E
JOIN tbldepartment D ON E.department_id = D.department_id;

--19.retrieve all the department information with their corresponding employee names 
--along with the newly added departments. 
SELECT D.*, E.first_name, E.last_name
FROM tbldepartment D
LEFT JOIN tblEmployee E ON D.department_id = E.department_id;

--20.details of the employee along with their managers. 
SELECT E.employee_id, E.first_name, E.last_name, E.manager_id, M.first_name AS ManagerFirstName, M.last_name AS ManagerLastName
FROM tblEmployee E
LEFT JOIN tblEmployee M ON E.manager_id = M.employee_id;

--21. employee details who are reporting to the same manager as Maria reports to.

--22.fetch the details of the employees working in the Executive department. 
SELECT E.*, D.* 
FROM tblEmployee E INNER JOIN tblDepartment D
ON E.department_id = D.department_id
WHERE department_name= 'Marketing'

-- 23.fetch the details of employee whose salary is greater than the average salary of all 
-- the employees. 
SELECT * 
FROM tblEmployee
WHERE salary > (SELECT AVG(salary) FROM tblEmployee)

-- 24. Write a query which displays all Ellen's colleague's names. Label the name as "Ellen's 
-- colleague".  
-- Hint: If an employee is Ellen's colleague then their department_id will be same. 

SELECT first_name || ' ' || last_name AS "Ellen colleague"
FROM tblEmployee
WHERE department_id = (SELECT department_id FROM tblEmployee WHERE first_name = 'Bob');

-- 25.which employees from adminstration team is/are earning less than all the 
-- employees. 
SELECT *
FROM tblEmployee E
WHERE department_id = (SELECT department_id FROM tbldepartment WHERE department_name = 'Finance')
  
SELECT * FROM tblEmployee

-- 26.  Write a query to display the last name and salary of those who reports to King. 
SELECT last_name, salary 
FROM tblEmployee E INNER JOIN tblDepartment D 
ON E.department_id= D.department_id
WHERE manager_id= 1
 
-- 27. Write a query to display the below requirement.   
-- Fetch employee id and first name of who work in a department with the employee's having 
-- ‘u’ in the  last_name.  
SELECT employee_id, first_name 
FROM tblEmployee 
WHERE last_name LIKE '%o%'

SELECT * FROM tbldepartment
SELECT * FROM tblemployee
SELECT * FROM tblJobHistory

-- 28.the employee who is getting highest pay in the specific department. 
SELECT employee_id, first_name FROM tblEmployee 
WHERE salary= (SELECT department_id, MAX(salary) FROM tblEmployee GROUP BY department_id)

SELECT employee_id, first_name 
FROM tblEmployee E INNER JOIN tblDepartment D
ON E.department_id= D.department_id

-- 29. the details of different employees who have atleast one person reporting to them. 
SELECT e.employee_id,e.first_name,e.last_name
FROM tblEmployee e
WHERE e.employee_id IN (SELECT DISTINCT manager_id 
					   FROM tblEmployee 
					   WHERE manager_id IS NOT NULL);

-- 30. the departments which was formed but it does not have employees working in 
-- them currently.   
SELECT d.department_id,d.department_name
FROM tbldepartment d
LEFT JOIN tblemployee e ON d.department_id = e.department_id
WHERE e.department_id IS NULL;

----------------------------------------------------------------------------------------------------

CREATE TABLE tblDepartments
(
   department_id INT PRIMARY KEY,
   department_name VARCHAR(100));

CREATE TABLE tblStudents
(
  student_id INT PRIMARY KEY,
  student_name VARCHAR(100),
  student_department INT,
  stipend INT,
  CONSTRAINT fk_student FOREIGN KEY(student_department) REFERENCES tblDepartments(department_id));
  
INSERT INTO tblDepartments VALUES
(1,'Science'),
(2,'Commerce'),
(3,'Bio-Chemistry'),
(4,'Bio-Medical'),
(5,'Fine Arts'),
(6,'Literature'),
(7,'Animation'),
(8,'Marketing');
  
INSERT INTO tblStudents VALUES
(1,'Hadria',7,2000),
(2,'Trumann',2,2000),
(3,'Earlie',3,2000),
(4,'Monika',4,2000),
(5,'Aila',5,2000),
(6,'Trina',5,2000),
(7,'Esteban',3,2000),
(8,'Camilla',1,2000),
(9,'Georgina',4,2000),
(10,'Reed',6,16000),
(11,'Northrup',7,2000),
(12,'Tina',2,2000),
(13,'Jonathan',	2,2000),
(14,'Renae',7,2000),
(15,'Sophi',6,16000),
(16,'Rayner',3,2000),
(17,'Mona',6,16000),
(18,'Aloin',5,2000),
(19,'Florance',5,2000),
(20,'Elsie',5,2000);

--stored procedures
--1.Write a stored procedure to insert values into the student table ans also 
--  update the student_department to 7 when the student_id is between 400 and 700.
DROP PROCEDURE InsertAndUpdateStudents
CREATE PROCEDURE sp_name(PstudentId INT, Pstudent_name VARCHAR())

CREATE OR REPLACE PROCEDURE InsertAndUpdateStudents(Pstudent_id INT, Pstudent_name VARCHAR, Pstudent_department INT, Pstipend INT)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO tblStudents (student_id, student_name, student_department, stipend)
    VALUES (Pstudent_id, Pstudent_name, Pstudent_department, Pstipend);
		
	IF Pstudent_id BETWEEN 400 AND 700
	then
		update tblStudents
		set Student_department= 7
		where student_id= Pstudent_id;
	end if;	
END	
$$

CALL InsertAndUpdateStudents(509,'Pooja',2,15000);

SELECT * FROM tblStudents
SELECT * FROM tblDepartments


--2.Write a procedure to update the department name to 'Animation' when the department id is 7. 
--  This command has to be committed. Write another statement to delete the record from the students 
--  table based on the studentid passed as the input parameter.This statement should not be committed.'
DROP PROCEDURE sp_Update

CREATE OR REPLACE PROCEDURE sp_Update(IN SID INT)
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE tblDepartments
	SET department_name= 'ANIMATIONNEW'
	WHERE department_id=6;
	COMMIT;
	
	BEGIN 
	DELETE FROM tblStudents WHERE student_id= SID;	
	ROLLBACK ;
	END ;
END;
$$ 

CALL sp_Update(6)

SELECT * FROM tblStudents
SELECT * FROM tblDepartments

--3.Write a procedure to display the sum,average,minimum and maximum values of the column 
-- stipend from the students table.


CREATE OR REPLACE PROCEDURE sp_sum_avg_min_max 
			(inout sum_stipend INT=0,
			 inout avg_stipend DECIMAL(10, 2)=0,
			 inout min_stipend INT=0,
			 inout max_stipend INT=0)
LANGUAGE plpgsql
AS $$
BEGIN
     SELECT SUM(stipend) INTO sum_stipend FROM tblStudents;
     SELECT AVG(stipend) INTO avg_stipend FROM tblStudents;
     SELECT MIN(stipend) INTO min_stipend FROM tblStudents;
     SELECT MAX(stipend) INTO max_stipend FROM tblStudents;
END;
$$ 

call sp_sum_avg_min_max()

-- --subqueries
--1.Fetch all the records from the table students where the stipend is more than 'Florence'
SELECT * FROM tblStudents
where stipend>(SELECT stipend FROM tblStudents WHERE student_name='Florance')

--2.Return all the records from the students table who get more than the minimum stipend for 
--  the department 'FineArts'.
    SELECT * FROM tblStudents WHERE stipend >
         (SELECT MIN(stipend) 
          FROM tblStudents S INNER JOIN tblDepartments D ON S.student_department=D.department_id
		  WHERE department_name='Fine Arts'
		  GROUP BY S.student_id, d.department_id )

-- 1.Write a query to fetch the student_name,stipend and department_name from the students and 
-- departments table where the student_id is between 1 to 5 AND stipend is in the range of 2000 to 4000.

	SELECT student_name, stipend, department_name 
	FROM tblStudents S INNER JOIN tblDepartments D ON S.student_department= D.department_id
	WHERE student_id BETWEEN 1 AND 5 
	AND stipend BETWEEN 2000 AND 4000;

-- 2.Write a query to fetch the sum value of the stipend from the students table based on
-- the department_id where the departments 'Animation' and 'Marketing' should not be 
-- included and the sum value should be less than 4000.
	
	SELECT student_department, SUM(stipend) 
	FROM tblStudents S INNER JOIN tblDepartments D ON S.student_department= D.department_id
	WHERE department_name NOT IN ('Animation','Marketing')
	GROUP BY student_department
	HAVING SUM(stipend) < 4000
		
	SELECT * FROM tblStudents
	SELECT * FROM tblDepartments
	
-- 3.Using the concept of multiple cte, fetch the maximum value, minimm value, average and 
-- sum of the stipend based on the department and return all the values.
	
	with display_stipend1
 	as(
 	select  max(stipend) as maxi,student_department
 	from students
 	group by student_department
 	),
    	display_stipend2
 	as(
 	select  min(stipend) as mini,student_department
 	from students
 	group by student_department
 	),
 	display_stipend3
 	as(
 	select  avg(stipend) as avge ,student_department
 	from students
 	group by student_department
 	),
 	display_stipend4
 	as(
 	select  sum(stipend) as sumof ,student_department
 	from students
 	group by student_department
 	)
 	select D1.maxi,D2.mini,D3.avge,D4.sumof ,D1.student_department
 	from  display_stipend1 D1 inner JOIN display_stipend2 D2
 	ON  D1. student_department= D2.student_department
 	inner JOIN display_stipend3 D3
 	ON  D2. student_department= D3.student_department
 	inner JOIN display_stipend4 D4
 	ON  D3. student_department= D4.student_department
 
 
 --1.Write a stored procedure to insert values into the 
--student table ans also update the student_department to 7 when the student_id
--is between 400 and 700.
create or replace procedure sp_insertvalues(
    S_studentI_id int,
	S_student_name varchar(100),
	S_student_department int,
	Stipend int
	)
Language plpgsql
AS $$
BEGIN

insert into tblstudents(student_id,student_name,student_department,stipend)
values(S_studentI_id,S_student_name,S_student_department,Stipend);

update tblstudents
set student_department=7
where student_id between 400 and 700;
end;
$$

call sp_S1(501,'GURU',8,56000)

-- 2. Create a stored procedure that calculates total salary for a department and updates budget 
CREATE OR REPLACE PROCEDURE calculate_department_salary(department_id INT) 
AS $$ 
DECLARE 
    total_salary DECIMAL; 
BEGIN 
    -- Start the transaction 
    BEGIN 
        -- Calculate total salary for the department 
        SELECT SUM(salary) INTO total_salary FROM employees WHERE department_id = department_id; 
 
        -- Update the department's budget 
        UPDATE departments SET budget = budget - total_salary WHERE id = department_id; 
 
        -- Log the transaction 
        INSERT INTO transaction_log(description, timestamp) 
        VALUES ('Total salary calculated and budget updated for department ' || department_id, NOW()); 
 
 
    EXCEPTION 
        -- Handle exceptions 
        WHEN OTHERS THEN 
            -- Log the exception 
            INSERT INTO error_log(message, timestamp) 
            VALUES ('Error calculating salary for department ' || department_id || ': ' || SQLERRM, 
NOW()); 
             
            -- Rollback the transaction 
            ROLLBACK; 
             
            -- Raise an exception 
            RAISE EXCEPTION 'Transaction failed. Please check the error logs.'; 
    END; 
 
    -- Commit the transaction 
    COMMIT; 
END; 
$$ 
LANGUAGE plpgsql; 

CREATE TABLE tblUsers
(
	UserID INT PRIMARY KEY,
	UserName VARCHAR(50) NOT NULL,
	EmailID Varchar(100) NOT NULL
)

INSERT INTO tblUsers(UserID, UserName, EmailID) VALUES
(1001,'Akash','akash@gmail.com'), 
(1002,'Arvind','arvind123@gmail.com'),
(1003,'Sakshi','sakshimys12@gmail.com'),
(1004,'Kumar','kumar987@gmail.com')

CREATE TABLE tblCategory
(
	CategoryID INT PRIMARY KEY,
	CategoryName VARCHAR(50) NOT NULL,
	Description VARCHAR(255) NOT NULL
)

INSERT INTO tblCategory(CategoryID, CategoryName, Description) VALUES
(201,'Electronics','One stop for electronic items'),
(202,'Apparel','Apparel is the next destination for fashion') ,
(203,'Grocery','All needs in one place')

CREATE TABLE tblProducts
(
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(50) NOT NULL,
	Quantity INT NOT NULL,
	ProductPrice INT NOT NULL,
	CategoryID INT REFERENCES tblCategory(CategoryID)
)

INSERT INTO tblProducts(ProductID, ProductName, Quantity, ProductPrice, CategoryID) VALUES
(1,'Mobile Phone',1000,15000,201), 
(2,'Television',500,40000,201) ,
(3,'Denims',2000,700,202),
(4,'Vegetables',4000,40,203) ,
(5,'Ethnic Wear',300,1500,202) ,
(6,'Wireless Earphone',5000,2500,201),
(7,'Lounge Wear',200,1600,202),
(8,'Refrigerator',50,30000,201),
(9,'Pulses',60,150,202),
(10,'Fruits',100,250,203)
 
CREATE TABLE tblSales
(
	SalesID INT PRIMARY KEY,
	SalesUserID INT REFERENCES tblUsers(UserID),
	ProductID INT REFERENCES tblProducts(ProductID)
)
 
INSERT INTO tblSales(SalesID, SalesUserID, ProductID) VALUES
(500,1001,1), 
(501,1002,1), 
(502,1003,2), 
(504,1004,3), 
(505,1004,1), 
(506,1004,1), 
(507,1002,2), 
(508,1003,1), 
(509,1001,7), 
(510,1001,8)  
 
 SELECT * FROM tblUsers
 SELECT * FROM tblCategory
 SELECT * FROM tblProducts
 SELECT * FROM tblSales

--1.Write a function to fetch the names of the product,category and users along with the cost for each product sold depending on the sales_id. 
--  Also if the cost for each product is more than 2000, then display a message stating that 'The product has gained profit'.  
--  If the product cost is between 500 and 1000, then raise a message stating that 'The product has occured loss'.  
--  If the product cost is less than 500, then raise an exception stating 'No profit no loss'. 

CREATE OR REPLACE FUNCTION fn_Sale(IN saleid int)
	RETURNS TABLE (_ProductName1 VARCHAR(25), _CategoryName1 VARCHAR(25), _UserName1 VARCHAR(25), _ProductID1 INT, _ProductPrice1 INT)
    LANGUAGE plpgsql
	AS
	$$
	DECLARE Price INT;
		BEGIN
			RETURN QUERY 
				SELECT P.ProductName, CategoryName , UserName , S.ProductID , ProductPrice AS Cost
				FROM tblCategory C 
				INNER JOIN tblProducts P ON C.CategoryID= P.CategoryID
				INNER JOIN tblSales S ON S.ProductID= P.ProductID
				INNER JOIN tblUsers U ON U.UserID= S.Salesuserid
				WHERE S.SalesID= SaleID;

				SELECT P.ProductPrice INTO Price FROM tblProducts P INNER JOIN tblsales S USING(ProductID)
   				WHERE S.SalesID= SaleID;
   				
				IF Price > 2000
				THEN 
					RAISE NOTICE 'The Product has gained Profit';
				END IF;
				
				IF Price BETWEEN 500 AND 1000
				THEN 
					RAISE NOTICE 'The product has occured loss';
				END IF;
				
				IF Price<500 
				THEN
					RAISE NOTICE 'No profit No loss';
				END IF;
		END;
		$$
		
SELECT * FROM fn_Sale(504)

-- 2.Write a procedure to update the name of the category from 'Electronics' to 'Modern Gadgets' and also  
-- fetch the category and product names when the userid is passed as the input parameter.

 SELECT * FROM tblUsers
 SELECT * FROM tblCategory
 SELECT * FROM tblProducts
 SELECT * FROM tblSales
 
CREATE OR REPLACE PROCEDURE usp_UpdateCategory(IN userID INT)
LANGUAGE PLPGSQL
AS $$
BEGIN
DROP TABLE IF EXISTS TempResult;
    -- Create a temporary table to store results
    CREATE TEMPORARY TABLE TempResult AS
    SELECT
        C.CategoryName AS Category,
        P.ProductName AS Product
    FROM
        tblSales S
        INNER JOIN tblProducts P ON S.ProductID = P.ProductID
        INNER JOIN tblCategory C ON P.CategoryID = C.CategoryID
    WHERE
        S.SalesUserID = UserID;

    UPDATE tblCategory
    SET CategoryName = 'Modern Gadgets'
    WHERE CategoryName = 'Electronics';

    -- Fetch category and product names from the temporary table
    PERFORM * FROM TempResult;
END;
$$;

CALL usp_UpdateCategory(1001)
SELECT * FROM TempResult






























