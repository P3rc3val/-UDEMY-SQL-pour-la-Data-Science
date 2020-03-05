# Utiliser Python avec SQLite
import sqlite3
connexion = sqlite3.connect("factbook.db")


c = connexion.cursor()
c.execute('SELECT name, population FROM facts ORDER BY population ASC LIMIT 10;')

print(c.fetchall())

