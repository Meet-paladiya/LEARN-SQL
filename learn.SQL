CREATE DATABASE college;

USE college;

CREATE TABLE student(
 roll_no INT,
 name VARCHAR(30),
 age INT
);

INSERT INTO student
VALUES
(103,"adam",18),
(104,"Meet",19);

SELECT * FROM student;


CREATE DATABASE IF NOT EXISTS instagram;
DROP DATABASE IF EXISTS college;

SHOW DATABASES;

SHOW TABLES;


//////////////////////////////////////////
Insta info

USE instagram;

CREATE DATABASE IF NOT EXISTS instagram;
DROP DATABASE IF EXISTS instagram;


CREATE TABLE user(
 id INT PRIMARY KEY,
 age INT,
 name VARCHAR(30) NOT NULL,
 email VARCHAR(30) UNIQUE,
 followers INT DEFAULT 0,
 following INT,
 CONSTRAINT CHECK (age>=18)
);


INSERT INTO user
(id,age,name,email,followers,following)
VALUES
(1,20,"MEET","JUST@GMAIL.COM",309,100),
(2,20,"jus","god@GMAIL.COM",48,106),
(3,24,"MruT","yulg@GMAIL.COM",09,170),
(4,25,"trish","Jynh@GMAIL.COM",39,720);

INSERT INTO user
(id,age,name)
VALUES
(6,19,"gof");

SELECT id,name,age FROM user;
SELECT * FROM user;
SELECT DISTINCT age FROM user; 



CREATE TABLE post(
  id INT PRIMARY KEY,
  content VARCHAR(100),
  user_id INT ,
  FOREIGN KEY (user_id) REFERENCES user(id)
);

INSERT INTO post
(id,content,user_id)
VALUES
(101,"Hello meet",1),
(102,"Hello Harsh",2),
(103,"Hello Om",3);

SELECT * FROM post;
 
///////////////////////////////////////////////




USE instagram;

CREATE DATABASE IF NOT EXISTS instagram;
DROP DATABASE IF EXISTS instagram;


CREATE TABLE user(
 id INT PRIMARY KEY,
 age INT,
 name VARCHAR(30) NOT NULL,
 email VARCHAR(30) UNIQUE,
 followers INT DEFAULT 0,
 following INT,
 CONSTRAINT CHECK (age>=18)
);


INSERT INTO user
(id,age,name,email,followers,following)
VALUES
(2,20,"jus","god@GMAIL.COM",480,106),
(1,20,"MEET","JUST@GMAIL.COM",309,100),
(3,24,"MruT","yulg@GMAIL.COM",09,170),
(4,25,"trish","Jynh@GMAIL.COM",39,720);

INSERT INTO user
(id,age,name)
VALUES
(6,19,"gof");

SELECT id,name,age FROM user;
SELECT * FROM user;
SELECT DISTINCT age FROM user; 

SELECT age,name, followers
FROM user
-- WHERE followers !=200 ;
-- WHERE age BETWEEN 15 AND 21;
-- WHERE email NOT IN ("JUST@GMAIL.COM","Jynh@GMAIL.COM","SG JHSBVCHBVED@GMAIL.COM");
WHERE email  IN ("JUST@GMAIL.COM","Jynh@GMAIL.COM","SG JHSBVCHBVED@GMAIL.COM");

-- SELECT age,name
-- From user
-- WHERE age>19
-- LIMIT 2;  IT GIVES ONLY 2 MEMBERS FROM ALL THE OUTPUTS

SELECT age,name,followers
FROM user 
ORDER BY followers ASC;

SELECT max(followers)
FROM user;

SELECT count(age)
FROM user
WHERE age = 20; -- WHERE ma aakha table par condition check thay jyare 

SELECT avg(age)
FROM user;

SELECT age,count(id),max(followers)
FROM user
GROUP BY age;  -- age na base group bani jay 

SELECT age,count(id), max(followers) -- general order 
FROM user
-- WHERE 
GROUP BY age
HAVING max(followers) >10
ORDER BY max(followers) ASC;
-- ORDER BY max(followers) DESC;

-- SET SQL_SAFE_UPDATES = 0;

UPDATE user  -- update and delete row ma thay
SET followers = 300
WHERE age = 20;

SELECT * from user;  

DELETE FROM user
WHERE name = "gof"; -- WHERE nai to badhi row delete kari nakhe 

ALTER TABLE user -- to add new column
ADD COLUMN city VARCHAR(30) DEFAULT "delhi";

ALTER TABLE user   
DROP COLUMN city;  -- to delete new column

ALTER TABLE instaUser
RENAME TO user;

ALTER TABLE user
CHANGE COLUMN followers subs INT DEFAULT 0;  

ALTER TABLE user
MODIFY subs INT DEFAULT 5; -- HAVE subs jo lakhie nai to automatic 5 j thai jay

TRUNCATE TABLE user; -- table aakhu khali but tenu name rehshe -- aa karva pela foreign key valu table delete karvu pade 
DROP TABLE user; -- aakhu table j udi jay  


CREATE TABLE post(
  id INT PRIMARY KEY,
  content VARCHAR(100),
  user_id INT ,
  FOREIGN KEY (user_id) REFERENCES user(id)
);

INSERT INTO post
(id,content,user_id)
VALUES
(101,"Hello meet",1),
(102,"Hello Harsh",2),
(103,"Hello Om",3);

SELECT * FROM post;


CREATE TABLE stuinfo(
 rollno INT ,
 name VARCHAR(100) NOT NULL,
 city VARCHAR(30),
 marks INT
);

INSERT INTO stuinfo
(rollno,name,city,marks)
VALUES
(110,"adam","delhi",76),
(180,"meet","pune",86),
(170,"gopal","uk",90),
(120,"yash","mumbai",54);

SELECT  * FROM stuinfo;

SELECT * FROM stuinfo
WHERE marks>75; 

-- both are same
SELECT DISTINCT city
FROM stuinfo;

SELECT city,max(marks)
FROM stuinfo
GROUP BY city; 

USE instagram;

ALTER TABLE stuinfo
ADD COLUMN grade VARCHAR(4);

SET SQL_SAFE_UPDATES = 0;

UPDATE stuinfo
SET grade = "A"
WHERE marks >= 80;

UPDATE stuinfo
SET grade = "B"
WHERE marks >= 60 AND marks<80;

UPDATE stuinfo
SET grade = "C"
WHERE marks <60;

SELECT * FROM stuinfo;