#Dataload

#db
DROP DATABASE IF EXISTS DS_PI_1;
CREATE DATABASE DS_PI_1;
USE DS_PI_1;

#tables

DROP TABLE IF EXISTS Driver;

CREATE TABLE Driver(
idDriver INT PRIMARY KEY,
dRef VARCHAR(20),
dNumber INT,
dCode VARCHAR(3),
dName VARCHAR(30),
dSurname VARCHAR(30),
dDob DATE,
dNationality VARCHAR(30),
dUrl VARCHAR(200)
);

LOAD DATA INFILE '..\\Uploads\\Datasets\\drivers.csv'
INTO TABLE Driver
CHARACTER SET 'utf8mb4'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS Result;

CREATE TABLE Result(
idResult INT PRIMARY KEY,
idRace VARCHAR(10),
idDriver VARCHAR(10),
idConstructor VARCHAR(10),
rNumber VARCHAR(10),
grid VARCHAR(10),
rPosition VARCHAR(10),
positionText VARCHAR(20),
positionOrder VARCHAR(10),
points VARCHAR(10),
laps VARCHAR(10),
rTime VARCHAR(40),
millis VARCHAR(10),
fastestLap VARCHAR(10),
rRank VARCHAR(10),
fastestLapTime VARCHAR(40),
fastestlapspeed VARCHAR(40),
idStatus VARCHAR(10));


LOAD DATA INFILE '..\\Uploads\\Datasets\\results.csv'
INTO TABLE Result
CHARACTER SET 'utf8mb4'
FIELDS TERMINATED BY ',' ESCAPED BY ''
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS Constructor;

CREATE TABLE Constructor(
idConstructor INT PRIMARY KEY,
cRef VARCHAR (30),
cName VARCHAR (30),
nationality VARCHAR(50),
url VARCHAR(200)
);

LOAD DATA INFILE '..\\Uploads\\Datasets\\constructors.csv'
INTO TABLE Constructor
CHARACTER SET 'utf8mb4'
FIELDS TERMINATED BY ',' ESCAPED BY ''
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS Track;

CREATE TABLE Track(
idCircuito INT PRIMARY KEY,
ref VARCHAR(30),
tname VARCHAR(40),
location VARCHAR(30),
country VARCHAR(30),
lat VARCHAR(30),
lng VARCHAR(30),
alt INT,
url VARCHAR(200)
);

LOAD DATA INFILE '..\\Uploads\\Datasets\\circuits.csv'
INTO TABLE Track
CHARACTER SET 'utf8mb4'
FIELDS TERMINATED BY ',' ESCAPED BY ''
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS Race;

CREATE TABLE Race(
idRace INT PRIMARY KEY,
yr INT,
rRound INT,
idCircuito INT,
rName VARCHAR(50),
rDate DATE,
rTime VARCHAR(45),
url VARCHAR(200)
);

LOAD DATA INFILE '..\\Uploads\\Datasets\\races.csv'
INTO TABLE Race
CHARACTER SET 'utf8mb4'
FIELDS TERMINATED BY ',' ESCAPED BY ''
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS PitStop;

CREATE TABLE PitStop (
idRace INT,
idDriver INT,
vez INT,
lap INT,
hora varchar(30),
duration VARCHAR(30),
millis INT
);

LOAD DATA INFILE '..\\Uploads\\Datasets\\pit_stops.csv'
INTO TABLE PitStop
CHARACTER SET 'utf8mb4'
FIELDS TERMINATED BY ',' ESCAPED BY ''
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS Qualifying;

CREATE TABLE Qualifying (
idQualy INT PRIMARY KEY,
idRace INT,
idDriver INT,
idConstructor INT,
numero VARCHAR(40),
position INT,
q1 VARCHAR(30),
q2 VARCHAR(30),
q3 VARCHAR(30)
);

LOAD DATA INFILE '..\\Uploads\\Datasets\\Qualifying\\qualifying_split_1.csv'
INTO TABLE Qualifying
CHARACTER SET 'utf8mb4'
FIELDS TERMINATED BY ',' ESCAPED BY ''
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '..\\Uploads\\Datasets\\Qualifying\\qualifying_split_2.csv'
INTO TABLE Qualifying
CHARACTER SET 'utf8mb4'
FIELDS TERMINATED BY ',' ESCAPED BY ''
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


#qualifyId,raceId,driverId,constructorId,number,position,q1,q2,q3
