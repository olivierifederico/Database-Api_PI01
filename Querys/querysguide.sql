USE ds_pi_1;


#driverMostWins

SELECT r.idDriver, d.dName, d.dSurname, count(r.rPosition) AS wins FROM result r
JOIN driver d ON r.iddriver = d.iddriver
WHERE rPosition = 1
GROUP BY idDriver
ORDER BY wins DESC
LIMIT 1;


#driverConsAmeBri

SELECT r.idDriver, d.dName, d.dSurname, sum(r.points) as total_score FROM result r
JOIN Driver d on r.idDriver = d.iddriver
JOIN Constructor c on r.idConstructor = c.idConstructor
WHERE c.nationality = 'British' or c.nationality = 'American'
GROUP BY r.idDriver
ORDER BY total_score DESC
LIMIT 1;


#yearMostRaced

SELECT yr, count(idRace) AS races FROM Race
GROUP BY yr
ORDER BY races DESC
LIMIT 1;


#trackMostRaced

SELECT t.tName, COUNT(idRace) AS races FROM Race r
JOIN track t on r.idTrack = t.idTrack
GROUP BY t.tName
ORDER BY races DESC
LIMIT 1;

