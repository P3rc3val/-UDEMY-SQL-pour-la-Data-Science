# Calculer une esimation de la population en 2050

import pandas as pd
import sqlite3 
import math

connexion = sqlite3.connect('factbook.db')

a = pd.read_sql_query('SELECT * FROM facts;', con = connexion)

# N = N0*e**(rt)
def pop_growth(x):
	return x['population'] * math.e ** ((x['population_growth']/100)* 35)

a['pop_2050'] = a.apply(lambda row: pop_growth(row), axis=1)

# clean les lignes avec un Nan dans une des colonnes des lignes
a = a.dropna(axis = 0)
# filtrer les superficie et population strictement supérieures à 0
a = a[(a['area_land'] > 0) & (a['population'] > 0)]


b = a.sort_values(['pop_2050'], ascending = [False])
# On ne souhaite affiche que les 10 premiers noms!!!!
b = b['name'].iloc[0 :9]

print(b)