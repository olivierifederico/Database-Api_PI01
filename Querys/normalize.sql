USE ds_pi_1;

ALTER TABLE Constructor
DROP COLUMN cRef,
DROP COLUMN url;

ALTER TABLE Driver
DROP COLUMN dNumber,
DROP COLUMN dRef,
DROP COLUMN dDob,
DROP COLUMN dNationality,
DROP COLUMN dUrl,
DROP COLUMN dCode;


ALTER TABLE result
DROP COLUMN idStatus;

ALTER TABLE result
DROP COLUMN rNumber,
DROP COLUMN positionText,
DROP COLUMN positionOrder,
DROP COLUMN grid,
DROP COLUMN laps,
DROP COLUMN rTime,
DROP COLUMN millis,
DROP COLUMN fastestLap,
DROP COLUMN rRank,
DROP COLUMN fastestLapTime,
DROP COLUMN fastestlapspeed;


ALTER TABLE Track
DROP COLUMN ref,
DROP COLUMN lat,
DROP COLUMN lng,
DROP COLUMN alt,
DROP COLUMN url;


ALTER TABLE Race
DROP COLUMN url,
DROP COLUMN rTime,
DROP COLUMN rRound;


ALTER TABLE PitStop
ADD FOREIGN KEY (idRace) REFERENCES race(idRace),
ADD FOREIGN KEY(idDriver) REFERENCES Driver(idDriver);

ALTER TABLE Race
ADD FOREIGN KEY(idTrack) REFERENCES Track(idTrack);

ALTER TABLE Qualifying
ADD FOREIGN KEY(idRace) REFERENCES Race(idRace),
ADD FOREIGN KEY(idDriver) REFERENCES driver(idDriver),
ADD FOREIGN KEY(idConstructor) REFERENCES constructor(idConstructor);


ALTER TABLE result
MODIFY idRace INT,
MODIFY idDriver INT,
MODIFY idConstructor INT,
MODIFY points INT,
ADD FOREIGN KEY(idRace) REFERENCES Race(idRace),
ADD FOREIGN KEY(idDriver) REFERENCES driver(idDriver),
ADD FOREIGN KEY (idConstructor) REFERENCES constructor(idConstructor);

