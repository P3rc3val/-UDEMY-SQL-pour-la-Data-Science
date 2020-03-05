import  sqlite3 # pour pouvoir se connecter à notre bdd factbook.db
import pandas as pd # imort de librairie pandas

# création d el'instance de connexion
connexion = sqlite3.connect('factbook.db')

# Une varaible a utilisée avec pandas pour requêter la bdd
# avec à la fin con l'instance de connexion à la bdd
a = pd.read_sql_query('SELECT SUM(area_land), SUM(area_water) FROM facts WHERE area_land != "" AND area_water != "";', con = connexion)

# Maintenant on calcule notre ratio
print(a['SUM(area_land)']/a['SUM(area_water)'])



