# Objectif: Quels pays auront le moins d’habitant en 2050 ?
import sqlite3
import pandas as pd
import math
 
connexion = sqlite3.connect('factbook.db')

# Affichage des 10 pays les moins peuplé en 2015
#f = pd.read_sql_query('SELECT name, population FROM facts WHERE population !="" AND population != 0 ORDER BY population ASC LIMIT 10;', con = connexion)
#print(f)

# Estimation du nombre de la population dans chaque pays en 2050
# N = N0*e**(rt)
a = pd.read_sql_query('SELECT * FROM facts;', con = connexion)

#Définition de la fonction qui calcule l'estimation de la population dans chaque pays en 2050
# N = N0*e**(rt)
def pop_growth(x):
	return x['population'] * math.e ** ((x['population_growth']/100)* 35)

# Application de la fonction pop_growth à chaque pays 
# + création d'une colonne pop_2050 contenant es résultats
a['hab_2050'] = a.apply(lambda row: pop_growth(row), axis=1)

# Suppression des lignes contenant des valeurs manquantes
a = a.dropna(axis = 0)

# On clean les données pour les pays qui ont une surface et une population >0
a = a[(a['area_land'] > 0) & (a['population'] > 0)]

b = a.sort_values(['hab_2050'], ascending = [True])
#On limite l'affichage à 10
b = b['name'].iloc[0 :9]

print(b)
