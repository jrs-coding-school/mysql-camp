## Exercise 2 Solution

```
mysql> CREATE TABLE RockStar.Individual
         (LastName varchar(50) NOT NULL
         , FirstName varchar(25)
         , BirthDate DATE NOT NULL
         , DateAdded TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

mysql> SHOW COLUMNS FROM Individual;
```
