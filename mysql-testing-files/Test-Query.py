import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="PieniYritys",
  password="PieniYritys123,",
  database="PieniYritys"
)

mycursor = mydb.cursor()

mycursor.execute("SELECT * FROM Tyontekija")

myresult = mycursor.fetchall()

for x in myresult:
  print(x)