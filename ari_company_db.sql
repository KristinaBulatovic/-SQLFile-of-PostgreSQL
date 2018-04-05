-- Database: ari_company

-- DROP DATABASE ari_company;

CREATE DATABASE ari_company
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	

CREATE TABLE crews(
   	id	SERIAL	PRIMARY KEY	NOT NULL,
   	name            TEXT    NOT NULL,
   	yearsOfService  INT     NOT NULL,
   	experience      INT		NOT NULL
);

CREATE TABLE aircrafts(
   	id  	SERIAL	PRIMARY KEY	NOT NULL,
   	name	TEXT    NOT NULL
);

CREATE TABLE crew_aircraft(
   	id  SERIAL PRIMARY KEY  NOT NULL,
  	crewId		INT	REFERENCES	crews(id),
	aircraftId 	INT REFERENCES 	aircrafts(id),
	date_ca		DATE	NOT NULL
);


INSERT INTO crews (name,yearsOfService,experience) VALUES 
('David', 4, 2), 
('Allen', 10, 8),
('Mark', 7, 3), 
('Paul', 12, 4),
('Teddy', 2, 1);

INSERT INTO aircrafts (name) VALUES 
('A1'), 
('A2'),
('A3'), 
('A4'),
('A5'),
('A6'), 
('A7'),
('A8'), 
('A9'),
('A10');

INSERT INTO crew_aircraft (crewId,aircraftId,date_ca) VALUES 
(1, 3, '2014-01-11'), 
(1, 5, '2016-10-03'), 
(2, 2, '2008-03-15'),
(2, 1, '2009-12-13'),
(2, 5, '2011-01-22'),
(2, 3, '2011-12-18'),
(2, 7, '2013-08-10'),
(2, 9, '2015-02-02'),
(2, 4, '2015-11-15'),
(2, 6, '2017-09-13'),
(3, 4, '2011-02-17'),
(3, 8, '2015-06-01'),
(3, 10, '2016-02-10'),
(4, 1, '2006-11-18'),
(4, 5, '2010-04-13'),
(4, 8, '2011-02-05'),
(4, 2, '2015-12-07'),
(5, 7, '2016-04-01');


SELECT * FROM crews;

SELECT name FROM crews ORDER BY yearsofservice DESC LIMIT 1;

SELECT name FROM crews ORDER BY yearsofservice DESC LIMIT 1 OFFSET 2; -- OFFSET value starting from 0, so second will be no. 1, third no. 2 and so on...

SELECT name, experience FROM crews ORDER BY experience DESC LIMIT 1;
SELECT c.name, COUNT(ca.aircraftid) AS total FROM crews AS c INNER JOIN crew_aircraft AS ca ON c.id = ca.crewid GROUP BY c.name ORDER BY total DESC LIMIT 1;

SELECT name, experience FROM crews ORDER BY experience ASC LIMIT 1;
SELECT c.name, COUNT(ca.aircraftid) AS total FROM crews AS c INNER JOIN crew_aircraft AS ca ON c.id = ca.crewid GROUP BY c.name ORDER BY total ASC LIMIT 1;

