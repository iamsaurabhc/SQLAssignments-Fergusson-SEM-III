--Create an New DataBase
CREATE DATABASE Assignment4
ON (NAME=Assignment4,FILENAME='E:\Database\Assignment4_db.mdf',
SIZE=10,MAXSIZE=50,FILEGROWTH=5)

USE Assignment4
GO

-- Create Required Tables
CREATE TABLE Movie
(
	Movie_id int NOT NULL PRIMARY KEY,
	Name varchar(50) NULL,
	Year_ int NULL
)
CREATE TABLE Actor
(
	Actor_id int NOT NULL PRIMARY KEY,
	Name varchar(50) NULL
)
CREATE TABLE Actor_Movie
(
	Actor_no int NOT NULL FOREIGN KEY REFERENCES Actor(Actor_id),
	Movie_no int NOT NULL FOREIGN KEY REFERENCES Movie(Movie_id)
)

-- Insert Data into both the Tables

INSERT INTO Actor VALUES (101,'Shahrukh Khan');
INSERT INTO Actor VALUES (102,'Salman Khan');
INSERT INTO Actor VALUES (103,'Aamir Khan');
INSERT INTO Actor VALUES (104,'Amitabh Bachhan');
INSERT INTO Actor VALUES (105,'Akshay Kumar');
INSERT INTO Actor VALUES (106,'Hrithik Roushan');
INSERT INTO Actor VALUES (107,'Priyanka Chopra');
INSERT INTO Actor VALUES (108,'Kareena Kapoor');
GO
INSERT INTO Movie VALUES (201,'Kabhi Khushi Kabhi Gam',1999);
INSERT INTO Movie VALUES (202,'Kal Ho Na Ho',2006);
INSERT INTO Movie VALUES (203,'Swadesh',1998);
INSERT INTO Movie VALUES (204,'Om Shanti Om',2006);
INSERT INTO Movie VALUES (205,'Chak De India',2008);
INSERT INTO Movie VALUES (206,'Sholay',1976);
INSERT INTO Movie VALUES (207,'Yaarana',1977);
INSERT INTO Movie VALUES (208,'Koila',1978);
INSERT INTO Movie VALUES (209,'Deewar',1979);
INSERT INTO Movie VALUES (210,'Ready',2008);
INSERT INTO Movie VALUES (211,'Bajrangi Bhaijan',2015);
INSERT INTO Movie VALUES (212,'Special 26',2012);
GO

-- Creating the Relation between Movie and Actors

INSERT INTO [Actor_Movie] VALUES (101,201);
INSERT INTO [Actor_Movie] VALUES (101,202);
INSERT INTO [Actor_Movie] VALUES (101,203);
INSERT INTO [Actor_Movie] VALUES (101,204);
INSERT INTO [Actor_Movie] VALUES (101,205);
INSERT INTO [Actor_Movie] VALUES (102,210);
INSERT INTO [Actor_Movie] VALUES (102,211);
INSERT INTO [Actor_Movie] VALUES (104,201);
INSERT INTO [Actor_Movie] VALUES (104,206);
INSERT INTO [Actor_Movie] VALUES (104,207);
INSERT INTO [Actor_Movie] VALUES (104,208);
INSERT INTO [Actor_Movie] VALUES (104,209);
INSERT INTO [Actor_Movie] VALUES (105,212);
INSERT INTO [Actor_Movie] VALUES (106,201);
INSERT INTO [Actor_Movie] VALUES (107,201);
INSERT INTO [Actor_Movie] VALUES (108,201);
GO

-- Queries
-- Number of Movies in which Shahrukh has Acted
SELECT DISTINCT Name,Year_
FROM Movie,Actor_Movie
WHERE Actor_no = 101 and Movie_id = Movie_no

-- Movie Details with more than 5 Actors
SELECT DISTINCT Name,Year_,count(Movie_id) as #ofActors
FROM Movie,Actor_Movie
WHERE Movie_id=Movie_no
GROUP BY Name,Year_,Movie_id

-- Movies of Amitabh between 1975 to 1985
SELECT DISTINCT Movie.Name
FROM Movie,Actor_Movie
WHERE Actor_no = 104 and (1975 < Movie.Year_ and Movie.Year_ <1985)

-- Actor wise List of Movies

SELECT DISTINCT Movie.Name,Actor.Name,Movie.Year_
FROM Movie,Actor,Actor_Movie
WHERE Movie_id = Movie_no and Actor_id = Actor_no
GROUP BY Movie.Name,Actor.Name,Movie.Year_
