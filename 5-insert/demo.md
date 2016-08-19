# Demo: DESCRIBE lists a Table’s Structure
Before you write an INSERT statement, it’s sometimes helpful to refresh your knowledge of the table’s schema.  One way to do this is to use the DESCRIBE table_name statement.  

1.	Go ahead and run the following 2 statements:

  ```
  mysql> USE RockStar;
  mysql> DESCRIBE Individual;
  ```

2.	Now let’s use the `INSERT` statement to add a single rock star into the **Individual** table.  Here is one way to insert a row into a table.  The syntax can be quite elaborate.  There are more than 3 ways to write an `INSERT` statement.  After the course, I suggest you review the different nuances of the syntax to perform INSERTs via the online MySQL guide:  http://dev.mysql.com/doc/refman/5.5/en/insert.html.  

Enter the following `INSERT` statement and run the query.  Note how the table name is qualified with the database name.  

```
mysql> INSERT INTO RockStar.Individual (LastName, FirstName, BirthDate) VALUES (‘Jagger’, ‘Mick’, ‘1943-07-26’);
```

After you submit the command to the MySQL Server, you should see a message that says ‘Query OK, 1 row affected…’

3.	Now, let’s check out the contents of the Individual table by issues a `SELECT` query.  Enter the following statement at the mysql> prompt and run the query:

```
mysql> SELECT * FROM Individual;
```

If all went well, your output in the terminal should look something like this.  Notice the value of the DateAdded column.  It’s in the table but we did not provide the value within our INSERT statement.
