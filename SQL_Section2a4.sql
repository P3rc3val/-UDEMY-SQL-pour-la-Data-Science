SELECT Rank, Major
FROM recent_grads;

# Ecrire une requête qui retourne les 5 colonnes
# de la atable recent_grads dans l'ordre suivant: Rank, Major_code, Major,
# Major_category et Total

SELECT Rank, 
Major_code,
Major,
Major_category,
Total
FROM recent_grads;


ShareWomen > 0.5

WHERE ColA = 3

WHERE sex = 'F'

# Ecrire une requête SQL qui retourne tous les majors avec plus de 10000 diplômés
# ayant un emploi. Vous afficherez les colonnes Major et Employed dans cet
# ordre. (Rappel: la colonne des diplômés ayant un emploi est Employed)

SELECT Major,
Employed
FROM recent_grads
WHERE Employed > 1000;

# Limiter le nombre de résultats à 15

LIMIT 15

SELECT Major
FROM recent_grads
LIMIT 5
;

# Ecrire une requête qui retourne la colonne Major, dans laquelle les diplômés
# ayant un emploi est supérieur à 10000, vous allez afficher seulement
# les 10 premiers résultats.

SELECT Major
FROM recent_grads
WHERE Employed > 1000
LIMIT 10;

SELECT col1, col2, ...
FROM Table
WHERE condition1 AND condition2;

# Ecrire une requête qui retourne toutes les majors qui contiennent une majorité 
# de femmes et qui ont plus de 10000 diplomés employés.

SELECT Major
FROM recent_grads
WHERE ShareWomen >= 0.5 AND Employed > 1000;

SELECT col1, col2, ...
FROM Table
WHERE condition1 OR condition2;

# Ecrire une requête qui retourne les 20 premières majors qui ont un salaire médian
# supérieur ou égal à 10000 ou un nombre de personnes sans emploi inférieur ou égal 
# à 1000 (afficher dans l'ordre les colonnes Major, Median, Unemployed).

# Rappel: le salaire médian se trouve dans la colonne Median et le nombre de diplômés
# sans emploi dans la colonne Unemployed.

SELECT Major,
Median,
Unemployed
FROM recent_grads
WHERE Median >= 10000 OR Unemployed <= 1000
LIMIT 20;

# Grouper les opérateurs avec des parenthèses

Major_category = 'Engineering'	# condition1
ShareWomen>= 0,5				# condition2
Unemployment_rate < 0.051		# condition3

# condition1 AND (condition2 OR condition3)

SELECT Major, Major_category, ShareWomen, Unemployment_rate
FROM recent_grads
WHERE Major_category = 'Engineering'
AND (ShareWomen>= 0,5 OR Unemployment_rate < 0.051);

# Trouver toutes les majors qui ont les critères suivants:
# - La catégorie de major (Major_category) sera Business, Arts ou Health
# - Les diplômés ayant un emploi (Employed) seront supérieurs à 20000 OU le taux
# 	de personne sans emploi (Unemployment_rate) sera inférieur à 5,1%

# Nous nous intéresserons aux colonnes suivantes (dans l'ordre):
# Major, Major_category, Employed, Unemployment_rate
# Sans aucune limite de résultats.

SELECT Major, Major_category, Employed, Unemployment_rate
FROM recent_grads
WHERE (Major_category = 'Business' OR Major_category ='Arts' 
	OR Major_category ='Health')
AND (Employed > 20000 OR Unemployment_rate < 0.051);



-- Trier les résultats avec ORDER BY
ORDER BY (ASC ou DESC)

SELECT col1, col2, ....
FROM Table
ORDER BY col1 ASC -- Pour ranger les éléments de la colonne 1 de + grand au + petit

-- Requête qui renvoit les 10 plus petite valeurs de la colonne 1
SELECT Employed
FROM recent_grads
ORDER BY Employed ASC
LIMIT 10

-- Retourner les 10 valeurs de la colonne Major dans l'ordre inverse alphabétique
SELECT Major
FROM recent_grads
ORDER BY Major DESC
LIMIT 10

-- Ordre des résultats sur plusieurs colonnes
SELECT col1, col2, ...
FROM Table
ORDER BY col1 ASC, col2 ASC 
-- Trés utile quand il y a des listes de noms et prénom de personnes
-- Permet de trier par nom de famille ou prénom

-- Ecrire une requête qui classe les catégories de majors (Major_category)
-- dans l'ordre croissant
-- puis par salaire médian (colonne médian) dans l'ordre décroissant.

-- Afficher les colonnes suivantes (dans l'ordre):
-- Major_category, Median et Major
-- Limiter les résultats à 20.

SELECT Major_category, Median, Major
FROM recent_grads
ORDER BY Major_category ASC, Median DESC
LIMIT 10;

SELECT car
FROM car_table


-- Ecrire une requête qui récupère les 20 premières lignes de la table
-- avec seulement les colonnes sivantes (dans l'ordre):
-- College_jobs
-- Median
-- Unemployment_rate

SELECT College_jobs, Median, Unemployment_rate
FROM recent_grads
ORDER BY College_jobs ASC, Median ASC, Unemployment_rate ASC
LIMIT 20;

-- Ecrire une requête qui retourne les 5 premières lignes des majors Arts
-- Afficher seulement la colonne Major

SELECT Major
FROM recent_grads
WHERE Major_category = 'Arts'
LIMIT 5;

-- Retourner toutes les Majors différentes de Engineering:
-- Avec un salaire médian inférieur ou égal à 50000
-- Ou avec un taux de personnes sans emploi supérieur à 6.5%

-- Retourner les colonnes suivantes dans l'ordre:
-- Major, Total, Median, Unemployment_rate
-- Sans limite de résultats

SELECT Major, Total, Median, Unemployment_rate
FROM recent_grads
WHERE Major_category != 'Engineering' 
AND (Median <= 50000 OR Unemployment_rate > 0.065)
;

-- Retourner les 20 premières majors dont la catégorie est différente de Engineering
-- Trier les résultats dans l'ordre anti alphabétique

SELECT Major
FROM recent_grads
WHERE Major_category != 'Engineering' 
ORDER BY Major DESC
LIMIT 20
;
