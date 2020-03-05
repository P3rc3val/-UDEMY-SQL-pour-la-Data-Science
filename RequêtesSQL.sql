-- Ecrire une requête qui retourne les 5 colonnes
-- de la atable recent_grads dans l'ordre suivant: Rank, Major_code, Major,
-- Major_category et Total

SELECT Rank, 
Major_code,
Major,
Major_category,
Total
FROM recent_grads;

-- Filtrer des données
 ShareWomen > 0.5

SELECT Major, ShareWomen
FROM recent_grads
WHERE ShareWomen > 0.5;

-- Ecrire une requête SQL qui retourne tous les majors avec plus de 10000 diplômés
-- ayant un emploi. Vous afficherez les colonnes Major et Employed dans cet
-- ordre. (Rappel: la colonne des diplômés ayant un emploi est Employed)

SELECT Major,
Employed
FROM recent_grads
WHERE Employed > 10000;