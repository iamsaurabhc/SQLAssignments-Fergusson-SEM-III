CREATE DATABASE Assignment4
USE Assignment4
GO

CREATE TABLE Movie
(
	Mv_no int PRIMARY KEY NOT NULL,
	Mv_name varchar(20),
	R_yr int ,
	CHECK(R_yr>0),
);

INSERT INTO Movie VALUES(231,'Don',2006)
INSERT INTO Movie VALUES(232,'KKKG',2001)
INSERT INTO Movie VALUES(233,'Krrish',2006)
INSERT INTO Movie VALUES(234,'Sholay',1984)
INSERT INTO Movie VALUES(235,'Cocktail',2012)
INSERT INTO Movie VALUES(236,'Singham',2011)
INSERT INTO Movie VALUES(237,'Suhaag',1979)
INSERT INTO Movie VALUES(238,'Silsila',1981)
INSERT INTO Movie VALUES(239,'Queen',2014)
INSERT INTO Movie VALUES(230,'Black',2005)

CREATE TABLE Actor
(
	Act_no int PRIMARY KEY NOT NULL,
	Act_name varchar(20)
);

INSERT INTO Actor VALUES(1,'Shahrukh Khan')
INSERT INTO Actor VALUES(2,'Amitabh Bachchan')
INSERT INTO Actor VALUES(3,'Hrithik Roshan')
INSERT INTO Actor VALUES(4,'Kajol Devgn')
INSERT INTO Actor VALUES(5,'Kareena Kapoor')
INSERT INTO Actor VALUES(6,'Saif Ali Khan')
INSERT INTO Actor VALUES(7,'Ajay Devgn')
INSERT INTO Actor VALUES(8,'Priyanka Chopra')
INSERT INTO Actor VALUES(9,'Rani Mukherjee')
INSERT INTO Actor VALUES(10,'Kangana Ranaut')
INSERT INTO Actor VALUES(11,'Jaya Bachchan')

CREATE TABLE Mv_Act
(
	Ma_no int PRIMARY KEY NOT NULL,
	Ref_Mv_no int NOT NULL FOREIGN KEY REFERENCES Movie(Mv_no),
	Ref_Act_no int NOT NULL FOREIGN KEY REFERENCES Actor(Act_no)
);

INSERT INTO Mv_Act VALUES(11,231,1)
INSERT INTO Mv_Act VALUES(12,231,8)
INSERT INTO Mv_Act VALUES(13,232,1)
INSERT INTO Mv_Act VALUES(14,232,2)
INSERT INTO Mv_Act VALUES(15,232,3)
INSERT INTO Mv_Act VALUES(16,232,4)
INSERT INTO Mv_Act VALUES(17,232,5)
INSERT INTO Mv_Act VALUES(18,232,11)
INSERT INTO Mv_Act VALUES(19,234,2)
INSERT INTO Mv_Act VALUES(20,237,2)
INSERT INTO Mv_Act VALUES(21,238,2)
INSERT INTO Mv_Act VALUES(22,233,3)
INSERT INTO Mv_Act VALUES(23,235,6)
INSERT INTO Mv_Act VALUES(24,236,7)
INSERT INTO Mv_Act VALUES(25,239,10)
INSERT INTO Mv_Act VALUES(26,230,9)
INSERT INTO Mv_Act VALUES(27,230,2)


--Count the number of movies in which Shahrukh Khan has acted

SELECT Act_name,COUNT(Mv_name) as No_Movies
FROM Actor,Movie,Mv_Act
WHERE Act_no=Ref_Act_no and Mv_no=Ref_Mv_no and Act_name='Shahrukh Khan'
GROUP BY Act_name

--Display movie details having more than 5 actors

SELECT Mv_no,Mv_name,COUNT(*) as No_Actors
FROM Movie,Actor,Mv_Act
WHERE Act_no=Ref_Act_no and Mv_no=Ref_Mv_no
GROUP BY Mv_no,Mv_name
HAVING COUNT(*)>5

--Find all movies of Amitabh Bachchan that are released between years 1975-1985 and starting with 'S'

SELECT Mv_name,R_yr
FROM Actor,Movie,Mv_Act
WHERE Act_no=Ref_Act_no and Mv_no=Ref_Mv_no and Act_name='Amitabh Bachchan' 
and Mv_name like '%S%' and R_yr BETWEEN 1975 and 1985

--List Actor wise list of movies along with release year and movie name

SELECT Act_name,Mv_name,R_yr
FROM Actor,Movie,Mv_Act
WHERE Act_no=Ref_Act_no and Mv_no=Ref_Mv_no
GROUP BY Act_name,Mv_name,R_yr