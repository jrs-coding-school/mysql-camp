# Demo:  Creating a table

To create a table we use a CREATE TABLE statement.  The syntax is:

```
mysql> CREATE TABLE table_name (column_listing)
```

1.	Within the CLI, connect to the database server using the `mysql` client.
2.	Create a database named `RockStar`.  Remember that semi-colon!
3.	Select the `RockStar` database as the default database for use.
4.	For starters we will create the `Individual` table with just the last and first name columns.  We will use the `VARCHAR` string data type for each of these two columns.  We will prefix the table name (`Individual`) with the database name (`RockStar`).  This part is redundant if we selected the default database.  This will ensure the table is created in the correct database.  

  At the `mysql>` prompt, enter the following SQL statement to create the Individual table.  

  Remember, we can enter multiple lines at the command prompt but be sure to end the statement with a semicolon to tell mysql that you are done typing the statement.  

  ```
  mysql> CREATE TABLE RockStar.Individual (LastName varchar(50) NOT NULL, FirstName varchar(25));
  ```

5.	Enter `SHOW DATABASES;` statement to list your databases
6.	Enter `SHOW TABLES;` statement to list your tables within the `RockStar` database. You should see the `Individual` table listed.
7.	Enter the statement `SHOW COLUMNS FROM Individual;` Compare the results on your screen to the `CREATE TABLE` statement you entered earlier.  
8.	Don’t grow too attached to your `Individual` table just yet.  `DROP` the table by issuing the following statement at the mysql> prompt:

  ```
  mysql> DROP TABLE Individual;
  ```
