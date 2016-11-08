# Aliases

## Column Aliases

Column aliases help make the output of a query more readable.  As a best practice, use the `AS` keyword followed by the alias name for the column.  

```
SELECT [column name | expression] AS ‘easy to understand alias name’ FROM table
```

In the following example we concatenate the first and last name columns together into a new column aliased as **FullName**.

```
SELECT LastName, FirstName, CONCAT(FirstName, ' ' , LastName) as FullName
FROM BandMembers;
```

You can use the column alias in `GROUP BY`, `ORDER BY`, or `HAVING` clauses to refer to the column.

```
SELECT Genre, count(Genre) as cnt
FROM BandMembers
GROUP BY Genre
HAVING cnt > 1
```

You **can't** use the column alias within a `WHERE` clause.  The reason is MySql will attempt to evaluate the `WHERE` clause _before_ the aliased column has been determined.  The following query will return an error:

```
SELECT LastName, FirstName, CONCAT(FirstName, ' ' , LastName) as FullName
FROM BandMembers
WHERE FullName = 'Mick Jagger'
```

## Table Aliases

A table reference can be aliased using this syntax...

```
table_name AS table_alias_name
```
or this syntax ...

```
tbl_name alias_name:
```

The examples below uses both forms of syntax to alias a table:

```
USE baseball;

SELECT b.playerID, b.Rank, p.LastName, p.FirstName  
FROM batting b INNER JOIN player p ON p.ID = b.playerID

SELECT b.playerID, b.Rank, p.LastName, p.FirstName  
FROM batting AS b INNER JOIN player AS p ON p.ID = b.playerID
```

The example below uses a combination of column and table aliases:

```
SELECT B.Genre AS Genre
, B.Name AS Name
, I.LastName AS LastName
, I.FirstName AS FirstName
, I.BirthDate AS BirthDate
FROM Band B join IndividualBand IB on B.ID = IB.BandID
join Individual I on I.ID = IB.IndividualID;
```

[Home](/)  |  [Aliases](/18-aliases/)  |  [Next](/18-aliases/1)
