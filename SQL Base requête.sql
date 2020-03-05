#Compter le nombre de lignes en SQL

SELECT DISTINCT birth_rate FROM facts;

SELECT AVG(DISTINCT birth_rate) FROM facts WHERE population > 20000000;

SELECT population / 1000000 FROM facts;

SELECT (birth_rate + migration_rate) / death_rate FROM facts;


SELECT SUM(Employed)
FROM recent_grads
GROUP BY Major_category
;


SELECT Major_category, AVG(Employed)/ AVG(Total) AS rateGraduateEmployed 
FROM recent_grads
GROUP BY Major_category
WHERE rateGraduateEmployed > 0.8
;

SELECT Major_category, AVG(low_wave_jobs)/ AVG(Total) AS rateLowWaveEmployed
FROM recent_grads
GROUP BY Major_category
HAVING rateLowWaveEmployed > 0.1
;


SELECT Major_category, (full_time * 100)/ (Employed) AS rateFullTimeEmployed
FROM recent_grads
GROUP BY Major_category
HAVING rateLowWaveEmployed < 0.6
;

SELECT name, AVG(population) AS pop_avg, 
AVG(population_growth) AS pop_growth_avg, 
AVG(birth_rate) AS birth_rate_avg, 
AVG(death_rate) AS death_rate_avg
FROM facts
GROUP BY name
HAVING pop_avg != "" & pop_growth_avg != "" & birth_rate_avg != "" & death_rate_avg != ""
;

SELECT name, population, AVG(population_growth) AS pop_growth_avg, AVG(birth_rate) AS birth_rate_avg, AVG(death_rate) AS death_rate_avg FROM facts WHERE population != "" GROUP BY name HAVING pop_growth_avg != "" & birth_rate_avg != "" & death_rate_avg != "" ;


SELECT SUM(population), AVG(population_growth), AVG(birth_rate), AVG(death_rate) FROM facts;

SELECT MIN(population), MIN(population_growth), MIN(birth_rate), MIN(death_rate) FROM facts;

SELECT MAX(population), MAX(population_growth), MAX(birth_rate), MAX(death_rate) FROM facts;

SELECT MIN(population), 
MIN(population_growth), 
MIN(birth_rate), 
MIN(death_rate), 
MAX(population), 
MAX(population_growth), 
MAX(birth_rate), 
MAX(death_rate) 
FROM facts
WHERE population < 2000000000 & population > 0
;

SELECT MIN(population), MAX(population), MIN(population_growth), MAX(population_growth), MIN(birth_rate), MAX(birth_rate), MIN(death_rate), MAX(death_rate) FROM facts WHERE population < 2000000000 AND population > 0;

SELECT name, ROUND(population + population *(population_growth/100), 0) 
FROM facts 
WHERE population < 7000000000 AND population > 0  
AND population IS NOT NULL AND population_growth IS NOT NULL 
;


SELECT MIN(ROUND(population + population *(population_growth/100), 0)), MAX(ROUND(population + population *(population_growth/100), 0)), AVG(ROUND(population + population *(population_growth/100), 0)) FROM facts WHERE population < 7000000000 AND population > 0 AND population IS NOT NULL AND population_growth IS NOT NULL ;

SELECT *
FROM facts
WHERE created_at <"2015-11-01" AND created_at >"2015-10-30"
;


SELECT col1, col2, ...
FROM table
WHERE colonne_date < "date1"
AND colonne_date > "date2"
;

SELECT *
FROM facts
WHERE created_at <"2015-11-01 13:40" 
AND created_at >"2015-11-01 13:35"
;


PRAGMA table_info(facts);

SELECT *
FROM facts
WHERE MAX(id)
;


INSERT INTO facts
VALUES (262, "ms", "Mars", 60000, 40000, 20000, 500000, 100, 50, 10, 20, "2017-02-25 12:00:00", "2017-02-25 12:00:00")
;

INSERT INTO facts
VALUES (263, "ms", "PHWorld", 1, NULL, 20000, 500000, 100, 50, 10, 20, "2017-02-25 12:00:00", "2017-02-25 12:00:00")
;


UPDATE nom_table
SET colonne1 = valeur1, colonne2 = valeur2, colonneN = valeurN
WHERE colonne1 = valeur3
;

UPDATE nom_table
SET colonne1 = valeur1, colonne2 = valeur2, colonneN = valeurN
WHERE colonne1 = valeur3
;


DELETE FROM nom_table
WHERE colonne1 = valeur1
;


ALTER TABLE nom_table
ADD nom_colonne dataType;

ALTER TABLE facts
ADD leader text;


ALTER TABLE facts
DROP COLUMN nom_colonne;

ALTER TABLE nom_table
DROP COLUMN awesomeness;

CREATE TABLE nom_bdd.nom_table(
colonne1 dataType1 PRIMARY KEY,
colonne2 dataType2,
colonneN dataTypeN
);

CREATE TABLE leaders(
id integer PRIMARY KEY,
name text,
country text
);

DROP TABLE leaders;

INSERT INTO leaders
VALUES (1, "Barack Obama", "United States");

SELECT country
FROM leaders
WHERE name="Barack Obama";


SELECT *
FROM facts
WHERE name="United States";

CREATE TABLE states(
id integer PRIMARY KEY,
name text,
area integer,
country integer,
FOREIGN KEY(country) REFERENCES facts(id)
);

SELECT col1, col2, ...
FROM nom_table1
INNER JOIN nom_table2
ON nom_table1.col3 == nom_table2.col4
;


SELECT *
FROM states
INNER JOIN facts
ON states.country == facts.id
;


SELECT *
FROM landmarks
INNER JOIN facts
ON landmarks.country == facts.id
;

SELECT *
FROM landmarks
INNER JOIN facts
ON landmarks.country == facts.id
;

