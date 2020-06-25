#module 5 examples/solutions

#Lets first drop the table INSTRUCTOR in case it exists from a previous attempt
dropQuery = "drop table INSTRUCTOR"

#Now execute the drop statment
dropStmt = ibm_db.exec_immediate(conn, dropQuery)

#Construct the Create Table DDL statement - replace the ... with rest of the statement
createQuery = "create table INSTRUCTOR(id INTEGER PRIMARY KEY NOT NULL, fname VARCHAR(20), lname VARCHAR(20), city VARCHAR(255), ccode CHAR(2))"
#Now fill in the name of the method and execute the statement
createStmt = ibm_db.exec_immediate(conn, createQuery)

#Construct the query 
insertQuery = "INSERT INTO instructor values (1, 'Rav', 'Ahuja', 'TORONTO', 'CA')"
#execute the insert statement
insertStmt = ibm_db.exec_immediate(conn, insertQuery)

#Construct the query that retrieves all rows from the INSTRUCTOR table
selectQuery = "select * from INSTRUCTOR"
#Execute the statement
selectStmt = ibm_db.exec_immediate(conn, selectQuery)
#Fetch the Dictionary (for the first row only) - replace ... with your code
ibm_db.fetch_both(selectStmt)
#results
# {'ID': 1,
#  0: 1,
#  'FNAME': 'Rav',
#  1: 'Rav',
#  'LNAME': 'Ahuja',
#  2: 'Ahuja',
#  'CITY': 'TORONTO',
#  3: 'TORONTO',
#  'CCODE': 'CA',
#  4: 'CA'}

#Fetch the rest of the rows and print the ID and FNAME for those rows
while ibm_db.fetch_row(selectStmt) != False:
   print (" ID:",  ibm_db.result(selectStmt, 0), " FNAME:",  ibm_db.result(selectStmt, "FNAME"))
#result
# ID: 2  FNAME: Raul
# ID: 3  FNAME: Hima

#update table 
updateQuery = "update INSTRUCTOR set CITY='MOOSETOWN' where FNAME='Rav'"
updateStmt = ibm_db.exec_immediate(conn, updateQuery)

#make a graph using result of SQL query in python
import matplotlib.pyplot as plt
%matplotlib inline
import seaborn as sns

income_vs_hardship = %sql SELECT per_capita_income_, hardship_index FROM chicago_socioeconomic_data;
plot = sns.jointplot(x='per_capita_income_',y='hardship_index', data=income_vs_hardship.DataFrame())