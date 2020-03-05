# Calculer une estimation de la population en 2050
 
import pandas as pd 
import sqlite3
import math
 
 
# Connexion à la base de données factbook.db
connexion = sqlite3.connect('factbook.db')
 
 
# Lecture des données de la table facts dans un tableau pandas
a = pd.read_sql_query('SELECT * FROM facts;', con = connexion)
 
 
# Calcul théorique:
# N = N0*e**(rt)
# N = population finale
# N0 = population initiale
# e = constante
# r = taux de croissance annuelle
# t = nombre d'années entre l'estimation et l'initiale
# 5000 habitants, taux de croissance t de 4% 2015 --> 2050, donc t = 35
# N = 5000 * e ** (0.04 * 35)
 
 
# définition de la fonction qui calcule une estimation de la population 
# en 2015 suivant le calcul ci-dessus:
def pop_growth(x):
 return x['population'] * math.e ** ((x['population_growth']/100)* 35)
 
 
# Application de la fonction pop_growth à chaque pays + création d'une 
# colonne pop_2050 contenant les résultats
a['pop_2050'] = a.apply(lambda row: pop_growth(row), axis=1)
 
 
# Suppression des lignes contenant des valeurs manquantes
a = a.dropna(axis = 0)
 
 
# On filtre les pays qui ont une surface terrestre > 0 
# et une population > 0
a = a[(a['area_land'] > 0) & (a['population'] > 0)]
 
 
# On trie les pays par population décroissante
b = a.sort_values(['pop_2050'], ascending = [False])
 
 
# On assigne à la variable b les noms des pays correspondants limités 
# à 10 valeurs
b = b['name'].iloc[0:9]
 
# On affiche le résultat final
print(b)