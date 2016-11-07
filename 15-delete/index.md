# DELETE


Use the DELETE statement to remove rows from a table.  The syntax is fairly straightforward.  In its simplest form you supply a statement with the following syntax:  

```
DELETE FROM <table_name>;  
```

> WATCH OUT!: the command  `DELETE FROM Individual;` will attempt to delete _all_ the rows from the **Individual** table.  This is very easy to do.  Use a `WHERE` clause to specify which rows to delete.  

The key to using the `DELETE` statement is to be double darn sure you know _EXACTLY_ which rows you want to delete.  This is when the `WHERE` clauses comes into play.  Use the `WHERE` clause to specify exactly which rows you want to delete.  

**Don’t** execute the following; but, if you were to issue the following statement...:  

```
DELETE FROM Individual
WHERE LastName = ‘Ramone’;
```

...Would you know exactly how many rows the statement would delete?  

To be sure, it’s a good idea to test out how selective the WHERE clause is by using it with a `SELECT` statement before you attempt to remove the data with the `DELETE` statement:

```
SELECT * FROM Individual
WHERE LastName = ‘Ramone’;
```

In summary, the key to using WHERE clauses on DELETE statements is to very precise in the way you select the rows for deletion.  I like to get the primary key column involved in my WHERE clauses.  In this way, you can really be specific:

```
DELETE FROM Individual
WHERE ID = ‘49’;
```
  

[Home](/)  |  [DELETE](/15-delete/)  |  [Next](/15-delete/1)
